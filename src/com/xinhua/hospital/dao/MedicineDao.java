package com.xinhua.hospital.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.xinhua.hospital.pojo.Medicine;
@Repository
public interface MedicineDao {
	List<Medicine> findAll() throws Exception; 
	Medicine findByName(String name) throws Exception;
	Medicine findByType(int type) throws Exception;
	void addMedicine(Medicine m)throws Exception;
}
