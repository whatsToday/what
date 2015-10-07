package com.bit2015.what.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit2015.what.vo.MemberVo;
import com.bit2015.what.vo.SearchListVo;

@Repository
public class SearchListDao {
  @Autowired
  SqlMapClientTemplate sqlMapClientTemplate;
  
  public List<SearchListVo> selectAll(){
	  List<SearchListVo> list = sqlMapClientTemplate.queryForList("searchList.selectAll");
	  return list;
  }
  public List<SearchListVo> select(int page, int limit) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		int startRow = (page - 1) * limit + 1; 
		int endRow = startRow + limit - 1; 
		map.put("startpage", startRow);
		map.put("endpage", endRow);
		List<SearchListVo> list =sqlMapClientTemplate.queryForList("searchList.searchList",map);
		System.out.println("리스트"+list);
		System.out.println("맵"+map);
		return list;
	}
  
  public int searchListCountList() {
		int count = 0;
		count = (Integer) sqlMapClientTemplate.queryForObject("searchList.searchListCountList");


		return count;
	}
  
  public void insert(SearchListVo searchListVo){
	  sqlMapClientTemplate.insert("searchList.insert",searchListVo);
  }
  public void delete(long searchList_no){
	  sqlMapClientTemplate.delete("searchList.delete",searchList_no);
  }
  public List<SearchListVo> selectAllByLoc(Double lat, Double lng, Double distance) {
	  Map<String, Object> map= new HashMap<String, Object>();
		map.put("lat", lat);
		map.put("lng", lng);
		map.put("distance", distance);
		
	  List<SearchListVo> list = sqlMapClientTemplate.queryForList("searchList.selectAllByLoc", map);
	  return list;
  }
  
  public List<String> selectHotKey(Double lat, Double lng, Double distance) {
	  Map<String, Object> map= new HashMap<String, Object>();
		map.put("lat", lat);
		map.put("lng", lng);
		map.put("distance", distance);
		
	  List<String> list = sqlMapClientTemplate.queryForList("searchList.selectHotKey", map);
	  return list;
  }
  
}
