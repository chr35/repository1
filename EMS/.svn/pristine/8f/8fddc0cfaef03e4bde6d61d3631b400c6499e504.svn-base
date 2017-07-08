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
	String info = request.getAttribute("json") + "";
	String timetable = "";
	for (int i = 1; i <= 5; i++) {
		timetable += "<tr><td>第" + (i * 2 - 1) + "-" + (i * 2)
				+ "节</td>";
		for (int j = 1; j <= 7; j++) {
			timetable += "<td id='"+ i + j + "'></td>";
		}
		timetable += "</tr>";
	}
%>
</head>

<body>
	<div id="catalog">信息查询->课表查询</div>
	<div class="userPage">
		<table id="maintable" border="1" style="width:100%;">
			<tr>
				<th style="width:10%">节次</th>
				<th style="width:10%">周一</th>
				<th style="width:10%">周二</th>
				<th style="width:10%">周三</th>
				<th style="width:10%">周四</th>
				<th style="width:10%">周五</th>
				<th style="width:10%">周六</th>
				<th style="width:10%">周日</th>
			</tr>
			<%=timetable %>
		</table>
	</div>
	<script type="text/javascript">
	var weeks = new Array("一", "二", "三", "四", "五", "六", "日");
		function init() {
			var json = eval("(" + '<%=info%>' + ")");
			for ( var i = 0; i < json.length; i++) {
				var son = json[i];
				var xy = son.sksj;
				var thetd = $("#" + xy);

				thetd.append("<p>" + son.coursename);
				thetd.append("<p>周" + weeks[xy.substr(-1)] + "第"
						+ ((xy.substr(0, 1)) * 2 - 1) + ","
						+ ((xy.substr(0, 1)) * 2) + "节{第" + son.firstweek + "周"
						+ (son.skpl == "否" ? "" : ("," + son.skpl)) + "}");
				thetd.append("<p>" + son.classname);
				thetd.append("<p>" + son.roomname);
			}
		}
		$(document).ready(function() {
			init();
		});
	</script>
</body>
</html>
