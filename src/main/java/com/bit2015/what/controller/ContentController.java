package com.bit2015.what.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit2015.what.service.ContentService;
import com.bit2015.what.vo.CommentsVo;
import com.bit2015.what.vo.ContentVo;
import com.bit2015.what.vo.GoodContentVo;
import com.bit2015.what.vo.MemberVo;

@Controller
@RequestMapping
public class ContentController {
	
	@Autowired
	ContentService contentService;

	@RequestMapping("/contentview")
	public String contentView(Model model, HttpSession session, @RequestParam Long content_no) {
		contentService.getContent(model, content_no);
		contentService.getComments(model);
		contentService.selectCntNo(model, content_no);
		contentService.selectVoByCno(model, content_no);
		return "/content/contentView";
	}
	
	 @RequestMapping("/commentwrite")
		public String insert(CommentsVo commentsVo,HttpSession session, Long content_no){
		 if(session.getAttribute("authUser")!=null){
		  contentService.insert(commentsVo);
		 }
		 return "redirect:/contentview?content_no="+content_no;
//		  return "redirect:/contentview?content_no="+commentsVo.getComments_no()+1;
	}	
	 
	 @RequestMapping("/commentdelete")
	  	public String delete(long comments_no,@RequestParam Long content_no){
		 contentService.delete(comments_no);
		 return "redirect:/contentView?content_no="+content_no;
	  }
	  
		
//		위도,경도값 Ajax로 가져오기
	  @RequestMapping("/getContent")
	  @ResponseBody
	  public Object getContent(Model model, @RequestParam Long content_no){
		  ContentVo vo = contentService.getContent(model, content_no);
		  return vo;	  
	  }
	  
//		좋아요
	  @RequestMapping("/like")
	  @ResponseBody
	  public void like(HttpSession session, @RequestParam Long member_no, @RequestParam Long content_no, Model model){
		  GoodContentVo goodVo = contentService.selectMno(member_no, content_no);
		  if(goodVo == null){
			  System.out.println("!");
			  contentService.insertGood(session, content_no, member_no);
			  List<GoodContentVo> list = contentService.selectCntNo(content_no);
			  model.addAttribute("good", list.size());
		  }
	  }
	  
//		찜하기 (미구현)
	  @RequestMapping("/jjim")
	  public String jjim(HttpSession session, @RequestParam Long content_no){
		  contentService.savePlan(session, content_no);
		  return "redirect:/contentView?content_no="+content_no;
	  }
	  
	  @RequestMapping("/test")
	  public String test(){
		  return "/content/test";
	  }	  

	  @RequestMapping("/test2")
	  public String test2(){
		  return "/content/test2";
	  }	  
	  
	  @RequestMapping("/facebook")
	  public String facebook(HttpSession session,MemberVo memberVo ,@RequestParam String email, @RequestParam String memberName, @RequestParam String imageUrl ){
		  contentService.facebookJoin(memberVo, email, memberName, imageUrl);
		  contentService.facebookLogin(session, email);
		  return "/main/index";
		  
	  }
}
