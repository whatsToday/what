package com.bit2015.what.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bit2015.what.service.BoardService;
import com.bit2015.what.vo.MemberVo;
import com.bit2015.what.vo.PlanVo;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping()
	public String index(@RequestParam Long plan_no, Model model){
		PlanVo planVo = boardService.getPlanVo(plan_no);
		model.addAttribute("planBoard", planVo);
		return "/board/index";
	}
	@RequestMapping("/addBoard")
	public String addBoard(HttpSession session, Model model){
		MemberVo memberVo = (MemberVo)session.getAttribute("authUser");
		List<PlanVo> list = boardService.userPlan(memberVo.getMember_no());
		model.addAttribute("planList", list);
		
		return "/board/addBoard";
	}
	@RequestMapping("/getPlan")
	@ResponseBody
	public Object[] getPlan(@RequestParam Long plan_no){
		Object[] contentVo =  boardService.getPlan(plan_no);
		return contentVo;
	}
	@RequestMapping("/addPlan")
	@ResponseBody
	public Long updatePlan(@RequestParam String title, @RequestParam String message, @RequestParam Long plan_no,HttpSession session){
		MemberVo memberVo = (MemberVo)session.getAttribute("authUser");
		Long member_no = memberVo.getMember_no();
		boardService.updatePlan(title, message, plan_no);
		return member_no;
	}
}
