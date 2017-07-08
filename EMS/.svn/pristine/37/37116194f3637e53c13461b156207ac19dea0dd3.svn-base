<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加教室信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link rel="stylesheet" type="text/css" href="css/ems.main.css?v=0.0.0">
<style type="text/css">
		div{
			background-color: white;
			padding: 10px;
		}
		body{
			padding: 10px;
			color: #656565;
		}
		td{
			padding: 5px;
		}
</style>
  </head>
  
  <body>
    <div class="uheader">
    	<span>添加教室信息</span>&nbsp;&nbsp;&nbsp;&nbsp;<a href="Xxwh.do?method=classroomsel">返回列表</a>
    </div>
    <div class="ucontent">
    	<form action="Xxwh.do?method=classroomadd" method="post">
    		<table style="margin-bottom: 10px;">
    			<tr><td>教室编号*:</td><td><input name="roomid" type="text"/></td></tr>
    			<tr><td>教室名称*:</td><td><input name="roomname" type="text"/></td></tr>
    			<tr><td>教室位置*:</td><td><input name="address" type="text"/></td></tr>
    			<tr><td>教室类型:</td><td><input name="type" type="text"/></td></tr>
    			<tr><td>教室容量:</td><td><input name="container" type="text"/></td></tr>
    		</table>
    		<input type="submit" class="btn" value="提交">
    	</form>
    </div>
  </body>
</html>
