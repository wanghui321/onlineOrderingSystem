package com.ordering.business.dao;

import java.util.List;
import java.util.Map;

import com.ordering.business.bean.Business;
import com.ordering.user.bean.User;

public interface businessDao {
	public Map<String,String> getState(String id);
	
	public boolean regist(Business business);
	
	public Business login(Business business);
	
	public int accountVerification(String accountNumber);
	
	public Map<String,String> getCommentState(String id);

	public Map<String, String> getsales(String id);
	
	public Business getBusiness(String businessId);
	
	public boolean updateBusiness(Business business);
	
	public boolean updateQualification(Business business);
	
	public boolean updatePassword(String businessId, String password);
}
