package com.note.service;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.note.bean.Notes;
import com.note.dao.Dao;
import com.note.util.PageUtil;
@WebServlet(name="notelist",urlPatterns="/student/notelist")
public class NoteList extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int studentid = Integer.valueOf(request.getParameter("studentid"));
		String time = request.getParameter("time") == "" ? null :request.getParameter("time");
		String flagTime = "";
		if(time != null){
			String[] str = time.split("-");
			flagTime = str[0]+"年"+str[1]+"月"+str[2]+"日";
		}
		String pass = request.getParameter("pass");
		String  pageNumString = request.getParameter("pageNum");//当前页数
		String pageSizeString = request.getParameter("pageSize");//每一页的容量
		if(!"审批状态".equals(pass) && pass != ""){
			pass = request.getParameter("pass");
		}else{
			pass  = null;
		}
		Dao dao = new Dao();
		int rowCount = dao.getNotesRowCountByTime(studentid,time,pass);//一共有多少行
		PageUtil<Notes> pageUtil = new PageUtil(pageNumString, pageSizeString ,rowCount);
		dao.querySearchNotesList(studentid,time,pass,pageUtil);
		request.getSession().setAttribute("pageUtil", pageUtil);
		request.getSession().setAttribute("time",time);
		request.getSession().setAttribute("pass",pass);
		request.getSession().setAttribute("flagTime", flagTime);
		response.sendRedirect(request.getContextPath()+"/student/notelist.jsp");
	}
	
}