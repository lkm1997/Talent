<%--
  Created by IntelliJ IDEA.
  User: 86158
  Date: 2019-11-30
  Time: 20:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = application.getContextPath()+"/";
	String csspath = application.getContextPath()+"/front/css/";
	String jspath =  application.getContextPath()+"/front/js/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">

	<title>登录页面</title>
	<link rel="stylesheet" href=<%=path+"layui/css/layui.css"%>>
	<link rel="stylesheet" href=<%=csspath+"reglogin.css"%>>
</head>
<body>
<input type="hidden" value="<%=path%>" id="basepath">
<div class="login-main">
	<header class="layui-elip">欢迎来到文档分享平台</header>
<%--	action=<%=path+"PatientServlet?methodName=dologin"%> method="post"--%>
	<form class="layui-form"  >
		<div class="layui-input-inline">
			<input type="text" id="login_account" name="account" required lay-verify="required" placeholder="用户名" autocomplete="off"
			       class="layui-input">
		</div>
		<div class="layui-input-inline">
			<input type="password" id="login_password" name="password" required lay-verify="required" placeholder="密码" autocomplete="off"
			       class="layui-input">
		</div>

		<div class="layui-input-inline">
			<input type="text" id="login_code" required lay-verify="required" placeholder="验证码" autocomplete="off"
			       class="layui-input" style="width: 45%;">
			<canvas id="canvas" width="150px" height="50px" onclick="drawPic()"></canvas>
		</div>

		<div class="layui-input-inline login-btn">
			<button type="submit" lay-submit lay-filter="login" class="layui-btn">登录</button>
		</div>
		<hr/>

		<p><a href="<%=path+"jump/front/reg"%>" class="fl">立即注册</a></p>
	</form>
</div>
<script type="text/javascript" src="<%=jspath+"jquery-3.4.1.js"%>"></script>
<script src=<%=path+"layui/layui.js"%>></script>
<script src=<%=jspath+"reglogin.js"%>></script>
<script>
	var basePath = "<%=jspath%>";
</script>
</body>
</html>
