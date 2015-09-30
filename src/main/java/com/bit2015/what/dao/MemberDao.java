package com.bit2015.what.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit2015.what.vo.MemberVo;

@Repository
public class MemberDao {
  @Autowired
  SqlMapClientTemplate sqlMapClientTemplate;
  
  // memberVo List로 뿌리기
  public List<MemberVo> selctAll(){
	  List<MemberVo> list = sqlMapClientTemplate.queryForList("member.selectAll");
	  return list;
  }
  // member insert
  public void insert(MemberVo memberVo){
	  sqlMapClientTemplate.insert("member.insert",memberVo);
  }
  
  public void delete(long member_no) {
		sqlMapClientTemplate.delete("member.delete", member_no);
	}
	
}
