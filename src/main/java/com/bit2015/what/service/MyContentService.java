package com.bit2015.what.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bit2015.what.dao.ContentBoxDao;
import com.bit2015.what.dao.ContentDao;
import com.bit2015.what.dao.FollowDao;
import com.bit2015.what.dao.GoodPlanDao;
import com.bit2015.what.dao.MemberDao;
import com.bit2015.what.dao.PlanCommentsDao;
import com.bit2015.what.dao.PlanDao;
import com.bit2015.what.dao.PlanImgDao;
import com.bit2015.what.dao.PlanReplyDao;
import com.bit2015.what.util.FileUploader;
import com.bit2015.what.vo.ContentBoxVo;
import com.bit2015.what.vo.ContentVo;
import com.bit2015.what.vo.FollowVo;
import com.bit2015.what.vo.MemberVo;
import com.bit2015.what.vo.PlanCommentsVo;
import com.bit2015.what.vo.PlanImgVo;
import com.bit2015.what.vo.PlanVo;

@Service
public class MyContentService {
	
	@Autowired
	PlanDao planDao;
	@Autowired
	MemberDao memberDao;
	@Autowired
	FollowDao followDao;
	@Autowired
	ContentDao contentDao;
	@Autowired
	ContentBoxDao contentBoxDao;
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
		
