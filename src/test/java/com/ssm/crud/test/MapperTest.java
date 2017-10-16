package com.ssm.crud.test;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ssm.bean.Employee;
import com.ssm.crud.dao.DepartmentMapper;
import com.ssm.crud.dao.EmployeeMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class MapperTest {
	
	@Autowired
	DepartmentMapper departmentMapper;
	@Autowired
	EmployeeMapper employeeMapper;
	@Autowired
	SqlSession sqlSessionBatch;
	
	@Test
	public void testCrud() throws ParseException{
		
//		departmentMapper.insertSelective(new Department(null,"管理部"));
//		departmentMapper.insertSelective(new Department(null,"测试部"));
//		departmentMapper.insertSelective(new Department(null,"研发部"));
		
/*		employeeMapper.insert(new Employee(null, "zhangHuai", new BigDecimal(23), "m", "zhangHuai@163.com", 
				new SimpleDateFormat("yyyy-MM-dd").parse("2017-10-07"), new BigDecimal(3)));*/
		// 批量添加员工
		EmployeeMapper mapper = sqlSessionBatch.getMapper(EmployeeMapper.class);
		for(int i = 0; i < 1000; i++){
			String uuid = UUID.randomUUID().toString().substring(0, 5) + i;
			Date workDate = new SimpleDateFormat("yyyy-MM-dd").parse("2017-10-07");
			Employee emp = new Employee(null,uuid,new BigDecimal(23),"m","uuid@qq.com",workDate,new BigDecimal(3));
			mapper.insertSelective(emp);
		}
	}
	
	@Test
	public void testDate() throws ParseException {
		Date date = new SimpleDateFormat("yyyy-MM-dd").parse("2017-9-6");
		System.out.println(date);		// Wed Sep 06 00:00:00 CST 2017
	}
}
