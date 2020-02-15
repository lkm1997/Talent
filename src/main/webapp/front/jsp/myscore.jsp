<%--
  Created by IntelliJ IDEA.
  User: 86135
  Date: 2019/12/25
  Time: 22:28
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
	<title>我的积分</title>
	<link rel="stylesheet" href=<%=path+"layui/css/layui.css"%> >

</head>
<body>

<label class="layui-form-label" style="margin-top: -4%;margin-left: 35%;font-size: 17px;">当前积分:</label>
<div style="margin-left: 21%;margin-top: 12%;">
	<table id="demo" lay-filter="test"></table>
</div>
<button type="button" class="layui-btn" style="position: absolute;margin-top: 24%;margin-left: 45%;" id="return">返回</button>
<script type="text/javascript" src="<%=jspath+"jquery-3.4.1.js"%>"></script>
<script src=<%=path+"layui/layui.js"%> charset="utf-8"></script>
<script>
	layui.use('table', function(){
		var table = layui.table;

		//第一个实例
		table.render({
			elem: '#demo'
			,height: 277
			,width: 796
			,url: '' //数据接口
			,limit:5
			,page: true //开启分页
			,cols: [[ //表头
				{field: 'fileid', title: 'ID', width:80, sort: true, fixed: 'left'}
				,{field: 'time', title: '发生时间', width:177}
				,{field: 'title', title: '发生用户', width:177}
				,{field: 'intro', title: '增加/扣除', width: 177, sort: true}
				,{field: 'fees', title: '积分数', width:177, sort: true}
			]]
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