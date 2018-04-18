package com.note.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.note.bean.Student;
import com.note.bean.Teacher;
import com.note.dao.Dao;
/**
 * 登陆功能
 * @author bigchow
 *
 */
@WebServlet(name="login",urlPatterns="/login")
public class Login extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Dao dao = new Dao();
		String userNumber = request.getParameter("userNumber");//获取提交过来的学号
		String password = request.getParameter("password");//获取提交过来的密码
		Object obj = dao.login(userNumber,password);//进行处理
		if(obj == null){
			response.sendRedirect(request.getContextPath()+"/index.jsp?type=4");
		}else if(obj instanceof Student){//判断返回的是不是Student类型
			Student student = (Student)obj;
			request.getSession().setAttribute("student", student);
			response.sendRedirect(request.getContextPath()+"/student/student.jsp");
		}else if(obj instanceof Teacher){//判断返回的是不是Teacher类型
			Teacher teacher = (Teacher)obj;
			request.getSession().setAttribute("teacher", teacher);
			response.sendRedirect(request.getContextPath()+"/teacher/admin.jsp");
		}
	}
}
