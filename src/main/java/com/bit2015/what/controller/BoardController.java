package com.bit2015.what.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@RequestMapping()
	public String index(){
		return "/board/index";
	}
	@RequestMapping("/addBoard")
	public String addBoard(){
		return "/board/addBoard";
	}

}
