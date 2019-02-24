package com.xinhua.hospital.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xinhua.hospital.dao.AppDao;
import com.xinhua.hospital.pojo.Application;
import com.xinhua.hospital.service.AppService;
//注解,定义业务层bean
@Service
public class AppServiceImpl implements AppService {
	
	@Resource
	private AppDao dao;
	@Override
	public void createApp(Application app) throws Exception {
		// TODO Auto-generated method stub
		dao.createApp(app);
	}

	@Override
	public Application findById(int id) throws Exception {
		// TODO Auto-generated method stub
		Application app=dao.findById(id);
		return app;
	}

	@Override
	public Application findByUserName(String userName) throws Exception {
		// TODO Auto-generated method stub
		Application app=dao.findByUserName(userName);
		return app;
	}

	@Override
	public List<Application> findAll() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("---------------");
		List<Application> list=dao.findAll();
		return list;
	}

}
