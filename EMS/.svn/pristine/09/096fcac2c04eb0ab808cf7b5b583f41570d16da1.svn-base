package com.ems.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.ems.entity.Student;
import com.ems.entity.Teacher;
import com.ems.utils.DbHelper;

public class StudentServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String method=request.getParameter("method");
		if(request.getSession().getAttribute("user")==null){
			response.sendRedirect("/EMS/jsp/teacher/teachermain.jsp");
		}
		if("selschedule".equals(method)){
			selschedule(request,response);
		}else if("selgrade".equals(method)){
			selgrade(request,response);
		}else if("selteachergrade".equals(method)){
			selteachergrade(request,response);
		}else if("addgradeitem".equals(method)){
			addgradeitem(request,response);
		}else if("chgpassword".equals(method)){
			chgpassword(request,response);
		}
	}
	
	private void chgpassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Student user=(Student)request.getSession().getAttribute("user");
		String oldpass=request.getParameter("oldpass");
		String newpass=request.getParameter("newpass");
		String msg="修改失败！";
		if(user.getPassword().equals(oldpass)){
			if(DbHelper.update("update student set password='"+newpass+"' where id="+user.getId()))msg="修改成功！";
		}
		response.getWriter().print(msg);
		response.getWriter().close();
	}
	public void addgradeitem(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String ccid=request.getParameter("ccid");
		Student user=(Student)request.getSession().getAttribute("user");
		DbHelper.update("delete from teachergrade where ccid="+ccid+" and studentid="+user.getId());
		String g=request.getParameter("item1");
		g+=request.getParameter("item2");
		g+=request.getParameter("item3");
		g+=request.getParameter("item4");
		g+=request.getParameter("item5");
		DbHelper.update("insert into teachergrade values(null,"+ccid+",null,"+g+","+user.getId()+")");
		request.getRequestDispatcher("jsp/student/teachergrade.jsp").forward(request, response);
	}
	public void selteachergrade(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String ccid=request.getParameter("ccid");
		Student user=(Student)request.getSession().getAttribute("user");
		String sql="select * from teachergrade tg where tg.ccid="+ccid+" and tg.studentid="+user.getId();
		List list=DbHelper.queryForTable(sql);
		response.getWriter().print(JSONArray.fromObject(list));
		response.getWriter().close();
	}
	public void selgrade(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Student user=(Student)request.getSession().getAttribute("user");
		String sql="select * from (" +
				"select cc.*,tc.name,cs.courseid as csnum,cs.coursename,cs.credit,cs.courseType from course cs,classcourse cc,teacher tc where tc.id=cc.teacherid and cc.courseid=cs.id and cc.classid="+ user.getClassid() +
				") t " +
				"left JOIN grade g on t.id=g.ccid and g.studentid="+user.getId();
		List list=(List)DbHelper.queryForTable(sql);
		request.setAttribute("list", list);
		request.getRequestDispatcher("jsp/student/grade.jsp").forward(request, response);
	}
	private void selschedule(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Student user=(Student)request.getSession().getAttribute("user");
		String sql="select cc.classid,cc.teacherid,cc.courseid,tp.*,tt.`name`,cs.coursename,rr.roomname from classcourse cc,timenplace tp,teacher tt,course cs,classroom rr " +
				"where cc.id=tp.ccid and cc.teacherid=tt.id and cs.id=cc.courseid and tp.roomid=rr.id and cc.classid="+user.getClassid();
		List list=DbHelper.queryForTable(sql);
		request.setAttribute("json", JSONArray.fromObject(list));
		request.getRequestDispatcher("jsp/student/schedule.jsp").forward(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
