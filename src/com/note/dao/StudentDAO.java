package com.note.dao;

import com.note.bean.Student;
import com.note.util.DBUtil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {
    public static List<Student> getStudentClasses() {
        List<Student> list = new ArrayList<Student>();
        Connection conn = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            String sql = "select distinct class from student";
            rs = DBUtil.executeQuery(conn, sql);
            while(rs.next()) {
                Student s = new Student();
                s.setClasses(rs.getString("class"));
                list.add(s);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closeConnection(conn);
        }
        
        return list;
    }
}