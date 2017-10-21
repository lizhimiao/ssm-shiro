package com.ssm.crud.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.ssm.bean.Department;
import com.ssm.crud.service.DepartmentsService;

@Controller
public class DepartmentsController {
	
	@Autowired
	DepartmentsService departmentsService;
	
	
	/**
	 * 部门查询
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/depts")
	public	ModelAndView getDepts(){
		List<Department> depts =  departmentsService.getDepts();
		return new ModelAndView("depts","depts",depts);
	}
	
}
