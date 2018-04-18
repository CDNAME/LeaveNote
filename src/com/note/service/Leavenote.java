package com.note.service;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.note.bean.Notes;
import com.note.dao.Dao;
import com.note.util.DateUtil;
/**
 * 请假
 * @author bigchow
 *
 */
@WebServlet(name="leavenote",urlPatterns="/student/leavenote")
public class Leavenote extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Dao dao = new Dao();
		int studentid = Integer.valueOf(request.getParameter("studentid"));
		int flag =  dao.queryNote(studentid);
		if(flag == 1){
			String btime = request.getParameter("btime");//格式为2018-04-15
			int bclass = Integer.valueOf(request.getParameter("bclass"));
			String etime = request.getParameter("etime");//格式为2018-04-15
			int eclass = Integer.valueOf(request.getParameter("eclass"));
			String reason = request.getParameter("reason");
			int classesNumber;
			try {
				classesNumber = classesNumber(btime,etime,bclass,eclass);
				Notes note = new Notes();
				note.setStarttime(btime);
				note.setEndtime(etime);
				note.setStartclass(bclass);
				note.setEndclass(eclass);
				note.setLeaveReason(reason);
				note.setStudentId(studentid);
				note.setClassesNumber(classesNumber);
				dao.insertNote(note);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			response.getWriter().print(flag);
		}else{
			response.getWriter().print(flag);
		}		
	}
	/**
	 * 计算一共请了多少节课的假
	 * @param btime
	 * @param etime
	 * @param bclass
	 * @param eclass
	 * @return
	 * @throws ParseException
	 */
	public static int classesNumber(String btime,String etime,int bclass,int eclass) throws ParseException{    
        Date d1 = DateUtil.stringToDate(btime, "yyyy-MM-dd");
        Date d2 = DateUtil.stringToDate(etime, "yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();    
        cal.setTime(d1);    
        long time1 = cal.getTimeInMillis();                 
        cal.setTime(d2);    
        long time2 = cal.getTimeInMillis();         
        int between_days=(int)(time2-time1)/(1000*3600*24);  
        int classnumber = between_days * 12 + eclass - bclass;  
       return classnumber;     
    } 
	
	/**
	 * 阿拉伯数字转换为汉字
	 * @param date
	 * @return
	 */
	/*public String exchange(String date){
			int num = Integer.valueOf(date);
			String str = null;
			switch(num){
			case 1:
				str = "一";
				break;
			case 2:
				str = "二";
				break;
			case 3:
				str = "三";
				break;
			case 4:
				str = "四";
				break;
			case 5:
				str = "五";
				break;
			case 6:
				str = "六";
				break;
			case 7:
				str = "七";
				break;
			case 8:
				str = "八";
				break;
			case 9:
				str = "九";
				break;
			case 10:
				str = "十";
				break;
			case 11:
				str = "十一";
				break;
			default :
				break;
			}
			return str;
	}*/
}
