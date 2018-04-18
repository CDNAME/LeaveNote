package com.note.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	/**
	 * 将时间装成字符串
	 * @param date
	 * @param pattern
	 * @return
	 */
	public static String dateToString(Date date,String pattern){
		DateFormat format=new  SimpleDateFormat(pattern);
		if(date==null){
			date =new Date();
		}
		return format.format(date);
	}
	/**
	 * 将字符串转成时间
	 * @return
	 */
	public static Date stringToDate(String str,String pattern){
		//获取当前时间
		Date date = new Date();
		//格式化
		DateFormat format=new  SimpleDateFormat(pattern);
		if(str==null){
			return new Date();
		}
		try {
			date = format.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
}