package com.bit2015.what.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bit2015.what.dao.ContentBoxDao;
import com.bit2015.what.dao.ContentDao;
import com.bit2015.what.dao.GoodPlanDao;
import com.bit2015.what.dao.MemberDao;
import com.bit2015.what.dao.PlanCommentsDao;
import com.bit2015.what.dao.PlanDao;
import com.bit2015.what.dao.PlanImgDao;
import com.bit2015.what.dao.PlanReplyDao;
import com.bit2015.what.util.FileUploader;
import com.bit2015.what.vo.ContentBoxVo;
import com.bit2015.what.vo.ContentVo;
import com.bit2015.what.vo.GoodPlanVo;
import com.bit2015.what.vo.MemberVo;
import com.bit2015.what.vo.PlanCommentsVo;
import com.bit2015.what.vo.PlanImgVo;
import com.bit2015.what.vo.PlanReplyVo;
import com.bit2015.what.vo.PlanVo;

@Service
public class BoardService {
	
	@Autowired
	MemberDao memberDao;
	@Autowired
	PlanDao planDao;
	@Autowired
	ContentBoxDao contentBoxDao;
	@Autowired
	ContentDao contentDao;
	@Autowired
	PlanImgDao planImgDao;
	@Autowired
	GoodPlanDao goodPlanDao;
	@Autowired
	PlanCommentsDao planCommentsDao;
	@Autowired
	PlanReplyDao planReplyDao;
	
	// 파일올리는거야
		FileUploader ful = new FileUploader();
	
