package com.xinhua.hospital.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xinhua.hospital.dao.MedicineDao;
import com.xinhua.hospital.pojo.Medicine;
import com.xinhua.hospital.service.MedicineService;
@Service
public class MedicineServiceImpl implements MedicineService {
	@Resource
	private MedicineDao dao;
	@Override
	public List<Medicine> findAll() throws Exception {
		// TODO Auto-generated method stub
		List<Medicine> list_m=dao.findAll();
		return list_m;
	}

	@Override
	public Medicine findByName(String name) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Medicine findByType(int type) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addMedicine(Medicine m) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
