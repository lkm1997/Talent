<%--
  Created by IntelliJ IDEA.
  User: 86158
  Date: 2019-12-7
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%
	String path = application.getContextPath()+"/";
	String csspath = application.getContextPath()+"/front/css/";
	String jspath =  application.getContextPath()+"/front/js/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>用户前台主页面</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href=<%=path+"layui/css/layui.css"%> >
	<link rel="stylesheet" href=<%=csspath+"forntmanager.css"%> >
</head>
<body>
<div class="layui-inline">
	<label class="layui-form-label">欢迎您：	${sessionScope.user.account}</label>
	<label class="layui-form-label">当前积分：${sessionScope.user.score}</label>
	<a href=<%=path+"jump/front/personinfo"%>>个人信息</a>
	<a href=<%=path+"jump/front/mydoc"%>>我的文档</a>
	<a href=<%=path+"jump/front/updoc"%>>我要上传</a>
	<a href="" >我要下载</a>
</div>
<form class="layui-form">
	<div class="layui-form-item">
		<div class="layui-inline">
			<div class="layui-input-inline">
				<input name="filename" class="layui-input" type="text" autocomplete="off" id="filename">
			</div>
		</div>
	</div>
	<button class="layui-btn layui-btn-normal layui-btn-radius" id="query_pa"  type="button">搜索文档</button>
</form>
<table class="layui-hide" id="test" lay-filter="table_pa"></table>
<script type="text/javascript" src="<%=jspath+"jquery-3.4.1.js"%>"></script>
<script src=<%=path+"layui/layui.js"%> charset="utf-8"></script>
<script type="text/javascript" src="<%=jspath+"json2.js"%>"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
	layui.use(['form','layer','jquery','table'], function(){
		var table = layui.table;
		var form = layui.form;
		var $ = layui.jquery;
		var layer  = layui.layer;

		table.render({
			elem: '#test'
			,even: true
			,page: true
			,width: 650
			,limit:5
			,limits:[5,10,15,20,25,30]
			,cols: [[
				{field:'title', width:150, title: '文档标题'}
				,{field:'clientid', width:100, title: '上传人'}
				,{field:'time', width:100, title: '上传时间'}
				,{field:'fees', width:100, title: '下载积分'}
				,{field:'typeid', width:100, title: '文档类型'}
				,{field:'downloads', width:100, title: '下载次数'}
			]]
			,where:{all:"all"}
			,url:"<%=path+"user/getDocList"%>"
			,id:'docTable'
		});

		<%--用于带条件查询--%>
		$("#query_pa").click(function () {
			table.reload('docTable',{
				url:"<%=path+"user/getDocList"%>"
				,where: { //设定异步数据接口的额外参数，任意设
					filename:$('#filename').val(),
					all:"all"
				}
				,page: {
					curr: 1 //重新从第 1 页开始
				}
			});
		});

		table.on('tool(table_pa)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
			var data = obj.data //获得当前行数据
				,layEvent = obj.event; //获得 lay-event 对应的值

			//查看详情
		});

	});
</script>
</body>
</html>

