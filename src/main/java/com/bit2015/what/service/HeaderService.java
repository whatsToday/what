package com.bit2015.what.service;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit2015.what.dao.MemberDao;
import com.bit2015.what.vo.MemberVo;

@Service
public class HeaderService {

	@Autowired
	MemberDao memberDao;
	
	public void join(HttpSession session, MemberVo memberVo) {
		memberVo.setMemberGrade("Guest");
		memberVo.setImageUrl("/assets/img/no_img.jpg");
		memberDao.insert(memberVo);
		String email = memberVo.getEmail();
		MemberVo memberVo2 =memberDao.checkEmail(email);
		session.setAttribute("authUser", memberVo2);
	}
	
public boolean login(HttpSession session, MemberVo vo) {
		if(memberDao.checkMember(vo)!=null){
			MemberVo memberVo = memberDao.checkMember(vo);
			session.setAttribute("authUser", memberVo);
			return true;
		}else{
			System.out.println("회원이 없는데요?");
			return false;
		}
	}

public MemberVo gradeCheck(HttpSession session, MemberVo memberVo) {
	MemberVo memberVo2 = memberDao.checkMember(memberVo);
	return memberVo2;
}

public MemberVo selectEmail(String email) {
	MemberVo vo = memberDao.checkEmail(email);
	return vo;
}

}
