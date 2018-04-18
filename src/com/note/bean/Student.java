package com.note.bean;

import java.util.Date;

public class Student {
	private int id;
	private String name;//学生姓名
	private String password;//密码
	private String studentNumber;//学号
	private String department;//系
	private String classes;//班级
	private String dormNumber;//宿舍号
	private String studentPhone;//学生电话
	private String parentPhone;//父母电话
	private Sex sex;//性别
	private int power;
	private Date registertime;//注册时间

	public	Student (){}
	/**
	 * 该构造方法用于修改信息页面
	 * @param name
	 * @param studentNumber
	 * @param department
	 * @param classes
	 * @param dormNumber
	 * @param parentPhone
	 * @param sex
	 */
	public Student(String name, String studentNumber,String department, String classes, String dormNumber, String parentPhone, Sex sex) {
		this.name = name;
		this.studentNumber = studentNumber;
		this.department = department;
		this.classes = classes;
		this.dormNumber = dormNumber;
		this.parentPhone = parentPhone;
		this.sex = sex;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getStudentNumber() {
		return studentNumber;
	}
	public void setStudentNumber(String studentNumber) {
		this.studentNumber = studentNumber;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getClasses() {
		return classes;
	}
	public void setClasses(String classes) {
		this.classes = classes;
	}
	public String getDormNumber() {
		return dormNumber;
	}
	public void setDormNumber(String dormNumber) {
		this.dormNumber = dormNumber;
	}
	public String getStudentPhone() {
		return studentPhone;
	}
	public void setStudentPhone(String studentPhone) {
		this.studentPhone = studentPhone;
	}
	public String getParentPhone() {
		return parentPhone;
	}
	public void setParentPhone(String parentPhone) {
		this.parentPhone = parentPhone;
	}
	public Sex getSex() {
		return sex;
	}
	public void setSex(Sex sex) {
		this.sex = sex;
	}
	public Date getRegistertime() {
		return registertime;
	}
	public void setRegistertime(Date registertime) {
		this.registertime = registertime;
	}
	public int getPower() {
		return power;
	}
	public void setPower(int power) {
		this.power = power;
	}

	@Override
	public String toString() {
		return "Student{" +
				"id=" + id +
				", name='" + name + '\'' +
				", password='" + password + '\'' +
				", studentNumber='" + studentNumber + '\'' +
				", department='" + department + '\'' +
				", classes='" + classes + '\'' +
				", dormNumber='" + dormNumber + '\'' +
				", studentPhone='" + studentPhone + '\'' +
				", parentPhone='" + parentPhone + '\'' +
				", sex=" + sex +
				", power=" + power +
				", registertime=" + registertime +
				'}';
	}
}