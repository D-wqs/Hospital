package com.xinhua.hospital.pojo;

public class Medicine {
	private int id;
	private String name;
	private double price;
	private int type;
	private int user_id;
	private int count;//当前库存数量
	private String image;//图片
	private String information;
	
	public String getInformation() {
		return information;
	}
	public void setInformation(String information) {
		this.information = information;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}

	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
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
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public Medicine() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Medicine [id=" + id + ", name=" + name + ", price=" + price + ", type=" + type + ", user_id=" + user_id
				+ ", count=" + count + ", image=" + image + ", information=" + information + "]";
	}
	
}
