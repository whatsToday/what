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
		Map<String, Object> map = new HashMap<String, Object>();
		List<FollowVo> list = followDao.selectUser(member_no);
		for(int i=0; i<list.size(); i++){
			FollowVo followVo = list.get(i);
			MemberVo memberVo = memberDao.getMemberVo(followVo.getFollowNum());
			map.put("followerName", followVo.getMemberName());
			map.put("followingName", followVo.getFollowName());
			map.put("Url", memberVo.getImageUrl());
			follower.add(map);
			System.out.println(map);
			}
		System.out.println(follower);
		return follower;
	}
	public List<FollowVo> following(Long followNum){
		List<FollowVo> list = followDao.selectMe(followNum);
		return list;
	}

}
