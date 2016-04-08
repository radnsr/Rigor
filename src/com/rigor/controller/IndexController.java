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
	@RequestMapping("/dept")
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
	@RequestMapping("/master_dept")
	public String MasterDept(){
		
		return "master_dept";
	}
	@RequestMapping("/dataTab")
	public String MasterDept2(){
		
		return "dataTab";
	}
}
