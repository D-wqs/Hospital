package com.xinhua.hospital.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xinhua.hospital.dao.UserDao;
import com.xinhua.hospital.pojo.User; 
import com.xinhua.hospital.service.UserService;
import com.xinhua.hospital.util.Md5Utils;
//注解,定义业务层bean
@Service
public class UserServiceImpl implements UserService {
	//制定依赖注入关系，优先按名称匹配注入
	@Resource
	private UserDao dao;
	@Override
	public User findById(int id) throws Exception {
		// TODO Auto-generated method stub
		User u=dao.findByid(1);
		return u;
	}
	@Override
	public User findByName(String name) throws Exception {
		// TODO Auto-generated method stub
		User u=dao.findByName(name);
		return u;
	}
	@Override
	public void addUser(User u) throws Exception {
		// TODO Auto-generated method stub
		//将传来的密码进行MD5加密
		System.out.println("传来的参数："+u.toString());
		u.setPassword(Md5Utils.md5(u.getPassword()));
		System.out.println("加密后的参数："+u.toString());
		dao.addUser(u);
	}
	@Override
	public List<User> getDoctor() throws Exception {
		// TODO Auto-generated method stub
		List<User> doctors=dao.getDoctor();//0位普通用户，1为医生
		return doctors;
	}

	
}
