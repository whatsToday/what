package com.bit2015.what.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit2015.what.service.ContentService;
import com.bit2015.what.vo.ContentVo;

@Controller
@RequestMapping
public class ContentController {
	
	@Autowired
	ContentService contentService;

	@RequestMapping("/contentview")
	public String contentView(Model model, HttpSession session, @RequestParam Long content_no) {
		contentService.getContent(model, content_no);
		contentService.getComments(model, content_no);
		return "content/contentView";
	}
		
//		위도,경도값 Ajax로 가져오기
	  @RequestMapping("/getContent")
	  @ResponseBody
	  public Object getContent(Model model, @RequestParam Long content_no){
		  ContentVo vo = contentService.getContent(model, content_no);
		  return vo;	  
	  }

}
