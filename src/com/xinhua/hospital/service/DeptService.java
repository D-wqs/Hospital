package com.xinhua.hospital.service;

import java.util.List;

import com.xinhua.hospital.pojo.Department;
import com.xinhua.hospital.pojo.User;

public interface DeptService {
	Department findByName(String name) throws Exception;
	void addDoctor(Department d)throws Exception;
	Department findDoctorsBydeptId(int id)throws Exception;
	List<Department> findDeptAll() throws Exception;
}
