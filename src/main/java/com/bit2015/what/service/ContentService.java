package com.bit2015.what.service;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit2015.what.dao.CommentsDao;
import com.bit2015.what.dao.ContentDao;
import com.bit2015.what.dao.GoodContentDao;
import com.bit2015.what.dao.MemberDao;
import com.bit2015.what.vo.CommentsVo;
import com.bit2015.what.vo.ContentVo;
import com.bit2015.what.vo.GoodContentVo;
import com.bit2015.what.vo.MemberVo;

@Service
public class ContentService {
	
	@Autowired
	ContentDao contentDao;
	@Autowired
	CommentsDao commentsDao;
	@Autowired
	GoodContentDao goodContentDao;
	@Autowired
	MemberDao memberDao;
	
	
	public ContentVo getContent(Model model, Long content_no){
		ContentVo vo = contentDao.selectVo(content_no);
		model.addAttribute("contentVo", vo);
		return vo;
	}
	
	public CommentsVo getComments(Model model){
		List<CommentsVo> commentsList = commentsDao.selectAll();
		model.addAttribute("commentsList", commentsList);
		return null;
	}
	
	public void selectCntNo(Model model, Long content_no) {
		List<GoodContentVo> list = goodContentDao.selectAllByCno(content_no);
		model.addAttribute("goodContent", list.size());
		return;
	}	
	
	public List<GoodContentVo> selectCntNo(Long content_no){
		List<GoodContentVo> list = goodContentDao.selectAllByCno(content_no);
		return list;
	}
	
	public void  insert (CommentsVo commentsVo){
		commentsDao.insert(commentsVo);
	}

	public void delete(long comments_no) {
		commentsDao.delete(comments_no);
		
	}	
	
	public GoodContentVo selectMno(Long member_no, Long content_no){
		GoodContentVo goodContentVo = goodContentDao.selectVoCnoMno(content_no, member_no);
		return goodContentVo;
	}
	
	public void insertGood(HttpSession session, Long content_no, Long member_no){
		GoodContentVo goodContentVo = new GoodContentVo();
		MemberVo memberVo = (MemberVo) session.getAttribute("authUser");
		goodContentVo.setMemberName(memberVo.getMemberName());
		goodContentVo.setContent_no(content_no);
		goodContentVo.setMember_no(member_no);
		goodContentDao.insert(goodContentVo);
	}
	
	
	public void saveItem(HttpSession session, Long content_no) {
		MemberVo memberVo =(MemberVo) session.getAttribute("authUser");
		
/*		//plan 만듬
		PlanVo tempVo = new PlanVo();
		 tempVo.setMember_no(memberVo.getMember_no());
		mainDao.inserttoday(tempVo);
		
		//제일 최신것 갖고옴
		List<PlanVo> planList =planDao.getUserPlan(memberVo.getMember_no());
		PlanVo planVo =planList.get(planList.size()-1);
		
		//insertContentBox
		ContentBoxVo contentBoxVo = new ContentBoxVo();
		contentBoxVo.setPlan_no(planVo.getPlan_no());
		contentBoxVo.setContent_no(content_no);
		contentBoxDao.insert(contentBoxVo);*/
	}

	public void facebookJoin(MemberVo memberVo, String email, String memberName) {
		if(memberDao.checkEmail(email)!=null){
			System.out.println("아이디 있음 아이디:"+email);
		}else{
			memberDao.facebookJoin(email, memberName);	
		}
	}

	public void facebookLogin(HttpSession session, String email) {
		MemberVo vo = memberDao.checkEmail(email);
		session.setAttribute("authUser", vo);
	}
	
	
	
}
