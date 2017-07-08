package com.ems.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.ems.entity.Teacher;
import com.ems.utils.DbHelper;

public class TeacherServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String method=request.getParameter("method");
		if(request.getSession().getAttribute("user")==null){
			response.sendRedirect("/EMS/jsp/teacher/teachermain.jsp");
		}
		if("getgradeitem".equals(method)){
			getgradeitem(request,response);
		}else if("addgradeitem".equals(method)){
			addgradeitem(request,response);
		}else if("selschedule".equals(method)){
			selschedule(request,response);
		}else if("selselfgrade".equals(method)){
			selselfgrade(request,response);
		}else if("chgpassword".equals(method)){
			chgpassword(request,response);
		}
	}
	
	private void selselfgrade(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String ccid=request.getParameter("ccid");
		String sql="select item,itemval,count(id) cnt from tgitem where ccid="+ccid+" GROUP BY item,itemval;";
		List list=DbHelper.queryForTable(sql);
		response.getWriter().print(JSONArray.fromObject(list));
		response.getWriter().close();
	}
	
	private void chgpassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Teacher user=(Teacher)request.getSession().getAttribute("user");
		String oldpass=request.getParameter("oldpass");
		String newpass=request.getParameter("newpass");
		String msg="修改失败！";
		if(user.getPassword().equals(oldpass)){
			if(DbHelper.update("update teacher set password='"+newpass+"' where id="+user.getId()))msg="修改成功！";
		}
		response.getWriter().print(msg);
		response.getWriter().close();
	}
	
	private void selschedule(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Teacher user=(Teacher)request.getSession().getAttribute("user");
		String sql="select cc.*,ci.classname,cs.coursename,tp.*,cr.roomname from classcourse cc,classinfo ci,course cs,timenplace tp,classroom cr where cc.id=tp.ccid and cc.classid=ci.id and cc.courseid=cs.id and tp.roomid=cr.id and cc.teacherid="+user.getId();
		List list=DbHelper.queryForTable(sql);
		request.setAttribute("json", JSONArray.fromObject(list));
		request.getRequestDispatcher("jsp/teacher/schedule.jsp").forward(request, response);
	}
	
	private void getgradeitem(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String ccid=request.getParameter("ccid");
		String sql="select stu.*,g.termgrade from student stu left join grade g on stu.id=g.studentid and ccid="+ccid+" where stu.classid=(select cc.classid from classcourse cc where cc.id="+ccid+") order by stu.userid";
		List list=DbHelper.queryForTable(sql);
		response.getWriter().print(JSONArray.fromObject(list));
		response.getWriter().close();
	}
	
	public void addgradeitem(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String ccid=request.getParameter("ccid");
		String sql="select * from student stu where stu.classid=(select cc.classid from classcourse cc where cc.id="+ccid+") order by stu.userid";
		String insertsql="insert into grade values ";
		List list=DbHelper.queryForTable(sql);
		for(int i=0;i<list.size();i++){
			Map m=(Map)list.get(i);
			insertsql+="(null,"+ccid+","+m.get("id")+","+request.getParameter("grade"+m.get("id"))+"),";
		}
		if(!"insert into grade values ".equals(insertsql))insertsql=insertsql.substring(0, insertsql.length()-1);
		DbHelper.update("delete from grade where ccid="+ccid);
		DbHelper.update(insertsql);
		request.getRequestDispatcher("jsp/teacher/studentgrade.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
