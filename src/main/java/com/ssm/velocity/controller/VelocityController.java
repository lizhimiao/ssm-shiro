package com.ssm.velocity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/velocity")
public class VelocityController {

	@RequestMapping("/login")
	public String loginVelocity(){
		return "login";
	}
	
	
	@RequestMapping("/list")
	public ModelAndView listVelocity(){
		return new ModelAndView("list");
	}
	
}
