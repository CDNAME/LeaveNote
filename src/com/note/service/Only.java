package com.note.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.note.dao.Dao;
/**
 * 验证学号和手机号是否已被注册
 * @author bigchow
 *
 */
@WebServlet(name="only",urlPatterns="/only")
public class Only extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Dao dao = new Dao();
		String oper = request.getParameter("oper");
		if("number".equals(oper)){
			String studentNumber = request.getParameter("studentNumber");
			boolean flag = dao.onlyNumber(studentNumber);
			response.getWriter().print(flag);
		}else if("phone".equals(oper)){
			String myphone = request.getParameter("myphone");
			boolean flag = dao.onlyPhone(myphone);
			response.getWriter().print(flag);
		}
	}
}
