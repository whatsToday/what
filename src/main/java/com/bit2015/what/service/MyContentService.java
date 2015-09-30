package com.bit2015.what.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit2015.what.dao.PlanDao;
import com.bit2015.what.vo.PlanVo;

@Service
public class MyContentService {
	
	@Autowired
	PlanDao planDao;
	
	
	public List<PlanVo> userPlan(Long member_no){
		List<PlanVo> list = planDao.getUserPlan(member_no);
		return list;
	}

}
