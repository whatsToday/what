package com.bit2015.what.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class MainController {

	
	@RequestMapping()
	public String index(){
		System.out.println("test 성공!");
		
		return "/main/index";
	}	

}
