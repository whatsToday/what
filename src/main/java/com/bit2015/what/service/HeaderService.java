package com.bit2015.what.service;

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
		memberDao.insert(memberVo);
		String email = memberVo.getEmail();
		MemberVo memberVo2 =memberDao.checkEmail(email);
		session.setAttribute("authUser", memberVo2);
		System.out.println(memberVo2);
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

}
