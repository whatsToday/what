package com.bit2015.what.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit2015.what.vo.MemberVo;
import com.bit2015.what.vo.PlanCommentsVo;

@Repository
public class PlanCommentsDao {
  @Autowired
  SqlMapClientTemplate sqlMapClientTemplate;
  
  public List<PlanCommentsVo> selectAll(){
	  List<PlanCommentsVo> list = sqlMapClientTemplate.queryForList("planComments.selectAll");
	  return list;
	  
  }
  public List<PlanCommentsVo> selectPlan(Long plan_no){
	  List<PlanCommentsVo> list = sqlMapClientTemplate.queryForList("planComments.selectPlan",plan_no);
	  return list;
	  
  }
  public List<PlanCommentsVo> select(int page, int limit) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		int startRow = (page - 1) * limit + 1; 
		int endRow = startRow + limit - 1; 
		map.put("startpage", startRow);
		map.put("endpage", endRow);
		List<PlanCommentsVo> list =sqlMapClientTemplate.queryForList("planComments.planCommentsList",map);
		System.out.println("리스트"+list);
		System.out.println("맵"+map);
		return list;
	}
  
  public int planCommentsCountList() {
		int count = 0;
		count = (Integer) sqlMapClientTemplate.queryForObject("planComments.planCommentsCountList");


		return count;
	}
  
  public void insert(PlanCommentsVo planCommentsVo){
	  sqlMapClientTemplate.insert("planComments.insert",planCommentsVo);
  }
  public void delete(long planComments_no){
	  sqlMapClientTemplate.delete("planComments.delete",planComments_no);
  }
}
