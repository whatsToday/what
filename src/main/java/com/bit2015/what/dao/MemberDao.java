package com.bit2015.what.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit2015.what.vo.MemberVo;

@Repository
public class MemberDao {
  @Autowired
  SqlMapClientTemplate slqMapClientTemplate;
  
  // memberVo List로 뿌리기
  public List<MemberVo> selctAll(){
	  List<MemberVo> list = slqMapClientTemplate.queryForList("member.selectAll");
	  return list;
  }
}
