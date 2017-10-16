package com.ssm.bean;

import java.math.BigDecimal;
import java.util.Date;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.springframework.format.annotation.DateTimeFormat;

public class Employee {
    private BigDecimal empId;
    
    // java中“\” 是特殊字符，需要加上“\"，进行转义，所以”\\“
    @Pattern(regexp="(^[\u2E80-\u9FFF]{2,5}$)|(^[a-zA-Z0-9_-]{5,16}$)"
    		,message="员工姓名必须是 2-5 位中文或者 5-16位英文和数字的组合")
    private String empName;

    private BigDecimal age;

    private String gender;
    
    @Email(regexp="^([a-zA-Z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
    		,message="邮箱格式不正确")
    private String email;
    
    /**
     * 使用 springmvc 日期格式化注解：
     * 将请求信息中的自定义日期格式转化为标准日期格式 'Sat Oct 07 00:00:00 CST 2017' 存入数据库
     */
    @DateTimeFormat(pattern="yyyy/MM/dd")
    private Date workdate;

    private BigDecimal deptid;
    
    // resultMap 映射创建对象必须具有getter 和setter 方法和无参构造器
    private Department department;

    public Employee() {
		super();
	}

	public Employee(BigDecimal empId, String empName, BigDecimal age, String gender, String email, Date workdate,
			BigDecimal deptid) {
		super();
		this.empId = empId;
		this.empName = empName;
		this.age = age;
		this.gender = gender;
		this.email = email;
		this.workdate = workdate;
		this.deptid = deptid;
	}

	public BigDecimal getEmpId() {
        return empId;
    }

    public void setEmpId(BigDecimal empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName == null ? null : empName.trim();
    }

    public BigDecimal getAge() {
        return age;
    }

    public void setAge(BigDecimal age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }
    
	public Date getWorkdate() {
    	// System.out.println(workdate); //从数据库获取到的 Date 型数据格式为  Sat Oct 07 00:00:00 CST 2017
    	return workdate; 
    }

    public void setWorkdate(Date workdate) {
    	
        this.workdate = workdate;
    }

    public BigDecimal getDeptid() {
        return deptid;
    }

    public void setDeptid(BigDecimal deptid) {
        this.deptid = deptid;
    }

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}
    
}