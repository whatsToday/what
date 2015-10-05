package com.bit2015.what.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
  public MemberVo getMemberVo(Long member_no){
	  MemberVo memberVo = (MemberVo)sqlMapClientTemplate.queryForObject("member.getMember", member_no);
	  return memberVo;
  }
  // member insert
  public void insert(MemberVo memberVo){
	  sqlMapClientTemplate.insert("member.insert",memberVo);
  }
  
  public void delete(long member_no) {
		sqlMapClientTemplate.delete("member.delete", member_no);
	}
public MemberVo checkMember(MemberVo memberVo) {
	MemberVo testVo = (MemberVo) sqlMapClientTemplate.queryForObject("member.checkMember", memberVo);
	return testVo;

	
}
public void facebookJoin(String email, String memberName) {
	Map<String, Object> map= new HashMap<String, Object>();
	map.put("email", email);
	map.put("memberName", memberName);
	System.out.println(map);
	sqlMapClientTemplate.insert("member.facebookinsert",map);
}
public MemberVo checkEmail(String email) {
	MemberVo vo = (MemberVo) sqlMapClientTemplate.queryForObject("member.checkEmail", email);
	return vo;
}
}
