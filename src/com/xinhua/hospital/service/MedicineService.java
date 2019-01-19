package com.xinhua.hospital.service;

import java.util.List;

import com.xinhua.hospital.pojo.Medicine;

public interface MedicineService {
	List<Medicine> findAll() throws Exception; 
	Medicine findByName(String name) throws Exception;
	Medicine findByType(int type) throws Exception;
	void addMedicine(Medicine m)throws Exception;
}
