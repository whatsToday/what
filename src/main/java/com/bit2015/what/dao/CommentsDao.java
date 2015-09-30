package com.bit2015.what.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit2015.what.vo.CommentsVo;

@Repository
public class CommentsDao {
	
	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;
	
	public CommentsVo selectVo(Long content_no ) {
		CommentsVo vo = (CommentsVo) sqlMapClientTemplate.queryForObject("comments.selectVo",content_no);
		return vo;
	}	
}
