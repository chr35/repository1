<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'studentmain.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/ems.main.css">
<style type="text/css">
.top{
	height: 92px;
	width:100%;
	background-color: #337ab7;
	padding: 10px;
	color: #fff;
}
#zx:hover{
			background-color: rgb(105, 174, 241);
    		color: #404040!important;
		}
</style>
  </head>

<body class="mainbody">
	<div class="top">
		<h1>云起教务管理系统-学生端</h1>
	</div>
	<a id="zx" style="position: absolute;top:10px;right: 10px;color: #d0d0d0;" href="Login.do?method=logout" target="_top">注销</a>
	<div id="divone"
		style="width:100%;background-color: #337ab7;height: 38px;;border-top:3px solid #F2861D">
		<ul class="navigation">
			<li><a href="welcome.jsp" target="thePage">返回首页</a></li>
			<li><a href="javascript:void(0)" target="thePage">课程管理</a>
				<ul>
					<li><a href="jsp/student/teachergrade.jsp" target="thePage">教学质量评价</a></li>
				</ul>
				<div class="clear"></div>
			</li>
			<li><a href="javascript:void(0)" target="thePage">信息查询</a>
				<ul>
					<li><a href="Student.do?method=selschedule" target="thePage">课表查询</a></li>
					<li><a href="Student.do?method=selgrade" target="thePage">成绩查询</a></li>
				</ul>
				<div class="clear"></div>
			</li>
			<li><a href="javascript:void(0)" target="thePage">信息维护</a>
				<ul>
					<li><a href="jsp/student/userinfo.jsp" target="thePage">个人信息管理</a></li>
				</ul>
			</li>
		</ul>
	</div>
	<div class="mainPage" id="mainPage">
		<iframe src="welcome.jsp" style="width:100%;height: 100%;" id="thePage" name="thePage"> </iframe>
	</div>
	<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript">
$(document).ready(function () {	
	$('.navigation li').hover(
		function () {
			$('ul', this).fadeIn();
		}, 
		function () {
			$('ul', this).fadeOut();
		}
	);
	$("#mainPage").innerHeight(window.innerHeight-113-41-20);
});
$(window).resize(function() {
  $("#mainPage").innerHeight(window.innerHeight-113-41-20);
});
	</script>
</body>
</html>