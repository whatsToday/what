package com.bit2015.what.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit2015.what.vo.EventVo;

@Repository
public class EventDao {
	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;

	public List<EventVo> selectAll() {
		List<EventVo> list = sqlMapClientTemplate.queryForList("event.selectAll");
		return list;
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
