package com.bit2015.what.controller;


import java.util.ArrayList;
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
		List<PlanVo> list = myContentService.userPlan(member_no);
		List<PlanVo> list1 = new ArrayList<PlanVo>();
		for(int i=0; i<list.size(); i++){
			PlanVo planVo = list.get(i);
			if(planVo.getMessage() != null){
				list1.add(planVo);
			}
		}
		List<Object> list2 = myContentService.following(member_no);
		List<Object> list3 = myContentService.follower(member_no);
		List<FollowVo> list4 =myContentService.selectFollow( member_no, authUserVo.getMember_no());
		System.out.println(list2);
		System.out.println(list3);
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
}
