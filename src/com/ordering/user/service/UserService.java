package com.ordering.user.service;

import java.util.List;
import java.util.Map;

import com.ordering.user.bean.ConsigneeAddress;
import com.ordering.user.bean.User;

public interface UserService {
	public List<Map<String,Object>> getClassify();
	
	public boolean regist(User user);
	
	public String accountVerification(String accountNumber);
	
	public User login(User user);
	
	public User updateUser(User user);
	
	public boolean updatePassword(String userId,String password);
	
	public boolean addAddress(ConsigneeAddress address);
	
	public List<Map<String,Object>> getAddress(String userId);
	
	public boolean delAddress (String id);
	
	public ConsigneeAddress getOneAddress(String id);
	
	public boolean updateAddress(ConsigneeAddress address);
	
	public List<Map<String,Object>> getBusiness(String id);
	
	public List<Map<String,Object>> getBusinessByBusinessName(String name);
	
}
