package com.note.dao;

import com.note.bean.Notes;
import com.note.bean.Pass;
import com.note.bean.Student;
import com.note.util.DBUtil;

import java.sql.*;
import java.util.List;

public class NotesDAO {

    public static int getNotes(List<Notes> notes, int pageNo, int page_size, boolean lazy) {
        Connection conn = null;
        ResultSet rs = null;
        ResultSet rsCount = null;
        int pageCount = 0;
        String sql = "";
        try {
            conn = DBUtil.getConnection();
            if(lazy){
                sql += "select notes.id , notes.student, notes.starttime, notes.startclasses, notes.endtime, notes.endclasses, notes.classesnumber, notes.leavereason, notes.ndate, notes.pass, " +
                        " student.id sid, student.name, student.studentnumber, student.department, student.class, student.dormnumber, student.myphone, student.parentphone " +
                        " from notes join student on (notes.student = student.id) limit " + (pageNo - 1) * page_size + "," + page_size;
                rsCount = DBUtil.executeQuery(conn, "select count(*) from notes");
            } else {
                sql += "select notes.id , notes.student, notes.starttime, notes.startclasses, notes.endtime, notes.endclasses, notes.classesnumber, notes.leavereason, notes.ndate, notes.pass, " +
                        " student.id sid, student.name, student.studentnumber, student.department, student.class, student.dormnumber, student.myphone, student.parentphone " +
                        " from notes join student on (notes.student = student.id) where notes.pass='待审批' limit " + (pageNo - 1) * page_size + "," + page_size;;
                rsCount = DBUtil.executeQuery(conn, "select count(*) from notes where notes.pass='待审批'");
            }
            rsCount.next();
            pageCount = (rsCount.getInt(1) + page_size - 1) / page_size;
            rs = DBUtil.executeQuery(conn, sql);
            while (rs.next()) {
                Notes n = new Notes();
                n.setId(rs.getInt("id"));
                n.setLeaveReason(rs.getString("leavereason"));
                n.setStarttime(rs.getString("starttime"));
                n.setStartclass(rs.getInt("startclasses"));
                n.setEndtime(rs.getString("endtime"));
                n.setEndclass(rs.getInt("endclasses"));
                n.setClassesNumber(rs.getInt("classesnumber"));
                n.setNdate(rs.getTimestamp("ndate"));
                n.setPass(Enum.valueOf(Pass.class,rs.getString("pass")));
                

                Student s = new Student();
                s.setStudentNumber(rs.getString("studentnumber"));
                s.setName(rs.getString("name"));
                s.setDepartment(rs.getString("department"));
                s.setClasses(rs.getString("class"));
                s.setDormNumber(rs.getString("dormnumber"));
                s.setStudentPhone(rs.getString("myphone"));
                s.setParentPhone(rs.getString("parentphone"));

                n.setStudent(s);

                notes.add(n);
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

    public static void updateNotes(int notesId, String passStatus) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DBUtil.getConnection();
            conn.setAutoCommit(false);

            //存储新的category
            String sql = "update notes set pass = ? where id = " + notesId;
            pstmt = DBUtil.getPreparedStatement(conn, sql);
            pstmt.setString(1, passStatus);
            pstmt.executeUpdate();
            conn.commit();
            conn.setAutoCommit(true);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeStatement(pstmt);
            DBUtil.closeConnection(conn);
        }
    }

    public static int find(List<Notes> notes, int pageNo, int page_size, String queryStr) {
        int totalRecords = -1;
        Connection conn = null;
        ResultSet rs = null;
        ResultSet rsCount = null;
        String sql = "";

        try {
            conn = DBUtil.getConnection();
            sql = "select notes.id , notes.student, notes.starttime, notes.startclasses, notes.endtime, notes.endclasses, notes.classesnumber, notes.leavereason, notes.ndate, notes.pass, " +
                    " student.id sid, student.name, student.studentnumber, student.department, student.class, student.dormnumber, student.myphone, student.parentphone " +
                    " from notes join student on (notes.student = student.id) " + queryStr +
                    " order by notes.ndate ";

            sql +=  " limit " + (pageNo - 1) * page_size + "," + page_size;

            rsCount = DBUtil.executeQuery(conn,
                    "select count(*) from notes join student on (notes.student = student.id)" + queryStr);
            
            rsCount.next();
            totalRecords = rsCount.getInt(1);
            rs = DBUtil.executeQuery(conn, sql);

            while (rs.next()) {
                Notes n = new Notes();
                n.setId(rs.getInt("id"));
                n.setLeaveReason(rs.getString("leavereason"));
                n.setStarttime(rs.getString("starttime"));
                n.setStartclass(rs.getInt("startclasses"));
                n.setEndtime(rs.getString("endtime"));
                n.setEndclass(rs.getInt("endclasses"));
                n.setClassesNumber(rs.getInt("classesnumber"));
                n.setNdate(rs.getTimestamp("ndate"));
                n.setPass(Enum.valueOf(Pass.class,rs.getString("pass")));


                Student s = new Student();
                s.setStudentNumber(rs.getString("studentnumber"));
                s.setName(rs.getString("name"));
                s.setDepartment(rs.getString("department"));
                s.setClasses(rs.getString("class"));
                s.setDormNumber(rs.getString("dormnumber"));
                s.setStudentPhone(rs.getString("myphone"));
                s.setParentPhone(rs.getString("parentphone"));

                n.setStudent(s);

                notes.add(n);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeResultSet(rsCount);
            DBUtil.closeResultSet(rs);
            DBUtil.closeConnection(conn);
        }

        return totalRecords;
    }
}