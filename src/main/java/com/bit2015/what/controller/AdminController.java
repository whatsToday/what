package com.bit2015.what.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bit2015.what.service.AdminService;
import com.bit2015.what.vo.MemberVo;
import com.bit2015.what.vo.PlanVo;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	AdminService adminService;

	@RequestMapping()
	public String index() {
		return "/admin/index";
	}

	// member조회
	@RequestMapping("/member")
	public String memberList(Model model) {
		List<MemberVo> memberList = adminService.selectMember();
		model.addAttribute("memberList", memberList);
		return "/admin/member";
	}

	// member등록
	@RequestMapping("/insertmember")
	public String insert(MemberVo memberVo,
			@RequestParam(required = false) MultipartFile img) {
		adminService.insertMember(memberVo, img);
		return "redirect:/admin/member";
	}

	// member 삭제
	@RequestMapping("/deletemember")
	public String deleteMember(@RequestParam Long member_no) {
		adminService.deleteMember(member_no);
		return "redirect:/admin/member";
	}

	// plan 조회

	@RequestMapping("/plan")
	public String planList(Model model) {
		List<MemberVo> memberList = adminService.selectMember();
		List<PlanVo> planList = adminService.selectPlan();
		model.addAttribute("memberList",memberList);
		model.addAttribute("planList", planList);
		return "/admin/plan";
	}
    // plan 등록
	@RequestMapping("/insertplan")
	public String insertplan(PlanVo planVo,@RequestParam(required = false) MultipartFile img) {
		
		
		/*List<MemberVo> memberList = adminService.selectMember();*/
		/*System.out.println("두번째"+memberList);
		model.addAttribute("memberList", memberList);*/
		adminService.insertPlan(planVo, img);
		
		return "redirect:/admin/plan";
	}
	// plan 삭제 
	@RequestMapping("/deleteplan")
	public String deletePlan(@RequestParam Long plan_no){
		adminService.deletePlan(plan_no);
		return "redirect:/admin/plan";

	}
}
