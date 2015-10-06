package com.bit2015.what.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.bit2015.what.vo.MemberVo;
import com.bit2015.what.vo.PlanVo;


@Repository
public class PlanDao {

	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;
	
	public void insert(PlanVo planVo){
		sqlMapClientTemplate.insert("plan.insert", planVo);
	}
	
	@SuppressWarnings("unchecked")
	public List<PlanVo> selectAll(){
		List<PlanVo> list= sqlMapClientTemplate.queryForList("plan.selectAll");
		return list;
	}
	
	public List<PlanVo> selectTodayList(Long member_no){
		List<PlanVo> list= sqlMapClientTemplate.queryForList("plan.selectTodayList",member_no);
		return list;
	}
	
	public List<PlanVo> getUserPlan(Long member_no){
		List<PlanVo> list = sqlMapClientTemplate.queryForList("plan.getUserPlan", member_no);
		return list;
	}
	
	public PlanVo selectVo(Long plan_no){
		PlanVo planVo = (PlanVo) sqlMapClientTemplate.queryForObject("plan.selectVo", plan_no);
		return planVo;
	}

	public void delete(Long plan_no) {
		sqlMapClientTemplate.delete("plan.delete", plan_no);
	}
	
	public void update(String planName, String message, Long plan_no,String member_img_url) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("titleImage", member_img_url);
		map.put("planName", planName);
		map.put("message", message);
		map.put("plan_no", plan_no);
		sqlMapClientTemplate.update("plan.update", map);
	}
	
	 public PlanVo getPlanName(Long plan_no){
		 PlanVo planVo = (PlanVo)sqlMapClientTemplate.queryForObject("plan.getPlanName", plan_no);
		  return planVo;
	  }
}
