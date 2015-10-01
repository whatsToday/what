package com.bit2015.what.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit2015.what.vo.GoodPlanVo;

@Repository
public class GoodPlanDao {
 @Autowired
 SqlMapClientTemplate sqlMapClientTemplate;
 
 public List<GoodPlanVo> selectAll(){
	 List<GoodPlanVo> list = sqlMapClientTemplate.queryForList("goodPlan.selectAll");
	 return list;
 }
 public void insert(GoodPlanVo goodPlanVo){
	 sqlMapClientTemplate.insert("goodPlan.insert",goodPlanVo);
 }
 public void delete(long goodPlan_no){
	 sqlMapClientTemplate.delete("goodPlan.delete",goodPlan_no);
 }
 
}
