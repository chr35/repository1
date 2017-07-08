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
	<link rel="stylesheet" type="text/css" href="css/ems.main.css?v=1.0.2">
	<style type="text/css">
		div{
			background-color: white;
			padding: 10px;
		}
		body{
			padding: 10px;
		}
		.tlisttable input{
			min-width: 0px;
		}
	</style>
	<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
	<%
		List list=(List)request.getAttribute("list");
		String tlist="";
		for(int i=0;i<list.size();i++){
			Map m=(Map)list.get(i);
			tlist+="<tr>";
			tlist+="<td>"+m.get("userid")+"</td>";
			tlist+="<td>"+m.get("name")+"</td>";
			tlist+="<td>"+m.get("people")+"</td>";
			tlist+="<td>"+m.get("cnt1")+"</td>";
			tlist+="<td>"+m.get("cnt2")+"</td>";
			tlist+="<td>"+m.get("cnt3")+"</td>";
			tlist+="<td>"+m.get("cnt4")+"</td>";
			tlist+="<td>"+m.get("cnt5")+"</td>";
			tlist+="</tr>";
		}
	 %>
  </head>
  
  <body>
    <div class="condition">
    <h2>教学质量评价结果</h2>
    	<!-- <form action="Xxwh.do?method=teachersel" method="post">
    		<table>
    			<tr>
    				<td>账户id:</td><td><input type="text" name="cuserid"/></td><td>姓名:</td><td><input type="text" name="cname"/></td>
    			</tr>
    		</table>
    		<input class="btn" type="submit" value="查询"/> <input class="btn" type="button" onclick="location.href='jsp/background/xxwh/teacherAdd.jsp'" value="添加"/>
    	</form> -->
    </div>
    <div class="tlist">
    	<table class="tlisttable">
    		<tr>
    			<th>编号</th><th>姓名</th><th>评价人数</th><th>优秀数</th><th>良好数</th><th>及格数</th><th>一般数</th><th>较差数</th>
    		</tr>
    		<%=tlist %>
    	</table>
    	<!-- <div class="divPage">
    		<table>
    			<tr>
    			<td><select onchange="chgPage(this)">
    				<option value="5" >5</option>
    				<option value="10" >10</option>
    				<option value="15" >15</option>
    				<option value="25" >25</option>
    			</select>/每页</td></tr>
    		</table>
    	</div> -->
    </div>
    <script type="text/javascript">
    $(".tlist").find("tr:even").css("background-color","#f0f2f5");
    function chgPage(o){
    	location.href="Xxwh.do?method=chgpage&topage=-1&per="+o.value;
    }
    </script>
  </body>
</html>
