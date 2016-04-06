package com.rigor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/index")
public class IndexController {

	@RequestMapping("/dashboard")
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
	@RequestMapping("/user")
	public String User(){
		
		return "user";
	}
}
