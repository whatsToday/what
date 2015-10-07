package com.bit2015.what.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit2015.what.service.HeaderService;
import com.bit2015.what.vo.MemberVo;

@Controller
@RequestMapping
public class HeaderController {

	@Autowired
	HeaderService headerService;
	
	
	@RequestMapping("/join")
	public String join(HttpSession session, MemberVo memberVo) {
		headerService.join(session, memberVo);
		return "redirect:/";
	}
	
	@RequestMapping("/login")
	public String login(HttpSession session, MemberVo memberVo) {
		System.out.println(memberVo.toString());
		headerService.login(session, memberVo);
		boolean Bo = headerService.login(session, memberVo);
		System.out.println(memberVo.getEmail());
		if(memberVo.getEmail().equals("admin")){
			return "redirect:/admin/index";
		}
		else if(Bo){
//			System.out.println("로그인 되었습니다.");
			return "redirect:/";
		}else{
//			System.out.println("등록된 회원이 없습니다.");
			return "redirect:/?a=error";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session, @ModelAttribute MemberVo memberVo){
		session.removeAttribute( "authUser" );
		session.invalidate();
		return "redirect:/";
	}
}
