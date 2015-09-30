package com.bit2015.what.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit2015.what.dao.CommentsDao;
import com.bit2015.what.dao.ContentDao;
import com.bit2015.what.vo.CommentsVo;
import com.bit2015.what.vo.ContentVo;

@Service
public class ContentService {
	
	@Autowired
	ContentDao contentDao;
	@Autowired
	CommentsDao commentsDao;
	
	
	public ContentVo getContent(Model model, Long content_no){
		ContentVo vo = contentDao.selectVo(content_no);
		model.addAttribute("contentVo", vo);
		System.out.println(vo);
		return vo;
	}
	
	public CommentsVo getComments(Model model, Long content_no){
		CommentsVo vo = commentsDao.selectVo(content_no);
		model.addAttribute("commentsVo", vo);
		return vo;
	}	
}
