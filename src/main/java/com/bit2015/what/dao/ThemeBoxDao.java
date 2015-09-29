package com.bit2015.what.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit2015.what.vo.ThemeBoxVo;


@Repository
public class ThemeBoxDao {

	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;
	
	public void insert(ThemeBoxVo themeBoxVo){
		sqlMapClientTemplate.insert("themeBox.insert", themeBoxVo);
	}
	
	@SuppressWarnings("unchecked")
	public List<ThemeBoxVo> selectAll(){
		List<ThemeBoxVo> list= sqlMapClientTemplate.queryForList("themeBox.selectAll");
		return list;
	}
	
	public List<ThemeBoxVo> selectAllByMm(Long member_no){
		List<ThemeBoxVo> list= sqlMapClientTemplate.queryForList("themeBox.selectAllByMm",member_no);
		return list;
	}
	
	public ThemeBoxVo selectVo(Long themeBox_no){
		ThemeBoxVo themeBoxVo = (ThemeBoxVo) sqlMapClientTemplate.queryForObject("themeBox.selectVo", themeBox_no);
		return themeBoxVo;
	}

	public void delete(Long themeBox_no) {
		sqlMapClientTemplate.delete("themeBox.delete", themeBox_no);
	}
	public void deleteMember(Long member_no) {
		sqlMapClientTemplate.delete("themeBox.deleteMember", member_no);
	}

	
	public void update(ThemeBoxVo themeBoxVo) {
		sqlMapClientTemplate.update("themeBox.update", themeBoxVo);
	}
}
