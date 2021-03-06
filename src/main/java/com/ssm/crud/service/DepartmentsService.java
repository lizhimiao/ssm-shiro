package com.ssm.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ssm.bean.Department;
import com.ssm.crud.dao.DepartmentMapper;

@Service
public class DepartmentsService {
	
	@Autowired
	DepartmentMapper departmentMapper;

	public List<Department> getDepts() {
		List<Department> depts = departmentMapper.selectByExample(null);
		return depts;
	}
	
}
