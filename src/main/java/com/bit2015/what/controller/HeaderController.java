package com.bit2015.what.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
//		headerService.login(session, memberVo);
		boolean Bo = headerService.login(session, memberVo);
		MemberVo memberVo2 = headerService.gradeCheck(session, memberVo);
		if(Bo){
				if(memberVo2.getMemberGrade().equals("Admin")){
					return "redirect:/admin/member"; 
				}else{
					return "redirect:/";
				}
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
	
	@RequestMapping("/checkId")
	@ResponseBody
	public Map checkId(@RequestParam String email){
		MemberVo vo = headerService.selectEmail(email);
		Map<String, String> map = new HashMap<String, String>();
		if(vo == null){
			map.put("exist", "no exist");
			return map;
		}else{
			map.put("exist" , "exist");
			return map;
		}
	}
}
