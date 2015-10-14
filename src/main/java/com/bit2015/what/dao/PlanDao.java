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
import com.sun.org.apache.regexp.internal.recompile;


@Repository
public class PlanDao {

	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;
	
	public void insert(PlanVo planVo){
		sqlMapClientTemplate.insert("plan.insert", planVo);
	}
	
	  public List<PlanVo> select(int page, int limit) {
			Map<String, Integer> map = new HashMap<String, Integer>();
			int startRow = (page - 1) * limit + 1; 
			int endRow = startRow + limit - 1; 
			map.put("startpage", startRow);
			map.put("endpage", endRow);
			List<PlanVo> list =sqlMapClientTemplate.queryForList("plan.planList",map);
			System.out.println("리스트"+list);
			System.out.println("맵"+map);
			return list;
		}
	  
	  public List<PlanVo> searchPlan(String memberName, int page, int limit) {
			Map<String, Object> map = new HashMap<String, Object>();
			int startRow = (page - 1) * limit + 1; 
			int endRow = startRow + limit - 1; 
			map.put("memberName", memberName);
			map.put("startpage", startRow);
			map.put("endpage", endRow);
			List<PlanVo> list =sqlMapClientTemplate.queryForList("plan.searchPlan",map);
			System.out.println("dao"+list.size());
//			System.out.println("맵"+map);
			return list;
		}
	  
	  public int planCountList() {
			int count = 0;
			count = (Integer) sqlMapClientTemplate.queryForObject("plan.planCountList");
			return count;
		}
	  
	  public int searchPlanCountList(String memberName) {
			int count = 0;
			count = (Integer) sqlMapClientTemplate.queryForObject("plan.searchPlanCountList",memberName);
			return count;
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
	 public List<PlanVo> selectFollowerPlanById(Long content_no, Long member_no){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("content_no", content_no);
			map.put("member_no", member_no);
			
			List<PlanVo> list= sqlMapClientTemplate.queryForList("plan.selectFollowerPlanById",map);
			return list;
		}
//	 public List<PlanVo> searchPlan(String memberName){
//		 List<PlanVo> list = sqlMapClientTemplate.queryForList("plan.searchPlan",memberName);
//		return list;
//	 }
}
