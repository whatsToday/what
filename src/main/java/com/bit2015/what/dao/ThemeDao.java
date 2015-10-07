package com.bit2015.what.dao;

import java.util.List;






import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit2015.what.vo.ThemeBoxVo;
import com.bit2015.what.vo.ThemeVo;

@Repository
public class ThemeDao {

	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;
	
	public List<ThemeVo> selectAll(){
		List<ThemeVo> list= sqlMapClientTemplate.queryForList("theme.selectAll");
		return list;
	}
	
	public ThemeVo selectVo(Long theme_no){
		ThemeVo vo = (ThemeVo) sqlMapClientTemplate.queryForObject("theme.selectVo", theme_no);
		return vo;
	}
	public ThemeVo getNo(String themeName){
		ThemeVo vo = (ThemeVo) sqlMapClientTemplate.queryForObject("theme.getNo", themeName);
		return vo;
	}
	
	public void insert(ThemeVo themeVo){
		sqlMapClientTemplate.insert("theme.insert", themeVo);
	}

	public void delete(long theme_no) {
		sqlMapClientTemplate.delete("theme.delete", theme_no);
	}
	
	public void update(ThemeVo themeVo) {
		sqlMapClientTemplate.update("theme.update", themeVo);
	}
	
	 public ThemeVo getThemeName(Long theme_no){
		 ThemeVo themeVo = (ThemeVo) sqlMapClientTemplate.queryForObject("theme.getThemeName", theme_no);
		  return themeVo;
	  }

	public List<ThemeVo> selectSearch(String text) {
		List<ThemeVo> list= sqlMapClientTemplate.queryForList("theme.selectSearch",text);
		return list;
		
	}
}
