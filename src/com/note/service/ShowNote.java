package com.note.service;

import java.io.IOException;
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
 * 查询note
 * @author bigchow
 *
 */
@WebServlet(name="shownote",urlPatterns="/student/shownote")
public class ShowNote extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Integer noteid = Integer.valueOf(request.getParameter("noteid"));
		Dao dao = new Dao();
		Notes note = dao.queryByNoteId(noteid);
		String starttime = note.getStarttime();//2018-04-14
		String endtime = note.getEndtime();//2018-04-14
		String leavereason = note.getLeaveReason();
		int bclass = note.getStartclass();
		int eclass = note.getEndclass();
		request.setAttribute("noteid", noteid);
		request.setAttribute("begintime", starttime);
		request.setAttribute("endtime", endtime);
		request.setAttribute("bclass", bclass);
		request.setAttribute("eclass", eclass);
		request.setAttribute("leavereason", leavereason);
		request.getRequestDispatcher("/student/updatenote.jsp").forward(request, response);
	}
	/**
	 * 汉字转阿拉伯数字
	 * @param startclass
	 * @return
	 */
	/*public int strToInt(String startclass){
		int flag = 0;
		if(startclass.equals("一节")){
			flag = 1;
		}else if(startclass.equals("二节")){
			flag = 2;
		}else if(startclass.equals("三节")){
			flag = 3;
		}else if(startclass.equals("四节")){
			flag = 4;
		}else if(startclass.equals("五节")){
			flag = 5;
		}else if(startclass.equals("六节")){
		    flag = 6;
		}else if(startclass.equals("七节")){
			flag = 7;
		}else if(startclass.equals("八节")){
			flag = 8;
		}else if(startclass.equals("九节")){
			flag = 9;
		}else if(startclass.equals("十节")){
			flag = 10;
		}else if(startclass.equals("十一")){
			flag = 11;
		}
		return flag;
	}*/
}
