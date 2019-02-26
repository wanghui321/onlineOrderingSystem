package com.ordering.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ordering.user.dao.UserDao;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
	
	public List<Map<String,Object>> getData() {
		List<Map<String,Object>> list = userDao.getData();
		return list;
	}
}
