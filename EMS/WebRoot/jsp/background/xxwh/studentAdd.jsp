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
    
    <title>添加学生信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link rel="stylesheet" type="text/css" href="css/ems.main.css">
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
	Calendar cal=Calendar.getInstance();
	List list=(List)DbHelper.queryForTable("select * from classinfo");
	String classinfos="<option value=''>--请选择班级--</option>";
	for(int i=0;i<list.size();i++){
		Map m=(Map)list.get(i);
		classinfos+="<option value='"+m.get("id")+"'>"+m.get("classname")+"</option>";
	}
 %>
  </head>
  
  <body>
    <div class="uheader">
    	<span>添加学生信息</span>&nbsp;&nbsp;&nbsp;&nbsp;<a href="Xxwh.do?method=studentsel">返回列表</a>
    </div>
    <div class="ucontent">
    	<form action="Xxwh.do?method=studentadd" method="post">
    		<table style="margin-bottom: 10px;">
    			<tr><td>学号*:</td><td><input name="userid" type="text"/></td></tr>
    			<tr><td>姓名*:</td><td><input name="name" type="text"/></td></tr>
    			<tr><td>密码*:</td><td><input name="password" type="text" value="000000"/></td></tr>
    			<tr><td>性别:</td>
    			<td>
    			<select name="sex">
    				<option value="1">男</option>
    				<option value="2">女</option>
    			</select>
    			</td></tr>
    			<tr><td>班级*:</td><td><select name="classid"><%=classinfos %></select></td></tr>
    			<tr><td>出生年月:</td><td><input name="birth" type="text"/></td></tr>
    			<tr><td>户籍所在地:</td><td><input name="HJSZD" type="text"/></td></tr>
    			<tr><td>入学时间:</td><td><input name="RXSJ" type="text" value="<%=(cal.get(Calendar.YEAR)+"-"+(cal.get(Calendar.MONTH)+1))%>"/></td></tr>
    		</table>
    		<input type="submit" class="btn" value="提交">
    	</form>
    </div>
  </body>
</html>
