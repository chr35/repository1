<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加班级信息</title>
    
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
    	<span>添加班级信息</span>&nbsp;&nbsp;&nbsp;&nbsp;<a href="Xxwh.do?method=classinfosel">返回列表</a>
    </div>
    <div class="ucontent">
    	<form action="Xxwh.do?method=classinfoadd" method="post">
    		<table style="margin-bottom: 10px;">
    			<tr><td>班级编号*:</td><td><input name="classid" type="text"/></td></tr>
    			<tr><td>班级名称*:</td><td><input name="classname" type="text"/></td></tr>
    		</table>
    		<input type="submit" class="btn" value="提交">
    	</form>
    </div>
  </body>
</html>
