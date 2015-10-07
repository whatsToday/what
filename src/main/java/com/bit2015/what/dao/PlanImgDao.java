package com.bit2015.what.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit2015.what.vo.MemberVo;
import com.bit2015.what.vo.PlanImgVo;

@Repository
public class PlanImgDao {
  @Autowired
  SqlMapClientTemplate sqlMapClientTemplate;
  
  public List<PlanImgVo> selectAll(){
	  List<PlanImgVo> list = sqlMapClientTemplate.queryForList("planImg.selectAll");
	  return list;
  }
  
  public List<PlanImgVo> select(int page, int limit) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		int startRow = (page - 1) * limit + 1; 
		int endRow = startRow + limit - 1; 
		map.put("startpage", startRow);
		map.put("endpage", endRow);
		List<PlanImgVo> list =sqlMapClientTemplate.queryForList("planImg.planImgList",map);
		System.out.println("리스트"+list);
		System.out.println("맵"+map);
		return list;
	}
  
  public int planImgCountList() {
		int count = 0;
		count = (Integer) sqlMapClientTemplate.queryForObject("planImg.planImgCountList");


		return count;
	}
  public void insert(PlanImgVo planImgVo){
	  sqlMapClientTemplate.insert("planImg.insert",planImgVo);
  }
  public void delete(long planImg_no){
	  sqlMapClientTemplate.delete("planImg.delete",planImg_no);
  }
  public void deletePlanImg(long plan_no){
	  sqlMapClientTemplate.delete("planImg.deletePlanImg",plan_no);
  }
  public List<PlanImgVo> selectPlan(Long plan_no){
	  List<PlanImgVo> list = sqlMapClientTemplate.queryForList("planImg.selectPlan", plan_no);
	  return list;
  }
}
