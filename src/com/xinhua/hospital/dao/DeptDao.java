package com.xinhua.hospital.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.xinhua.hospital.pojo.Department;
import com.xinhua.hospital.pojo.User;
@Repository
public interface DeptDao {
	Department findByName(String name) throws Exception;
	void addDoctor(Department d) throws Exception;
	Department findDoctorsBydeptId(int id) throws Exception;
	List<Department> findDeptAll() throws Exception;
	
}
