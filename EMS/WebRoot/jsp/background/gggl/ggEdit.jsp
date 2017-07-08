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
	Map m=DbHelper.queryARow("select * from teacher where id="+id);
 %>
  </head>
  
  <body>
    <div class="uheader">
    	<span>添加教师信息</span>&nbsp;&nbsp;&nbsp;&nbsp;<a href="Xxwh.do?method=teachersel">返回列表</a>
    </div>
    <div class="ucontent">
    	<form action="Xxwh.do?method=teacherupd" method="post">
    	<input type="hidden" name="id" value="<%=id%>"/>
    		<table style="margin-bottom: 10px;">
    			<tr><td>账户id*:</td><td><input name="userid" type="text" value="<%=m.get("userid")%>"/></td></tr>
    			<tr><td>姓名*:</td><td><input name="name" type="text" value="<%=m.get("name")%>"/></td></tr>
    			<tr><td>密码*:</td><td><input name="password" type="text" value="<%=m.get("password")%>"/></td></tr>
    			<tr><td>性别:</td>
    			<td>
    			<select name="sex">
    				<option value="1" <%=("1".equals(m.get("sex"))?"selected='selected'":"")%>>男</option>
    				<option value="2" <%=("2".equals(m.get("sex"))?"selected='selected'":"")%>>女</option>
    			</select>
    			</td></tr>
    			<tr><td>类型:</td><td><input name="type" type="text" value="<%=m.get("type")%>"/></td></tr>
    		</table>
    		<input type="submit" class="btn" value="提交">
    	</form>
    </div>
  </body>
</html>
