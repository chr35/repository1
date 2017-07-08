package com.ems.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ems.utils.DbHelper;
import com.ems.utils.PageHelper;

public class XxwhServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PageHelper page=(PageHelper)request.getSession().getAttribute("pageinfo");
		String method=request.getParameter("method");
		if(request.getSession().getAttribute("user")==null){
			response.sendRedirect("/EMS/jsp/teacher/teachermain.jsp");
		}
		if("courseadd".equals(method)){
			String courseid=request.getParameter("courseid");
			String coursename=request.getParameter("coursename");
			String coursetype=request.getParameter("coursetype");
			String credit=request.getParameter("credit");
			String bz=request.getParameter("bz");
			String sql="insert into course(id,courseid,coursename,coursetype,credit,bz) values(null,'"+courseid+"','"+coursename+"','"+coursetype+"',"+credit+",'"+bz+"')";
			request.setAttribute("msg", (DbHelper.update(sql)?"操作成功！":"操作失败！"));
			request.getRequestDispatcher("Xxwh.do?method=coursesel").forward(request, response);
		}else if("courseupd".equals(method)){
			String id=request.getParameter("id");
			String courseid=request.getParameter("courseid");
			String coursename=request.getParameter("coursename");
			String coursetype=request.getParameter("coursetype");
			String credit=request.getParameter("credit");
			String bz=request.getParameter("bz");
			String sql="update course set courseid='"+courseid+"',coursename='"+coursename+"',coursetype='"+coursetype+"',credit="+credit+",bz='"+bz+"' where id="+id;
			request.setAttribute("msg", (DbHelper.update(sql)?"操作成功！":"操作失败！"));
			request.getRequestDispatcher("Xxwh.do?method=coursesel").forward(request, response);
		}else if("coursedel".equals(method)){
			String id=request.getParameter("id");
			String sql="delete from course where id="+id;
			request.setAttribute("msg", (DbHelper.update(sql)?"操作成功！":"操作失败！"));
			request.getRequestDispatcher("Xxwh.do?method=coursesel").forward(request, response);
		}else if("coursesel".equals(method)){
			String cuserid=request.getParameter("ccourseid");
			String cname=request.getParameter("ccoursename");
			String sql="select * from course where 1=1 ";
			String condition="";
			if(null!=cuserid&&!"".equals(cuserid)){
				condition+=" and courseid = '"+cuserid+"'";
			}
			if(null!=cname&&!"".equals(cname)){
				condition+=" and coursename like '%"+cname+"%'";
			}
			sql+=condition+" order by courseid ";
			page=PageHelper.getpage(sql, 5, condition,"jsp/background/xxwh/courseInfo.jsp");
			request.getSession().setAttribute("pageinfo", page);
			List list=DbHelper.queryForTable(sql+" limit "+((page.getNowPage()-1)*page.getRecordNum())+","+page.getRecordNum());
			request.setAttribute("tlist", list);
			request.getRequestDispatcher("jsp/background/xxwh/courseInfo.jsp").forward(request, response);
		}else if("classroomadd".equals(method)){
			String roomid=request.getParameter("roomid");
			String roomname=request.getParameter("roomname");
			String address=request.getParameter("address");
			String type=request.getParameter("type");
			String container=request.getParameter("container");
			String sql="insert into classroom values(null,'"+roomid+"','"+roomname+"','"+address+"','"+type+"','"+container+"')";
			request.setAttribute("msg", (DbHelper.update(sql)?"操作成功！":"操作失败！"));
			request.getRequestDispatcher("Xxwh.do?method=classroomsel").forward(request, response);
		}else if("classroomupd".equals(method)){
			String id=request.getParameter("id");
			String roomid=request.getParameter("roomid");
			String roomname=request.getParameter("roomname");
			String address=request.getParameter("address");
			String type=request.getParameter("type");
			String container=request.getParameter("container");
			String sql="update classroom set roomid='"+roomid+"',roomname='"+roomname+"',address='"+address+"',type='"+type+"',container='"+container+"' where id="+id;
			request.setAttribute("msg", (DbHelper.update(sql)?"操作成功！":"操作失败！"));
			request.getRequestDispatcher("Xxwh.do?method=classroomsel").forward(request, response);
		}else if("classroomdel".equals(method)){
			String id=request.getParameter("id");
			String sql="delete from classroom where id="+id;
			request.setAttribute("msg", (DbHelper.update(sql)?"操作成功！":"操作失败！"));
			request.getRequestDispatcher("Xxwh.do?method=classroomsel").forward(request, response);
		}else if("classroomsel".equals(method)){
			String cuserid=request.getParameter("croomid");
			String cname=request.getParameter("croomname");
			String sql="select * from classroom where 1=1 ";
			String condition="";
			if(null!=cuserid&&!"".equals(cuserid)){
				condition+=" and roomid = '"+cuserid+"'";
			}
			if(null!=cname&&!"".equals(cname)){
				condition+=" and roomname like '%"+cname+"%'";
			}
			sql+=condition+" order by roomid ";
			page=PageHelper.getpage(sql, 5, condition,"jsp/background/xxwh/classroomInfo.jsp");
			request.getSession().setAttribute("pageinfo", page);
			List list=DbHelper.queryForTable(sql+" limit "+((page.getNowPage()-1)*page.getRecordNum())+","+page.getRecordNum());
			request.setAttribute("tlist", list);
			request.getRequestDispatcher("jsp/background/xxwh/classroomInfo.jsp").forward(request, response);
		}else if("teacheradd".equals(method)){
			String userid=request.getParameter("userid");
			String name=request.getParameter("name");
			String password=request.getParameter("password");
			String sex=request.getParameter("sex");
			String type=request.getParameter("type");
			String sql="insert into teacher values(null,'"+userid+"','"+name+"','"+password+"','"+sex+"','"+type+"')";
			request.setAttribute("msg", (DbHelper.update(sql)?"操作成功！":"操作失败！"));
			request.getRequestDispatcher("Xxwh.do?method=teachersel").forward(request, response);
		}else if("teacherupd".equals(method)){
			String id=request.getParameter("id");
			String userid=request.getParameter("userid");
			String name=request.getParameter("name");
			String password=request.getParameter("password");
			String sex=request.getParameter("sex");
			String type=request.getParameter("type");
			String sql="update teacher set userid='"+userid+"',name='"+name+"',password='"+password+"',sex='"+sex+"',type='"+type+"' where id="+id;
			request.setAttribute("msg", (DbHelper.update(sql)?"操作成功！":"操作失败！"));
			request.getRequestDispatcher("Xxwh.do?method=teachersel").forward(request, response);
		}else if("teacherdel".equals(method)){
			String id=request.getParameter("id");
			String sql="delete from teacher where id="+id;
			request.setAttribute("msg", (DbHelper.update(sql)?"操作成功！":"操作失败！"));
			request.getRequestDispatcher("Xxwh.do?method=teachersel").forward(request, response);
		}else if("teachersel".equals(method)){
			String cuserid=request.getParameter("cuserid");
			String cname=request.getParameter("cname");
			String sql="select * from teacher where 1=1 ";
			String condition="";
			if(null!=cuserid&&!"".equals(cuserid)){
				condition+=" and userid = '"+cuserid+"'";
			}
			if(null!=cname&&!"".equals(cname)){
				condition+=" and name like '%"+cname+"%'";
			}
			sql+=condition+" order by userid ";
			page=PageHelper.getpage(sql, 5, condition,"jsp/background/xxwh/teacherInfo.jsp");
			request.getSession().setAttribute("pageinfo", page);
			List list=DbHelper.queryForTable(sql+" limit "+((page.getNowPage()-1)*page.getRecordNum())+","+page.getRecordNum());
			request.setAttribute("tlist", list);
			request.getRequestDispatcher("jsp/background/xxwh/teacherInfo.jsp").forward(request, response);
		}else if("studentadd".equals(method)){
			String userid=request.getParameter("userid");
			String name=request.getParameter("name");
			String password=request.getParameter("password");
			String sex=request.getParameter("sex");
			String classid=request.getParameter("classid");
			String birth=request.getParameter("birth");
			String HJSZD=request.getParameter("HJSZD");
			String RXSJ=request.getParameter("RXSJ");
			String sql="insert into student values(null,"+classid+",'"+userid+"','"+name+"','"+password+"','"+HJSZD+"','"+sex+"','"+birth+"','"+RXSJ+"')";
			request.setAttribute("msg", (DbHelper.update(sql)?"操作成功！":"操作失败！"));
			request.getRequestDispatcher("Xxwh.do?method=studentsel").forward(request, response);
		}else if("studentupd".equals(method)){
			String id=request.getParameter("id");
			String userid=request.getParameter("userid");
			String name=request.getParameter("name");
			String password=request.getParameter("password");
			String sex=request.getParameter("sex");
			String classid=request.getParameter("classid");
			String birth=request.getParameter("birth");
			String HJSZD=request.getParameter("HJSZD");
			String RXSJ=request.getParameter("RXSJ");
			String sql="update student set userid='"+userid+"',name='"+name+"',password='"+password+"',sex='"+sex+"',classid="+classid+",birth='"+birth+"',HJSZD='"+HJSZD+"',RXSJ='"+RXSJ+"' where id="+id;
			request.setAttribute("msg", (DbHelper.update(sql)?"操作成功！":"操作失败！"));
			request.getRequestDispatcher("Xxwh.do?method=studentsel").forward(request, response);
		}else if("studentdel".equals(method)){
			String id=request.getParameter("id");
			String sql="delete from student where id="+id;
			request.setAttribute("msg", (DbHelper.update(sql)?"操作成功！":"操作失败！"));
			request.getRequestDispatcher("Xxwh.do?method=studentsel").forward(request, response);
		}else if("studentsel".equals(method)){
			String cuserid=request.getParameter("cuserid");
			String cname=request.getParameter("cname");
			String sql="select s.*,c.classname from student s left join classinfo c on s.classid=c.id where 1=1 ";
			String condition="";
			if(null!=cuserid&&!"".equals(cuserid)){
				condition+=" and userid = '"+cuserid+"'";
			}
			if(null!=cname&&!"".equals(cname)){
				condition+=" and name like '%"+cname+"%'";
			}
			sql+=condition+" order by userid ";
			page=PageHelper.getpage(sql, 5, condition,"jsp/background/xxwh/studentInfo.jsp");
			request.getSession().setAttribute("pageinfo", page);
			List list=DbHelper.queryForTable(sql+" limit "+((page.getNowPage()-1)*page.getRecordNum())+","+page.getRecordNum());
			request.setAttribute("tlist", list);
			request.getRequestDispatcher("jsp/background/xxwh/studentInfo.jsp").forward(request, response);
		}else if("classinfoadd".equals(method)){
			String classid=request.getParameter("classid");
			String classname=request.getParameter("classname");
			String sql="insert into classinfo values(null,'"+classid+"','"+classname+"')";
			request.setAttribute("msg", (DbHelper.update(sql)?"操作成功！":"操作失败！"));
			request.getRequestDispatcher("Xxwh.do?method=classinfosel").forward(request, response);
		}else if("classinfoupd".equals(method)){
			String id=request.getParameter("id");
			String classid=request.getParameter("classid");
			String classname=request.getParameter("classname");
			String sql="update classinfo set classid='"+classid+"',classname='"+classname+"' where id="+id;
			request.setAttribute("msg", (DbHelper.update(sql)?"操作成功！":"操作失败！"));
			request.getRequestDispatcher("Xxwh.do?method=classinfosel").forward(request, response);
		}else if("classinfodel".equals(method)){
			String id=request.getParameter("id");
			String sql="delete from classinfo where id="+id;
			request.setAttribute("msg", (DbHelper.update(sql)?"操作成功！":"操作失败！"));
			request.getRequestDispatcher("Xxwh.do?method=classinfosel").forward(request, response);
		}else if("classinfosel".equals(method)){
			String classid=request.getParameter("cclassid");
			String classname=request.getParameter("cclassname");
			String sql="select * from classinfo where 1=1 ";
			String condition="";
			if(null!=classid&&!"".equals(classid)){
				condition+=" and classid = '"+classid+"'";
			}
			if(null!=classname&&!"".equals(classname)){
				condition+=" and classname like '%"+classname+"%'";
			}
			sql+=condition+" order by classid ";
			page=PageHelper.getpage(sql, 5, condition,"jsp/background/xxwh/classinfoInfo.jsp");
			request.getSession().setAttribute("pageinfo", page);
			List list=DbHelper.queryForTable(sql+" limit "+((page.getNowPage()-1)*page.getRecordNum())+","+page.getRecordNum());
			request.setAttribute("tlist", list);
			request.getRequestDispatcher("jsp/background/xxwh/classinfoInfo.jsp").forward(request, response);
		}else if("chgpage".equals(method)){
			String topage=request.getParameter("topage");
			if("-1".equals(topage)){
				String per=request.getParameter("per");
				page=PageHelper.getpage(page.getSql(), Integer.parseInt(per), page.getCondition(),page.getUrl());
			}else{
				page.setNowPage(Integer.parseInt(topage));
			}
			request.getSession().setAttribute("pageinfo", page);
			List list=DbHelper.queryForTable(page.getSql()+" limit "+((page.getNowPage()-1)*page.getRecordNum())+","+page.getRecordNum());
			request.setAttribute("tlist", list);
			request.getRequestDispatcher(page.getUrl()).forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
