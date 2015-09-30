package com.bit2015.what.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit2015.what.dao.CommentsDao;

@Service
public class AdminService {
  @Autowired
  CommentsDao commentDao;
}
