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
	Teacher user = new Teacher();//(Teacher)request.getSession().getAttribute("user");
	String classid = "1";
	List clist = (List) DbHelper
			.queryForTable("select cc.*,tc.`name`,cs.coursename from classcourse cc,teacher tc,course cs where cc.teacherid=tc.id and cc.courseid=cs.id and cc.classid="
					+ classid);
	String ctoption = "<option value=''>--请选择班级课程--</option>";
	for (int i = 0; i < clist.size(); i++) {
		Map m = (Map) clist.get(i);
		ctoption += "<option value='" + m.get("id") + "'>"
				+ m.get("coursename") + "&nbsp;" + m.get("name")
				+ "</option>";
	}
%>
</head>

<body>
	<div id="catalog">课程管理->学生成绩管理</div>
	<div class="userPage">
		<div style="border-bottom: #ccc 1px solid;margin-bottom: 10px;">
			选择教师：<select id="ccid" name="ccid" onchange="chscc()">
				<%=ctoption%>
			</select> <input type="button" value="添加评价信息" onclick="editcc()">
		</div>
		<form method="post" action="Student.do?method=addgradeitem">
			<input type="hidden" name="ccid" id="cc">
			<table>
				<tr>
					<th>编号</th>
					<th>评价内容</th>
					<th>得分</th>
				</tr>
				
				<tr><td>1</td><td>讲义内容是否丰富充实，积极向上</td><td><select id="item1" name="item1">
					<option value='0'></option>
					<option value="1">优秀</option>
					<option value="2">良好</option>
					<option value="3">及格</option>
					<option value="4">一般</option>
					<option value="5">较差</option>
				</select></td></tr>
				<tr><td>2</td><td>教师能准确把握所教学科内容的重点、难点</td><td><select id="item2" name="item2">
				<option value='0'></option>
					<option value="1">优秀</option>
					<option value="2">良好</option>
					<option value="3">及格</option>
					<option value="4">一般</option>
					<option value="5">较差</option>
				</select></td></tr>
				<tr><td>3</td><td>课堂教学中教师能够有效地调动学生</td><td><select id="item3" name="item3">
				<option value='0'></option>
					<option value="1">优秀</option>
					<option value="2">良好</option>
					<option value="3">及格</option>
					<option value="4">一般</option>
					<option value="5">较差</option>
				</select></td></tr>
				<tr><td>4</td><td>教学手段，教学媒体运用</td><td><select id="item4" name="item4">
				<option value='0'></option>
					<option value="1">优秀</option>
					<option value="2">良好</option>
					<option value="3">及格</option>
					<option value="4">一般</option>
					<option value="5">较差</option>
				</select></td></tr>
				<tr><td>5</td><td>教师在教学方法等方面的处理上表现</td><td><select id="item5" name="item5">
				<option value='0'></option>
					<option value="1">优秀</option>
					<option value="2">良好</option>
					<option value="3">及格</option>
					<option value="4">一般</option>
					<option value="5">较差</option>
				</select></td></tr>
			</table>
			<div>
				<span style="margin-left: 90px;"><input type="submit"
					id="sub" value="提交" /> </span>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		$('#sub').hide();
		function chscc() {
			var tbl = $("td select").val(0);
			$('#sub').hide();
			if ($("#ccid option:selected").val() == '') {
				return;
			}
			$.post("Student.do?method=selteachergrade", {
				"ccid" : $("#ccid option:selected").val()
			}, function(data, textStatus) {
				if(data=="null"||data==""||data==null||typeof(data) == undefined)return;
				var json = eval("(" + data + ")");
				if(json.length<1)return;
				var g=json[0].evaluategrade;
				$("#item1").val(g.substr(0,1));
				$("#item2").val(g.substr(1,1));
				$("#item3").val(g.substr(2,1));
				$("#item4").val(g.substr(3,1));
				$("#item5").val(g.substr(4,1));
			});
		}
		function editcc() {
			var tbl = $("td select").val(0);
			$('#sub').hide();
			if ($("#ccid option:selected").val() == '') {
				return;
			}
			$.post("Student.do?method=selteachergrade", {
				"ccid" : $("#ccid option:selected").val()
			}, function(data, textStatus) {
				$('#sub').show();
				$("#cc").val($("#ccid option:selected").val());
				if(data=="null"||data==""||data==null||typeof(data) == undefined)return;
				var json = eval("(" + data + ")");
				if(json.length<1)return;
				var g=json[0].evaluategrade;
				$("#item1").val(g.substr(0,1));
				$("#item2").val(g.substr(1,1));
				$("#item3").val(g.substr(2,1));
				$("#item4").val(g.substr(3,1));
				$("#item5").val(g.substr(4,1));
			});
		}
	</script>
</body>
</html>
