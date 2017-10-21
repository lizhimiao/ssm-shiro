package com.ssm.crud.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ssm.bean.Department;
import com.ssm.crud.message.Msg;
import com.ssm.crud.service.DepartmentsService;

//@Controller
public class DepartmentsController1 {
	
	//@Autowired
	DepartmentsService departmentsService;
	
	@ResponseBody
	@RequestMapping("/depts")
	public Msg getDepts(){
		
		List<Department> depts =  departmentsService.getDepts();
		return Msg.success().add("depts", depts);
	}
}
