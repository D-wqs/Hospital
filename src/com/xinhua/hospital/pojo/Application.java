package com.xinhua.hospital.pojo;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

public class Application implements Serializable{
	private int id;
	private int medicine_id;
	private int doctor_id;
	private int user_id;
	private String medicine_name;
	private String doctor_name;
	private String user_name;
	private Timestamp create_time;
	
	public Timestamp getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Timestamp create_time) {
		this.create_time = create_time;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMedicine_id() {
		return medicine_id;
	}
	public void setMedicine_id(int medicine_id) {
		this.medicine_id = medicine_id;
	}
	public int getDoctor_id() {
		return doctor_id;
	}
	public void setDoctor_id(int doctor_id) {
		this.doctor_id = doctor_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getMedicine_name() {
		return medicine_name;
	}
	public void setMedicine_name(String medicine_name) {
		this.medicine_name = medicine_name;
	}
	public String getDoctor_name() {
		return doctor_name;
	}
	public void setDoctor_name(String doctor_name) {
		this.doctor_name = doctor_name;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public Application() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Application [id=" + id + ", medicine_id=" + medicine_id + ", doctor_id=" + doctor_id + ", user_id="
				+ user_id + ", medicine_name=" + medicine_name + ", doctor_name=" + doctor_name + ", user_name="
				+ user_name + ", create_time=" + create_time + "]";
	}
	
}
