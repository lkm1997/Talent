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
	String jsppath =  application.getContextPath()+"/front/jsp/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>注册页</title>
	<link rel="stylesheet" href=<%=path+"layui/css/layui.css"%>>
	<link rel="stylesheet" href=<%=csspath+"reglogin.css"%>>

	<!--    <link rel="icon" href="../../static/image/code.png">-->
</head>
<body>

<div class="login-main">
	<header class="layui-elip" style="width: 82%">用户注册</header>

	<!-- 表单选项 -->
	<form class="layui-form" action="<%=path%>+user/doreg" method="post">
		<div class="layui-input-inline">
			<!-- 用户名 -->
			<div class="layui-inline" style="width: 85%">
				<input type="text" id="reg_user" name="account" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
			</div>
			<!-- 对号 -->
			<div class="layui-inline">
				<i class="layui-icon" id="ri" style="color: green;font-weight: bolder;" hidden></i>
			</div>
			<!-- 错号 -->
			<div class="layui-inline">
				<i class="layui-icon" id="wr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
			</div>
		</div>
		<!-- 密码 -->
		<div class="layui-input-inline">
			<div class="layui-inline" style="width: 85%">
				<input type="password" id="pwd" name="password" required  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
			</div>
			<!-- 对号 -->
			<div class="layui-inline">
				<i class="layui-icon" id="pri" style="color: green;font-weight: bolder;" hidden></i>
			</div>
			<!-- 错号 -->
			<div class="layui-inline">
				<i class="layui-icon" id="pwr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
			</div>
		</div>
		<!-- 确认密码 -->
		<div class="layui-input-inline">
			<div class="layui-inline" style="width: 85%">
				<input type="password" id="rpwd" name="repassword" required  lay-verify="required" placeholder="请确认密码" autocomplete="off" class="layui-input">
			</div>
			<!-- 对号 -->
			<div class="layui-inline">
				<i class="layui-icon" id="rpri" style="color: green;font-weight: bolder;" hidden></i>
			</div>
			<!-- 错号 -->
			<div class="layui-inline">
				<i class="layui-icon" id="rpwr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
			</div>
		</div>

		<!--性别-->
		<div class="layui-form-item">
			<label class="layui-form-label">性别</label>
			<div class="layui-input-block">
				<input name="sexy" title="男" type="radio" checked="" value="男">
				<input name="sexy" title="女" type="radio" value="女">
			</div>
		</div>

		<!--学历-->
		<div class="layui-input-inline">
			<div class="layui-inline" style="width: 85%">
				<input type="text" id="reg_edu" name="educationid" required  lay-verify="required" placeholder="请输入您的姓名" autocomplete="off" class="layui-input">
			</div>
			<!-- 对号 -->
			<div class="layui-inline">
				<i class="layui-icon" id="nri" style="color: green;font-weight: bolder;" hidden></i>
			</div>
			<!-- 错号 -->
			<div class="layui-inline">
				<i class="layui-icon" id="nwr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
			</div>
		</div>
	<!-- 职业-->
		<div class="layui-inline" style="width: 17%">
			<input type="text" id="reg_pro" name="profession" required  lay-verify="required" placeholder="请输入您的职业" autocomplete="off" class="layui-input">
		</div>
		<!-- 对号 -->
		<div class="layui-inline">
			<i class="layui-icon" id="ari" style="color: green;font-weight: bolder;" hidden></i>
		</div>
		<!-- 错号 -->
		<div class="layui-inline">
			<i class="layui-icon" id="awr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
		</div>

		<!--        手机号-->
		<div class="layui-inline" style="width: 61% ">
			<input type="text" id="reg_phone" name="phone" required  lay-verify="required" placeholder="请输入手机号码" autocomplete="off" class="layui-input">
		</div>
		<!-- 对号 -->
		<div class="layui-inline">
			<i class="layui-icon" id="phri" style="color: green;font-weight: bolder;" hidden></i>
		</div>
		<!-- 错号 -->
		<div class="layui-inline">
			<i class="layui-icon" id="phwr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
		</div>


		<!--   Email-->
		<div class="layui-input-inline">
			<div class="layui-inline" style="width: 85%">
				<input type="text" id="reg_email" name="email" required  lay-verify="required" placeholder="请输入您的学历" autocomplete="off" class="layui-input">
			</div>
			<!-- 对号 -->
			<div class="layui-inline">
				<i class="layui-icon" id="addri" style="color: green;font-weight: bolder;" hidden></i>
			</div>
			<!-- 错号 -->
			<div class="layui-inline">
				<i class="layui-icon" id="addwr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
			</div>
		</div>


		<div class="layui-input-inline login-btn" style="width: 85%">
			<button type="submit" class="layui-btn" lay-submit lay-filter="reg">注册</button>
		</div>
		<hr style="width: 85%" />

		<p><a href="<%=path+"jump/front/login"%>" class="fl">已有账号？立即登录</a></p>

	</form>
</div>
<script src=<%=path+"layui/layui.js"%>></script>
<script src=<%=jspath+"reglogin.js"%>></script>
<script type="text/javascript" src="<%=jspath+"jquery-3.4.1.js"%>"></script>
<script type="text/javascript" src="<%=jspath+"json2.js"%>"></script>
</body>
</html>
