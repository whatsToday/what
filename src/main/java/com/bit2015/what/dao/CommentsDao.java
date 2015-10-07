package com.bit2015.what.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit2015.what.vo.CommentsVo;
import com.bit2015.what.vo.MemberVo;

@Repository
public class CommentsDao {
	
	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;
	
	public List<CommentsVo> selectAll(){
		List<CommentsVo> list= sqlMapClientTemplate.queryForList("comments.selectAll");
		return list;
	}
	
	
	  public List<CommentsVo> select(int page, int limit) {
			Map<String, Integer> map = new HashMap<String, Integer>();
			int startRow = (page - 1) * limit + 1; 
			int endRow = startRow + limit - 1; 
			map.put("startpage", startRow);
			map.put("endpage", endRow);
			List<CommentsVo> list =sqlMapClientTemplate.queryForList("comments.commentsList",map);
			System.out.println("리스트"+list);
			System.out.println("맵"+map);
			return list;
		}
	  
	  public int commentsCountList() {
			int count = 0;
			count = (Integer) sqlMapClientTemplate.queryForObject("comment.commentCountList");


			return count;
		}
	
	
	
	
	
	public List<CommentsVo> selectAllByCno(Long content_no){
		List<CommentsVo> list= sqlMapClientTemplate.queryForList("comments.selectAllByCno",content_no);
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
