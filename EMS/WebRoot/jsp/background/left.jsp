<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<style type="text/css">
* {
	margin: 0;
	padding: 0
}

body {
	font-size: 12px;
	font-family: "宋体", "微软雅黑";
}

ul,li {
	list-style: none;
}

a:link,a:visited {
	text-decoration: none;
}

.list {
	width: 210px;
	border-bottom: solid 1px #316a91;
	margin: 5px auto 0 auto;
}

.list ul li {
	background-color: #467ca2;
	border: solid 1px #316a91;
	border-bottom: 0;
}

.list ul li a {
	padding-left: 10px;
	color: #fff;
	font-size: 12px;
	display: block;
	font-weight: bold;
	height: 36px;
	line-height: 36px;
	position: relative;
}

.list ul li .inactive {
	background: url(images/off.png) no-repeat 184px center;
}

.list ul li .inactives {
	background: url(images/on.png) no-repeat 184px center;
}

.list ul li ul {
	display: none;
}

.list ul li ul li {
	border-left: 0;
	border-right: 0;
	background-color: #6196bb;
	border-color: #467ca2;
}

.list ul li ul li ul {
	display: none;
}

.list ul li ul li a {
	padding-left: 20px;
}

.list ul li ul li ul li {
	background-color: #d6e6f1;
	border-color: #6196bb;
}

.last {
	background-color: #d6e6f1;
	border-color: #6196bb;
}

.list ul li ul li ul li a {
	color: #316a91;
	padding-left: 30px;
}
</style>
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('.inactive')
								.click(
										function() {
											if ($(this).siblings('ul').css(
													'display') == 'none') {
												$(this).parent('li').siblings(
														'li').removeClass(
														'inactives');
												$(this).addClass('inactives');
												$(this).siblings('ul')
														.slideDown(100)
														.children('li');
												if ($(this).parents('li')
														.siblings('li')
														.children('ul').css(
																'display') == 'block') {
													$(this)
															.parents('li')
															.siblings('li')
															.children('ul')
															.parent('li')
															.children('a')
															.removeClass(
																	'inactives');
													$(this).parents('li')
															.siblings('li')
															.children('ul')
															.slideUp(100);

												}
											} else {
												//控制自身变成+号
												$(this)
														.removeClass(
																'inactives');
												//控制自身菜单下子菜单隐藏
												$(this).siblings('ul').slideUp(
														100);
												//控制自身子菜单变成+号
												$(this).siblings('ul')
														.children('li')
														.children('ul').parent(
																'li').children(
																'a').addClass(
																'inactives');
												//控制自身菜单下子菜单隐藏
												$(this).siblings('ul')
														.children('li')
														.children('ul')
														.slideUp(100);

												//控制同级菜单只保持一个是展开的（-号显示）
												$(this).siblings('ul')
														.children('li')
														.children('a')
														.removeClass(
																'inactives');
											}
										})
					});
</script>
</head>
<body>
	<div class="list">
		<ul class="yiji">
			<li><a href="welcome.jsp" target="mainPage" target="mainPage">返回首页</a>
			</li>
			<li><a href="javascript:void(0)" target="mainPage" class="inactive">信息维护</a>
				<ul style="display: none">
					<li class="last"><a href="Xxwh.do?method=teachersel" target="mainPage">教师信息维护</a>
					</li>
					<li class="last"><a href="Xxwh.do?method=studentsel" target="mainPage">学生信息维护</a>
					</li>
					<li class="last"><a href="Xxwh.do?method=coursesel" target="mainPage">课程信息维护</a>
					</li>
					<li class="last"><a href="Xxwh.do?method=classroomsel" target="mainPage">教室信息维护</a>
					</li>
					<li class="last"><a href="Xxwh.do?method=classinfosel" target="mainPage">班级信息维护</a>
					</li>
				</ul></li>
			<li><a href="javascript:void(0)" target="mainPage" class="inactive">教务管理</a>
				<ul style="display: none">
					<li><a href="jsp/background/jwgl/schedule.jsp" target="mainPage">课程安排</a>
					<li class="last"><a href="Jwgl.do?method=teachergrade" target="mainPage">教师评价查询</a>
					</li>
					<!-- <li class="last"><a href="jsp/background/jwgl/grademanage.jsp" target="mainPage">学生成绩查看</a>
					</li> -->
				</ul></li>
			<li><a href="javascript:void(0)" target="mainPage" class="inactive">信息管理</a>
				<ul style="display: none">
					<li><a href="jsp/background/userinfo.jsp" target="mainPage">个人信息管理</a>
				</ul>
			</li>
		</ul>
	</div>

</body>
</html>
