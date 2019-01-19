package com.xinhua.hospital.pojo;

import java.util.List;

public class Department {
	private int id;
	private String name;
	private int doctor_id;
	//关联科室下的医生
	private List<User> doctor;
	
	public List<User> getDoctor() {
		return doctor;
	}
	public void setDoctor(List<User> doctor) {
		this.doctor = doctor;
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
	public int getDoctor_id() {
		return doctor_id;
	}
	public void setDoctor_id(int doctor_id) {
		this.doctor_id = doctor_id;
	}
	@Override
	public String toString() {
		return "Department [id=" + id + ", name=" + name + ", doctor_id=" + doctor_id + ", doctor=" + doctor + "]";
	}
	public Department() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
