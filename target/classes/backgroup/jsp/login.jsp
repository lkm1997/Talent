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
	String csspath = application.getContextPath()+"/backgroup/css/";
	String jspath =  application.getContextPath()+"/backgroup/js/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">

	<title>后台登录页面</title>
	<link rel="stylesheet" href=<%=path+"layui/css/layui.css"%>>
	<link rel="stylesheet" href=<%=csspath+"login.css"%>>
</head>
<body>

<div class="login-main">
	<header class="layui-elip">文档分享平台管理端</header>
	<form class="layui-form" >
		<div class="layui-input-inline">
			<input type="text" id="login_accountB" name="login_accountB" required lay-verify="required" placeholder="用户名" autocomplete="off"
			       class="layui-input">
		</div>
		<div class="layui-input-inline">
			<input type="password" id="login_passwordB" name="login_passwordB" required lay-verify="required" placeholder="密码" autocomplete="off"
			       class="layui-input">
		</div>

		<div class="layui-input-inline">
			<input type="text" id="login_code" required lay-verify="required" placeholder="验证码" autocomplete="off"
			       class="layui-input" style="width: 45%;">
			<canvas id="canvas" width="150px" height="50px" onclick="drawPic()"></canvas>
		</div>

		<div class="layui-input-inline login-btn">
			<button type="submit" lay-submit lay-filter="login_B" class="layui-btn">登录</button>
		</div>
		<hr/>

	</form>
</div>
<script type="text/javascript" src="<%=jspath+"jquery-3.4.1.js"%>"></script>
<script src=<%=path+"layui/layui.js"%>></script>
<script src=<%=jspath+"login.js"%>></script>
</body>
</html>
