package com.xinhua.hospital.pojo;

import java.io.Serializable;

/**
 * @author wqs
 *
 */
public class User implements Serializable{
	private int id;
	private String name;
	private String password;
	private int age;
	private String location;//学生宿舍号
	private String phone;//手机号唯一
	private String email;
	private int role;//角色值
	private int status;//用户状态
	private int sex;//性别
	//映射对象，该用户对应的属性角色（骨科，耳鼻喉科等）
	private Department d;
	
	
	public Department getD() {
		return d;
	}
	public void setD(Department d) {
		this.d = d;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
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
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", password=" + password + ", age=" + age + ", location="
				+ location + ", phone=" + phone + ", email=" + email + ", role=" + role + ", status=" + status
				+ ", sex=" + sex + ", d=" + d + "]";
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
