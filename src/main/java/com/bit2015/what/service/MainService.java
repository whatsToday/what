package com.bit2015.what.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;







import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit2015.what.dao.CommentsDao;
import com.bit2015.what.dao.ContentBoxDao;
import com.bit2015.what.dao.ContentDao;
import com.bit2015.what.dao.EventDao;
import com.bit2015.what.dao.FollowDao;
import com.bit2015.what.dao.GoodContentDao;
import com.bit2015.what.dao.MemberDao;
import com.bit2015.what.dao.PlanDao;
import com.bit2015.what.dao.SearchListDao;
import com.bit2015.what.dao.ThemeBoxDao;
import com.bit2015.what.dao.ThemeDao;
import com.bit2015.what.dao.planCommentsDao;
import com.bit2015.what.util.FileUploader;
import com.bit2015.what.vo.ContentBoxVo;
import com.bit2015.what.vo.ContentVo;
import com.bit2015.what.vo.EventVo;
import com.bit2015.what.vo.FollowVo;
import com.bit2015.what.vo.GoodContentVo;
import com.bit2015.what.vo.MemberVo;
import com.bit2015.what.vo.PlanVo;
import com.bit2015.what.vo.SearchListVo;
import com.bit2015.what.vo.ThemeBoxVo;
import com.bit2015.what.vo.ThemeVo;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;


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
	@Autowired
	GoodContentDao goodContentDao;
	@Autowired
	CommentsDao commentsDao;
	@Autowired
	EventDao eventDao;
	@Autowired
	SearchListDao searchListDao;
	@Autowired
	FollowDao followDao;
	
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

	public void getInfo(HttpSession session, Map<String, Object> map, String id) {
		
		// 후기 수집
		List<PlanVo> planList = new ArrayList<PlanVo>();
		List<FollowVo> followList = new ArrayList<FollowVo>();
		long good = 0; 
		long comments = 0 ;
		boolean event = false;

		if (contentDao.selectVoById(id) == null) {
			System.out.println("해당 id로 아무것도 검색되지 않았습니다.");
		} else {
			ContentVo contentVo = contentDao.selectVoById(id);
			long content_no=contentVo.getContent_no();

			List<ContentBoxVo> contentBoxList = contentBoxDao.selectAllById(content_no);
			for (int i = 0; i < contentBoxList.size(); i++) {
				PlanVo tempVo = planDao.selectVo(contentBoxList.get(i).getPlan_no());
				if(tempVo.getMessage()!=null){
					planList.add(tempVo);
				}
			}
			//event 가져오기
			if(eventDao.checkEvents(content_no)) event=true;
			
			// 좋아요
			//good 갯수
			good = goodContentDao.selectAllByCno(content_no).size();
			// 댓글
			comments = commentsDao.selectAllByCno(content_no).size();
			
			if(session.getAttribute("authUser")!=null){
				MemberVo memberVo = (MemberVo) session.getAttribute("authUser"); 
				followList = followDao.selectUser(memberVo.getMember_no());
			}
			
		}
		map.put("followList", followList);
		map.put("event", event);
		map.put("comments", comments);
		map.put("good", good);
		map.put("planList", planList);
	}

	public long insertPlan(ContentVo cvo, Long plan_no, HttpSession session) {
		MemberVo memberVo = (MemberVo)session.getAttribute("authUser");
		PlanVo planVo = new PlanVo();
		
		//plan 없으면 만들어서 보내주기.
		if(plan_no == null || plan_no == -1){
			String size =String.valueOf(planDao.getUserPlan(memberVo.getMember_no()).size()+1);
			
			PlanVo pvo = new PlanVo();
			pvo.setMember_no(memberVo.getMember_no());
			pvo.setPlanName(memberVo.getMemberName()+"님의 "+size+"번째 일정");
			pvo.setMemberName(memberVo.getMemberName());
			
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date today=Calendar.getInstance().getTime();
			String planDate=df.format(today);
			pvo.setPlanDate(planDate);
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
		long content_no=contentVo.getContent_no();
		ContentBoxVo contentBoxVo=new ContentBoxVo();
		contentBoxVo.setContent_no(content_no);
		contentBoxVo.setPlan_no(plan_no);
		contentBoxVo.setPlanName(planVo.getPlanName());
		
		//중복된 plan_no , content_no 안들어가게
		if(contentBoxDao.getContentBoxNo(content_no, plan_no)==null){
		contentBoxDao.insert(contentBoxVo);
		}else{
			System.out.println("중복되는 contentbox tuple이 있습니다");
		}
		
		return plan_no;
	}

	public List<PlanVo> getMyPlan(HttpSession session) {
		MemberVo memberVo = (MemberVo)session.getAttribute("authUser");
		
		List<PlanVo> MyPlanList = planDao.getUserPlan(memberVo.getMember_no());
		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date today = Calendar.getInstance().getTime();
		String planDate = df.format(today);
		if(MyPlanList.size() == 0 || 
				!MyPlanList.get(0).getPlanDate().equals(planDate)){
			PlanVo addVo = new PlanVo();
			addVo.setPlan_no(-1);
			addVo.setPlanName("오늘의 일정이 없습니다");
			
			MyPlanList.add(addVo);
		}
				
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

	public void insertThemeBox(Long[] param, HttpSession session) {
		MemberVo memberVo = (MemberVo)session.getAttribute("authUser");
		//초기화 한 후 
		themeBoxDao.deleteMember(memberVo.getMember_no());
		//insert
		ThemeBoxVo themeBoxVo = new ThemeBoxVo();
		themeBoxVo.setMember_no(memberVo.getMember_no());
		for (int i = 0; i < param.length; i++) {
			long theme_no = param[i];
			themeBoxVo.setTheme_no(theme_no);
			themeBoxVo.setThemeName(themeDao.selectVo(theme_no).getThemeName());
			themeBoxDao.insert(themeBoxVo);
		}
	}

	public void checkThemeBox(Model model, HttpSession session) {
		MemberVo memberVo = (MemberVo)session.getAttribute("authUser");
		List<ThemeBoxVo> themeBoxList = themeBoxDao.selectAllByMm(memberVo.getMember_no());
		String json=jsonn((ArrayList<?>) themeBoxList);
		
		model.addAttribute("themeBoxList", json);
	}
	
	public String jsonn(ArrayList<?> list) {
		String jsonn = "";

		ObjectMapper objectMapper = new ObjectMapper();
		try {
			jsonn = objectMapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		return jsonn;
	}

	public void placesNear(Map<String, Object> map, String[] themeName, Double lat, Double lng, Double distance) {
//		System.out.println("사용자가 고른 관심사와 관련된 message가 있는 후기글(plan)들을 가지고 있는 content를 가져옵니다");
		List<ContentVo> ctList = new ArrayList<ContentVo>();
		
		for (int i = 0; i < themeName.length; i++) {
			ctList.addAll(contentDao.selectAllNearWithTheme(themeName[i], lat, lng, distance));
		}
		
		map.put("contentList", ctList);
		
	}

	public void insertKey(Map<String, Object> map, HttpSession session, String keyword, Double lat, Double lng,
			Double distance) {
		MemberVo memberVo =new MemberVo();
		SearchListVo searchListVo = new SearchListVo();
		
		if(session.getAttribute("authUser")!=null){
			memberVo = (MemberVo) session.getAttribute("authUser");
		}else{
			memberVo = memberDao.getMemberVo((long) 99999);
		}
		searchListVo.setMember_no(memberVo.getMember_no());
		searchListVo.setMemberName(memberVo.getMemberName());
		searchListVo.setSearch(keyword);
		searchListVo.setLatitude(String.valueOf(lat));
		searchListVo.setLongitude(String.valueOf(lng));
		
		searchListDao.insert(searchListVo);
	}

	public void showHotKey(Map<String, Object> map, Double lat,
			Double lng, Double distance) {
		
		List<String> searchList = searchListDao.selectHotKey(lat,lng,distance);
		map.put("searchList", searchList);
	}

	public void markerColor(Map<String, Object> map, HttpSession session,
			String id) {
		String color = "";
		
		if(contentDao.selectVoById(id)!=null){
			
			List<EventVo> eventList =eventDao.selectAllById(id);
			if(eventList.size()!=0)	color="purple";
			
			long content_no =contentDao.selectVoById(id).getContent_no();
			if(session.getAttribute("authUser")!=null){
				MemberVo memberVo = (MemberVo)session.getAttribute("authUser");
				List<PlanVo> planList = planDao.selectFollowerPlanById(content_no,memberVo.getMember_no());
				if(planList.size()!=0) color="green";
			}
		}
		
		map.put("color", color);
		
		//green follow
		
	}

	public void insertContent(Map<String, Object> map, ContentVo cvo) {
		//content가 DB에 없으면 새로 넣기
		if(contentDao.selectVoById(cvo.getId()) == null){
			contentDao.insert(cvo);
		}
		ContentVo contentVo = contentDao.selectVoById(cvo.getId());
		map.put("contentVo", contentVo);
	}

	public void textSearch(Map<String, Object> map, String text) {
		List<ThemeVo> themeList = themeDao.selectSearch(text);
		map.put("themeList", themeList);
	}
	
}// main Service

