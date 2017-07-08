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

form input {
	min-width: 0px;
	width: 50px;
}
</style>
<%
	Teacher user = (Teacher) request.getSession().getAttribute("user");
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
	<div id="catalog">信息查询->教学评价查询</div>
	<div class="userPage">
		<div style="border-bottom: #ccc 1px solid;margin-bottom: 10px;">
			选择课程班级：<select id="ccid" name="ccid" onchange="chscc()">
				<%=ctoption%>
			</select>
		</div>
		<table>
			<tr>
				<th>编号</th>
				<th>项目名称</th>
				<th>优秀数</th>
				<th>良好数</th>
				<th>及格数</th>
				<th>一般数</th>
				<th>较差数</th>
			</tr>
			<tr>
				<td>1</td>
				<td>讲义内容是否丰富充实，积极向上</td>
				<td id="11">
				<td id="12">
				<td id="13">
				<td id="14">
				<td id="15">
			</tr>
			<tr>
				<td>2</td>
				<td>教师能准确把握所教学科内容的重点、难点</td>
				<td id="21">
				<td id="22">
				<td id="23">
				<td id="24">
				<td id="25">
			</tr>
			<tr>
				<td>3</td>
				<td>课堂教学中教师能够有效地调动学生</td>
				<td id="31">
				<td id="32">
				<td id="33">
				<td id="34">
				<td id="35">
			</tr>
			<tr>
				<td>4</td>
				<td>教学手段，教学媒体运用</td>
				<td id="41">
				<td id="42">
				<td id="43">
				<td id="44">
				<td id="45">
			</tr>
			<tr>
				<td>5</td>
				<td>教师在教学方法等方面的处理上表现</td>
				<td id="51">
				<td id="52">
				<td id="53">
				<td id="54">
				<td id="55">
			</tr>
		</table>
	</div>
	<script type="text/javascript">
		$('#sub').hide();
		function chscc() {
			$("tr [id$=1]").text("");
			$("tr [id$=2]").text("");
			$("tr [id$=3]").text("");
			$("tr [id$=4]").text("");
			$("tr [id$=5]").text("");
			if ($("#ccid option:selected").val() == '') {
				return;
			}
			$.post("Teacher.do?method=selselfgrade", {
				"ccid" : $("#ccid option:selected").val()
			}, function(data, textStatus) {
				var json = eval("(" + data + ")");
				if (json.length < 1)
					return;
				for ( var i = 0; i < json.length; i++) {
					var son = json[i];
					$("#" + son.item + son.itemval).text(son.cnt);
				}
			});
		}
	</script>
</body>
</html>
