package com.bit2015.what.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit2015.what.vo.GoodPlanVo;
import com.bit2015.what.vo.MemberVo;

@Repository
public class GoodPlanDao {
	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;

	public List<GoodPlanVo> selectAll() {
		List<GoodPlanVo> list = sqlMapClientTemplate.queryForList("goodPlan.selectAll");
		return list;
	}

	public List<GoodPlanVo> select(int page, int limit) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		int startRow = (page - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		map.put("startpage", startRow);
		map.put("endpage", endRow);
		List<GoodPlanVo> list = sqlMapClientTemplate.queryForList("goodPlan.goodPlanList", map);
		System.out.println("리스트" + list);
		System.out.println("맵" + map);
		return list;
	}

	public int goodPlanCountList() {
		int count = 0;
		count = (Integer) sqlMapClientTemplate.queryForObject("goodPlan.goodPlanCountList");
		return count;
	}

	public void insert(GoodPlanVo goodPlanVo) {
		sqlMapClientTemplate.insert("goodPlan.insert", goodPlanVo);
	}

	public void delete(Long goodPlan_no) {
		sqlMapClientTemplate.delete("goodPlan.delete", goodPlan_no);
	}

}
