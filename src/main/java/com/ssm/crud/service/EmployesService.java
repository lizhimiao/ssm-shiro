package com.ssm.crud.service;

import java.math.BigDecimal;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ssm.bean.Employee;
import com.ssm.bean.EmployeeExample;
import com.ssm.bean.EmployeeExample.Criteria;
import com.ssm.crud.dao.EmployeeMapper;

@Service
public class EmployesService {
	
	@Autowired
	private EmployeeMapper employeeMapper;
	
	public List<Employee> getEmps() {
		List<Employee> list = employeeMapper.selectByExampleWithDept(null);
		return list;
	}

	public void saveEmp(Employee employee) {
		employeeMapper.insertSelective(employee);
	}
	
	/**
	 * 检查用户名是否可用
	 * @param empName
	 * @return
	 */
	public boolean checkUser(String empName) {
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		// 为 criteria 拼装查询条件
		criteria.andEmpNameEqualTo(empName);
		long countByExample = employeeMapper.countByExample(example);
		return countByExample == 0;
	}

	public Employee getEmp(Integer id) {
		Employee employee = employeeMapper.selectByPrimaryKeyWithDept(new BigDecimal(id));
		return employee;
	}

	public void updateEmp(Employee employee) {
		employeeMapper.updateByPrimaryKeySelective(employee);
	}

	public void deleteEmp(BigDecimal id) {
		employeeMapper.deleteByPrimaryKey(id);
	}
	
	public void deleteEmps(List<BigDecimal> empIdList) {
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpIdIn(empIdList);
		employeeMapper.deleteByExample(example);
	}

}
