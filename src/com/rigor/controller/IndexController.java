package com.rigor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dept")
public class IndexController {

	@RequestMapping("/abc")
	public String dashboard(){
		
		return "dashboard";
	}
	@RequestMapping("/form")
	public String DeptForm(){
		
		return "dept_form";
	}
	@RequestMapping("/u_form")
	public String UserForm(){
		
		return "UserManagement";
	}
}
