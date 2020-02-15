<%--
  Created by IntelliJ IDEA.
  User: 86135
  Date: 2019/12/25
  Time: 22:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = application.getContextPath()+"/";
	String csspath = application.getContextPath()+"/front/css/";
	String jspath =  application.getContextPath()+"/front/js/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>我的文档</title>
	<link rel="stylesheet" href=<%=path+"layui/css/layui.css"%> >

</head>
<body>

<div class="layui-form-item">
	<label class="layui-form-label" style="margin-top: -4%;margin-left: 21%;font-size: 17px;">上传时间</label>
	<div class="layui-input-block" style="margin-left: 30%;margin-top: -4%;position: absolute;width: 12%;">
		<input type="date" name="title" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input" >
	</div>
</div>
<div class="layui-form-item">
	<label class="layui-form-label" style="margin-top: -4%;margin-left: 40%;font-size: 17px;">至</label>
	<div class="layui-input-block" style="margin-left: 49%;margin-top: -4%;position: absolute;width: 12%;">
		<input type="date" name="title" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input" >
	</div>
</div>
<button type="button" class="layui-btn" style="position: absolute;margin-top: -4%;margin-left: 65%;">查询</button>
<label class="layui-form-label" style="margin-top: -8%;margin-left: 21%;font-size: 17px;">文档类型</label>
<div class="layui-form" style="width: 11%;position: absolute;margin-top: -8%;margin-left: 31%;">
	<select name="city" lay-verify="selectType" >
		<option value="">请选择一个类型</option>
		<option value="010">图片</option>
		<option value="021">文档</option>
		<option value="0571">视频</option>
		<option value="057">音乐</option>
	</select>
</div>
<label class="layui-form-label" style="margin-top: -8%;margin-left: 41%;font-size: 17px;">审核状态</label>
<div class="layui-form" style="width: 11%;position: absolute;margin-top: -8%;margin-left: 50%;">
	<select name="city" lay-verify="selectState" >
		<option value="">请选择一个状态</option>
		<option value="010">待审核</option>
		<option value="021">审核通过</option>
	</select>
</div>


<div style="margin-left: 12%;margin-top: 12%;">
	<table id="demo" lay-filter="test"></table>
</div>
<button type="button" class="layui-btn" style="position: absolute;margin-top: 24%;margin-left: 45%;" id="return">返回</button>
<script type="text/javascript" src="<%=jspath+"jquery-3.4.1.js"%>"></script>
<script src=<%=path+"layui/layui.js"%> charset="utf-8"></script>
<script>
	layui.use(['form','layer','jquery','table'], function(){
		var table = layui.table;
		var form = layui.form;
		var $ = layui.jquery;
		var layer  = layui.layer;

		//第一个实例
		table.render({
			elem: '#demo'
			,height: 277
			,width: 973
			,url: "<%=path+"user/getDocList"%>" //数据接口
			,where:{all:"no"}
			,limit:5
			,page: true //开启分页
			,cols: [[ //表头
				{field: 'fileid', title: 'ID', width:80, sort: true, fixed: 'left'}
				,{field: 'title', title: '文档标题', width:177}
				,{field: 'time', title: '上传时间', width:177}
				,{field: 'fees', title: '下载积分', width:177, sort: true}
				,{field: 'typeid', title: '文档类型', width: 177, sort: true
				,templet:function (d) {
					return d.typeid==1 ? '.doc':'.txt';
				}}
				,{field: 'statusid', title: '审核状态', width: 177
				,templet:function (d) {
					return d.statusid==0 ? '审核通过':'审核失败';
				}}
			]]
			,id:'mydocTable'
		});

		form.on('submit(login)', function () {
			table.reload('mydocTable',{
				url:"<%=path+"user/getDocList"%>"
				,where: { //设定异步数据接口的额外参数，任意设
					filename:$('#filename').val(),
					all:"no"
				}
				,page: {
					curr: 1 //重新从第 1 页开始
				}
			});

		});

	});
</script>
<script>
	$('#return').click(function () {
		window.location.href = "<%=path+"jump/front/frontmain"%>";
	})
</script>
</body>
</html>