package com.bit2015.what.service;

import java.util.ArrayList;
import java.util.List;







import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit2015.what.dao.ContentBoxDao;
import com.bit2015.what.dao.ContentDao;
import com.bit2015.what.dao.MemberDao;
import com.bit2015.what.dao.PlanDao;
import com.bit2015.what.dao.ThemeBoxDao;
import com.bit2015.what.dao.ThemeDao;
import com.bit2015.what.util.FileUploader;
import com.bit2015.what.vo.ContentBoxVo;
import com.bit2015.what.vo.ContentVo;
import com.bit2015.what.vo.MemberVo;
import com.bit2015.what.vo.PlanVo;
import com.bit2015.what.vo.ThemeBoxVo;
import com.bit2015.what.vo.ThemeVo;


@Service
public class MainService {

	@Autowired
	ContentDao contentDao;
	@Autowired
	PlanDao planDao;
	@Autowired
	ContentBoxDao contentBoxDao;
	@Autowired
	ThemeDao themeDao;
	@Autowired
	ThemeBoxDao themeBoxDao;
	@Autowired
	MemberDao memberDao;
	
	FileUploader ful = new FileUploader();

	public void index() {
	}
	
	public void getTodayPlan(Model model, HttpSession session){
		MemberVo memberVo = (MemberVo) session.getAttribute("authUser");
		List<PlanVo> planList = planDao.selectTodayList(memberVo.getMember_no());
		PlanVo todayPlan = planList.get(0);
		
		model.addAttribute("todayPlan", todayPlan);
	}

	public List<ContentVo> getNear(Double lat, Double lng, Double distance) {
		List<ContentVo> contentList = contentDao.selectAllNear(lat, lng, distance);
		return contentList;
	}

	public List<PlanVo> getPlanListById(String id) {
		List<PlanVo> planList = new ArrayList<PlanVo>();
		ContentVo contentVo = contentDao.selectVoById(id);

		if (contentVo == null) {
			System.out.println("해당 id로 아무것도 검색되지 않았습니다.");
			return planList;
		} else {
			List<ContentBoxVo> contentBoxList = contentBoxDao
					.selectAllById(contentVo.getContent_no());
			for (int i = 0; i < contentBoxList.size(); i++) {
				planList.add(planDao.selectVo(contentBoxList.get(i)
						.getPlan_no()));
			}
			return planList;
		}
	}

	public void callTheme(Model model) {
		List<ThemeVo> themeList = themeDao.selectAll();
		model.addAttribute("themeList", themeList);
	}

	public void memberTheme(Model model, HttpSession session) {
		List<ThemeVo> memberTheme = new ArrayList<ThemeVo>();
		MemberVo memberVo = (MemberVo) session.getAttribute("authUser");
		List<ThemeBoxVo> themeBoxList = themeBoxDao.selectAllByMm(memberVo
				.getMember_no());

		for (int i = 0; i < themeBoxList.size(); i++) {
			ThemeVo themeVo = themeDao.selectVo(themeBoxList.get(i)
					.getTheme_no());
			String[] array = themeVo.getThemeName().split(">");
			themeVo.setThemeName(array[array.length - 1]);
			memberTheme.add(themeVo);
		}
		
		// model
		model.addAttribute("memberTheme", memberTheme);
	}

	public void getInfo(Map<String, Object> map, String id) {

		// 좋아요
		//goodContentDao
		
		// 댓글
		
		//planCommentsDao
		

		// 후기 수집
		List<PlanVo> planList = new ArrayList<PlanVo>();

		if (contentDao.selectVoById(id) == null) {
			System.out.println("해당 id로 아무것도 검색되지 않았습니다.");
		} else {
			ContentVo contentVo = contentDao.selectVoById(id);

			List<ContentBoxVo> contentBoxList = contentBoxDao
					.selectAllById(contentVo.getContent_no());
			for (int i = 0; i < contentBoxList.size(); i++) {
				planList.add(planDao.selectVo(contentBoxList.get(i)
						.getPlan_no()));
			}
		}

		map.put("planList", planList);
	}

	public void insertPlan(ContentVo cvo, Long plan_no, HttpSession session) {
		MemberVo memberVo = (MemberVo)session.getAttribute("authUser");
		PlanVo planVo = new PlanVo();
		
		//plan 없으면 만들어서 보내주기.
		if(plan_no == null){
			String size =String.valueOf(planDao.getUserPlan(memberVo.getMember_no()).size());
			
			PlanVo pvo = new PlanVo();
			pvo.setMember_no(memberVo.getMember_no());
			pvo.setPlanName(memberVo.getMemberName()+"님의 "+size+"번째 일정");
			pvo.setMemberName(memberVo.getMemberName());
			planDao.insert(pvo);
			
			List<PlanVo> planList = planDao.selectTodayList(memberVo.getMember_no());
			planVo = planList.get(0);
			plan_no = planVo.getPlan_no();
		}
		
		
		//content가 DB에 없으면 새로 넣기
		if(contentDao.selectVoById(cvo.getId()) == null){
			contentDao.insert(cvo);
		}
		
		//contentVo 가져오기
		ContentVo contentVo = contentDao.selectVoById(cvo.getId());

		
		//contentBox에 넣기
		ContentBoxVo contentBoxVo=new ContentBoxVo();
		contentBoxVo.setContent_no(contentVo.getContent_no());
		contentBoxVo.setPlan_no(plan_no);
		contentBoxVo.setPlanName(planVo.getPlanName());
		
		contentBoxDao.insert(contentBoxVo);
	}

	public List<PlanVo> getMyPlan(HttpSession session) {
		MemberVo memberVo = (MemberVo)session.getAttribute("authUser");
		
		List<PlanVo> MyPlanList = planDao.getUserPlan(memberVo.getMember_no());
		
		return MyPlanList;
	}

	public List<ContentVo> callContents(Model model, Long plan_no,
			HttpSession session) {
		MemberVo memberVo = (MemberVo) session.getAttribute("authUser");
		List<ContentVo> contentList = new ArrayList<ContentVo>();
		PlanVo planVo = planDao.selectVo(plan_no);
		
		//확인 후 plan_no에 연결된 contents add
		if(planVo.getMember_no()==memberVo.getMember_no()){
		List<ContentBoxVo> contentBoxList = contentBoxDao.selectAllByPno(plan_no);
			for (int i = 0; i < contentBoxList.size(); i++) {
				contentList.add(contentDao.selectVo(contentBoxList.get(i).getContent_no()));
			}
		}
		
		return contentList;
	}

	public void join(HttpSession session, MemberVo memberVo) {
		//memberVo.setMemberGrade('guest');
		
		memberDao.insert(memberVo);
		session.setAttribute("authUser", memberVo);
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
	
	
	
}// main Service

