package com.xinhua.hospital.service;

import java.util.List;

import com.xinhua.hospital.pojo.Medicine;
import com.xinhua.hospital.pojo.PageBean;

public interface MedicineService {
	List<Medicine> findAll() throws Exception; 
	Medicine findByName(String name) throws Exception;
	Medicine findByType(int type) throws Exception;
	Medicine findById(int id) throws Exception;
	void addMedicine(Medicine m)throws Exception;
	int findCount() throws Exception;//获取总数
	//分页处理
	List<Medicine> findByPage(int start,int count)throws Exception;
	List<Medicine> findMByinformation(String Info)throws Exception;
}
