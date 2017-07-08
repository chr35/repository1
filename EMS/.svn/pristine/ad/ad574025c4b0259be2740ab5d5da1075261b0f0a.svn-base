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
#maintable div{
	width: 100%;
    padding: 0px;
}
</style>
<%
	String ccid=request.getParameter("ccid");
	Map info=DbHelper.queryARow("select cc.*,ci.classname,cs.coursename from classcourse cc,classinfo ci,course cs where cc.classid=ci.id and cc.courseid=cs.id and cc.id="+ccid);
	String courselist = "<option value=''>--请选择课程--</option>";
	String teacherlist = "<option value=''>--请选择教师--</option>";
	String classroomlist = "<option value=''>--请选择教室--</option>";
	String classlist="<option value=''>--请选择班级--</option>";
	String weeklist = "";
	String timetable = "";
	List clist = (List) DbHelper
			.queryForTable("select * from course order by courseid");
	List tlist = (List) DbHelper
			.queryForTable("select * from teacher order by userid");
	List rlist = (List) DbHelper
			.queryForTable("select * from classroom order by roomid");
	List alist = (List) DbHelper
			.queryForTable("select * from classinfo order by classid");
			
	for (int i = 0; i < clist.size(); i++) {
		Map m = (Map) clist.get(i);
		courselist += "<option value='" + m.get("id") + "'>"
				+ m.get("coursename") + "</option>";
	}
	for (int i = 0; i < tlist.size(); i++) {
		Map m = (Map) tlist.get(i);
		teacherlist += "<option value='" + m.get("id") + "' "+(m.get("id").equals(info.get("teacherid"))?"selected='selected'":"")+">"
				+ m.get("name") + "</option>";
	}
	for (int i = 0; i < rlist.size(); i++) {
		Map m = (Map) rlist.get(i);
		classroomlist += "<option value='" + m.get("id") + "'>"
				+ m.get("roomname") + "</option>";
	}
	for (int i = 0; i <alist.size(); i++) {
		Map m = (Map) alist.get(i);
		classlist += "<option value='" + m.get("id") + "'>"
				+ m.get("classname") + "</option>";
	}
	for (int i = 1; i <= 24; i++) {
		weeklist += "<option value='" + i + "'>" + i + "</option>";
	}
	for (int i = 1; i <= 5; i++) {
		timetable += "<tr><td>第" + (i * 2 - 1) + "-" + (i * 2)
				+ "节</td>";
		for (int j = 1; j <= 7; j++) {
			timetable += "<td><div id='"+ i + j + "'>"+
			"<input type='button' value='编辑' onclick='showCon(this,"+ i + "," + j + ")'/>"+
					" <input type='button' value='删除' onclick='del(this)'/></div></td>";
		}
		timetable += "</tr>";
	}
%>
</head>

