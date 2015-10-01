package com.bit2015.what.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bit2015.what.dao.FollowDao;
import com.bit2015.what.service.AdminService;
import com.bit2015.what.vo.CommentsVo;
import com.bit2015.what.vo.ContentVo;
import com.bit2015.what.vo.FollowVo;
import com.bit2015.what.vo.MemberVo;
import com.bit2015.what.vo.PlanVo;
import com.bit2015.what.vo.ThemeBoxVo;
import com.bit2015.what.vo.ThemeVo;
import com.sun.java.swing.plaf.motif.resources.motif;

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
		model.addAttribute("memberList", memberList);
		model.addAttribute("planList", planList);
		return "/admin/plan";
	}

	// plan 등록
	@RequestMapping("/insertplan")
	public String insertPlan(PlanVo planVo,
			@RequestParam(required = false) MultipartFile img) {

		adminService.insertPlan(planVo, img);

		return "redirect:/admin/plan";
	}

	// plan 삭제
	@RequestMapping("/deleteplan")
	public String deletePlan(@RequestParam Long plan_no) {
		adminService.deletePlan(plan_no);
		return "redirect:/admin/plan";

	}

	@RequestMapping("/getMemberName")
	@ResponseBody
	public MemberVo getMemberName(@RequestParam Long member_no) {
		MemberVo memberVo = adminService.getMemberName(member_no);
		return memberVo;

	}

	@RequestMapping("/theme")
	public String themeList(Model model) {
		List<ThemeVo> themeList = adminService.selectTheme();
		model.addAttribute("themeList", themeList);
		return "/admin/theme";
	}

	@RequestMapping("/inserttheme")
	public String insertTheme(ThemeVo themeVo,
			@RequestParam(required = false) MultipartFile img) {
		adminService.insertTheme(themeVo, img);
		return "redirect:/admin/theme";
	}

	@RequestMapping("/deletetheme")
	public String deleteTheme(@RequestParam Long theme_no) {
		adminService.deleteTheme(theme_no);
		return "redirect:/admin/theme";
	}

	@RequestMapping("/themebox")
	public String themeBoxList(Model model) {
		List<MemberVo> memberList = adminService.selectMember();
		List<ThemeVo> themeList = adminService.selectTheme();
		List<ThemeBoxVo> themeBoxList = adminService.selectThemeBox();
		model.addAttribute("memberList", memberList);
		model.addAttribute("themeList", themeList);
		model.addAttribute("themeBoxList", themeBoxList);
		return "/admin/themebox";
	}

	@RequestMapping("insertthemebox")
	public String insertThemeBox(ThemeBoxVo themeBoxVo) {
		adminService.insertThemeBox(themeBoxVo);
		return "redirect:/admin/themebox";
	}

	@RequestMapping("deletethemebox")
	public String deleteThemeBox(@RequestParam Long themeBox_no) {
		adminService.deleteThemeBox(themeBox_no);
		return "redirect:/admin/themebox";
	}

	@RequestMapping("/content")
	public String contentList(Model model) {
		List<ContentVo> contentList = adminService.selectContent();
		model.addAttribute("contentList", contentList);
		return "/admin/content";
	}

	@RequestMapping("/insertcontent")
	public String insertContent(ContentVo contentVo,@RequestParam(required = false) MultipartFile img ) {
		adminService.insertContent(contentVo, img);;
		return "redirect:/admin/content";
	}

	@RequestMapping("/deletecontent")
	public String deleteContent(@RequestParam Long content_no) {
		adminService.deleteContent(content_no);
		return "redirect:/admin/content";
	}

	@RequestMapping("/comments")
	public String commentsList(Model model) {
		List<MemberVo> memberList = adminService.selectMember();
		List<ContentVo> contentList= adminService.selectContent();
 		List<CommentsVo> commentsList = adminService.selectComments();
		
 		model.addAttribute("memberList",memberList);
 		model.addAttribute("contentList",contentList);
 		model.addAttribute("commentsList", commentsList);
		
		return "/admin/comments";
	}

	@RequestMapping("/insertcomments")
	public String insertCommentsString(CommentsVo commentsVo) {
		adminService.insertComments(commentsVo);
		return "redirect:/admin/comments";
	}

	@RequestMapping("/deletecomments")
	public String deleteComments(@RequestParam Long comments_no) {
		adminService.deleteComments(comments_no);
		return "redirect:/admin/comments";
	}
	@RequestMapping("/follow")
	public String followList(Model model){
		List<MemberVo> memberList = adminService.selectMember();
		List<FollowVo> followList = adminService.selectFollow();
		
		model.addAttribute("memberList",memberList);
		model.addAttribute("followList",followList);
		return "/admin/follow";
	}
    @RequestMapping("/insertfollow")
    public String insertFollow(FollowVo followVo){
    	adminService.insertFollow(followVo);
    	return "redirect:/admin/follow";
    }
    @RequestMapping("/deletefollow")
    public String deleteFollow(@RequestParam Long follow_no){
    	adminService.deleteFollow(follow_no);
    	return "redirect:/admin/follow";
    }
}
