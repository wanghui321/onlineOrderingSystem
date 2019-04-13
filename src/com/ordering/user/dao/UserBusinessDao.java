package com.ordering.user.dao;

import java.util.List;
import java.util.Map;

import com.ordering.business.bean.Business;
import com.ordering.business.bean.Comment;
import com.ordering.business.bean.Food;
import com.ordering.business.bean.Order;
import com.ordering.business.bean.OrderFood;

public interface UserBusinessDao {
	public List<Map<String, Object>> getBusiness(String id);

	public List<Map<String, Object>> getBusinessByBusinessName(String name);

	public List<Map<String, Object>> getBusinessByFoodName(String name);

	public Business getBusinessById(String id);

	public List<Map<String, Object>> getFoodByBusinessId(String id);

	public Food getFoodById(String id);

	public boolean addToOrder(Order order);

	public void addToOrderFood(OrderFood orderFood);

	public List<Map<String, Object>> getMyOrder(String userId);

	public List<Map<String, Object>> getFoodDetail(String orderId);

	public Order getOrderDetail(String orderId);

	public double updateOrder(String orderId,String state,double balance,String userId);

	public boolean addComment(Comment com);

	public void updateHaveComment(String orderId);

	public List<Map<String, Object>> getComment(String businessId);

	public Map<String,Object> getCommentNumber(String id);
}
