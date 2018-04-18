package com.note.bean;

public class Teacher {
	private String name;//老师姓名
	private String password;//密码
	private String teacherPhone;//老师电话
	private int power;
	private String department;//系
	
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
	public String getTeacherPhone() {
		return teacherPhone;
	}
	public void setTeacherPhone(String teacher_phone) {
		this.teacherPhone = teacher_phone;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public int getPower() {
		return power;
	}
	public void setPower(int power) {
		this.power = power;
	}
	@Override
	public String toString() {
		return "Teacher [name=" + name + ", password=" + password + ", teacherPhone=" + teacherPhone + ", power="
				+ power + ", department=" + department + "]";
	}
}