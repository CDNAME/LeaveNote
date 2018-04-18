package com.note.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.note.dao.Dao;
/**
 * 注册功能
 * @author bigchow
 *
 */
@WebServlet(name="register",urlPatterns="/register")
public class Register extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Dao dao = new Dao();
		String studentNumber = request.getParameter("studentNumber");
		String password = request.getParameter("password");
		String myPhone = request.getParameter("myphone");
		dao.register(studentNumber,password,myPhone);
		response.sendRedirect(request.getContextPath()+"/index.jsp?type=1");
	}
}
