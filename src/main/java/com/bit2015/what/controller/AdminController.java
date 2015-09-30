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
	public String delete(@RequestParam Long memeber_no) {
		adminService.deleteMember(memeber_no);
		return "redirect:/admin/member";
	}
}
