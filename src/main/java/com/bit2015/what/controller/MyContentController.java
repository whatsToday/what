package com.bit2015.what.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class MyContentController {

	@RequestMapping("/mycontent")
	public String index() {
		return "/mycontent/mycontent";
	}
}
