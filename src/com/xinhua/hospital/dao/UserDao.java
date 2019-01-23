package com.xinhua.hospital.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.xinhua.hospital.pojo.User;

@Repository
public interface UserDao {
	User findByid(int id) throws Exception;
	User findByName(String name) throws Exception;
	void addUser(User u) throws Exception;
	List<User> getDoctor() throws Exception;//获取所有医生
	void toDoctor(int user_id ,int role) throws Exception;
}
