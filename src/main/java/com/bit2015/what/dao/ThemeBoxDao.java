package com.bit2015.what.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit2015.what.vo.MemberVo;
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
	
	  public List<ThemeBoxVo> select(int page, int limit) {
			Map<String, Integer> map = new HashMap<String, Integer>();
			int startRow = (page - 1) * limit + 1; 
			int endRow = startRow + limit - 1; 
			map.put("startpage", startRow);
			map.put("endpage", endRow);
			List<ThemeBoxVo> list =sqlMapClientTemplate.queryForList("themeBox.themeBoxList",map);
			System.out.println("리스트"+list);
			System.out.println("맵"+map);
			return list;
		}
	  
	  public int themeBoxCountList() {
			int count = 0;
			count = (Integer) sqlMapClientTemplate.queryForObject("themeBox.themeBoxCountList");


			return count;
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
