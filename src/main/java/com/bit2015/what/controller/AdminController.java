package com.bit2015.what.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bit2015.what.service.AdminService;
import com.bit2015.what.vo.MemberVo;
import com.bit2015.what.vo.PlanVo;
import com.bit2015.what.vo.ThemeVo;

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
	public String insertMember(MemberVo memberVo,
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
	public String insertPlan(PlanVo planVo,@RequestParam(required = false) MultipartFile img) {
		
		adminService.insertPlan(planVo, img);
		
		return "redirect:/admin/plan";
	}
	// plan 삭제 
	@RequestMapping("/deleteplan")
	public String deletePlan(@RequestParam Long plan_no){
		adminService.deletePlan(plan_no);
		return "redirect:/admin/plan";

	}
	@RequestMapping("/getMemberName")
	@ResponseBody
	public MemberVo getMemberName(@RequestParam Long member_no){
		MemberVo memberVo= adminService.getMemberName(member_no);
		return memberVo;

	}
	@RequestMapping("theme")
	public String themeList(Model model){
		List<ThemeVo> themeList = adminService.selectTheme();
		model.addAttribute("themeList",themeList);
		return "/admin/theme";
	}
	@RequestMapping("inserttheme")
	public String insertTheme(ThemeVo themeVo,@RequestParam(required = false) MultipartFile img){
		adminService.insertTheme(themeVo,img);
		return "redirect:/admin/theme";
	}
	@RequestMapping("deletetheme")
	public String deleteTheme(@RequestParam Long theme_no){
		adminService.deleteTheme(theme_no);
		return "redirect:/admin/theme";
	}
	
}
