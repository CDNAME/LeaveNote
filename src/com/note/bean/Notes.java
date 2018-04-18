package com.note.bean;

import java.util.Date;

public class Notes {
	private int id;
	private Integer studentId;//请假学生id
	private String starttime; //开始时间
	private int startclass;
	private String endtime; //结束时间
	private int endclass;
	private int classesNumber;//请假节数
	private String leaveReason;//请假原因
	private Date ndate;//请假日期
	private Pass pass;
	
	private Student student;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public String getStarttime() {
		return starttime;
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}

	public int getStartclass() {
		return startclass;
	}

	public void setStartclass(int startclass) {
		this.startclass = startclass;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	public int getEndclass() {
		return endclass;
	}

	public void setEndclass(int endclass) {
		this.endclass = endclass;
	}

	public int getClassesNumber() {
		return classesNumber;
	}

	public void setClassesNumber(int classesNumber) {
		this.classesNumber = classesNumber;
	}

	public String getLeaveReason() {
		return leaveReason;
	}

	public void setLeaveReason(String leaveNeason) {
		this.leaveReason = leaveNeason;
	}

	public Date getNdate() {
		return ndate;
	}

	public void setNdate(Date ndate) {
		this.ndate = ndate;
	}

	public Pass getPass() {
		return pass;
	}

	public void setPass(Pass pass) {
		this.pass = pass;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}
}