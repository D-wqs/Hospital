package com.xinhua.hospital.service;

import java.util.List;

import com.xinhua.hospital.pojo.User;

public interface UserService {
	User findById(int id) throws Exception;
	User findByName(String name) throws Exception;
	void addUser(User u) throws Exception;
	List<User> getDoctor() throws Exception;//获取所有医生
	void toDoctor(int user_id ,int role) throws Exception;
	void update(User u)throws Exception;
}
