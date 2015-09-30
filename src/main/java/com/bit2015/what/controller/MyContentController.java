package com.bit2015.what.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit2015.what.service.MyContentService;
import com.bit2015.what.vo.MemberVo;
import com.bit2015.what.vo.PlanVo;

@Controller
@RequestMapping
public class MyContentController {
	@Autowired
	MyContentService myContentService;
	
	@RequestMapping("/mycontent")
	public String index(HttpSession session, Model model) {
		MemberVo memberVo = (MemberVo)session.getAttribute("authUser");
		List<PlanVo> list = myContentService.userPlan(memberVo.getMember_no());
		model.addAttribute("planList", list);
		
		return "/mycontent/mycontent";
	}
}
