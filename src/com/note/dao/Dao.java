package com.note.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.note.bean.Notes;
import com.note.bean.Pass;
import com.note.bean.Sex;
import com.note.bean.Student;
import com.note.bean.Teacher;
import com.note.util.DBUtil;
import com.note.util.DateUtil;
import com.note.util.PageUtil;

public class Dao{
	/**
	 * 登陆功能
	 * @param userNumber
	 * @param password
	 * @return
	 */
	public Object login(String userNumber,String password) {
		//同时查询老师和学生表
		String sql1 = "SELECT * FROM STUDENT WHERE ( STUDENTNUMBER ='"+userNumber+"' OR MYPHONE = '"+ userNumber +"' ) AND PASSWORD = '"+password+"' ";  
		String sql2 = "SELECT * FROM TEACHER WHERE PHONE ='"+userNumber+"' AND PASSWORD = '"+password+"' ";  
		Object obj = null;//用于存储返回的学生和老师对象
		//调用连接数据库方法
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		connection = DBUtil.getConnection();
		statement = DBUtil.getStatement(connection);
		try {
			resultSet = statement.executeQuery(sql1);
			while(resultSet.next()){
				if(resultSet.getInt("power") == 1 && resultSet.getString("myphone") != null&& resultSet.getString("studentnumber") != null){//如果是学生权限就返回学生对象
					Student student = new Student();
					student.setId(resultSet.getInt("id"));
					student.setName(resultSet.getString("name"));
					student.setPassword(resultSet.getString("password"));
					student.setStudentNumber(resultSet.getString("studentnumber"));
					student.setDepartment(resultSet.getString("department"));
					student.setClasses(resultSet.getString("class"));
					student.setDormNumber(resultSet.getString("dormnumber"));
					student.setStudentPhone(resultSet.getString("myphone"));
					student.setParentPhone(resultSet.getString("parentphone"));
					student.setSex(Enum.valueOf(Sex.class,resultSet.getString("sex") == null ? "未知" : resultSet.getString("sex")));
					student.setPower(resultSet.getInt("power"));
					student.setRegistertime(resultSet.getTimestamp("date"));
					if(student != null){
						return student;
					}
				}
			}
			resultSet = statement.executeQuery(sql2);
			while(resultSet.next()){
				if(resultSet.getInt("power") == 2 && resultSet.getString("phone") != null){//如果是老师权限就返回老师对象
					Teacher teacher  = new Teacher();
					teacher.setName(resultSet.getString("name"));
					teacher.setPower(resultSet.getInt("power"));
					teacher.setPassword(resultSet.getString("password"));
					teacher.setDepartment(resultSet.getString("department"));
					teacher.setTeacherPhone(resultSet.getString("phone"));
					if(teacher != null){
						return teacher;
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBUtil.closeAll(connection, statement, resultSet);
		}
		return null;
	}
	/**
	 * 验证学号是否已经被注册
	 * @param studentNumber
	 * @return
	 */
	public boolean onlyNumber(String studentNumber) {
		String sql = "SELECT * FROM STUDENT WHERE STUDENTNUMBER = '"+ studentNumber +"'";
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		connection = DBUtil.getConnection();
		statement = DBUtil.getStatement(connection);
		try {
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBUtil.closeAll(connection, statement, resultSet);
		}
		return false;
	}
	/**
	 * 验证手机后是否已经被注册
	 * @param myphone
	 * @return
	 */
	public boolean onlyPhone(String myphone) {
		String sql = "SELECT * FROM STUDENT WHERE MYPHONE = '"+ myphone +"'";
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		connection = DBUtil.getConnection();
		statement = DBUtil.getStatement(connection);
		try {
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBUtil.closeAll(connection, statement, resultSet);
		}
		return false;
	}
	/**
	 * 注册操作
	 * @param studentNumber
	 * @param password
	 * @param myPhone
	 */
	public void register(String studentNumber, String password, String myPhone) {
		String sql = "INSERT INTO STUDENT VALUES(NULL,NULL,'"+password+"','"+studentNumber+"',NULL,NULL,NULL,'"+myPhone+"',NULL,NULL,1,NOW())";
		Connection connection = null;
		Statement statement = null;
		connection = DBUtil.getConnection();
		statement = DBUtil.getStatement(connection);
		try {
			statement.execute(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(connection, statement, null);
		}
	}
	public void change(Student student) {
		String sql = "UPDATE STUDENT SET NAME = '"+student.getName()+"', DEPARTMENT = '"+student.getDepartment()+"', CLASS = '"+student.getClasses()+"', DORMNUMBER = '"+ student.getDormNumber() +"',PARENTPHONE = '"+student.getParentPhone()+"', SEX = '"+ student.getSex() +"' WHERE STUDENTNUMBER = '"+student.getStudentNumber()+"'";
		Connection connection = null;
		Statement statement = null;
		connection = DBUtil.getConnection();
		statement = DBUtil.getStatement(connection);
		try {
			statement.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(connection, statement, null);
		}		
	}
	/**
	 * 根据学号查询
	 * @param studentNumber
	 * @return
	 */
	public Student queryByNumber(String studentNumber) {
		String sql = "SELECT * FROM STUDENT WHERE STUDENTNUMBER = '"+studentNumber+"'";
		Student student = null;
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		connection = DBUtil.getConnection();
		statement = DBUtil.getStatement(connection);
		try {
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
				student = new Student();
				student.setId(resultSet.getInt("id"));
				student.setName(resultSet.getString("name") == null ? "" : resultSet.getString("name"));
				student.setPassword(resultSet.getString("password"));
				student.setStudentNumber(resultSet.getString("studentnumber"));
				student.setDepartment(resultSet.getString("department") == null ? "" : resultSet.getString("department"));
				student.setClasses(resultSet.getString("class") == null ? "" : resultSet.getString("class"));
				student.setDormNumber(resultSet.getString("dormnumber") == null ? "" : resultSet.getString("dormnumber"));
				student.setStudentPhone(resultSet.getString("myphone"));
				student.setParentPhone(resultSet.getString("parentphone") == null ? "" : resultSet.getString("parentphone"));
				student.setSex(Enum.valueOf(Sex.class, resultSet.getString("sex") == null ? "未知" : resultSet.getString("sex")));
				student.setPower(resultSet.getInt("power"));
				student.setRegistertime(resultSet.getTimestamp("date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBUtil.closeAll(connection, statement, resultSet);
		}
		return student;
	}
	/***
	 * 添加请假条
	 * @param note
	 * @return
	 */
	public int insertNote(Notes note) {
		String sql = "INSERT INTO NOTES VALUES(NULL,"+note.getStudentId()+",'"+note.getStarttime()+"',"+note.getStartclass()+",'"+note.getEndtime()+"',"+note.getEndclass()+","+note.getClassesNumber()+",'"+note.getLeaveReason()+"', NOW() ,'待审批')";
		Connection connection = null;
		Statement statement = null;
		connection = DBUtil.getConnection();
		statement = DBUtil.getStatement(connection);
		try {
			statement.execute(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBUtil.closeAll(connection, statement, null);
		}
		return 1;
	}
	/**
	 * 查询是否有未审批的假条
	 * @return
	 */
	public int queryNote(int studentid) {
		String sql = "SELECT * FROM NOTES WHERE STUDENT = "+studentid+" AND PASS = '待审批'";
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		connection = DBUtil.getConnection();
		statement = DBUtil.getStatement(connection);
		try {
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
				return 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(connection, statement, resultSet);
		}
		return 1;
	}
	/**
	 * 重置密码
	 * @param myphone
	 * @param password
	 */
	public void resetPwd(String myphone, String password) {
		String sql = "UPDATE STUDENT SET PASSWORD = '"+password+"' WHERE MYPHONE = '"+myphone+"'";
		Connection connection = null;
		Statement statement = null;
		connection = DBUtil.getConnection();
		statement = DBUtil.getStatement(connection);
		try {
			statement.executeUpdate(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBUtil.closeAll(connection, statement, null);
		}
	}
	/**
	 * 根据id查询note
	 * @param noteid
	 * @return
	 */
	public Notes queryByNoteId(int noteid) {
		String sql = "SELECT * FROM NOTES WHERE ID = "+noteid;
		Notes note = null;
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		connection = DBUtil.getConnection();
		statement = DBUtil.getStatement(connection);
		try {
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
				note = new Notes();
				note.setId(resultSet.getInt("id"));
				note.setStudentId(resultSet.getInt("student"));
				String sd1 = resultSet.getString("starttime");
				String[] s1 = sd1.split("-");
				String d1 = s1[0]+"年"+s1[1]+"月"+s1[2]+"日";
			    note.setStarttime(d1);
			    String sd2 = resultSet.getString("endtime");
				String[] s2 = sd2.split("-");
				String d2 = s2[0]+"年"+s2[1]+"月"+s2[2]+"日";
				note.setEndtime(d2);
				note.setStartclass(resultSet.getInt("startclasses"));
				note.setEndclass(resultSet.getInt("endclasses"));
				note.setClassesNumber(resultSet.getInt("classesnumber"));
				note.setLeaveReason(resultSet.getString("leavereason"));
				note.setNdate(resultSet.getTimestamp("ndate"));
				note.setPass(Enum.valueOf(Pass.class, resultSet.getString("pass")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBUtil.closeAll(connection, statement, resultSet);
		}	
		return note;
	}
	/**
	 * 修改请假数据
	 * @param note
	 */
	public void updateNote(Notes note) {
		String sql =  "UPDATE NOTES SET STARTTIME = '"+note.getStarttime()+"' , STARTCLASSES = "+note.getStartclass()+", ENDTIME = '"+note.getEndtime()+"' ,ENDCLASSES = "+note.getEndclass()+", CLASSESNUMBER = "+note.getClassesNumber()+" , LEAVEREASON = '"+note.getLeaveReason()+"' WHERE ID = "+note.getId();
		Connection connection = null;
		Statement statement = null;
		connection = DBUtil.getConnection();
		statement = DBUtil.getStatement(connection);
		try {
			statement.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(connection, statement, null);
		}
	}
	/**
	 * 根据时间进行查询
	 * @param studentid
	 * @param time
	 * @return
	 */
	public int getNotesRowCountByTime(int studentid,String time, String pass) {
		StringBuffer sql = new StringBuffer(" SELECT COUNT(*) FROM NOTES");
		if(time != null && pass != null){
			sql.append(" WHERE STARTTIME = '"+time+"' AND STUDENT ="+studentid+" AND PASS = '"+pass+"'");
		}else if(time!=null){
			sql.append(" WHERE STARTTIME ='"+time+"' AND STUDENT ="+studentid);
		}else if(pass!=null){
			sql.append(" WHERE PASS ='"+pass+"' AND STUDENT ="+studentid);
		}else{
			sql.append(" WHERE 1=1 AND STUDENT ="+studentid);
		}
		int count = 0;
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		connection = DBUtil.getConnection();
		statement = DBUtil.getStatement(connection);
		try {
			resultSet = statement.executeQuery(sql.toString());
			while(resultSet.next()){
				count = resultSet.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBUtil.closeAll(connection, statement, resultSet);
		}
		return count;
	}
	/**
	 * 按时间查询请假记录
	 * @param studentid
	 * @param pageUtil
	 */
	public void querySearchNotesList(int studentid, String time,String pass,PageUtil<Notes> pageUtil) {
		List<Notes> notesList = new ArrayList<Notes>();
		StringBuffer sql = new StringBuffer("SELECT * FROM NOTES");
		if(time != null && pass != null){
			sql.append(" WHERE STARTTIME = '"+time+"' AND STUDENT ="+studentid+" AND PASS = '"+pass+"'  LIMIT "+ pageUtil.getRowStart() +" , "+ pageUtil.getPageSize());
		}else if(time!=null){
			sql.append(" WHERE STARTTIME ='"+time+"'  AND STUDENT ="+studentid+" LIMIT "+ pageUtil.getRowStart() +" , "+ pageUtil.getPageSize());
		}else if(pass!=null){
			sql.append(" WHERE PASS ='"+pass+"' AND STUDENT ="+studentid+" LIMIT "+ pageUtil.getRowStart() +" , "+ pageUtil.getPageSize());
		}else{
			sql.append(" WHERE 1=1 AND STUDENT ="+studentid+" LIMIT "+ pageUtil.getRowStart() +" , "+ pageUtil.getPageSize());
		}
		Connection connection = DBUtil.getConnection();
		Statement statement = DBUtil.getStatement(connection);
		ResultSet resultSet = null;
		try {
			resultSet = statement.executeQuery(sql.toString());
			while(resultSet.next()){
				Notes notes = new Notes();
				notes.setId(resultSet.getInt("id"));
				notes.setStudentId(resultSet.getInt("student"));
				String sd1 = resultSet.getString("starttime");
				String[] s1 = sd1.split("-");
				String d1 = s1[0]+"年"+s1[1]+"月"+s1[2]+"日";
			    notes.setStarttime(d1);
			    String sd2 = resultSet.getString("endtime");
				String[] s2 = sd2.split("-");
				String d2 = s2[0]+"年"+s2[1]+"月"+s2[2]+"日";
				notes.setEndtime(d2);
				notes.setStartclass(resultSet.getInt("startclasses"));
				notes.setEndclass(resultSet.getInt("endclasses"));
				notes.setClassesNumber(resultSet.getInt("classesnumber"));
				notes.setLeaveReason(resultSet.getString("leavereason"));
				notes.setNdate(resultSet.getTimestamp("ndate"));
				notes.setPass(Enum.valueOf(Pass.class, resultSet.getString("pass")));
				notesList.add(notes);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBUtil.closeAll(connection, statement, resultSet);
		}
		pageUtil.setList(notesList);
	}
	/**
	 * 删除请假数据
	 * @param noteid
	 */
	public void deleteNoteById(int noteid) {
		String sql = "DELETE FROM NOTES WHERE ID ="+noteid;
		Connection connection = null;
		Statement statement = null;
		connection = DBUtil.getConnection();
		statement = DBUtil.getStatement(connection);
		try {
			statement.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBUtil.closeAll(connection, statement, null);
		}
	}
}
