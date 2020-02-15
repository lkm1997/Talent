<%--
  Created by IntelliJ IDEA.
  User: 86158
  Date: 2020-1-2
  Time: 10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%
	String csspath = application.getContextPath()+"/front/css/";
	String jspath =  application.getContextPath()+"/front/js/";
	String path = application.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>个人信息</title>
	<link rel="stylesheet" href=<%=path+"layui/css/layui.css"%> >
</head>
<body>

<label class="layui-form-label" style="position: absolute;margin-top: 4%;margin-left: 19%;font-size: 20px;width:33%;color: darkorange;">用户名:${sessionScope.user.account}</label>
<label class="layui-form-label" style="position: absolute;margin-top: 8%;margin-left: 19%;font-size: 20px;width:33%;color: darkorange;">性别:${sessionScope.user.sexy}</label>
<label class="layui-form-label" style="position: absolute;margin-top: 12%;margin-left: 19%;font-size: 20px;width:33%;color: darkorange;">学历:${sessionScope.user.educationid}</label>
<label class="layui-form-label" style="position: absolute;margin-top: 16%;margin-left: 19%;font-size: 20px;width: 33%;color: darkorange;">职业:${sessionScope.user.profession}</label>
<label class="layui-form-label" style="position: absolute;margin-top: 20%;margin-left: 19%;font-size: 20px;width: 33%;color: darkorange;">Email:${sessionScope.user.email}</label>
<button type="button" class="layui-btn" style="position: absolute;margin-top: 24%;margin-left: 45%;" id="return">返回</button>
<script type="text/javascript" src="<%=jspath+"jquery-3.4.1.js"%>"></script>
<script src=<%=path+"layui/layui.js"%> charset="utf-8"></script>
<script>
	$('#return').click(function () {
		window.location.href = "<%=path+"jump/front/frontmain"%>";
	})
</script>
</body>
</html>
