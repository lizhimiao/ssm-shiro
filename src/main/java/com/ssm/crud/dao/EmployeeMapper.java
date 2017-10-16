package com.ssm.crud.dao;

import com.ssm.bean.Employee;
import com.ssm.bean.EmployeeExample;
import java.math.BigDecimal;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EmployeeMapper {
    long countByExample(EmployeeExample example);

    int deleteByExample(EmployeeExample example);

    int deleteByPrimaryKey(BigDecimal empId);

    int insert(Employee record);

    int insertSelective(Employee record);

    List<Employee> selectByExample(EmployeeExample example);

    Employee selectByPrimaryKey(BigDecimal empId);
    
    // 新增查询员工信息的同时携带部门信息
    List<Employee> selectByExampleWithDept(EmployeeExample example);
    
    Employee selectByPrimaryKeyWithDept(BigDecimal empId);

    int updateByExampleSelective(@Param("record") Employee record, @Param("example") EmployeeExample example);

    int updateByExample(@Param("record") Employee record, @Param("example") EmployeeExample example);

    int updateByPrimaryKeySelective(Employee record);

    int updateByPrimaryKey(Employee record);
}