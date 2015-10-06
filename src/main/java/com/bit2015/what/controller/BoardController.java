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
import com.bit2015.what.vo.ContentVo;
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
	public List<ContentVo> getPlan(@RequestParam Long plan_no){
		List<ContentVo> contentVo =  boardService.getPlan(plan_no);
		return contentVo;
	}
	@RequestMapping("/addPlan")
	public String updatePlan(@RequestParam String planName, @RequestParam String msg, @RequestParam Long plan_no, HttpSession session, MultipartFile titleImage){
		System.out.println("!");
		MemberVo memberVo = (MemberVo)session.getAttribute("authUser");
		Long member_no = memberVo.getMember_no();
		boardService.updatePlan(planName, msg, plan_no, titleImage);
		return "redirect:/mycontent?member_no="+member_no;
	}
	@RequestMapping("/deletePlan")
	public String deletePlan(@RequestParam Long plan_no,@RequestParam Long member_no){
		String planName = "";
		String message = "";
		String titleImage ="";
		boardService.deletePlan(planName, message, plan_no, titleImage);
		return "redirect:/mycontent?member_no="+member_no;
	}
	@RequestMapping("/deleteContent")
	@ResponseBody
	public List<ContentVo> deleteContent(@RequestParam Long plan_no,@RequestParam Long content_no){
		boardService.deleteContent(content_no, plan_no);
		List<ContentVo> contentVo =  boardService.getPlan(plan_no);
		return contentVo;
	}
	@RequestMapping("/getContentVo")
	@ResponseBody
	public ContentVo getContentVo(@RequestParam Long content_no){
		ContentVo contentVo =  boardService.getContentVo(content_no);
		return contentVo;
	}
}
