package com.note.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.note.bean.Sex;
import com.note.bean.Student;
import com.note.dao.Dao;
/**
 * 修改信息
 * @author bigchow
 *
 */
@WebServlet(name="modify",urlPatterns="/student/modify")
public class Modify extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String studentNumber = request.getParameter("studentnumber");
		String department = request.getParameter("department");
		String classes = request.getParameter("class");
		String dormnumber = request.getParameter("dormnumber");
		String parentphone = request.getParameter("parentphone");
		String sex = request.getParameter("sex");
		Student student = new Student(name,studentNumber, department, classes, dormnumber, parentphone, Enum.valueOf(Sex.class	, sex));
		Dao dao = new Dao();
		dao.change(student);
		Student stu = dao.queryByNumber(studentNumber);
		request.getSession().setAttribute("student", stu);
		response.sendRedirect("information.jsp");
	}
}
