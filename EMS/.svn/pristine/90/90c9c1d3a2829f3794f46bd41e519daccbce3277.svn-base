<%@page import="com.ems.utils.PageHelper"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>教师信息维护</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link rel="stylesheet" type="text/css" href="css/ems.main.css?v=1.0.3">
	<style type="text/css">
		div{
			background-color: white;
			padding: 10px;
		}
		body{
			padding: 10px;
		}
	</style>
	<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
	<%	
		String tlist="";
		List list=(List)request.getAttribute("tlist");
		for(int i=0;i<list.size();i++){
			Map m=(Map)list.get(i);
			tlist+="<tr>";
			tlist+="<td>"+m.get("userid")+"</td>";
			tlist+="<td>"+m.get("name")+"</td>";
			tlist+="<td>"+("1".equals(m.get("sex"))?"男":"女")+"</td>";
			tlist+="<td>"+m.get("type")+"</td>";
			tlist+="<td><a href='jsp/background/xxwh/teacherEdit.jsp?tid="+m.get("id")+"'>编辑</a> "+
				"<a href='javascript:delTeacher("+m.get("id")+")'>删除</a></td>";
			tlist+="</tr>";
		}
		PageHelper pageinfo=(PageHelper)request.getSession().getAttribute("pageinfo");
		String pages="";
		int per=pageinfo.getRecordNum();
		int nowp=pageinfo.getNowPage();
		int endp=pageinfo.getSumPage()-nowp;
		pages+="<td><a href='Xxwh.do?method=chgpage&topage=1'>首页</a><td>";
		pages+="<td><a href='Xxwh.do?method=chgpage&topage="+(nowp>1?(nowp-1):1)+"'>上一页</a><td>";
		pages+="<td>"+nowp+"/"+pageinfo.getSumPage()+"<td>";
		pages+="<td><a href='Xxwh.do?method=chgpage&topage="+(endp>0?(nowp+1):pageinfo.getSumPage())+"'>下一页</a><td>";
		pages+="<td><a href='Xxwh.do?method=chgpage&topage="+pageinfo.getSumPage()+"'>尾页</a><td>";
	 %>
  </head>
  
  <body>
  	<div style="margin-bottom: 10px;">
  		<h2>教师信息维护</h2>
  	</div>
    <div class="condition">
    	<form action="Xxwh.do?method=teachersel" method="post">
    		<table>
    			<tr>
    				<td>账户id:</td><td><input type="text" name="cuserid"/></td><td>姓名:</td><td><input type="text" name="cname"/></td>
    			</tr>
    		</table>
    		<input class="btn" type="submit" value="查询"/> <input class="btn" type="button" onclick="location.href='jsp/background/xxwh/teacherAdd.jsp'" value="添加"/>
    	</form>
    </div>
    <div class="tlist">
    	<table class="tlisttable">
    		<tr>
    			<th>账户id</th><th>姓名</th><th>性别</th><th>类型</th><th>操作</th>
    		</tr>
    		<%=tlist %>
    	</table>
    	<div class="divPage">
    		<table>
    			<tr><%=pages %>
    			<td><select onchange="chgPage(this)">
    				<option value="5" <%=(per==5?"selected='selected'":"") %>>5</option>
    				<option value="10" <%=(per==10?"selected='selected'":"") %>>10</option>
    				<option value="15" <%=(per==15?"selected='selected'":"") %>>15</option>
    				<option value="25" <%=(per==25?"selected='selected'":"") %>>25</option>
    			</select>/每页</td></tr>
    		</table>
    	</div>
    </div>
    <script type="text/javascript">
    $(".tlist").find("tr:even").css("background-color","#f0f2f5");
    function chgPage(o){
    	location.href="Xxwh.do?method=chgpage&topage=-1&per="+o.value;
    }
    function delTeacher(id){
    	if(confirm("你确定要删除这条记录吗？")){
    		location.href="Xxwh.do?method=teacherdel&id="+id;
    	}
    }
    </script>
  </body>
</html>
