package com.ems.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ems.entity.Student;
import com.ems.entity.Teacher;
import com.ems.utils.DbHelper;

public class LoginServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String method=request.getParameter("method");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		boolean logbuf=false;
		if("student".equals(method)){
			String sql="select * from student where userid='"+username+"'";
			Map m=DbHelper.queryARow(sql);
			if(m!=null){
				if(m.get("password").equals(password)){
					logbuf=true;
					Student user=new Student();
					user.setId(m.get("id")+"");
					user.setName(m.get("name")+"");
					user.setPassword(m.get("password")+"");
					user.setBirth(m.get("birth")+"");
					user.setClassid(m.get("classid")+"");
					user.setHjszd(m.get("HJSZD")+"");
					user.setRxsj(m.get("RXSJ")+"");
					user.setSex(m.get("sex")+"");
					user.setUserid(m.get("userid")+"");
					request.getSession().setAttribute("user", user);
					response.sendRedirect("/EMS/jsp/student/studentmain.jsp");
				}
			}
		}else if("teacher".equals(method)){
			String sql="select * from teacher where userid='"+username+"'";
			Map m=DbHelper.queryARow(sql);
			if(m!=null){
				if(m.get("password").equals(password)){
					logbuf=true;
					Teacher user=new Teacher();
					user.setId(m.get("id")+"");
					user.setUserid(m.get("userid")+"");
					user.setName(m.get("name")+"");
					user.setPassword(m.get("password")+"");
					user.setSex(m.get("sex")+"");
					user.setType(m.get("type")+"");
					request.getSession().setAttribute("user", user);
					response.sendRedirect("/EMS/jsp/teacher/teachermain.jsp");
				}
			}
		}else if("admin".equals(method)){
			String sql="select * from teacher where type=2 and userid='"+username+"'";
			Map m=DbHelper.queryARow(sql);
			if(m!=null){
				if(m.get("password").equals(password)){
					logbuf=true;
					Teacher user=new Teacher();
					user.setId(m.get("id")+"");
					user.setUserid(m.get("userid")+"");
					user.setName(m.get("name")+"");
					user.setPassword(m.get("password")+"");
					user.setSex(m.get("sex")+"");
					user.setType(m.get("type")+"");
					request.getSession().setAttribute("user", user);
					response.sendRedirect("/EMS/jsp/background/backmain.jsp");
				}
			}
		}else if("logout".equals(method)){
			logbuf=true;
			request.getSession().setAttribute("user", null);
			request.setAttribute("msg", null);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		if(!logbuf){
			request.setAttribute("msg", "用户名或密码错误!");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
