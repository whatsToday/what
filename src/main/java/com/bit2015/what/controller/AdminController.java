package com.bit2015.what.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit2015.what.service.AdminService;
import com.bit2015.what.vo.MemberVo;



@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@RequestMapping()
	public String index(){
		return "/admin/index";
	}
	
	@RequestMapping("/member")
	public String memberList(Model model){
	  List<MemberVo> memberList = adminService.selectMember();
	  model.addAttribute("memberList",memberList);
		return "/admin/member";
	}
	
}
