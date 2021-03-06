package com.ems.entity;
/**
 * 学生信息
 * @author hrcui
 *
 */
public class Student {
	private String id;
	private String classid;
	private String userid;
	private String name;
	private String password;
	private String hjszd;
	private String sex;
	private String birth;
	private String rxsj;//入学时间
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getClassid() {
		return classid;
	}
	public void setClassid(String classid) {
		this.classid = classid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHjszd() {
		return hjszd;
	}
	public void setHjszd(String hjszd) {
		this.hjszd = hjszd;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getRxsj() {
		return rxsj;
	}
	public void setRxsj(String rxsj) {
		this.rxsj = rxsj;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "Student [id=" + id + ", classid=" + classid + ", userid="
				+ userid + ", name=" + name + ", password=" + password
				+ ", hjszd=" + hjszd + ", sex=" + sex + ", birth=" + birth
				+ ", rxsj=" + rxsj + "]";
	}
	
	
}