	public List<PlanVo> userPlan(Long member_no){
		List<PlanVo> list = planDao.getUserPlan(member_no);
		List<PlanVo> list1 = new ArrayList<PlanVo>();
		for(int i=0; i<list.size(); i++){
			PlanVo planVo = list.get(i);
			System.out.println(planVo);
			if(planVo.getMessage() == null){
				list1.add(planVo);
				System.out.println(planVo);
			}
		}
		return list1;
	}
	public List<ContentVo> getPlan(Long plan_no){
		List<ContentBoxVo> list = contentBoxDao.selectAllByPno(plan_no);
		ContentBoxVo contentBoxVo = new ContentBoxVo();
		List<ContentVo> cntVo = new ArrayList<ContentVo>();
		for( int i=0; i<list.size(); i++){
			contentBoxVo = list.get(i);
			cntVo.add(contentDao.selectVo(contentBoxVo.getContent_no()));
		}
		return cntVo;
	}
	public void updatePlan(String planName, String message, Long plan_no, MultipartFile titleImage){
			String member_img_url = ful.upload(titleImage);
			planDao.update(planName, message, plan_no, member_img_url);
	}
	public void deletePlan(String planName, String message, Long plan_no, String titleImage){
		planDao.update(planName, message, plan_no, titleImage);
		planImgDao.deletePlanImg(plan_no);
		goodPlanDao.deletePlan(plan_no);
	}
	public PlanVo getPlanVo(Long plan_no){
		PlanVo planVo = planDao.selectVo(plan_no);
		String planDate = planVo.getPlanDate();
		String pd[] = planDate.split("-");
		String planD = pd[0]+"년"+pd[1]+"월"+pd[2]+"일";
		planVo.setPlanDate(planD);
		
		return planVo;
	}
	public void deleteContent(Long content_no, Long plan_no){
		contentBoxDao.deleteContent(content_no, plan_no);
	}
	public ContentVo getContentVo(Long content_no){
		ContentVo contentVo = contentDao.selectVo(content_no);
		return contentVo;
	}
	public void insertImage(Long plan_no, List<MultipartFile> fileList){
		for(int i=0; i<fileList.size(); i++){
			PlanImgVo planImgVo = new PlanImgVo();
			planImgVo.setPlan_no(plan_no);
			if(ful.upload(fileList.get(i)) != ""){
				planImgVo.setImageUrl(ful.upload(fileList.get(i)));
				planImgDao.insert(planImgVo);
			}
		}
	}
	public List<PlanImgVo> selectPlan(Long plan_no){
		List<PlanImgVo> list = planImgDao.selectPlan(plan_no);
		return list;
	}
	public int goodPlan(Long plan_no, Long member_no){
		PlanVo planVo = planDao.selectVo(plan_no);
		int countGood;
		System.out.println(goodPlanDao.selectPlanByUser(plan_no, member_no));
		if(goodPlanDao.selectPlanByUser(plan_no, member_no) == null){
			
			String memberName = planVo.getMemberName();
			String planName = planVo.getPlanName();
			
			GoodPlanVo goodPlanVo = new GoodPlanVo();
			goodPlanVo.setPlan_no(plan_no);
			goodPlanVo.setMember_no(member_no);
			goodPlanVo.setMemberName(memberName);
			goodPlanVo.setPlanName(planName);
			
			goodPlanDao.insert(goodPlanVo);
			countGood = goodPlanDao.selectPlan(plan_no);
			return countGood;
			
		}else{
			countGood = goodPlanDao.selectPlan(plan_no);
			return countGood;
		}
	}
	public int selectGoodPlan(Long plan_no){
		int countGood = goodPlanDao.selectPlan(plan_no);
		return countGood;
	}
	public void insertComments(Long member_no, Long plan_no, String message){
		MemberVo memberVo = memberDao.getMemberVo(member_no);
		PlanVo planVo = planDao.selectVo(plan_no);
		
		PlanCommentsVo planCommentsVo = new PlanCommentsVo();
		
		planCommentsVo.setMember_no(member_no);
		planCommentsVo.setPlan_no(plan_no);
		planCommentsVo.setImageUrl(memberVo.getImageUrl());
		planCommentsVo.setMemberName(memberVo.getMemberName());
		planCommentsVo.setPlanName(planVo.getPlanName());
		planCommentsVo.setMessage(message);
		
		planCommentsDao.insert(planCommentsVo);
	}
	public List<PlanCommentsVo> selectPlanComments(Long plan_no){
		Date dateNow = new Date();
		long regDate =0;
		List<PlanCommentsVo> list = planCommentsDao.selectPlan(plan_no);
		List<PlanCommentsVo> list1 = new ArrayList<PlanCommentsVo>();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date xxxx = new Date();
		for(int i=0;i<list.size();i++){
			PlanCommentsVo planCommentsVo = list.get(i);
			Long planComments_no = planCommentsVo.getPlanComments_no();
			List<Long> replyCount = planReplyDao.selectReplyCount(planComments_no);
			planCommentsVo.setReplyCount(replyCount.get(0));
			String date = planCommentsVo.getRegDate();
			
			 try {
				xxxx =format.parse(date);
				regDate = xxxx.getTime();
				Long seconds = (dateNow.getTime() - regDate) / 1000;
				
				String interval ="";
				if(seconds<=60 &&seconds>0){
					interval= ((seconds) + "초 전");
				}
				if(seconds>60 && seconds<=3600){
					interval = ((seconds / 60)+"분 전");
				}
				if(seconds>3600 && seconds<=86400){
					interval = ((seconds / 3600)+"시간 전");
					System.out.println(seconds);
				}
				if(seconds>86400 && seconds<=2592000){
					interval = ((seconds / 86400)+"일 전");
				}
				if(seconds>2592000 && seconds<=31536000){
					interval = ((seconds / 2592000)+"달 전");
				}
				planCommentsVo.setRegDate(interval);
				System.out.println(planCommentsVo);
				list1.add(planCommentsVo);
			} catch (ParseException e) {			
				e.printStackTrace();			
			}
		}
		
		return list1;
	}
	public void deleteComments(Long planComments_no){
		planCommentsDao.delete(planComments_no);
	}
	public void insertPlanReply(Long member_no, Long planComments_no, String message){
		MemberVo memberVo = memberDao.getMemberVo(member_no);
		String imageUrl = memberVo.getImageUrl();
		String memberName = memberVo.getMemberName();
		
		PlanReplyVo planReplyVo = new PlanReplyVo();
		planReplyVo.setMember_no(member_no);
		planReplyVo.setPlanComments_no(planComments_no);
		planReplyVo.setImageUrl(imageUrl);
		planReplyVo.setMemberName(memberName);
		planReplyVo.setMessage(message);
		
		planReplyDao.insertPlanReply(planReplyVo);
	}
	public List<PlanReplyVo> selectAllReply(){
		Date dateNow = new Date();
		long regDate =0;
		List<PlanReplyVo> list = planReplyDao.selectAll();
		List<PlanReplyVo> list1 = new ArrayList<PlanReplyVo>();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date xxxx = new Date();
		for(int i=0;i<list.size();i++){
			PlanReplyVo planReplyVo = list.get(i);
			String date = planReplyVo.getRegDate();
			 try {
				xxxx =format.parse(date);
				regDate = xxxx.getTime();
				Long seconds = (dateNow.getTime() - regDate) / 1000;
				
				String interval ="";
				if(seconds<=60 &&seconds>0){
					interval= ((seconds) + "초 전");
				}
				if(seconds>60 && seconds<=3600){
					interval = ((seconds / 60)+"분 전");
				}
				if(seconds>3600 && seconds<=86400){
					interval = ((seconds / 3600)+"시간 전");
				}
				if(seconds>86400 && seconds<=2592000){
					interval = ((seconds / 86400)+"일 전");
				}
				if(seconds>2592000 && seconds<=31536000){
					interval = ((seconds / 2592000)+"달 전");
				}
				planReplyVo.setRegDate(interval);
				list1.add(planReplyVo);
			} catch (ParseException e) {			
				e.printStackTrace();			
			}
		}
		return list1;
	}
	public void deletePlanReply(Long planReply_no){
		planReplyDao.deletePlanReply(planReply_no);
	}
}
