package com.bit2015.what.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit2015.what.service.MyContentService;
import com.bit2015.what.vo.ContentVo;
import com.bit2015.what.vo.FollowVo;
import com.bit2015.what.vo.MemberVo;
import com.bit2015.what.vo.PlanCommentsVo;
import com.bit2015.what.vo.PlanImgVo;
import com.bit2015.what.vo.PlanVo;

@Controller
@RequestMapping("/mycontent")
public class MyContentController {
	@Autowired
	MyContentService myContentService;
	
	@RequestMapping()
	public String index(@RequestParam Long member_no, Model model, HttpSession session) {
		MemberVo authUserVo = (MemberVo)session.getAttribute("authUser");
		MemberVo memberVo = myContentService.getMemberVo(member_no);
		List<Object> list1 = myContentService.userPlan(member_no);
		List<Object> list2 = myContentService.following(member_no);
		List<Object> list3 = myContentService.follower(member_no);
		List<FollowVo> list4 = myContentService.selectFollow( member_no, authUserVo.getMember_no());
		List<PlanImgVo> list5 = myContentService.allPlanImg();
		List<PlanCommentsVo> list6 = myContentService.selectPlanCommentsAll();
		
		model.addAttribute("planComments", list6);
		model.addAttribute("planImgList", list5);
		model.addAttribute("planList", list1);
		model.addAttribute("followerList", list2);
		model.addAttribute("followingList", list3);
		model.addAttribute("selectFollow", list4);
		model.addAttribute("memberVo", memberVo);
		return "/mycontent/mycontent";
	}
	
	@RequestMapping("/unFollow")
	public String unFollow(@RequestParam Long following, @RequestParam Long follower, @RequestParam Long member_no){
		myContentService.unFollow(following, follower);
		return "redirect:/mycontent?member_no="+member_no;
	}
	@RequestMapping("/follow")
	public String follow(@RequestParam Long following, @RequestParam Long follower, @RequestParam Long member_no){
		myContentService.follow(following, follower);
		return "redirect:/mycontent?member_no="+member_no;
	}
	@RequestMapping("/allPlan")
	@ResponseBody
	public List<ContentVo> allPlanList(@RequestParam Long member_no){
		List<ContentVo> contentVo = myContentService.allPlan(member_no);
		return contentVo;
	}
	@RequestMapping("/getContent")
	@ResponseBody
	public ContentVo getContent(@RequestParam String id, @RequestParam Long member_no){
		ContentVo contentVo = myContentService.getContent(id, member_no);
		return contentVo;
	}
	@RequestMapping("/getContentPlan")
	@ResponseBody
	public PlanVo getContentPlan(@RequestParam String id, @RequestParam Long member_no){
		PlanVo plantVo = myContentService.getContentPlan(id, member_no);
		return plantVo;
	}
	@RequestMapping("/getPlanComments")
	@ResponseBody
	public List<PlanCommentsVo> getPlanComments(@RequestParam Long plan_no, Model model){
		List<PlanCommentsVo> list = myContentService.selectPlanComments(plan_no);
		model.addAttribute("planComments", list);
		return list;
	}
	@RequestMapping("/insertComments")
	public String planCommentsInsert(@RequestParam Long plan_no, HttpSession session, @RequestParam String message,@RequestParam Long member_no){
		MemberVo memberVo = (MemberVo)session.getAttribute("authUser");
		myContentService.insertComments(memberVo.getMember_no(), plan_no, message);
		
		return "redirect:/mycontent?member_no="+member_no;
	}
	@RequestMapping("/deleteComments")
	public String planCommentsDelete(@RequestParam Long planComments_no,@RequestParam Long plan_no,@RequestParam Long member_no){
		myContentService.deleteComments(planComments_no);
		return "redirect:/mycontent?member_no="+member_no;
	}
}
