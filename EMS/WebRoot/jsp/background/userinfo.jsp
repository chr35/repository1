<%@page import="com.ems.utils.DbHelper"%>
<%@page import="com.ems.entity.Teacher"%>
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

<title>My JSP 'studentgrade.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/ems.main.css?v=1.0.0">
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<style type="text/css">
body {
	padding: 10px;
}

.userPage { /* border: #ccc 1px solid; */
	padding: 10px;
}

td {
	border-top: #ccc 1px solid;
	padding: 6px;
}

td:hover {
	background-color: #ccccc;
}
form input{
	min-width: 0px;
	width: 50px;
}
table tr td:FIRST-CHILD {
	text-align: right;
	border-right: #ccc 1px solid;
}
table tr:FIRST-CHILD td {
	border-top-style: none;
}
</style>
<%
	Teacher user = (Teacher)request.getSession().getAttribute("user");
%>
</head>

<body>
	<div id="catalog">信息管理->个人信息管理</div>
	<div class="userPage" style="text-align: center;">
	<div style="width:50%;min-width: 450px;display: inline-block">
			<table style="width:100%;">
				<col style="width:50%;text-align: right;"/>
				<col style="width:50%;text-align: left;"/>
				<tr><td>编号</td><td><%=user.getUserid() %></td></tr>
				<tr><td>姓名</td><td><%=user.getName() %></td></tr>
				<tr><td>性别</td><td><%=(user.getSex().equals("1")?"男":"女") %></td></tr>
				<tr><td>账号类型</td><td><%=user.getType() %></td></tr>
			</table>
			<div style="margin: 10px 0px;padding: 0 10px;text-align: center;background-color: #50b3f5;">
				修改密码
			</div>
				<table style="width:100%;">
					<col style="width:50%;text-align: right;"/>
					<col style="width:50%;text-align: left;"/>
					<tr><td>原密码：</td><td><input type="password" id="oldpass" name="oldpass"></td></tr>
					<tr><td>新密码：</td><td><input type="password" id="newpass" name="newpass"></td></tr>
					<tr><td colspan="2" style="border-right-style: none;text-align: center;"><input type="button" onclick="chgpass()" value="提交"></td></tr>
				</table>
			<span id="msg"></span>
	</div>
	</div>
	<script type="text/javascript">
		function chgpass(){
			$.post("Teacher.do?method=chgpassword", {
				"oldpass" : $("#oldpass").val(),
				"newpass" : $("#newpass").val()
			}, function(data, textStatus) {
				$("#msg").text(data);
			});
		}
	</script>
</body>
</html>
