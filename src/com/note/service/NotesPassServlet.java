package com.note.service;

import com.aliyuncs.exceptions.ClientException;
import com.note.dao.NotesDAO;
import com.note.util.SmsUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name="notesupdate",urlPatterns = {"/teacher/notesupdate"})
public class NotesPassServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        //获取notesid和状态
        int notesId = Integer.parseInt(request.getParameter("notesid"));
        String passStatus = request.getParameter("passstatus");
        String notesDate = request.getParameter("notesdate");
        String studentPhone = request.getParameter("studentphone");
        String studentName = request.getParameter("studentname");
        NotesDAO.updateNotes(notesId,passStatus);
        if(passStatus.equals("同意")) {
            //请假条编号，请假条申请时间，ndate学生的电话用于发送短信，学生姓名
            System.out.println(studentPhone + studentName+"同学，您好。您与"+notesDate+"发起的请假申请（编号："+notesId+"）已被辅导员审批通过，请在工作日期间到办公室领取请加盖公章的请假条尾联");
            try {
                SmsUtil.sendSms(studentPhone,"passOk","");
            } catch (ClientException e) {
                e.printStackTrace();
            }
        } else if(passStatus.equals("不同意")) {
            //请假条编号，请假条申请时间，学生的电话用于发送短信，拒绝原因，学生姓名
            String rejectReason = request.getParameter("rejectreason");
            System.out.println(studentPhone + studentName+"同学，您好。您与"+notesDate+"发起的请假申请（编号："+notesId+"）被拒绝，拒绝原因为：" + rejectReason+"。您可以重新申请或者电话咨询辅导员具体原因，辅导员电话：15248952040");
            try {
                SmsUtil.sendSms(studentPhone,"passNo","");
            } catch (ClientException e) {
                e.printStackTrace();
            }
        }
    }
}