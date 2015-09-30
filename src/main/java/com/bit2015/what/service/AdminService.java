package com.bit2015.what.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit2015.what.dao.MemberDao;
import com.bit2015.what.util.FileUploader;
import com.bit2015.what.vo.MemberVo;

@Service
public class AdminService {
 @Autowired
  MemberDao memberDao;
 
 // 파일올리는거야
 FileUploader ful=new FileUploader();
 
 // 회원가입한 사람들 불러오기
  public List<MemberVo> selectMember(){
	 List<MemberVo> memberList = memberDao.selctAll();
	 System.out.println("지금 가입한사람"+memberList);
	 return memberList;
  }
 
 
}