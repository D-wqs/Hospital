package com.xinhua.hospital.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.xinhua.hospital.pojo.Application;
@Repository
public interface AppDao {
	void createApp(Application app) throws Exception;
	Application findById(int id) throws Exception;
	Application findByUserName(String userName) throws Exception;
	List<Application> findAll() throws Exception;
}
