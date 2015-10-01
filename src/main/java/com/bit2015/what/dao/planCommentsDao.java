package com.bit2015.what.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit2015.what.vo.PlanCommentsVo;

@Repository
public class planCommentsDao {
  @Autowired
  SqlMapClientTemplate sqlMapClientTemplate;
  
  public List<PlanCommentsVo> selectAll(){
	  List<PlanCommentsVo> list = sqlMapClientTemplate.queryForList("planComments.selectAll");
	  return list;
  }
  public void insert(PlanCommentsVo planCommentsVo){
	  sqlMapClientTemplate.insert("planComments.insert",planCommentsVo);
  }
  public void delete(long planComments_no){
	  sqlMapClientTemplate.delete("planComments.delete",planComments_no);
  }
}
