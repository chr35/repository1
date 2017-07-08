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
	text-align: center;
	padding: 3px;
}

td:hover {
	background-color: #ccccc;
}
form input{
	min-width: 0px;
	width: 50px;
}
</style>
<%
	Teacher user = (Teacher)request.getSession().getAttribute("user");
	List clist = (List) DbHelper
			.queryForTable("select cc.*,ci.classname,cs.coursename from classcourse cc,classinfo ci,course cs where cc.classid=ci.id and cc.courseid=cs.id and cc.teacherid="
					+ user.getId() + " order by cc.courseid,cc.classid");
	String ctoption = "<option value=''>--请选择班级课程--</option>";
	for (int i = 0; i < clist.size(); i++) {
		Map m = (Map) clist.get(i);
		ctoption += "<option value='" + m.get("id") + "'>"
				+ m.get("coursename") + "&nbsp;" + m.get("classname")
				+ "</option>";
	}
%>
</head>

<body>
	<div id="catalog">信息查询->学生表查询</div>
	<div class="userPage">
		<div style="border-bottom: #ccc 1px solid;margin-bottom: 10px;">
			选择课程班级：<select id="ccid" name="ccid" onchange="chscc()">
				<%=ctoption%>
			</select><!--  <input type="button" value="添加学生成绩" onclick="editcc()"> -->
		</div>
		<form method="post" action="Teacher.do?method=addgradeitem">
			<input type="hidden" name="ccid" id="cc">
			<table>
				<tr>
					<th>学号</th>
					<th>姓名</th>
				</tr>

			</table>
			<div>
				<span style="margin-left: 90px;"><input type="submit" id="sub"
					value="提交" /> </span>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		$('#sub').hide();
		function chscc() {
			var tbl = $("form table");
			tbl.find("th").parent().nextAll().remove();
			$('#sub').hide();
			if ($("#ccid option:selected").val() == '') {
				return;
			}
			$.post(
							"Teacher.do?method=getgradeitem",
							{
								"ccid" : $("#ccid option:selected").val()
							},
							function(data, textStatus) {
								$('#cc').val($("#ccid option:selected").val());
								var json = eval("(" + data + ")");

								var trs = "";
								for ( var i = 0; i < json.length; i++) {
									var son = json[i];
									trs += "<tr>"
									trs += "<td>" + son.userid + "</td>";
									trs += "<td>" + son.name + "</td>";
								}
								tbl.append(trs);
							});
		}
		function editcc() {
			var tbl = $("form table");
			tbl.find("th").parent().nextAll().remove();
			$('#sub').hide();
			if ($("#ccid option:selected").val() == '') {
				return;
			}
			$.post(
							"Teacher.do?method=getgradeitem",
							{
								"ccid" : $("#ccid option:selected").val()
							},
							function(data, textStatus) {
								$('#cc').val($("#ccid option:selected").val());
								var json = eval("(" + data + ")");

								var trs = "";
								for ( var i = 0; i < json.length; i++) {
									var son = json[i];
									trs += "<tr>"
									trs += "<td>" + son.userid + "</td>";
									trs += "<td>" + son.name + "</td>";
									trs += "<td><input type='text' name='grade"+son.id+"' value='"+(son.termgrade==null?"":son.termgrade)+"'></td>";
								}
								tbl.append(trs);
								$('#sub').show();
							});
		}
	</script>
</body>
</html>
