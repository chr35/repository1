<%@page import="com.ems.utils.DbHelper"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'schedule.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/ems.main.css?v=1.0.0">
<style type="text/css">
body {
	padding: 10px;
}

select {
	min-width: 0px;
}

#maintable p {
	margin: 0px;
}

.userPage { /* border: #ccc 1px solid; */
	padding: 10px;
}

td {
	border-top: #ccc 1px solid;
	text-align: center;
	padding: 3px;
}

td:hover {
	background-color: #ccccc;
}

form input {
	min-width: 0px;
	width: 50px;
}
</style>
<%
	List list = (List)request.getAttribute("list");
	String tbl = "";
	for (int i = 0; i <list.size(); i++) {
		Map m=(Map)list.get(i);
		tbl += "<tr>";
		tbl	+=  "<td>"+m.get("csnum")+"</td>";
		tbl	+=  "<td>"+m.get("coursename")+"</td>";
		tbl	+=  "<td>"+m.get("name")+"</td>";
		tbl	+=  "<td>"+m.get("courseType")+"</td>";
		tbl	+=  "<td>"+m.get("credit")+"</td>";
		tbl	+=  "<td>"+(m.get("termgrade")==null?"未上传":m.get("termgrade"))+"</td>";
		tbl += "</tr>";
	}
%>
</head>

<body>
	<div id="catalog">信息查询->成绩查询</div>
	<div class="userPage">
		<table id="maintable" border="1" style="width:100%;">
			<tr>
				<th style="width:10%">课程编号</th>
				<th style="width:10%">课程名称</th>
				<th style="width:10%">任课教师</th>
				<th style="width:10%">课程类型</th>
				<th style="width:10%">课程学分</th>
				<th style="width:10%">分数</th>
			</tr>
			<%=tbl %>
		</table>
	</div>
</body>
</html>
