package com.ems.entity;
/**
 * 教师信息
 * @author hrcui on 2017-5-11
 */
public class Teacher {
	private String id;
	private String userid;
	private String name;
	private String password;
	private String sex;
	private String type;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "Teacher [id=" + id + ", userid=" + userid + ", name=" + name
				+ ", password=" + password + ", sex=" + sex + ", type=" + type
				+ "]";
	}
	
}
