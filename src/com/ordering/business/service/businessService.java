package com.ordering.business.service;

import java.util.List;
import java.util.Map;

import com.ordering.business.bean.Business;
import com.ordering.user.bean.User;

public interface businessService {
	public Map<String,String> getState();
	
	public boolean regist(Business business);
	
	public Business login(Business business);
}