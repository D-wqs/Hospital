package com.xinhua.hospital.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xinhua.hospital.dao.DeptDao;
import com.xinhua.hospital.pojo.Department;
import com.xinhua.hospital.pojo.User;
import com.xinhua.hospital.service.DeptService;
@Service
public class DeptServiceImpl implements DeptService {
	@Resource
	private DeptDao dao;
	//通过部门名查部门信息
	@Override
	public Department findByName(String name) throws Exception {
		// TODO Auto-generated method stub
		Department d=dao.findByName(name);
		return d;
	}

	@Override
	public void addDoctor(Department d) throws Exception {
		// TODO Auto-generated method stub
		dao.addDoctor(d);
	}

	@Override
	public List<Department> findDoctorsBydeptId(int id) throws Exception {
		// TODO Auto-generated method stub
		List<Department> list=dao.findDoctorsBydeptId(id);
		return list;
	}

}
