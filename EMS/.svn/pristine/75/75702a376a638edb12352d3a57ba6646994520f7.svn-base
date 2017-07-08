package com.ems.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.ems.utils.DbHelper;

public class JwglServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String method=request.getParameter("method");
		if(request.getSession().getAttribute("user")==null){
			response.sendRedirect("/EMS/jsp/teacher/teachermain.jsp");
		}
		if("addschedule".equals(method)){
			addschedule(request,response);
		}else if("selschedule".equals(method)){
			selschedule(request,response);
		}else if("editschedule".equals(method)){
			editschedule(request,response);
		}else if("chgschedule".equals(method)){
			chgschedule(request,response);
		}else if("teachergrade".equals(method)){
			teachergrade(request,response);
		}
	}
	private void teachergrade(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String classid=request.getParameter("classid");
		String sql="select tc.*,(select COUNT(*) from teachergrade tg,classcourse cc where cc.id = tg.ccid and cc.teacherid=tc.id) as people," +
				"(select COUNT(*) from tgitem tg,classcourse cc where cc.id = tg.ccid and cc.teacherid=tc.id and tg.itemval=1) as cnt1," +
				"(select COUNT(*) from tgitem tg,classcourse cc where cc.id = tg.ccid and cc.teacherid=tc.id and tg.itemval=1) as cnt2," +
				"(select COUNT(*) from tgitem tg,classcourse cc where cc.id = tg.ccid and cc.teacherid=tc.id and tg.itemval=1) as cnt3," +
				"(select COUNT(*) from tgitem tg,classcourse cc where cc.id = tg.ccid and cc.teacherid=tc.id and tg.itemval=1) as cnt4," +
				"(select COUNT(*) from tgitem tg,classcourse cc where cc.id = tg.ccid and cc.teacherid=tc.id and tg.itemval=1) as cnt5 from teacher tc";
		List list=DbHelper.queryForTable(sql);
		request.setAttribute("list", list);
		request.getRequestDispatcher("jsp/background/jwgl/teachergrade.jsp").forward(request, response);
	}
	private void selschedule(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String classid=request.getParameter("classid");
		String sql="select cc.classid,cc.teacherid,cc.courseid,tp.*,tt.`name`,cs.coursename,rr.roomname from classcourse cc,timenplace tp,teacher tt,course cs,classroom rr " +
				"where cc.id=tp.ccid and cc.teacherid=tt.id and cs.id=cc.courseid and tp.roomid=rr.id and cc.classid="+classid;
		List list=DbHelper.queryForTable(sql);
		response.getWriter().print(JSONArray.fromObject(list));
		response.getWriter().close();
	}
	private void addschedule(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String classid=request.getParameter("classid");
		String courseid=request.getParameter("courseid");
		DbHelper.update("delete from classcourse where id in (select * from (" +
				"select cc.id from classcourse cc LEFT JOIN timenplace tp on cc.id=tp.ccid where cc.teacherid=0) t)");
		String sql="insert into classcourse values(null,"+classid+",0,"+courseid+")";
		int ccid=DbHelper.getMySQLIncId(sql);
		String sqllist="select cc.classid,cc.teacherid,cc.courseid,tp.*,tt.`name`,cs.coursename,rr.roomname from classcourse cc,timenplace tp,teacher tt,course cs,classroom rr " +
				"where cc.id=tp.ccid and cc.teacherid=tt.id and cs.id=cc.courseid and tp.roomid=rr.id and cc.classid="+classid;
		List list=DbHelper.queryForTable(sqllist);
		request.setAttribute("list", JSONArray.fromObject(list));
		request.setAttribute("ccid", ccid);
		request.getRequestDispatcher("jsp/background/jwgl/scheduleAdd.jsp").forward(request, response);
	}
	private void editschedule(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String ccid=request.getParameter("ccid");
		String teacherid=request.getParameter("teacherid");
		DbHelper.update("update classcourse set teacherid="+teacherid+" where id="+ccid);
		String sql="insert into timenplace values ";
		for(int i=1;i<=5;i++){
			for(int j=1;j<=7;j++){
				String roomid=request.getParameter("roomid"+i+j);
				if(roomid==null)continue;
				String ksz=request.getParameter("ksz"+i+j);
				String jsz=request.getParameter("jsz"+i+j);
				String dsz=request.getParameter("dsz"+i+j);
				sql+="(null,"+ccid+",'"+i+j+"',"+roomid+",'"+dsz+"','"+ksz+"-"+jsz+"'),";
			}
		}
		if("insert into timenplace values ".equals(sql))return ;
		DbHelper.update(sql.substring(0, sql.length()-1));
		request.getRequestDispatcher("jsp/background/jwgl/schedule.jsp?ccid="+ccid).forward(request, response);
	}
	private void chgschedule(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String ccid=request.getParameter("ccid");
		String teacherid=request.getParameter("teacherid");
		DbHelper.update("delete from timenplace where ccid="+ccid);
		DbHelper.update("update classcourse set teacherid="+teacherid+" where id="+ccid);
		String sql="insert into timenplace values ";
		for(int i=1;i<=5;i++){
			for(int j=1;j<=7;j++){
				String roomid=request.getParameter("roomid"+i+j);
				if(roomid==null)continue;
				String ksz=request.getParameter("ksz"+i+j);
				String jsz=request.getParameter("jsz"+i+j);
				String dsz=request.getParameter("dsz"+i+j);
				sql+="(null,"+ccid+",'"+i+j+"',"+roomid+",'"+dsz+"','"+ksz+"-"+jsz+"'),";
			}
		}
		if("insert into timenplace values ".equals(sql))return ;
		DbHelper.update(sql.substring(0, sql.length()-1));
		request.getRequestDispatcher("jsp/background/jwgl/schedule.jsp?ccid="+ccid).forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
