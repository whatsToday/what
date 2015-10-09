package com.bit2015.what.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit2015.what.service.MainService;
import com.bit2015.what.vo.ContentVo;
import com.bit2015.what.vo.MemberVo;
import com.bit2015.what.vo.PlanVo;
import com.bit2015.what.vo.ThemeBoxVo;
import com.bit2015.what.vo.ThemeVo;

@Controller
@RequestMapping
public class MainController {

	@Autowired
	MainService mainService;

	@RequestMapping
	public String index(Model model, HttpSession session) {
		if(session.getAttribute("authUser") != null){
//			System.out.println("session이 있습니다.");

		//authUser의 기존 관심사 가져오는중
		mainService.memberTheme(model, session);

		//선택창에 띄울 테마들 다 가져오는중
		mainService.callTheme(model);
		//themeBox 뒤지는 중
		mainService.checkThemeBox(model,session);
		
		return "/main/index";
		
		}else{
//			System.out.println("session이 없습니다. 회원가입 페이지로 이동합니다");
			
		return "/main/join";
		}
	}

	@RequestMapping("/getnear")
	@ResponseBody
	public Map<String, Object> getNear(@RequestParam Double lat,
			@RequestParam Double lng,
			@RequestParam(required = false, defaultValue = "5") Double distance) {

		List<ContentVo> contentList = mainService.getNear(lat, lng, distance);

		// ajax-jason
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("contentList", contentList);

		return map;
	}

	@RequestMapping("/getInfo")
	@ResponseBody
	public Map<String, Object> callPlanList(HttpSession session, @RequestParam String id) {
		Map<String, Object> map = new HashMap<String, Object>();

		// ajax-jason
		mainService.getInfo(session, map, id);

		return map;
	}
	
	@RequestMapping("/getMyPlan")
	@ResponseBody
	public Map<String, Object> getMyPlan(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();

		List<PlanVo> MyPlanList = mainService.getMyPlan(session);
		
		map.put("MyPlanList", MyPlanList);

		return map;
	}

	@RequestMapping("/insertPlan")
	@ResponseBody
	public Map<String, Object> insertPlan(ContentVo contentVo,@RequestParam(required=false) Long plan_no, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		long plan_no2 = mainService.insertPlan(contentVo, plan_no, session);
		
		map.put("plan_no", plan_no2);
		return map;
	}
	
	@RequestMapping("/callContents")
	@ResponseBody
	public Map<String, Object> callContents(Model model, @RequestParam Long plan_no, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<ContentVo> contentList =mainService.callContents(model, plan_no, session);
		
		map.put("contentList", contentList);
		
		return map;
	}
	
	@RequestMapping("/insertThemeBox")
	public String insertThemeBox(@RequestParam Long[] param,HttpSession session) {
		
		mainService.insertThemeBox(param, session);
		
		return "redirect:/";
	}
	
	@RequestMapping("/placesNear")
	@ResponseBody
	public Map<String, Object> placesNear(@RequestParam String[] themeName, @RequestParam Double lat, @RequestParam Double lng, @RequestParam(required=false, defaultValue="5") Double distance) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		mainService.placesNear(map, themeName, lat, lng, distance);
		
		return map;
	}
	@RequestMapping("/insertKey")
	@ResponseBody
	public Map<String, Object> insertKey(HttpSession session,@RequestParam String keyword,  @RequestParam Double lat, @RequestParam Double lng, @RequestParam(required=false, defaultValue="5") Double distance) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		mainService.insertKey(map,session, keyword, lat, lng, distance);
		
		return map;
	}
	
	@RequestMapping("/showHotKey")
	@ResponseBody
	public Map<String, Object> showHotKey(@RequestParam Double lat, @RequestParam Double lng, @RequestParam(required=false, defaultValue="10") Double distance) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		mainService.showHotKey(map, lat, lng, distance);
		
		return map;
	}
	
	@RequestMapping("/markerColor")
	@ResponseBody
	public Map<String, Object> markerColor(HttpSession session ,@RequestParam String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		mainService.markerColor(map, session, id);
		
		return map;
	}
	@RequestMapping("/insertContent")
	@ResponseBody
	public Map<String, Object> insertContent(ContentVo contentVo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		mainService.insertContent(map, contentVo);
		
		return map;
	}
	@RequestMapping("/textSearch")
	@ResponseBody
	public Map<String, Object> textSearch(@RequestParam String text) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		mainService.textSearch(map, text);
		
		
		return map;
	}
	
	@RequestMapping("/createPlan")
	@ResponseBody
	public void createPlan(HttpSession session) {
		
		mainService.createPlan(session);
		
		
	}
	
}
