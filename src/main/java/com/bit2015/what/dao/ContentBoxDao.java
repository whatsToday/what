package com.bit2015.what.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit2015.what.vo.ContentBoxVo;
import com.bit2015.what.vo.MemberVo;


@Repository
public class ContentBoxDao {

	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;

	public void insert(ContentBoxVo contentBoxVo){
		sqlMapClientTemplate.insert("contentBox.insert", contentBoxVo);
	}
	
	  public List<ContentBoxVo> select(int page, int limit) {
			Map<String, Integer> map = new HashMap<String, Integer>();
			int startRow = (page - 1) * limit + 1; 
			int endRow = startRow + limit - 1; 
			map.put("startpage", startRow);
			map.put("endpage", endRow);
			List<ContentBoxVo> list =sqlMapClientTemplate.queryForList("contentBox.contentBoxList",map);
			System.out.println("리스트"+list);
			System.out.println("맵"+map);
			return list;
		}
	  
	  public int contentBoxCountList() {
			int count = 0;
			count = (Integer) sqlMapClientTemplate.queryForObject("contentBox.contentBoxCountList");


			return count;
		}
	
	
	@SuppressWarnings("unchecked")
	public List<ContentBoxVo> selectAll(){
		List<ContentBoxVo> list= sqlMapClientTemplate.queryForList("contentBox.selectAll");
		return list;
	}
	public List<ContentBoxVo> selectAllByPno(Long plan_no){
		List<ContentBoxVo> list= sqlMapClientTemplate.queryForList("contentBox.selectAllByPno",plan_no);
		return list;
	}
	public List<ContentBoxVo> selectAllById(Long content_no){
		List<ContentBoxVo> list= sqlMapClientTemplate.queryForList("contentBox.selectAllByCno",content_no);
		return list;
	}
	
	public ContentBoxVo selectVo(Long contentBox_no){
		ContentBoxVo contentBoxVo = (ContentBoxVo) sqlMapClientTemplate.queryForObject("contentBox.selectVo", contentBox_no);
		return contentBoxVo;
	}
	public ContentBoxVo getContentBoxNo(Long content_no, Long plan_no){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("plan_no", plan_no);
		map.put("content_no", content_no);
		ContentBoxVo contentBoxVo = (ContentBoxVo) sqlMapClientTemplate.queryForObject("contentBox.getContentBoxNo", map);
		return contentBoxVo;
	}

	public void delete(Long contentBox_no) {
		sqlMapClientTemplate.delete("contentBox.delete", contentBox_no);
	}
	public void deleteContent(Long content_no, Long plan_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("content_no", content_no);
		map.put("plan_no", plan_no);
		
		sqlMapClientTemplate.delete("contentBox.deleteContent", map);
	}
	
	public void update(ContentBoxVo contentBoxVo) {
		sqlMapClientTemplate.update("contentBox.update", contentBoxVo);
	}
}
