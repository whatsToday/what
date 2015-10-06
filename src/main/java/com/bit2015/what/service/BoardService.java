package com.bit2015.what.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit2015.what.dao.ContentBoxDao;
import com.bit2015.what.dao.ContentDao;
import com.bit2015.what.dao.PlanDao;
import com.bit2015.what.util.FileUploader;
import com.bit2015.what.vo.ContentBoxVo;
import com.bit2015.what.vo.ContentVo;
import com.bit2015.what.vo.PlanVo;

@Service
public class BoardService {
	
	@Autowired
	PlanDao planDao;
	@Autowired
	ContentBoxDao contentBoxDao;
	@Autowired
	ContentDao contentDao;
	
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
	public void updatePlan(String planName, String message, Long plan_no){
		planDao.update(planName, message, plan_no );
	}
	public PlanVo getPlanVo(Long plan_no){
		PlanVo planVo = planDao.selectVo(plan_no);
		return planVo;
	}
	public void deleteContent(Long content_no, Long plan_no){
		contentBoxDao.deleteContent(content_no, plan_no);
	}
	public ContentVo getContentVo(Long content_no){
		ContentVo contentVo = contentDao.selectVo(content_no);
		return contentVo;
	}
}
