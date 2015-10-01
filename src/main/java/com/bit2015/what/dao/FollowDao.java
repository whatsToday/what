package com.bit2015.what.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit2015.what.vo.FollowVo;

@Repository
public class FollowDao {
    @Autowired
    SqlMapClientTemplate sqlMapClientTemplate;
    
    public List<FollowVo> selectAll(){
    	List<FollowVo> list = sqlMapClientTemplate.queryForList("follow.selectAll");
    	return list;
    }
    public void insert(FollowVo followVo){
    	sqlMapClientTemplate.insert("follow.insert",followVo);
    }
    public void delete(long follow_no){
    	sqlMapClientTemplate.delete("follow.delete",follow_no);
    }
}
