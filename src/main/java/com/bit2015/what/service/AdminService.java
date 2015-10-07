package com.bit2015.what.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bit2015.what.dao.CommentsDao;
import com.bit2015.what.dao.ContentBoxDao;
import com.bit2015.what.dao.ContentDao;
import com.bit2015.what.dao.EventDao;
import com.bit2015.what.dao.FollowDao;
import com.bit2015.what.dao.GoodContentDao;
import com.bit2015.what.dao.GoodPlanDao;
import com.bit2015.what.dao.MemberDao;
import com.bit2015.what.dao.PlanDao;
import com.bit2015.what.dao.PlanImgDao;
import com.bit2015.what.dao.SearchListDao;
import com.bit2015.what.dao.ThemeBoxDao;
import com.bit2015.what.dao.ThemeDao;
import com.bit2015.what.dao.planCommentsDao;
import com.bit2015.what.util.FileUploader;
import com.bit2015.what.vo.CommentsVo;
import com.bit2015.what.vo.ContentBoxVo;
import com.bit2015.what.vo.ContentVo;
import com.bit2015.what.vo.EventVo;
import com.bit2015.what.vo.FollowVo;
import com.bit2015.what.vo.GoodContentVo;
import com.bit2015.what.vo.GoodPlanVo;
import com.bit2015.what.vo.MemberVo;
import com.bit2015.what.vo.PlanCommentsVo;
import com.bit2015.what.vo.PlanImgVo;
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
    @Autowired
    GoodPlanDao goodPlanDao;
    @Autowired
    GoodContentDao goodContentDao;
    @Autowired
    ContentBoxDao contentBoxDao;
    @Autowired
    PlanImgDao planImgDao;
    @Autowired
    EventDao eventDao;
    
    
	// 파일올리는거야
	FileUploader ful = new FileUploader();

	// 회원가입한 사람들 불러오기
	public List<MemberVo> selectMember() {
		List<MemberVo> memberList = memberDao.selctAll();
		System.out.println("지금 가입한사람" + memberList);
		return memberList;
	}
	
	/*member페이징*/
	public List<MemberVo> selectMember1(int page, int limit) {
		List<MemberVo> memberList1 = memberDao.select(page, limit);
		
		return memberList1;
		
	}
	/*member페이징*/
	public int memberCountList(){
		int count = 0;
		count =	memberDao.memberCountList();
		return count;
	}
	
	/*comments페이징*/
	public List<CommentsVo> selectComments1(int page, int limit) {
		List<CommentsVo> commentsList1 = commentsDao.select(page, limit);
		
		return commentsList1;
		
	}
	/*comments페이징*/
	public int commentsCountList(){
		int count = 0;
		count =	commentsDao.commentsCountList();
		return count;
	}
	
	/*content페이징*/
	public List<ContentVo> selectContent1(int page, int limit) {
		List<ContentVo> contentList1 = contentDao.select(page, limit);
		
		return contentList1;
		
	}
	/*content페이징*/
	public int contentCountList(){
		int count = 0;
		count =	contentDao.contentCountList();
		return count;
	}
	
	/*contentBox페이징*/
	public List<ContentBoxVo> selectContentBox1 (int page, int limit) {
		List<ContentBoxVo> contentBoxList1 = contentBoxDao.select(page, limit);
		
		return contentBoxList1;
		
	}
	/*contentBox페이징*/
	public int contentBoxCountList(){
		int count = 0;
		count =	contentBoxDao.contentBoxCountList();
		return count;
	}
	
	/*event페이징*/
	public List<EventVo> selectEvent1 (int page, int limit) {
		List<EventVo> event1 = eventDao.select(page, limit);		
		return event1;
		
	}
	/*event페이징*/
	public int eventBoxCountList(){
		int count = 0;
		count =	eventDao.eventCountList();
		return count;
	}
	/*follow페이징*/
	public List<FollowVo> selectFollow1 (int page, int limit) {
		List<FollowVo> follow1 = followDao.select(page, limit);		
		return follow1;
		
	}
	/*follow페이징*/
	public int followCountList(){
		int count = 0;
		count =	followDao.followCountList();
		return count;
	}
	
	/*goodContent페이징*/
	public List<GoodContentVo> selectgoodContent1 (int page, int limit) {
		List<GoodContentVo> goodContent1 = goodContentDao.select(page, limit);		
		return goodContent1;
		
	}
	/*goodContent페이징*/
	public int goodContentCountList(){
		int count = 0;
		count =	goodContentDao.goodContentCountList();
		return count;
	}
	/*goodplan페이징*/
	public List<GoodPlanVo> selectgoodPlan1 (int page, int limit) {
		List<GoodPlanVo> goodPlan1 = goodPlanDao.select(page, limit);		
		return goodPlan1;
		
	}
	/*goodplan페이징*/
	public int goodPlanList(){
		int count = 0;
		count =	goodPlanDao.goodPlanCountList();
		return count;
	}

	/*planComments페이징*/
	public List<PlanCommentsVo> selectPlanComments1 (int page, int limit) {
		List<PlanCommentsVo> planComments1 = planCommentsDao.select(page, limit);		
		return planComments1;
		
	}
	/*planComments페이징*/
	public int palnCommentsList(){
		int count = 0;
		count =	planCommentsDao.planCommentsCountList();
		return count;
	}
	
	/*planimg페이징*/
	public List<PlanImgVo> selectPlanImg1 (int page, int limit) {
		List<PlanImgVo> planImg1 = planImgDao.select(page, limit);		
		return planImg1;
		
	}
	/*planimg페이징*/
	public int palnImgList(){
		int count = 0;
		count =	planImgDao.planImgCountList();
		return count;
	}
	
	/*SearchList페이징*/
	public List<SearchListVo> selectSearchList1 (int page, int limit) {
		List<SearchListVo> searchList1 = searchListDao.select(page, limit);		
		return searchList1;
		
	}
	/*SearchList페이징*/
	public int searchList1(){
		int count = 0;
		count =	searchListDao.searchListCountList();
		return count;
	}
	/*plan페이징*/
	public List<PlanVo> selectplan1 (int page, int limit) {
		List<PlanVo> plan1 = planDao.select(page, limit);		
		return plan1;
		
	}
	/*plan페이징*/
	public int paln1(){
		int count = 0;
		count =	planDao.planCountList();
		return count;
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
     // onchange memberName할때 ajax를 사용하기 위해하거야 
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
	public List<GoodPlanVo> selectGoodPlan(){
		List<GoodPlanVo> selectGoodPlan = goodPlanDao.selectAll();
		return selectGoodPlan;
	}
	public void insertGoodPlan(GoodPlanVo goodPlanVo){
		goodPlanDao.insert(goodPlanVo);
	}
	public void deleteGoodPlan(@RequestParam Long goodPlan_no){
		goodPlanDao.delete(goodPlan_no);
	}
	
	public List<GoodContentVo> selectGoodContent(){
		List<GoodContentVo> selectGoodContent = goodContentDao.selectAll();
		return selectGoodContent;
	}
	public void insertGoodContent(GoodContentVo goodContentVo){
		goodContentDao.insert(goodContentVo);
	}
	public void deleteGoodContent(@RequestParam Long goodContent_no){
		goodContentDao.delete(goodContent_no);
	}
    public List<ContentBoxVo> selectContentBox(){
    	List<ContentBoxVo> selectContentBox = contentBoxDao.selectAll();
    	return selectContentBox;
    }
    public void insertContentBox(ContentBoxVo contentBoxVo){
    	contentBoxDao.insert(contentBoxVo);
    }
    public void deleteContentBox(@RequestParam Long contentBox_no){
    	contentBoxDao.delete(contentBox_no);
    }
    public List<PlanImgVo> selectPlanImg(){
    	List<PlanImgVo> selectPlanImg = planImgDao.selectAll();
    	return selectPlanImg;
    }
    public void insertPlanImg(PlanImgVo planImgVo, MultipartFile imageUrl){
    	if (imageUrl == null) {
    		planImgVo.setImageUrl("");
		} else {
			String member_img_url = ful.upload(imageUrl);
			planImgVo.setImageUrl(member_img_url);
		}
		System.out.println(planImgVo.toString());
		planImgDao.insert(planImgVo);
    }
    public void deletePlanImg(@RequestParam Long planImg_no){
    	planImgDao.delete(planImg_no);
    }
    
    // onchange title할때 ajax를 사용하기 위해하거야 
	public ContentVo getTitle(Long content_no) {
		ContentVo contentVo = contentDao.getContentVo(content_no);
		return contentVo;
	}
	
	public List<EventVo> selectEvent(){
		List<EventVo> selectEvent = eventDao.selectAll();
        return selectEvent;
	}
	public void insertEvent(EventVo eventVo){
		eventDao.insert(eventVo);
	}
	public void deleteEvent(@RequestParam Long event_no){
		eventDao.delete(event_no);
	}
	
	public ContentVo getContent_no(String title){
		ContentVo contentVo = contentDao.getContent_no(title);
		return contentVo;
	}
	
	public PlanVo getPlanName(long plan_no){
		PlanVo planVo = planDao.getPlanName(plan_no);
		return planVo;
	}
	
	public ThemeVo getThemeName(long theme_no){
		ThemeVo themeVo = themeDao.getThemeName(theme_no);
		return themeVo;
	}
}