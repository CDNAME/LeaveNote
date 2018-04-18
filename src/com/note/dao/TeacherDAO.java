package com.note.dao;

import com.note.bean.Sex;
import com.note.bean.Student;
import com.note.util.DBUtil;

import java.sql.*;
import java.util.List;

public class TeacherDAO {

    public static int getStudents(List<Student> students, int pageNo, int page_size) {
        Connection conn = null;
        ResultSet rs = null;
        ResultSet rsCount = null;
        int pageCount = 0;
        try {
            conn = DBUtil.getConnection();
            rsCount = DBUtil.executeQuery(conn, "select count(*) from student");
            rsCount.next();
            pageCount = (rsCount.getInt(1) + page_size - 1) / page_size;
            String sql = "select * from student limit " + (pageNo-1)*page_size + "," + page_size;;
            rs = DBUtil.executeQuery(conn, sql);
            while (rs.next()) {
                Student s = new Student();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setStudentNumber(rs.getString("studentnumber"));
                s.setDepartment(rs.getString("department"));
                s.setClasses(rs.getString("class"));
                s.setDormNumber(rs.getString("dormnumber"));
                s.setStudentPhone(rs.getString("myphone"));
                s.setParentPhone(rs.getString("parentphone"));
                s.setSex(Enum.valueOf(Sex.class,rs.getString("sex")));
                s.setRegistertime(rs.getTimestamp("date"));
                
                students.add(s);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeResultSet(rsCount);
            DBUtil.closeResultSet(rs);
            DBUtil.closeConnection(conn);
        }
        return pageCount;
    }

    public static void delete(int id) {
        Connection conn = null;
        Statement stmt = null;
        try {
            conn = DBUtil.getConnection();
            stmt = DBUtil.getStatement(conn);
            //执行删除
            String sql = "delete from student where id = " + id;
            stmt.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeConnection(conn);
        }
    }

    public static Student loadById(int id) {
        Connection conn = null;
        Student s = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            rs = DBUtil.executeQuery(conn, "select * from student where id = " + id);
            if(rs.next()) {
                s = new Student();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setStudentNumber(rs.getString("studentnumber"));
                s.setDepartment(rs.getString("department"));
                s.setClasses(rs.getString("class"));
                s.setDormNumber(rs.getString("dormnumber"));
                s.setStudentPhone(rs.getString("myphone"));
                s.setParentPhone(rs.getString("parentphone"));
                s.setSex(Enum.valueOf(Sex.class,rs.getString("sex")));
                s.setRegistertime(rs.getTimestamp("date"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closeConnection(conn);
        }
        return s;
    }
}