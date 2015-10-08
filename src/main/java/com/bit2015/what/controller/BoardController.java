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
import org.springframework.web.multipart.MultipartFile;

import com.bit2015.what.service.BoardService;
import com.bit2015.what.vo.ContentVo;
import com.bit2015.what.vo.MemberVo;
import com.bit2015.what.vo.PlanCommentsVo;
import com.bit2015.what.vo.PlanImgVo;
import com.bit2015.what.vo.PlanReplyVo;
import com.bit2015.what.vo.PlanVo;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping()
	public String index(@RequestParam Long plan_no, Model model){
		PlanVo planVo = boardService.getPlanVo(plan_no);
		List<PlanImgVo> list = boardService.selectPlan(plan_no);
		List<PlanCommentsVo> list1 = boardService.selectPlanComments(plan_no);
		List<PlanReplyVo> list2 = boardService.selectAllReply();
		int countGood = boardService.selectGoodPlan(plan_no);
		model.addAttribute("planBoard", planVo);
		model.addAttribute("planImg", list);
		model.addAttribute("planComments", list1);
		model.addAttribute("planReply", list2);
		model.addAttribute("countGood",countGood);
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
	public String updatePlan(@RequestParam String planName, @RequestParam String msg, @RequestParam Long plan_no, HttpSession session, MultipartFile titleImage, MultipartFile img1, MultipartFile img2,MultipartFile img3,MultipartFile img4,MultipartFile img5,MultipartFile img6,MultipartFile img7,MultipartFile img8,MultipartFile img9, MultipartFile img10){
		List<MultipartFile> fileList = new ArrayList<MultipartFile>();
		System.out.println(img1);
		if(img1 !=null){
			fileList.add(img1);
		}
		if(img2 !=null){
			fileList.add(img2);
		}
		if(img3 !=null){
			fileList.add(img3);
		}
		if(img4 !=null){
			fileList.add(img4);
		}
		if(img5 !=null){
			fileList.add(img5);
		}
		if(img6 !=null){
			fileList.add(img6);
		}
		if(img7 !=null){
			fileList.add(img7);
		}
		if(img8 !=null){
			fileList.add(img8);
		}
		if(img9 !=null){
			fileList.add(img9);
		}
		if(img10 !=null){
			fileList.add(img10);
		}
		System.out.println(fileList.size());
		MemberVo memberVo = (MemberVo)session.getAttribute("authUser");
		Long member_no = memberVo.getMember_no();
		boardService.insertImage(plan_no, fileList);
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
	@RequestMapping("/goodPlan")
	@ResponseBody
	public int goodPlan(@RequestParam Long plan_no, @RequestParam Long member_no){
		int countGood = boardService.goodPlan(plan_no, member_no);
		return countGood;
		
	}
	@RequestMapping("/insertComments")
	public String planCommentsInsert(@RequestParam Long plan_no, HttpSession session, @RequestParam String message){
		MemberVo memberVo = (MemberVo)session.getAttribute("authUser");
		boardService.insertComments(memberVo.getMember_no(), plan_no, message);
		
		return "redirect:/board?plan_no="+plan_no;
	}
	@RequestMapping("/deleteComments")
	public String planCommentsDelete(@RequestParam Long planComments_no,@RequestParam Long plan_no){
		boardService.deleteComments(planComments_no);
		return "redirect:/board?plan_no="+plan_no;
	}
	@RequestMapping("/insertReply")
	public String replyInsert(@RequestParam Long planComments_no, HttpSession session, @RequestParam String message, @RequestParam Long plan_no){
		MemberVo memberVo = (MemberVo)session.getAttribute("authUser");
		boardService.insertPlanReply(memberVo.getMember_no(), planComments_no, message);
		
		return "redirect:/board?plan_no="+plan_no;
	}
}
