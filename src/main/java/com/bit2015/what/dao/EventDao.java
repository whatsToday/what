package com.bit2015.what.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit2015.what.vo.EventVo;
import com.bit2015.what.vo.MemberVo;

@Repository
public class EventDao {
	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;

	public List<EventVo> selectAll() {
		List<EventVo> list = sqlMapClientTemplate.queryForList("event.selectAll");
		return list;
	}
	
	  public List<EventVo> select(int page, int limit) {
			Map<String, Integer> map = new HashMap<String, Integer>();
			int startRow = (page - 1) * limit + 1; 
			int endRow = startRow + limit - 1; 
			map.put("startpage", startRow);
			map.put("endpage", endRow);
			List<EventVo> list =sqlMapClientTemplate.queryForList("event.eventList",map);
			return list;
		}
	  
	  public int eventCountList() {
			int count = 0;
			count = (Integer) sqlMapClientTemplate.queryForObject("event.eventCountList");


			return count;
		}
	

	public void insert(EventVo eventVo) {
		sqlMapClientTemplate.insert("event.insert", eventVo);
	}

	public void delete(long event_no) {
		sqlMapClientTemplate.delete("event.delete", event_no);
	}
	
	public boolean checkEvents(Long content_no){
		List<EventVo> list =  sqlMapClientTemplate.queryForList("event.selectVoByCno", content_no);
		if(list.isEmpty()){
			return false;
		}else{
			return true;
		}
	}

	public List<EventVo> selectVoByCno(Long content_no) {
		List<EventVo> eventList =  sqlMapClientTemplate.queryForList("event.selectVoByCno", content_no);
		return eventList;
	}
	
	public List<EventVo> selectAllById(String id) {
		List<EventVo> eventList =  sqlMapClientTemplate.queryForList("event.selectAllById", id);
		return eventList;
	}

}
