package com.bit2015.what.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit2015.what.dao.FollowDao;
import com.bit2015.what.dao.MemberDao;
import com.bit2015.what.dao.PlanDao;
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

}
