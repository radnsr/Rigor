package com.rigor.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import com.rigor.model.Department;
import com.rigor.service.DeptService;

@RestController
public class DeptController {
	@Autowired
	DeptService deptService;
	
	 @RequestMapping(value = "/dept_post/", method = RequestMethod.POST)
	    public ResponseEntity<Void> createDept(@RequestBody Department dept,    UriComponentsBuilder ucBuilder) {
	        System.out.println("Creating Deaprtment " + dept.getDept_name());
	 
	      
	        deptService.saveDept(dept);
	 
	        HttpHeaders headers = new HttpHeaders();
	        headers.setLocation(ucBuilder.path("/user1/{id}").buildAndExpand(dept.getDept_id()).toUri());
	        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	    }
}
