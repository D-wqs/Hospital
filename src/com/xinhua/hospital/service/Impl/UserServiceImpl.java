package com.xinhua.hospital.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xinhua.hospital.dao.UserDao;
import com.xinhua.hospital.pojo.User; 
import com.xinhua.hospital.service.UserService;
import com.xinhua.hospital.util.Md5Utils;
//ע��,����ҵ���bean
@Service
public class UserServiceImpl implements UserService {
	//�ƶ�����ע���ϵ�����Ȱ�����ƥ��ע��
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
		//���������������MD5����
		System.out.println("�����Ĳ�����"+u.toString());
		u.setPassword(Md5Utils.md5(u.getPassword()));
		System.out.println("���ܺ�Ĳ�����"+u.toString());
		dao.addUser(u);
	}
	@Override
	public List<User> getDoctor() throws Exception {
		// TODO Auto-generated method stub
		List<User> doctors=dao.getDoctor();//0λ��ͨ�û���1Ϊҽ��
		return doctors;
	}

	
}
