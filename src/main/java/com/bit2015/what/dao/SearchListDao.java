package com.bit2015.what.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit2015.what.vo.SearchListVo;

@Repository
public class SearchListDao {
  @Autowired
  SqlMapClientTemplate sqlMapClientTemplate;
  
  public List<SearchListVo> selectAll(){
	  List<SearchListVo> list = sqlMapClientTemplate.queryForList("searchList.selectAll");
	  return list;
  }
  public void insert(SearchListVo searchListVo){
	  sqlMapClientTemplate.insert("searchList.insert",searchListVo);
  }
  public void delete(long searchList_no){
	  sqlMapClientTemplate.delete("searchList.delete",searchList_no);
  }
}
