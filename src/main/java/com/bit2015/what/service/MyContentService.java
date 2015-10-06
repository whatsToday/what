package com.bit2015.what.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit2015.what.dao.ContentBoxDao;
import com.bit2015.what.dao.ContentDao;
import com.bit2015.what.dao.FollowDao;
import com.bit2015.what.dao.MemberDao;
import com.bit2015.what.dao.PlanDao;
import com.bit2015.what.vo.ContentBoxVo;
import com.bit2015.what.vo.ContentVo;
import com.bit2015.what.vo.FollowVo;
import com.bit2015.what.vo.MemberVo;
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
	
	public List<PlanVo> userPlan(Long member_no){
		List<PlanVo> list = planDao.getUserPlan(member_no);
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
}
