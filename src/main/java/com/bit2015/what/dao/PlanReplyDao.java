package com.bit2015.what.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit2015.what.vo.PlanReplyVo;

@Repository
public class PlanReplyDao {
	
	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;
	
	public List<PlanReplyVo> selectAll(){
		List<PlanReplyVo> list = sqlMapClientTemplate.queryForList("planReply.selectAll");
		return list;
	}
	public void insertPlanReply(PlanReplyVo planReplyVo){
		sqlMapClientTemplate.insert("planReply.insert", planReplyVo);
		
	}
	public List<Long> selectReplyCount(Long planComments_no){
		List<Long> list = sqlMapClientTemplate.queryForList("planReply.selectReplyCount", planComments_no);
		return list;
	}
	public void deletePlanReply(Long planReply_no){
		sqlMapClientTemplate.delete("planReply.delete",planReply_no);
	}

}
