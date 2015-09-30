package com.bit2015.what.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.bit2015.what.dao.MemberDao;
import com.bit2015.what.dao.PlanDao;
import com.bit2015.what.util.FileUploader;
import com.bit2015.what.vo.MemberVo;
import com.bit2015.what.vo.PlanVo;

@Service
public class AdminService {
 @Autowired
  MemberDao memberDao;
 @Autowired
 PlanDao planDao;
 
 // 파일올리는거야
 FileUploader ful=new FileUploader();
 
 // 회원가입한 사람들 불러오기
  public List<MemberVo> selectMember(){
	 List<MemberVo> memberList = memberDao.selctAll();
	 System.out.println("지금 가입한사람"+memberList);
	 return memberList;
  }
// 회원가입 추가 
  public void insertMember(MemberVo memberVo,MultipartFile img){
	  if(img == null){
		  memberVo.setImageUrl("");
	  }else{
		  String member_img_url=ful.upload(img);
		  memberVo.setImageUrl(member_img_url);
	  }
	  memberDao.insert(memberVo);
  }
  // 회원 강제 삭제
  public void deleteMember(Long member_no){
	  memberDao.delete(member_no);
	  System.out.println("삭제"+ member_no);  
  }
  
  // plan 조회
  public List<PlanVo> selectPlan(){
	  List<PlanVo> planList = planDao.selectAll();
	  System.out.println("현재 전체 플랜"+planList);
	  return planList;
  }
  //plan 등록 
  public void insertPlan( PlanVo planVo,MultipartFile titleImage){

	  System.out.println("planVo"+planVo);
	  if(titleImage == null){
		  planVo.setTitleImage("");
	  }else{
		  String member_img_url=ful.upload(titleImage);
		  planVo.setTitleImage(member_img_url);
	  }
	  System.out.println(planVo.toString());
	  planDao.insert(planVo);
  }
  // plan 삭제 
  public void deletePlan(Long plan_no){
	  planDao.delete(plan_no);
  }
 
}