<body>
	<div style="margin-bottom: 10px;">
		<h2>编辑课表</h2>
	</div>
	<form method="post" action="Jwgl.do?method=chgschedule">
	<input type="hidden" name="ccid" value="<%=ccid%>"/>
		<div>
			<div>
				<%=info.get("classname") %>班&nbsp;&nbsp;编辑 <%=info.get("coursename") %>
				选择任课教师：<select id="teacherid" name="teacherid">
					<%=teacherlist %>
				</select>
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
			<div style="height: 23px;">
				<input type="submit" style="float:right;" class="btn" value="保存" />
			</div>
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
					<td>起始周：</td>
					<td id="sj"><select id="ksz" style="width:40%;">
							<%=weeklist%>
					</select>到<select id="jsz" style="width:40%;">
							<%=weeklist%>
					</select>
					</td>
				</tr>
				<tr>
					<td>单双周：</td>
					<td id="dsz"><select id="dsz" style="width:100%;">
							<option value="否">否</option>
							<option value="单周">单周</option>
							<option value="双周">双周</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>教室：</td>
					<td id="js"><select id="roomid" style="width:100%;">
							<%=classroomlist%>
					</select>
					</td>
				</tr>
			</table>
			<input class="btn" id="bcbtn" type="button" value="保存" onclick="editCourse()" />
		</div>
	</div>
	<script type="text/javascript">
		var weeks = new Array("一", "二", "三", "四", "五", "六", "日");
		var tbl = $("#content").children(".content");
		var course={'key':'<%=info.get("courseid")%>','value':'<%=info.get("coursename")%>'};
		$("#bcbtn").css(
				"margin-left",
				$("#bcbtn").parent().innerWidth() / 2 - $("#bcbtn").outerWidth()/ 2);

		$(tbl).css("margin-top", -$(tbl).innerHeight() / 2);
		$(tbl).css("margin-left", -$(tbl).innerWidth() / 2);
		tbl.hide();
		var nowtd;
		var nowx;
		var nowy;
		var nowkc="";
		function del(o){
			$(o).parent().prevAll().remove();
			$(o).parent().nextAll().remove();
		}
		function showCon(obj, x, y) {
			var teacher=$("#teacherid option:selected").val();
			if(teacher==''){
				alert("请选择任课教师！");
				return ;
			}
			tbl.show();
			nowtd = $(obj).parent();
			nowx = x;
			nowy = y;
			setcontent($(nowtd).parent(), "ksz");
			setcontent($(nowtd).parent(), "jsz");
			setcontent($(nowtd).parent(), "dsz");
			setcontent($(nowtd).parent(), "roomid");
		}
		function setcontent(obj, attr) {
			var vals = $(obj).children("#" + attr + nowx + nowy).val();
			if (vals != undefined && vals != null && vals != "") {
				document.getElementById(attr).value = vals;
			} else {
				document.getElementById(attr).selectedIndex = 0;
			}
		}
		function setcontent2(obj, attr) {
			obj.prepend("<input id='" + attr + nowx + nowy + "' name='" + attr
					+ nowx + nowy + "' type='hidden' value='"
					+ ($("#" + attr + " option:selected").val()) + "'>");
		}
		function editCourse() {
			var thetd = $(nowtd).parent();
			tbl.hide();
			$(nowtd).prevAll().remove();
			$(nowtd).nextAll().remove();

			thetd.append("<p>" + course.value);
			thetd.append("<p>周"
					+ weeks[nowy]
					+ "第"
					+ (nowx * 2 - 1)
					+ ","
					+ (nowx * 2)
					+ "节{第"
					+ ($("#ksz option:selected").text())
					+ "-"
					+ ($("#jsz option:selected").text())
					+ "周"
					+ ($("#dsz option:selected").text() == "否" ? "" : ("," + $(
							"#dsz option:selected").text())) + "}");
			thetd.append("<p>" + $("#teacherid option:selected").text());
			thetd.append("<p>" + $("#roomid option:selected").text());

			//$("#testSelect option:selected").text();
			setcontent2(thetd, "ksz");
			setcontent2(thetd, "jsz");
			setcontent2(thetd, "dsz");
			setcontent2(thetd, "roomid");
		}
		function init(){
		$.post("Jwgl.do?method=selschedule", {
				"classid" : '<%=info.get("classid")%>'
			}, function(data, textStatus) {
			var json = eval("(" + data + ")");
				$("#maintable span").nextAll().remove();
				for ( var i=0;i<json.length;i++) {
					var son=json[i];
					var xy = son.sksj;
					var thetd = $("#"+xy).parent();
					
					
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
					if(son.courseid=='<%=info.get("courseid")%>'){
						thetd.prepend("<input id='" + "ksz" + xy + "' name='" + "ksz" + xy + "' type='hidden' value='" + son.firstweek.split("-")[0] + "'>");
						thetd.prepend("<input id='" + "jsz" + xy + "' name='" + "jsz" + xy + "' type='hidden' value='" + son.firstweek.split("-")[1] + "'>");
						thetd.prepend("<input id='" + "dsz" + xy + "' name='" + "dsz" + xy + "' type='hidden' value='" + son.skpl + "'>");
						thetd.prepend("<input id='" + "roomid" + xy + "' name='" + "roomid" + xy + "' type='hidden' value='" + son.roomid + "'>");
					}else{
						$("#"+xy).remove();
					}
				}
			});
		}
		$(document).ready(function(){
			init();
		});
	</script>
</body>
</html>
