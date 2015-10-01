package com.bit2015.what.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bit2015.what.dao.CommentsDao;
import com.bit2015.what.dao.ContentDao;
import com.bit2015.what.dao.FollowDao;
import com.bit2015.what.dao.MemberDao;
import com.bit2015.what.dao.PlanDao;
import com.bit2015.what.dao.SearchListDao;
import com.bit2015.what.dao.ThemeBoxDao;
import com.bit2015.what.dao.ThemeDao;
import com.bit2015.what.dao.planCommentsDao;
import com.bit2015.what.util.FileUploader;
import com.bit2015.what.vo.CommentsVo;
import com.bit2015.what.vo.ContentVo;
import com.bit2015.what.vo.FollowVo;
import com.bit2015.what.vo.MemberVo;
import com.bit2015.what.vo.PlanCommentsVo;
import com.bit2015.what.vo.PlanVo;
import com.bit2015.what.vo.SearchListVo;
import com.bit2015.what.vo.ThemeBoxVo;
import com.bit2015.what.vo.ThemeVo;

@Service
public class AdminService {
	@Autowired
	MemberDao memberDao;
	@Autowired
	PlanDao planDao;
	@Autowired
	ThemeDao themeDao;
	@Autowired
	ThemeBoxDao themeBoxDao;
	@Autowired
	ContentDao  contentDao;
	@Autowired
	CommentsDao commentsDao;
	@Autowired
	FollowDao followDao;
    @Autowired
    SearchListDao searchListDao;
    @Autowired
    planCommentsDao planCommentsDao;
	// 파일올리는거야
	FileUploader ful = new FileUploader();

	// 회원가입한 사람들 불러오기
	public List<MemberVo> selectMember() {
		List<MemberVo> memberList = memberDao.selctAll();
		System.out.println("지금 가입한사람" + memberList);
		return memberList;
	}

	// 회원가입 추가
	public void insertMember(MemberVo memberVo, MultipartFile img) {
		if (img == null) {
			memberVo.setImageUrl("");
		} else {
			String member_img_url = ful.upload(img);
			memberVo.setImageUrl(member_img_url);
		}
		memberDao.insert(memberVo);
	}

	// 회원 강제 삭제
	public void deleteMember(Long member_no) {
		memberDao.delete(member_no);
		System.out.println("삭제" + member_no);
	}

	// plan 조회
	public List<PlanVo> selectPlan() {
		List<PlanVo> planList = planDao.selectAll();
		System.out.println("현재 전체 플랜" + planList);
		return planList;
	}

	// plan 등록
	public void insertPlan(PlanVo planVo, MultipartFile titleImage) {

		System.out.println("planVo" + planVo);
		if (titleImage == null) {
			planVo.setTitleImage("");
		} else {
			String member_img_url = ful.upload(titleImage);
			planVo.setTitleImage(member_img_url);
		}
		System.out.println(planVo.toString());
		planDao.insert(planVo);
	}

	// plan 삭제
	public void deletePlan(Long plan_no) {
		planDao.delete(plan_no);
	}
     // onchange 할때 ajax를 사용하기 위해하거야 
	public MemberVo getMemberName(Long member_no) {
		MemberVo memberVo = memberDao.getMemberVo(member_no);
		return memberVo;
	}
	// theme 조회
	public List<ThemeVo> selectTheme(){
		List<ThemeVo> selectTheme = themeDao.selectAll();
		return selectTheme;
	}
	// theme insert
	public void insertTheme(ThemeVo themeVo, MultipartFile imageUrl){
		System.out.println("themeVo" + themeVo);
		if (imageUrl == null) {
			themeVo.setImageUrl("");
		} else {
			String member_img_url = ful.upload(imageUrl);
			themeVo.setImageUrl(member_img_url);
		}
		System.out.println(themeVo.toString());
		themeDao.insert(themeVo);
	}
	public void deleteTheme(Long theme_no){
		themeDao.delete(theme_no);
	}
	
	//themeBox 조회
	public List<ThemeBoxVo> selectThemeBox(){
		List<ThemeBoxVo> selectThemeBox = themeBoxDao.selectAll();
		return selectThemeBox;
	} 
	//themeBox 등록
	public void insertThemeBox(ThemeBoxVo themeBoxVo){
		themeBoxDao.insert(themeBoxVo);
	}
	public void deleteThemeBox(@RequestParam Long themeBox_no){
		themeBoxDao.delete(themeBox_no);
		
	}
	//content 조회 
	public List<ContentVo> selectContent(){
		List<ContentVo> selectContent = contentDao.selectAll();
		return selectContent;
	}
	// content 등록
	public void insertContent(ContentVo contentVo, MultipartFile imageUrl){
		if (imageUrl == null) {
			contentVo.setImageUrl("");
		} else {
			String member_img_url = ful.upload(imageUrl);
			contentVo.setImageUrl(member_img_url);
		}
		System.out.println(contentVo.toString());
		contentDao.insert(contentVo);
	}
	// content 삭제
	public void deleteContent(@RequestParam Long content_no){
		contentDao.delete(content_no);
	}
	
	// comments 조회
	public List<CommentsVo> selectComments(){
		List<CommentsVo> selectComments = commentsDao.selectAll();
		return selectComments;
	}
	// comments 등록
	public void insertComments(CommentsVo commentsVo){
		commentsDao.insert(commentsVo);
	}
	public void deleteComments(@RequestParam Long comments_no){
		commentsDao.delete(comments_no);
	}
	
	public List<FollowVo> selectFollow(){
		List<FollowVo> selectFollow = followDao.selectAll();
		return selectFollow;
	}
	public void insertFollow(FollowVo followVo){
		followDao.insert(followVo);
	}
	public void deleteFollow(@RequestParam Long follow_no){
		followDao.delete(follow_no);
	}
	
	public List<SearchListVo> selectSerchList(){
		List<SearchListVo> selectSerchList= searchListDao.selectAll();
		return selectSerchList;
	}
	public void insertSearchList(SearchListVo searchListVo){
		searchListDao.insert(searchListVo);
	}
	public void deleteSearchList(@RequestParam Long searchList_no){
		searchListDao.delete(searchList_no);
	}
	
	public List<PlanCommentsVo> selectPlanComments(){
		List<PlanCommentsVo> selectPlanComments = planCommentsDao.selectAll();
		return selectPlanComments;
	}
	public void insertPlanComments(PlanCommentsVo planCommentsVo){
		planCommentsDao.insert(planCommentsVo);
	}
	public void deletePlanComments(@RequestParam Long planComments_no){
		planCommentsDao.delete(planComments_no);
	}
}