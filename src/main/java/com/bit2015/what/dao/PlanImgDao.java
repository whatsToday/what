package com.bit2015.what.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit2015.what.vo.PlanImgVo;

@Repository
public class PlanImgDao {
  @Autowired
  SqlMapClientTemplate sqlMapClientTemplate;
  
  public List<PlanImgVo> selectAll(){
	  List<PlanImgVo> list = sqlMapClientTemplate.queryForList("planImg.selectAll");
	  return list;
  }
  public void insert(PlanImgVo planImgVo){
	  sqlMapClientTemplate.insert("planImg.insert",planImgVo);
  }
  public void delete(long planImg_no){
	  sqlMapClientTemplate.delete("planImg.delete",planImg_no);
  }
}
