package com.bit2015.what.dao;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

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
	
	public void update(PlanVo planVo) {
		sqlMapClientTemplate.update("plan.update", planVo);
	}
}
