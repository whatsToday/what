package com.bit2015.what.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit2015.what.vo.CommentsVo;

@Repository
public class CommentsDao {
	
	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;
	
	public List<CommentsVo> selectAll(){
		List<CommentsVo> list= sqlMapClientTemplate.queryForList("comments.selectAll");
		return list;
	}
	
	public CommentsVo selectVo(Long content_no ) {
		CommentsVo vo = (CommentsVo) sqlMapClientTemplate.queryForObject("comments.selectVo",content_no);
		return vo;
	}	
	
	public void insert(CommentsVo commentsVo) {
        sqlMapClientTemplate.insert("comments.insert",commentsVo);		
}

	public void delete(long comments_no) {
	   sqlMapClientTemplate.delete("comments.delete",comments_no);
}
}
