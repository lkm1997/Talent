<%--
  Created by IntelliJ IDEA.
  User: 86158
  Date: 2020-2-5
  Time: 17:11
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
	<title>Title</title>
	<link rel="stylesheet" href=<%=path+"layui/css/layui.css"%> >
	<style>
		#test12{
			float: left;
		}

		#test13{
			float: left;
		}
		#btn{
			float: left;
			margin-top: 8%;
		}
		#btn button{
			margin-top: 2%;
		}

	</style>
</head>
<body>
<div id="test12"></div>
<div id="btn">
	<button class="layui-btn layui-btn-danger" type="button" id="delBtn"><i class="layui-icon"></i></button><br>
	<button class="layui-btn layui-btn-danger" type="button" id="addBtn"><i class="layui-icon"></i></button>
</div>
<div id="test13"></div>
<script type="text/javascript" src="<%=jspath+"jquery-3.4.1.js"%>"></script>
<script src=<%=path+"layui/layui.js"%>></script>
<script>
	var basePath = "<%=path%>";
	//初始加载
	$(getMenu());


	//左移和右移
	layui.use(['tree','form', 'util','jquery','layer'], function() {
		var $ = layui.jquery;
		var tree = layui.tree;
		var layer = layui.layer;
		var util = layui.util;
		var form = layui.form;


		$('#delBtn').click(function () {
			var s = tree.getChecked('deltree');
			$.ajax({
				headers: {
					'Accept': 'application/json',
					'Content-Type': 'application/json'
				},
				type: 'post'
				,async:false
				,url: basePath+"user/delmenu"
				,data:JSON.stringify(s)
				, success: function (res) {
					getMenu();
				}
			});

		});


		$('#addBtn').click(function () {
			var s = tree.getChecked('addtree');
			$.ajax({
				headers: {
					'Accept': 'application/json',
					'Content-Type': 'application/json'
				},
				type: 'post'
				,async:false
				,url: basePath+"user/addmenu"
				,data:JSON.stringify(s)
				, success: function (res) {
					getMenu();
				}
			});

		})
	})



	function getMenu() {
		layui.use(['tree', 'util','jquery','layer'], function() {

			var $ = layui.jquery;
			var tree = layui.tree;
			var layer = layui.layer;
			var	util = layui.util;

			$.ajax({
				type: 'post'
				,async:false
				, url: basePath+"user/menumanger"
				, success: function (res) {
					tree.render({
						elem: '#test12',
						data: res,
						id: 'deltree',
						showCheckbox: true,     //是否显示复选框
						onlyIconControl: true
					})}
			});

			$.ajax({
				type: 'post'
				,async:false
				, url: basePath+"user/unmenu"
				, success: function (res) {
					tree.render({
						elem: '#test13',
						data: res,
						id: 'addtree',
						showCheckbox: true,     //是否显示复选框
						onlyIconControl: true
					})}
			});
		})
	}
</script>
</body>
</html>
