package com.bit2015.what.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@RequestMapping()
	public String index(){
		return "/admin/index";
	}
	
}
