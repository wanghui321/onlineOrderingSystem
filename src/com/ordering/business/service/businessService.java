package com.ordering.business.service;

import java.util.List;
import java.util.Map;

import com.ordering.business.bean.Business;
import com.ordering.business.bean.Food;
import com.ordering.business.bean.Order;
import com.ordering.user.bean.User;

public interface businessService {
	public Map<String,String> getState(String id);
	
	public boolean regist(Business business);
	
	public Business login(Business business);
	
	public String accountVerification(String accountNumber);
	
	public Map<String,String> getCommentState(String id);

	public Map<String, String> getsales(String id);
	
	public Business updateBusiness(Business business);
	
	public Business updateQualification(Business business);
	
	public boolean updatePassword(String businessId,String password);
	
	public List<Map<String,Object>> getCommodity(String id);
	
	public boolean addProduct(Food food);
	
	public List<Map<String,Object>> getCommodityByName(String id,String name);
	
	public Food getFoodById(String id,String businessId);
	
	public Food revise(Food food);
	
	public boolean deleteFoodById(Food food);
	
	public List<Order> getOrders(String id,String state);
	
	public List<Map<String,Object>> getFoodByOrders(String id);
	
	public boolean acceptOrder(String id);
	
	public boolean denialOrder(String id);
}
