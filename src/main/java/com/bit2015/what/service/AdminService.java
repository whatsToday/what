package com.bit2015.what.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit2015.what.dao.CommentsDao;
import com.bit2015.what.dao.ContentBoxDao;
import com.bit2015.what.dao.ContentDao;
import com.bit2015.what.dao.FollowDao;
import com.bit2015.what.dao.GoodContentDao;
import com.bit2015.what.dao.GoodPlanDao;
import com.bit2015.what.dao.MemberDao;
import com.bit2015.what.dao.PlanDao;
import com.bit2015.what.dao.PlanImgDao;
import com.bit2015.what.dao.SearchListDao;
import com.bit2015.what.dao.ThemeBoxDao;
import com.bit2015.what.dao.ThemeDao;
import com.bit2015.what.dao.planCommentsDao;

@Service
public class AdminService {
  @Autowired
   CommentsDao commentsDao;
  @Autowired
  ContentBoxDao contentBoxDao;
  @Autowired
  ContentDao contentDao;
  @Autowired
  FollowDao followDao;
  @Autowired
  GoodContentDao goodContentDao;
  @Autowired
  GoodPlanDao goodPlanDao;
  @Autowired
  MemberDao memberDao;
  @Autowired
  planCommentsDao planCommentsDao;
  @Autowired
  PlanImgDao planImgDao;
  @Autowired
  PlanDao planDao;
  @Autowired
  SearchListDao searchListDao;
  @Autowired
  ThemeBoxDao themeBoxDao;
  @Autowired
  ThemeDao themeDao;
  
  
  
}
