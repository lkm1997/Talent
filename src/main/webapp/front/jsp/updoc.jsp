<%--
  Created by IntelliJ IDEA.
  User: SGT
  Date: 2019/12/3
  Time: 16:49
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
	<title>上传文档</title>
	<link rel="stylesheet" href=<%=path+"layui/css/layui.css"%> >
</head>
<body>

<div class="layui-form-item">
	<label class="layui-form-label" style="margin-top: -4%;margin-left: 21%;font-size: 17px;">文档标题</label>
	<div class="layui-input-block" style="margin-left: 30%;margin-top: -4%;position: absolute;width: 21.6%;">
		<input type="text" name="title" required  lay-verify="required" placeholder="请输入文档标题" autocomplete="off" class="layui-input" >
	</div>
</div>
<div class="layui-form-item layui-form-text" style="position: absolute;margin-left: 21.7%;">
	<label class="layui-form-label" style="font-size: 17px;margin-left: -3%;">文档简介</label>
	<div class="layui-input-block" style="width: 98%;">
		<textarea name="intro" placeholder="请输入内容" class="layui-textarea"></textarea>
	</div>
</div>

<div style="margin-left: 12%;margin-top: 12%;">
	<table id="demo" lay-filter="test"></table>
</div>
<button type="button" class="layui-btn" id="test2" style="position: absolute;margin-left: 45%;margin-top: 9%;">
	<i class="layui-icon">&#xe67c;</i>浏览
</button>
<div class="layui-form-item">
	<label class="layui-form-label" style="margin-top: 9%;margin-left: 17%;font-size: 17px;width: 10%;">请选择上传文档</label>
	<div class="layui-input-block" style="margin-left: 30%;margin-top: 9%;position: absolute;width: 12%;">
		<input type="text" name="file" required  lay-verify="required" placeholder="文档名称" autocomplete="off" class="layui-input" >
	</div>
</div>
<div class="layui-form-item">
	<label class="layui-form-label" style="margin-top: 1%;margin-left: 21%;font-size: 17px;">下载积分</label>
	<div class="layui-input-block" style="margin-left: 30%;margin-top: 1%;position: absolute;width: 21.6%;">
		<input type="text" name="fees" required  lay-verify="required" placeholder="文档积分" autocomplete="off" class="layui-input" >
	</div>
</div>
<button type="button" class="layui-btn" style="margin-left: 30%;margin-top: 3%;position: absolute;" id="up">提交</button>
<button type="button" class="layui-btn" style="position: absolute;margin-top: 24%;margin-left: 45%;" id="return">返回</button>
<script type="text/javascript" src="<%=jspath+"jquery-3.4.1.js"%>"></script>
<script src=<%=path+"layui/layui.js"%> charset="utf-8"></script>
<script>
	layui.use(['form','layer','jquery','upload'], function(){
		var upload = layui.upload;
		var form = layui.form;
		var $ = layui.jquery;
		var layer  = layui.layer;
		//执行实例
		upload.render({
			elem: '#test2' //绑定元素
			,url: 'user/uploadfile' //上传接口
			,multiple:false
			,auto: false  //取消自动上传，并指定提交按钮进行上传
			,bindAction: '#btn'
			,accept: 'file' //允许上传的文件类型
			,done: function(res){
				//上传完毕回调
				alert(res.code);
			}
			,error: function(){
				//请求异常回调
			}
		});
		form.on('submit(up)', function (data) {
			$.post(
				"user/uploadfile",
				{
					"data": data.field
				},
				function (msg) {
				}
			);
		})
	});
</script>
<script>
	$('#return').click(function () {
		window.location.href =  "<%=path+"jump/front/frontmain"%>";
	})
</script>

</body>
</html>