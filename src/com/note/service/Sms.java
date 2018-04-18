package com.note.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.note.dao.NotesDAO;
import com.note.util.SmsUtil;
/**
 * 发短信功能
 * @author bigchow
 *
 */
@WebServlet(name="Sms",urlPatterns={"/teacher/Sms","/Sms"})
public class Sms extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oper = request.getParameter("oper");
		System.out.println(oper);
		
		if(oper!=null && "register".equals(oper)){//注册码
			String code = SmsUtil.createRandom(true, 6);
			String myPhone = request.getParameter("myphone");
			String template = "{\"code\":\""+code+"\"}";
			System.out.println(myPhone+"/"+template);
			try {
				SmsUtil.sendSms(myPhone, oper, template);
			} catch (ClientException e) {
				e.printStackTrace();
			}
			response.getWriter().print(code);
		}else if(oper != null && "changePassword".equals(oper)){//修改密码
			String code = SmsUtil.createRandom(true, 6);
			String myPhone = request.getParameter("myphone");
			String template = "{\"code\":\""+code+"\"}";
			System.out.println(myPhone+"/"+template);
			try {
				SmsUtil.sendSms(myPhone, oper, template);
			} catch (ClientException e) {
				e.printStackTrace();
			}
			response.getWriter().print(code);
		}else if(oper !=null && "passOk".equals(oper)){//审批通过
            //获取notesid和状态
            int notesId = Integer.parseInt(request.getParameter("notesid"));
            String passStatus = request.getParameter("passstatus");
            String notesDate = request.getParameter("notesdate").substring(0,16);
            String studentPhone = request.getParameter("studentphone");
            String studentName = request.getParameter("studentname");
			NotesDAO.updateNotes(notesId,passStatus);
			String template = "{\"name\":\""+studentName+"\", \"time\":\""+notesDate+"\"}";
			System.out.println(studentPhone+passStatus+template);
			try {
				SmsUtil.sendSms(studentPhone, oper, template);
			} catch (ClientException e) {
				e.printStackTrace();
			}
		}else if(oper != null && "passNo".equals(oper)){//审批未通过
            //获取notesid和状态
            int notesId = Integer.parseInt(request.getParameter("notesid"));
            String passStatus = request.getParameter("passstatus");
            String notesDate = request.getParameter("notesdate").substring(0,16);
            String studentPhone = request.getParameter("studentphone");
            String studentName = request.getParameter("studentname");
			String rejectReason = request.getParameter("rejectreason");
			NotesDAO.updateNotes(notesId,passStatus);
			String template = "{\"name\":\""+studentName+"\", \"time\":\""+notesDate+"\", \"reason\":\""+rejectReason+"\"}";
			System.out.println(studentPhone+passStatus+template);
			try {
				SmsUtil.sendSms(studentPhone, oper, template);
			} catch (ClientException e) {
				e.printStackTrace();
			}
		}
	}
}
