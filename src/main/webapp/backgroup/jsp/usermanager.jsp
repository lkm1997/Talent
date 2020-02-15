<%--
  Created by IntelliJ IDEA.
  User: 86158
  Date: 2019-12-2
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = application.getContextPath()+"/";
	String csspath = application.getContextPath()+"/backgroup/css/";
	String jspath =  application.getContextPath()+"/backgroup/js/";
	String jsppath =  application.getContextPath()+"/backgroup/jsp/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Layui</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href=<%=path+"layui/css/layui.css"%> >
	<link rel="stylesheet" href=<%=csspath+"forntmanager.css"%> >

<body>
<h3 id="fun_title">客户管理页面</h3>
<form class="layui-form">
	<div class="layui-form-item" >

		<div class="layui-inline">
			<label class="layui-form-label">请选择范围</label>
			<div class="layui-input-inline">
				<input class="layui-input" id="test16" type="text" placeholder="开始 到 结束">
			</div>
		</div>

		<div class="layui-inline">
			<label class="layui-form-label" >用户名 ：</label>
			<div class="layui-input-inline">
				<input name="user_name" id="user_name" class="layui-input" type="text" autocomplete="off">
			</div>
		</div>

		<button class="layui-btn layui-btn-normal layui-btn-radius" id="query_pa"  type="button">查询</button>
	</div>
</form>

<table class="layui-hide" id="test" lay-filter="table_pa"></table>
<script type="text/javascript" src="<%=jspath+"jquery-3.4.1.js"%>"></script>
<script src=<%=path+"layui/layui.js"%> charset="utf-8"></script>
<script type="text/javascript" src="<%=jspath+"json2.js"%>"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script type="text/html" id="toolbar">
	{{# if(d.statusid == 0){  }}
	<a class="layui-btn layui-btn-sm background-style" lay-event="able">禁用</a>
	{{# }else if(d.statusid == 1){             }}
	<a class="layui-btn layui-btn-sm background-style" lay-event="able">启用</a>
	{{# }else if(d.statusid == 2){             }}

	{{#      }      }}
</script>
<script type="text/html" id="toolbar3">
	{{# if(d.statusid == 0){  }}
	启用
	{{# }else if(d.statusid == 1){             }}
	禁用
	{{# }else if(d.statusid == 2){             }}
	已删除
	{{#      }      }}
</script>
<script type="text/html" id="toolbar1">
	{{# if(d.statusid == 2){  }}

	{{# }else{             }}
	<a class="layui-btn layui-btn-sm background-style" lay-event="delete">删除</a>
	{{#      }      }}
</script>
<script type="text/html" id="toolbar2">
	{{# if(d.statusid == 2){  }}

	{{# }else{             }}
	<a class="layui-btn layui-btn-sm background-style" lay-event="repwd">重置密码</a>
	{{#      }      }}
</script>

<script>
	layui.use(['form','layer','jquery','table','laydate'], function(){
		var table = layui.table;
		var form = layui.form;
		var $ = layui.jquery;
		var layer  = layui.layer;
		var laydate = layui.laydate;

		var times = "";
		laydate.render({
			elem: '#test16'
			,type: 'datetime'
			,range: 'to'
			,format: 'yyyy-M-d'
			,done:function (value,date) {
				times = value;
			}
		});
		table.render({
			elem: '#test'
			,even: true
			,page: true
			,width: 1000
			,limit:5
			,limits:[5,10,15,20,25,30]
			,cols: [[
				{field:'account', width:150, title: '用户名'}
				,{field:'regtime', width:100, title: '注册时间'}
				,{field:'score', width:100, title: '积分', sort: true}
				,{field:'up', width:150, title: '上传文档数', sort: true}
				,{field:'down', width:100, title: '下载文档数',sort: true}
				,{field:'statusid', width:100, title: '用户状态',align:'center', toolbar: '#toolbar3'}
				,{field:'opera', width:100, title: '操作',align:'center', toolbar: '#toolbar'}
				,{field:'delete', width:100, title: '删除',align:'center', toolbar: '#toolbar1'}
				,{field:'repwd', width:100, title: '重置密码',align:'center', toolbar: '#toolbar2'}
			]]
			,url:"UserServlet?methodName=getAllUser"
			,id:'UserTable'
		});

		<%--用于带条件查询--%>
		$("#query_pa").click(function () {
			table.reload('UserTable',{
				url:"UserServlet?methodName=getAllUser"
				,where: { //设定异步数据接口的额外参数，任意设
					account: $('#user_name').val(),
					time:times
				}
				,page: {
					curr: 1 //重新从第 1 页开始
				}
			});
		});

		table.on('tool(table_pa)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
			var data = obj.data //获得当前行数据
				,layEvent = obj.event; //获得 lay-event 对应的值

			var account = data.account;
			var state = data.statusid;

			//修改状态
			if(layEvent === 'able'){
				layer.confirm('确定要修改该用户状态吗',function (index)
				{
					$.ajax({
						type: 'post'
						, url: "UserServlet?methodName=updateState"
						, dataType: 'text'
						, data: {account: account, state:state}
						, success: function (res) {
							var result = res.toString();
							if (result == 'true') {
								layer.msg('修改成功');
								window.location.reload();
							} else {
								layer.msg('修改错误');
							}
						}
						, error: function (msg) {
							alert("服务器正忙。。。。" + msg);
						}
					});
					layer.close(index);
				});
			}

			// 删除
			if(layEvent === 'delete'){
				layer.confirm('确定要删除该用户吗',function (index)
				{
					$.ajax({
						type: 'post'
						, url: "UserServlet?methodName=updateState"
						, dataType: 'text'
						, data: {account: account, state:2}
						, success: function (res) {
							var result = res.toString();
							if (result == 'true') {
								layer.msg('修改成功');
								window.location.reload();
							} else {
								layer.msg('修改错误');
							}
						}
						, error: function (msg) {
							alert("服务器正忙。。。。" + msg);
						}
					});
					layer.close(index);
				})
			}

			// 重置密码,直接访问修改状态的方法，传入状态为8
			if(layEvent === 'repwd'){
				layer.confirm('确定要对此用户重置密码？',function (index)
				{
					$.ajax({
						type: 'post'
						, url: "UserServlet?methodName=updateState"
						, dataType: 'text'
						, data: {account: account, state:8}
						, success: function (res) {
							var result = res.toString();
							if (result == 'true') {
								layer.msg('修改成功');
								window.location.reload();
							} else {
								layer.msg('修改错误');
							}
						}
						, error: function (msg) {
							alert("服务器正忙。。。。" + msg);
						}
					});
					layer.close(index);
				})
			}
		});

		});
</script>

</body>
</html>