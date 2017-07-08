<%@page import="com.ems.utils.DbHelper"%>
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

<title>My JSP 'schedule.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/ems.main.css">
<style type="text/css">
div {
	background-color: white;
	padding: 10px;
}

body {
	padding: 10px;
}

td {
	text-align: center;
}

#content {
	position: fixed;
	left: 50%;
	top: 50%;
	padding: 0;
	height: 0px;
}

#content .content {
	display: block;
}

#content td {
	text-align: right;
}

select {
	min-width: 0px;
}
#maintable p{
	margin: 0px;
}
</style>
<%
	String courselist = "<option value=''>--请选择课程--</option>";
	//String teacherlist = "<option value=''>--请选择教师--</option>";
	//String classroomlist = "<option value=''>--请选择教室--</option>";
	String classlist="<option value=''>--请选择班级--</option>";
	//String weeklist = "";
	String timetable = "";
	List clist = (List) DbHelper
			.queryForTable("select * from course order by courseid");
	//List tlist = (List) DbHelper
	//		.queryForTable("select * from teacher order by userid");
	//List rlist = (List) DbHelper
	//		.queryForTable("select * from classroom order by roomid");
	List alist = (List) DbHelper
			.queryForTable("select * from classinfo order by classid");
			
	for (int i = 0; i < clist.size(); i++) {
		Map m = (Map) clist.get(i);
		courselist += "<option value='" + m.get("id") + "'>"
				+ m.get("coursename") + "</option>";
	}
	/* for (int i = 0; i < tlist.size(); i++) {
		Map m = (Map) tlist.get(i);
		teacherlist += "<option value='" + m.get("id") + "'>"
				+ m.get("name") + "</option>";
	} */
	/* for (int i = 0; i < rlist.size(); i++) {
		Map m = (Map) rlist.get(i);
		classroomlist += "<option value='" + m.get("id") + "'>"
				+ m.get("roomname") + "</option>";
	} */
	for (int i = 0; i <alist.size(); i++) {
		Map m = (Map) alist.get(i);
		classlist += "<option value='" + m.get("id") + "'>"
				+ m.get("classname") + "</option>";
	}
	/* for (int i = 1; i <= 24; i++) {
		weeklist += "<option value='" + i + "'>" + i + "</option>";
	} */
	for (int i = 1; i <= 5; i++) {
		timetable += "<tr><td>第" + (i * 2 - 1) + "-" + (i * 2)
				+ "节</td>";
		for (int j = 1; j <= 7; j++) {
			timetable += "<td>"+
			//"<input type='button' value='编辑' onclick='showCon(this,"+ 
			//		i + "," + j + ")'/>"+
				"<span id='"+i + j+"'>"+
					"</td>";
		}
		timetable += "</tr>";
	}
%>
</head>

<body>
	<div style="margin-bottom: 10px;">
		<h2>添加课表</h2>
	</div>
	<form method="post" action="">
		<div>
			<div>
				班级：<select id="bj" name="classid" onchange="chsclass()">
					<%=classlist %>
				</select>
				课程管理：<select id="kcid">
				<option value='0'>--添加新课程--</option>
				</select>
				<input type="button" id="edit" value="编辑" onclick="editTT()"/>
			</div>
			<table id="maintable" border="1" style="width:100%;">
				<tr>
					<th style="width:10%">节次</th>
					<th style="width:10%">周一</th>
					<th style="width:10%">周二</th>
					<th style="width:10%">周三</th>
					<th style="width:10%">周四</th>
					<th style="width:10%">周五</th>
					<th style="width:10%">周六</th>
					<th style="width:10%">周日</th>
				</tr>
				<%=timetable%>
			</table>
		</div>
	</form>
	<div id="content">
		<div class="content">
			<div>
				<a style="float: right;margin-top: -18px;margin-right: -12px;"
					href="javascript:tbl.hide()">x</a>
			</div>
			<table style="margin-bottom: 10px;">
				<tr>
					<td>选择课程：</td>
					<td><select id="kc" style="width:100%;">
							<%=courselist %>
					</select>
					</td>
				</tr>
			</table>
			<input class="btn" id="bcbtn" type="button" value="保存" onclick="addTT()" />
		</div>
	</div>
	<script type="text/javascript">
		var tbl = $("#content").children(".content");
		$("#bcbtn").css(
				"margin-left",
				$("#bcbtn").parent().innerWidth() / 2 - $("#bcbtn").outerWidth()/ 2);

		$(tbl).css("margin-top", -$(tbl).innerHeight() / 2);
		$(tbl).css("margin-left", -$(tbl).innerWidth() / 2);
		tbl.hide();
		function addTT(){
			if($("#kc option:selected").val()==''){
				alert("请选择课程！");
				return ;
			}
			location.href='Jwgl.do?method=addschedule&classid='+$("#bj option:selected").val()+'&courseid='+$("#kc option:selected").val();
		}
		function editTT(){
			if($("#bj option:selected").val()==''){
				alert("请选择班级！");
				return ;
			}
			if($("#kcid option:selected").val()==''){
				tbl.show();
				return ;
			}
			location.href='jsp/background/jwgl/scheduleEdit.jsp?ccid='+$("#kcid option:selected").attr('data-ccid');
		}
		var nowkc="";
		var weeks = new Array("一", "二", "三", "四", "五", "六", "日");
		function chsclass() {
			var bjid = $("#bj option:selected").val();
			if(bjid==""){
				$("#maintable").find("span").nextAll().remove();
				$("#kcid").children().remove();
				$("#kcid").append("<option value=''>--添加新课程--</option>");
				return;
			}
			$.post("Jwgl.do?method=selschedule", {
				"classid" : bjid
			}, function(data, textStatus) {
				var json = eval("(" + data + ")");
				$("#maintable span").nextAll().remove();
				var kcs="<option value=''>--添加新课程--</option>";
				for ( var i=0;i<json.length;i++) {
					var son=json[i];
					var xy = son.sksj;
					var thetd = $("#"+xy).parent();
					if(nowkc.indexOf(son.courseid, 0)==-1){
						nowkc+=son.courseid+",";
						kcs+="<option value='"+son.courseid+"' data-ccid='"+son.ccid+"'>"+son.coursename+"</option>";
					}
					thetd.append("<p>" + son.coursename);
					thetd.append("<p>周"
							+ weeks[xy.substr(-1)]
							+ "第"
							+ ((xy.substr(0, 1)) * 2 - 1)
							+ ","
							+ ((xy.substr(0, 1)) * 2)
							+ "节{第"
							+ son.firstweek
							+ "周"
							+ (son.skpl == "否" ? ""
									: ("," + son.skpl))
							+ "}");
					thetd.append("<p>"
							+ son.name);
					thetd.append("<p>" + son.roomname);
				}
				nowkc=nowkc.substring(0, nowkc.length-1);
				$("#kcid").children().remove();
				$("#kcid").append(kcs);
			});
		}
	</script>
</body>
</html>
