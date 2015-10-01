package com.bit2015.what.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit2015.what.vo.GoodContentVo;

@Repository
public class GoodContentDao {

	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;
	
	public void insert(GoodContentVo goodContentVo){
		sqlMapClientTemplate.insert("goodContent.insert", goodContentVo);
	}
	
	@SuppressWarnings("unchecked")
	public List<GoodContentVo> selectAll(){
		List<GoodContentVo> list = sqlMapClientTemplate.queryForList("goodContent.selectAll");
		return list;
	}
	
	public GoodContentVo selectVoCnoMno(Long content_no, Long member_no){
		Map<String, Long> map = new HashMap<String, Long>();
		map.put( "content_no", content_no );
		map.put( "member_no", member_no );
		GoodContentVo goodContentVo = (GoodContentVo) sqlMapClientTemplate.queryForObject("goodContent.selectVoCnoMno", map);
		return goodContentVo;
	}
	
	public void delete(Long goodContent_no) {
		sqlMapClientTemplate.delete("goodContent.delete", goodContent_no);
	}
	
	public List<GoodContentVo> selectAllByCno(Long content_no) {
		List<GoodContentVo> list=sqlMapClientTemplate.queryForList("goodContent.selectAllByCno", content_no);
		return list;
	}public List<GoodContentVo> selectMno(Long member_no) {
		List<GoodContentVo> list=sqlMapClientTemplate.queryForList("goodContent.selectVoMno", member_no);
		return list;
	}
	
}