	public List<Object> userPlan(Long member_no){
		List<Object> list = new ArrayList<Object>();
		List<PlanVo> list1 = planDao.getUserPlan(member_no);
		for(int i=0; i<list1.size(); i++){
			PlanVo planVo = list1.get(i);
			if(planVo.getMessage() != null){
			int goodCount = goodPlanDao.selectPlan(planVo.getPlan_no());
			int commentsCount = planCommentsDao.countPlanComments(planVo.getPlan_no());
			Map <String, Object> map = new HashMap<String, Object>();
			map.put("plan_no", planVo.getPlan_no());
			map.put("member_no", planVo.getMember_no());
			map.put("planName", planVo.getPlanName());
			map.put("memberName", planVo.getMemberName());
			map.put("message", planVo.getMessage());
			map.put("planDate", planVo.getPlanDate());
			map.put("titleImage", planVo.getTitleImage());
			map.put("goodCount", goodCount);
			map.put("commentsCount", commentsCount);
			list.add(map);
			}
		}
		System.out.println(list);
		return list;
	}
	public MemberVo getMemberVo(Long member_no){
		MemberVo memberVo = memberDao.getMemberVo(member_no);
		return  memberVo;
	}
	public List<Object> follower(Long member_no){
		List<Object> follower = new ArrayList<Object>();
		List<FollowVo> list = followDao.selectUser(member_no);
		for(int i=0; i<list.size(); i++){
			FollowVo followVo = list.get(i);
			Map<String, Object> map = new HashMap<String, Object>();
			MemberVo memberVo = memberDao.getMemberVo(followVo.getFollowNum());
			map.put("followerName", followVo.getMemberName());
			map.put("followingName", followVo.getFollowName());
			map.put("followingNum", followVo.getFollowNum());
			map.put("Url", memberVo.getImageUrl());
			follower.add(map);
			}
		return follower;
	}
	public List<FollowVo> selectFollow(Long followNum, Long member_no){
		List<FollowVo> list = followDao.selectFollow(followNum, member_no);
		return list;
	}
	public List<Object> following(Long followNum){
		List<Object> follower = new ArrayList<Object>();
		List<FollowVo> list = followDao.selectMe(followNum);
		for(int i=0; i<list.size(); i++){
			FollowVo followVo = list.get(i);
			Map<String, Object> map = new HashMap<String, Object>();
			MemberVo memberVo = memberDao.getMemberVo(followVo.getMember_no());
			map.put("followerName", followVo.getMemberName());
			map.put("followingName", followVo.getFollowName());
			map.put("followerNum", followVo.getMember_no());
			map.put("Url", memberVo.getImageUrl());
			follower.add(map);
			}
		return follower;
	}
	public void unFollow(Long following, Long follower){
		followDao.unFollow(following, follower);
	}
	public void follow(Long following, Long follower){
		FollowVo followVo = new FollowVo();
		MemberVo memberVo = memberDao.getMemberVo(follower);
		String memberName = memberVo.getMemberName();
		MemberVo memberVo1 = memberDao.getMemberVo(following);
		String followName = memberVo1.getMemberName();
		
		followVo.setMember_no(follower);
		followVo.setMemberName(memberName);
		followVo.setFollowNum(following);
		followVo.setFollowName(followName);
		followDao.insert(followVo);
	}
	public List<ContentVo> allPlan(Long member_no){
		List<PlanVo> list = planDao.getUserPlan(member_no);
		List<ContentVo> cntVo = new ArrayList<ContentVo>();
		for(int i=0; i<list.size(); i++){
			PlanVo planVo = list.get(i);
			if(planVo.getMessage() != null){
				List<ContentBoxVo> list1 = contentBoxDao.selectAllByPno(planVo.getPlan_no());
				for(int q=0; q<list1.size(); q++){
					ContentBoxVo contentBoxVo = list1.get(q);
					cntVo.add(contentDao.selectVo(contentBoxVo.getContent_no()));
				}
			}
		}
		return cntVo;
	}
	public ContentVo getContent(String id, Long member_no){
		ContentVo contentVo = contentDao.selectVoById(id);
		return contentVo;
	}
	public PlanVo getContentPlan(String id, Long member_no){
		ContentVo contentVo = contentDao.selectVoById(id);
		List<ContentBoxVo> list = contentBoxDao.selectAllById(contentVo.getContent_no());
		PlanVo pnVo = new PlanVo();
		for(int i=0; i<list.size(); i++){
			ContentBoxVo contentBoxVo = list.get(i);
			List<PlanVo> list1 =planDao.getUserPlan(member_no);
			for(int q=0; q<list1.size(); q++){
			PlanVo planVo = list1.get(q);
			if(planVo.getPlan_no() == contentBoxVo.getPlan_no()){
				pnVo = planVo;
			}
			}
		}
		return pnVo;
	}
	public List<PlanImgVo> selectPlan(Long plan_no){
		List<PlanImgVo> list = planImgDao.selectPlan(plan_no);
		return list;
	}
	public List<PlanImgVo> allPlanImg(){
		List<PlanImgVo> list = planImgDao.selectAll();
		return list;
	}
	public List<PlanCommentsVo> selectPlanComments(Long plan_no){
		List<PlanCommentsVo> list = planCommentsDao.selectPlan(plan_no);
		return list;
	}
	public List<PlanCommentsVo> selectPlanCommentsAll(){
		List<PlanCommentsVo> list = planCommentsDao.selectAll();
		
		Date dateNow = new Date();
		long regDate =0;
		
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
				list1.add(planCommentsVo);
				System.out.println(list1);
			} catch (ParseException e) {			
				e.printStackTrace();			
			}
		}
		
		return list1;
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
		
		System.out.println(planCommentsVo);
		planCommentsDao.insert(planCommentsVo);
	}
	public void deleteComments(Long planComments_no){
		planCommentsDao.delete(planComments_no);
	}
	public void modify(String memberName, String password, MultipartFile imageUrl, Long member_no){
		MemberVo memberVo = memberDao.getMemberVo(member_no);
		String mName = memberName;
		String pass = password;
		String iUrl;
		
		if(mName.equals("")){
			mName = memberVo.getMemberName();
		}
		if(pass.equals("")){
			pass= memberVo.getPassword();
		}
		if(imageUrl.isEmpty()){
			iUrl = memberVo.getImageUrl();
		}else{
			iUrl = ful.upload(imageUrl);
		}
		memberDao.modify(mName, pass, iUrl, member_no);
		
	}
}
