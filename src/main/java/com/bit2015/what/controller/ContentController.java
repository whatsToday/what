package com.bit2015.what.controller;



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

@Controller
@RequestMapping
public class ContentController {
	
	@Autowired
	ContentService contentService;

	@RequestMapping("/contentview")
	public String contentView(Model model, HttpSession session, @RequestParam Long content_no) {
		contentService.getContent(model, content_no);
		contentService.getComments(model);
		return "content/contentView";
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
	  	public String delete(long comments_no, Long content_no){
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
	  
	  
	  @RequestMapping("/like")
	  @ResponseBody
	  public void like(@RequestParam Long member_no, @RequestParam Long content_no, Model model){
		  GoodContentVo goodContentVo = contentService.selectMno(member_no, content_no);
		  System.out.println("!!!");
		  if(goodContentVo == null){
			  System.out.println("!");
		  }  else{
			  System.out.println("!!");
		  }
	  }
	  

	  
	  @RequestMapping("/jjim")
	  public String jjim(HttpSession session, @RequestParam Long content_no){
		  contentService.saveItem(session, content_no);
		  return "redirect:/contentView?content_no="+content_no;
	  }

}
