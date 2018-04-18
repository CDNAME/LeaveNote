package com.note.service;

import com.note.bean.NoteSearchBean;
import com.note.bean.Notes;
import com.note.dao.NotesDAO;

import java.util.List;

public class NotesManager {

    public static int find(List<Notes> notes, int pageNo, int page_size, NoteSearchBean bean) {
        String queryStr = " where 1=1 ";
        if(bean.getTimeType().trim().equals("申请日期")) {
            if (bean.getStartTime() != null && !bean.getStartTime().equals("")) {
                queryStr += " and notes.ndate >= '" + bean.getStartTime() + " 00:00:00'";
            }
            if (bean.getEndTime() != null && !bean.getEndTime().equals("")) {
                queryStr += " and notes.ndate <= '" + bean.getEndTime() + " 00:00:00'";
            }
        } else if(bean.getTimeType().trim().equals("请假日期")) {
            if (bean.getStartTime() != null && !bean.getStartTime().equals("")) {
                queryStr += " and notes.starttime >= '" + bean.getStartTime() + "'";
            }
            if (bean.getEndTime() != null && !bean.getEndTime().equals("")) {
                queryStr += " and notes.starttime <= '" + bean.getEndTime() + "'";
            }
        }
        if(bean.getClasses() != null && !bean.getClasses().trim().equals("")) {
            queryStr += " and student.class = '" + bean.getClasses() + "'";
        }
        return NotesDAO.find(notes, pageNo, page_size, queryStr);
    }
}