package com.bit2015.what.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public List<FollowVo> selectUser(Long member_no){
    	List<FollowVo> list = sqlMapClientTemplate.queryForList("follow.selectUser", member_no);
    	return list;
    }
    public List<FollowVo> selectMe(Long followNum){
    	List<FollowVo> list = sqlMapClientTemplate.queryForList("follow.selectMe", followNum);
    	return list;
    }
    public List<FollowVo> selectFollow(Long followNum, Long member_no){
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("followNum", followNum);
    	map.put("member_no", member_no);
    	List<FollowVo> list = sqlMapClientTemplate.queryForList("follow.selectFollow", map);
    	return list;
    }
    public void insert(FollowVo followVo){
    	sqlMapClientTemplate.insert("follow.insert",followVo);
    }
    public void delete(long follow_no){
    	sqlMapClientTemplate.delete("follow.delete",follow_no);
    }
    public void unFollow(long following, long follower){
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("following", following);
    	map.put("follower", follower);
    	
    	sqlMapClientTemplate.delete("follow.unFollow",map);
    }
}
