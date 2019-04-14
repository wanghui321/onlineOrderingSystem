package com.ordering.business.dao;

import java.util.List;
import java.util.Map;

import com.ordering.business.bean.Business;
import com.ordering.business.bean.Food;
import com.ordering.business.bean.Order;
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
	
	public List<Map<String, Object>> getCommodity(String id);
	
	public boolean addProduct(Food food);
	
	public List<Map<String, Object>> getCommodityByName(String id,String name);
	
	public Food getFoodById(String id,String businessId);
	
	public Food revise(Food food);
	
	public boolean deleteFoodById(Food food);
	
	public List<Order> getOrders(String id,String state);
	
	public List<Map<String,Object>> getFoodByOrders(String id);
	
	public boolean acceptOrder(String id);
	
	public boolean denialOrder(String id);
	
	public List<String> sumList(List<String> datalist,String id);
	
	public List<String> orderList(List<String> datalist,String id);
	
	public boolean setHeadPicture(String head,String id);

	public boolean updateComment(String id, String quantity);

	public Map<String, Object> getCommentstate(String businessId);
}
