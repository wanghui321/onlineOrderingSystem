package com.ordering.user.service;

import java.util.List;
import java.util.Map;

import com.ordering.business.bean.Business;
import com.ordering.business.bean.Food;
import com.ordering.user.bean.ConsigneeAddress;

public interface UserBusinessService {
	
	public List<Map<String,Object>> getBusiness(String id);
	
	public List<Map<String,Object>> getBusinessByBusinessName(String name);

	public Business getBusinessById(String id);

	public List<Map<String, Object>> getFoodByBusinessId(String id);

	public Food getFoodById(String id);

	public String addToOrder(ConsigneeAddress address, String userId, String businessId, String remarke, String totalPrice);

	public boolean addToOrderFood(List<Map<String, Object>> cartList, String orderId);

	public List<Map<String, Object>> getMyOrder(String userId);

	public List<Map<String, Object>> getFoodDetail(String orderId);

	public Map<String, Object> getOrderDetail(String orderId);

	public double updateOrder(String orderId,String state,double balance,String userId);

	public boolean addComment(String orderId, String score, String comment, String userId);

	public List<Map<String, Object>> getComment(String businessId);

	public String getScore(String id);
}
