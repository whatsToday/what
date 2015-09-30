package com.bit2015.what.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit2015.what.dao.ContentBoxDao;
import com.bit2015.what.dao.ContentDao;
import com.bit2015.what.dao.PlanDao;
import com.bit2015.what.vo.ContentBoxVo;
import com.bit2015.what.vo.PlanVo;

@Service
public class BoardService {
	
	@Autowired
	PlanDao planDao;
	@Autowired
	ContentBoxDao contentBoxDao;
	@Autowired
	ContentDao contentDao;
	
	public List<PlanVo> userPlan(Long member_no){
		List<PlanVo> list = planDao.getUserPlan(member_no);
		return list;
	}
	public Object[] getPlan(Long plan_no){
		List<ContentBoxVo> list = contentBoxDao.selectAllByPno(plan_no);
		ContentBoxVo contentBoxVo = new ContentBoxVo();
		Object[] cntVo = new Object[list.size()];
		for( int i=0; i<list.size(); i++){
			contentBoxVo = list.get(i);
			cntVo[i] = contentDao.selectVo(contentBoxVo.getContent_no());
			System.out.println(cntVo[i]);
		}
		return cntVo;
	}
	public void updatePlan(String planName, String message, Long plan_no){
		planDao.update(planName, message, plan_no);
	}
	public PlanVo getPlanVo(Long plan_no){
		PlanVo planVo = planDao.selectVo(plan_no);
		return planVo;
	}
}
