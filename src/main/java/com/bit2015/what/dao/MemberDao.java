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
	public List<MemberVo> selctAll() {
		List<MemberVo> list = sqlMapClientTemplate
				.queryForList("member.selectAll");
		return list;
	}

	public List<MemberVo> select(int page, int limit) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		int startRow = (page - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		map.put("startpage", startRow);
		map.put("endpage", endRow);
		List<MemberVo> list = sqlMapClientTemplate.queryForList(
				"member.memberList", map);
		System.out.println("리스트" + list);
		System.out.println("맵" + map);
		return list;
	}

	public int memberCountList() {
		int count = 0;
		count = (Integer) sqlMapClientTemplate
				.queryForObject("memeber.memberCountList");

		return count;
	}

	public MemberVo getMemberVo(Long member_no) {
		MemberVo memberVo = (MemberVo) sqlMapClientTemplate.queryForObject(
				"member.getMember", member_no);
		return memberVo;
	}

	// member insert
	public void insert(MemberVo memberVo) {
		sqlMapClientTemplate.insert("member.insert", memberVo);
	}

	public void delete(long member_no) {
		sqlMapClientTemplate.delete("member.delete", member_no);
	}

	public MemberVo checkMember(MemberVo memberVo) {
		MemberVo testVo = (MemberVo) sqlMapClientTemplate.queryForObject(
				"member.checkMember", memberVo);
		return testVo;

	}

	public void facebookJoin(String email, String memberName, String imageUrl) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("memberName", memberName);
		map.put("imageUrl", imageUrl);
		System.out.println("페북으로 가입후 로그인" + map);
		sqlMapClientTemplate.insert("member.facebookinsert", map);
	}

	public MemberVo checkEmail(String email) {
		MemberVo vo = (MemberVo) sqlMapClientTemplate.queryForObject(
				"member.checkEmail", email);
		return vo;
	}

	public List<MemberVo> searchEmail(String email) {
	    List<MemberVo> list = sqlMapClientTemplate.queryForList("member.searchEmail",email);
		return list;
	}
	public void modify(String memberName, String password, String imageUrl, Long member_no){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_no", member_no);
		map.put("memberName", memberName);
		map.put("password", password);
		map.put("imageUrl", imageUrl);
		sqlMapClientTemplate.update("member.modify", map);
	}
}
