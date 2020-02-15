<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 86158
  Date: 2019-12-2
  Time: 15:29
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
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>心理咨询与诊断平台管理端</title>
	<link rel="stylesheet" href=<%=path+"layui/css/layui.css"%>>

</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
	<div class="layui-header">
		<div class="layui-logo">心理咨询与诊断平台管理端</div>
		<!-- 头部区域（可配合layui已有的水平导航） -->

		<ul class="layui-nav layui-layout-right">
			<li class="layui-nav-item">
				<a href="javascript:;">
					<img src="http://t.cn/RCzsdCq" class="layui-nav-img">
					${sessionScope.user.wusername}
				</a>
				<dl class="layui-nav-child">
					<dd><a href="">基本资料</a></dd>
					<dd><a href="">安全设置</a></dd>
				</dl>
			</li>
			<li class="layui-nav-item" onclick="zhuxiao()">注销</li>
		</ul>
	</div>

	<div class="layui-side layui-bg-black">
		<div class="layui-side-scroll">
			<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
			<ul class="layui-nav layui-nav-tree"  lay-filter="test">
				<li class="layui-nav-item layui-nav-itemed">
					<a class="">用户管理</a>
					<dl class="layui-nav-child">
						<dd><a href="JumpServlet?methodName=goUserManager" target="main_self_frame">用户列表</a></dd>
						<dd><a href="">列表二</a></dd>
						<dd><a href="">列表三</a></dd>
						<dd><a href="">超链接</a></dd>
					</dl>
				</li>
			</ul>
		</div>
	</div>
<%--	<div class="layui-side layui-bg-black">--%>
<%--		<div class="layui-side-scroll">--%>
<%--			<ul class="layui-nav layui-nav-tree"  lay-filter="test">--%>
<%--			<!-- 左侧导航区域（可配合layui已有的垂直导航） -->--%>
<%--			<c:if test="${sessionScope.menumap != null}">--%>
<%--				<c:forEach items="${sessionScope.menumap}" begin="0" var="i">--%>
<%--					<li class="layui-nav-item ">--%>
<%--						<a class="" href="javascript:;">${i.key}</a>--%>
<%--						<dl class="layui-nav-child">--%>
<%--							<c:forEach items="${i.value}" begin="0" var="j" >--%>
<%--								<dd><a href="${j.url}" target="main_self_frame">${j.menuname}</a></dd>--%>
<%--							</c:forEach>--%>
<%--						</dl>--%>
<%--					</li>--%>
<%--				</c:forEach>--%>
<%--			</c:if>--%>
<%--			</ul>--%>
<%--		</div>--%>
<%--	</div>--%>

	<div class="layui-body">
		<!-- 内容主体区域 -->
		<iframe src="" name="main_self_frame" frameborder="0" class="layadmin-iframe" style="width: 100%" height="100%"></iframe>
	</div>

	<div class="layui-footer">
		<!-- 底部固定区域 -->
		© layui.com - 底部固定区域
	</div>
</div>
<script src=<%=path+"layui/layui.js"%>></script>
<script>
	//JavaScript代码区域
	layui.use('element', function(){
		var element = layui.element;

	});
	function zhuxiao() {
		if(confirm("确定注销账号吗?")){
			window.location.href="JumpServlet?methodName=goBackgroupLogin";
		}
	}
</script>
</body>
</html>
