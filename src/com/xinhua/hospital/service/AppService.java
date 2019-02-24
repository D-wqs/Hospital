package com.xinhua.hospital.service;

import java.util.List;

import com.xinhua.hospital.pojo.Application;

public interface AppService {
	void createApp(Application app) throws Exception;
	Application findById(int id) throws Exception;
	Application findByUserName(String userName) throws Exception;
	List<Application> findAll() throws Exception;
}
