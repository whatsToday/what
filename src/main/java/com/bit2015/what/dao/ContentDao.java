package com.bit2015.what.dao;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit2015.what.vo.ContentVo;


@Repository
public class ContentDao {
  
	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;
	
	public List<ContentVo> selectAll(){
		List<ContentVo> list= sqlMapClientTemplate.queryForList("content.selectAll");
		return list;
	}

	public ContentVo selectVo(Long content_no ) {
		ContentVo vo = (ContentVo) sqlMapClientTemplate.queryForObject("content.selectVo",content_no);
		return vo;
	}
	public void insert(ContentVo contentVo){
		sqlMapClientTemplate.insert("content.insert", contentVo);
	}

	public void delete(long content_no) {
		sqlMapClientTemplate.delete("content.delete",content_no);
		
	}

	public void update(ContentVo contentVo) {
		sqlMapClientTemplate.update("content.update", contentVo);

	}
	public ContentVo selectVoById(String id) {
		ContentVo vo = (ContentVo) sqlMapClientTemplate.queryForObject("content.selectVoById",id);
		return vo;
	}
	public List<ContentVo> selectContentByTheme(Long theme_no){
		List<ContentVo> list= sqlMapClientTemplate.queryForList("content.selectContentByTheme", theme_no);
		return list;
	}
	public List<ContentVo> selectAllByDist(Long lat, Long lng, Long distance){
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("lat", lat);
		map.put("lng", lng);
		map.put("distance", distance);
		
		List<ContentVo> list= sqlMapClientTemplate.queryForList("content.selectAllByDist", map);
		return list;
	}
	public List<ContentVo> selectAllNear(Double lat, Double lng, double d){
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("lat", lat);
		map.put("lng", lng);
		map.put("distance", d);
		
		List<ContentVo> list= sqlMapClientTemplate.queryForList("content.selectAllNear", map);
		return list;
	}
}
