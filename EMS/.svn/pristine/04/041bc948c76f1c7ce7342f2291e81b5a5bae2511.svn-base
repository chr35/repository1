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
    
    <title>编辑学生信息</title>
    
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
	String id=request.getParameter("tid");
	Map m=DbHelper.queryARow("select * from student where id="+id);
	List list=(List)DbHelper.queryForTable("select * from classinfo");
	String classinfos="<option value=''>--请选择班级--</option>";
	for(int i=0;i<list.size();i++){
		Map mm=(Map)list.get(i);
		classinfos+="<option value='"+mm.get("id")+"' "+(mm.get("id").equals(m.get("classid"))?"selected='selected'":"")+">"+mm.get("classname")+"</option>";
	}
 %>
  </head>
  
  <body>
    <div class="uheader">
    	<span>编辑学生信息</span>&nbsp;&nbsp;&nbsp;&nbsp;<a href="Xxwh.do?method=studentsel">返回列表</a>
    </div>
    <div class="ucontent">
    	<form action="Xxwh.do?method=studentadd" method="post">
    		<table style="margin-bottom: 10px;">
    			<tr><td>学号*:</td><td><input name="userid" type="text" value="<%=m.get("userid")%>"/></td></tr>
    			<tr><td>姓名*:</td><td><input name="name" type="text" value="<%=m.get("name")%>"/></td></tr>
    			<tr><td>密码*:</td><td><input name="password" type="text" value="<%=m.get("password")%>"/></td></tr>
    			<tr><td>性别:</td>
    			<td>
    			<select name="sex">
    				<option value="1" <%=("1".equals(m.get("sex"))?"selected='selected'":"")%>>男</option>
    				<option value="2" <%=("2".equals(m.get("sex"))?"selected='selected'":"")%>>女</option>
    			</select>
    			</td></tr>
    			<tr><td>班级*:</td><td><select name="classid"><%=classinfos %></select></td></tr>
    			<tr><td>出生年月:</td><td><input name="birth" type="text" value="<%=m.get("birth")%>"/></td></tr>
    			<tr><td>户籍所在地:</td><td><input name="HJSZD" type="text" value="<%=m.get("HJSZD")%>"/></td></tr>
    			<tr><td>入学时间:</td><td><input name="RXSJ" type="text" value="<%=m.get("RXSJ")%>"/></td></tr>
    		</table>
    		<input type="submit" class="btn" value="提交">
    	</form>
    </div>
  </body>
</html>
