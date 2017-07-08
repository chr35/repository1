<%@page import="com.ems.utils.DbHelper"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>编辑教师信息</title>
    
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
<%
	String id=request.getParameter("tid");
	Map m=DbHelper.queryARow("select * from course where id="+id);
 %>
  </head>
  
  <body>
    <div class="uheader">
    	<span>编辑课程信息</span>&nbsp;&nbsp;&nbsp;&nbsp;<a href="Xxwh.do?method=coursesel">返回列表</a>
    </div>
    <div class="ucontent">
    	<form action="Xxwh.do?method=courseupd" method="post">
    	<input type="hidden" name="id" value="<%=id%>"/>
    		<table style="margin-bottom: 10px;">
    			<tr><td>课程编号*:</td><td><input name="courseid" type="text" value="<%=m.get("courseid")%>"/></td></tr>
    			<tr><td>课程名称*:</td><td><input name="coursename" type="text" value="<%=m.get("coursename")%>"/></td></tr>
    			<tr><td>课程类型:</td><td><input name="coursetype" type="text" value="<%=m.get("courseType")%>"/></td></tr>
    			<tr><td>学分:</td><td><input name="credit" type="text" value="<%=m.get("credit")%>"/></td></tr>
    			<tr><td>备注:</td><td><input name="bz" type="text" value="<%=m.get("bz")%>"/></td></tr>
    		</table>
    		<input type="submit" class="btn" value="提交">
    	</form>
    </div>
  </body>
</html>
