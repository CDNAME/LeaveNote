package com.note.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.note.dao.Dao;

@WebServlet(name="resetpwd",urlPatterns="/resetpwd")
public class ResetPwd extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String myphone = request.getParameter("phone");
		String password = request.getParameter("password");
		Dao dao = new Dao();
		dao.resetPwd(myphone,password);
		request.getSession().invalidate();
		response.sendRedirect(request.getContextPath()+"/index.jsp?type=3");
	}
}
