package com.ordering.user.service;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ordering.business.bean.Business;
import com.ordering.business.bean.Comment;
import com.ordering.business.bean.Food;
import com.ordering.business.bean.Order;
import com.ordering.business.bean.OrderFood;
import com.ordering.user.bean.ConsigneeAddress;
import com.ordering.user.bean.User;
import com.ordering.user.dao.UserBusinessDao;
import com.ordering.user.dao.UserDao;

@Service
public class UserBusinessServiceImpl implements UserBusinessService {

	@Autowired
	private UserBusinessDao userBusinessDao;
	@Autowired
	private UserDao userDao;
	
	//获得商家信息
	@Override
	public List<Map<String, Object>> getBusiness(String id) {
		// TODO Auto-generated method stub
		List<Map<String,Object>> list = userBusinessDao.getBusiness(id);
		return list;
	}

	//根据商店的名称获取商家的信息
	@Override
	public List<Map<String, Object>> getBusinessByBusinessName(String name) {
		// TODO Auto-generated method stub
		List<Map<String,Object>> businessList = userBusinessDao.getBusinessByBusinessName(name);
		List<Map<String,Object>> foodList = userBusinessDao.getBusinessByFoodName(name); 
		businessList.removeAll(foodList);
		businessList.addAll(foodList);
		return businessList;
	}

	//根据商店的Id获取商店的信息
	@Override
	public Business getBusinessById(String id) {
		// TODO Auto-generated method stub
		Business business = userBusinessDao.getBusinessById(id);
		return business;
	}

	//根据商店的Id获取商店中商品的信息
	@Override
	public List<Map<String, Object>> getFoodByBusinessId(String id) {		
		// TODO Auto-generated method stub
		List<Map<String,Object>> list = userBusinessDao.getFoodByBusinessId(id);
		return list;
	}

	//商家商品的Id获取商品的相关信息
	@Override
	public Food getFoodById(String id) {
		// TODO Auto-generated method stub
		Food food = userBusinessDao.getFoodById(id);
		return food;
	}

	@Override
	public String addToOrder(ConsigneeAddress address, String userId, String businessId, String remarke,String totalPrice) {
		// TODO Auto-generated method stub
				Order order = new Order();
				String uuid = UUID.randomUUID().toString().replaceAll("-","");
				order.setId(uuid);
				order.setAddress(address.getAddress());
				order.setBusinessId(businessId);
				//获取当前时间
				Date date = new Date(); 
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				order.setData(dateFormat.format(date));
				order.setName(address.getName());
				order.setPhone(address.getPhone());
				order.setRemake(remarke);
				order.setSex(address.getSex());
				order.setState("0");
				order.setTotalPrice(totalPrice);
				order.setUserId(userId);
				boolean flag = userBusinessDao.addToOrder(order);
				if(flag) {
					return order.getId();
				}
				return "";
	}

	@Override
	public boolean addToOrderFood(List<Map<String, Object>> cartList, String orderId) {
		// TODO Auto-generated method stub
		for (Map<String,Object> map : cartList) {
			OrderFood orderFood = new OrderFood();
			String uuid = UUID.randomUUID().toString().replaceAll("-","");
			orderFood.setId(uuid);
			orderFood.setFoodId(map.get("foodId").toString());
			orderFood.setNumber(map.get("count").toString());
			orderFood.setOrderId(orderId);
			userBusinessDao.addToOrderFood(orderFood);
		}
		return true;
	}

	//
	@Override
	public List<Map<String, Object>> getMyOrder(String userId) {
		// TODO Auto-generated method stub
		//根据用户Id获取所有用户的订单信息
		List<Map<String,Object>> list = userBusinessDao.getMyOrder(userId);
		List<Map<String,Object>> orderList = new ArrayList<Map<String,Object>>();
		for (Map<String,Object> map : list) {
			Map<String,Object> orderMap = new HashMap<String,Object>();
			orderMap.put("id", map.get("Id").toString());
			Business business = userBusinessDao.getBusinessById(map.get("businessId").toString());
			orderMap.put("businessName", business.getNickName().toString());
			orderMap.put("data", map.get("data"));
			String state = map.get("state").toString();
			switch(state) {
			case "0":
				orderMap.put("state", "新订单");
				break;
			case "1":
				orderMap.put("state", "待配送");
				break;
			case "2":
				orderMap.put("state", "已催单");
				break;
			case "3":
				orderMap.put("state", "已取消");
				break;
			case "4":
				orderMap.put("state", "已完成");
				break;
			case "5":
				orderMap.put("state", "商家以拒绝");
				break;
			case "6":
				orderMap.put("state", "待配送");
				break;
			case "7":
				orderMap.put("state", "已评论");
				break;
			}
			orderMap.put("totalPrice",map.get("totalPrice").toString());
			orderList.add(orderMap);
		} 
		return orderList;
	}

	//根据orderId获取订单中的商品信息
	@Override
	public List<Map<String, Object>> getFoodDetail(String orderId) {
		// TODO Auto-generated method stub
		List<Map<String,Object>> list = userBusinessDao.getFoodDetail(orderId);
		List<Map<String,Object>> orderList = new ArrayList<Map<String,Object>>();
		for (Map<String,Object> map : list) {
			Map<String,Object> orderMap  = new HashMap<String,Object>();
			int number = Integer.parseInt(map.get("number").toString());
			orderMap.put("number", number);
			String foodId = map.get("foodId").toString();
			Food food = userBusinessDao.getFoodById(foodId);
			double price = food.getPrice();
			double totalPrice = number*price;
			orderMap.put("totalPrice", totalPrice);
			orderMap.put("foodName", food.getFoodName());
			orderList.add(orderMap);
		}
		return orderList;
	}

	//获取订单的基本信息
	@Override
	public Map<String, Object> getOrderDetail(String orderId) {
		// TODO Auto-generated method stub
		Order order = userBusinessDao.getOrderDetail(orderId);
		Map<String,Object> map = new HashMap<String,Object>();
		if(order.getRemake() == null || order.getRemake().equals("")) {
			map.put("remake", "无备注信息");
		} else {
			map.put("remake", order.getRemake());
		}
		map.put("name", order.getName());
		map.put("address", order.getAddress());
		map.put("phone", order.getPhone());
		map.put("data", order.getData());
		map.put("totalPrice", order.getTotalPrice());
		map.put("state", order.getState());
		return map;
	}

	//确认收货
	@Override
	public double updateOrder(String orderId,String state,double balance,String userId) {
		// TODO Auto-generated method stub
		double newBalance = userBusinessDao.updateOrder(orderId,state,balance,userId);
		return newBalance;
	}

	//添加评论
	@Override
	public boolean addComment(String orderId, String score, String comment, String userId) {
		// TODO Auto-generated method stub
		Comment com = new Comment();
		com.setContent(comment);
		String uuid = UUID.randomUUID().toString().replaceAll("-","");
		com.setId(uuid);
		com.setLevel(Integer.parseInt(score));
		com.setState("0");
		com.setUserId(userId);
		Order order = userBusinessDao.getOrderDetail(orderId);
		String businessId = order.getBusinessId();
		com.setBusinessId(businessId);
		Date date = new Date(); 
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		com.setData(dateFormat.format(date));
		//添加评论
		boolean flag = userBusinessDao.addComment(com);
		//修改订单状态为已评论
		userBusinessDao.updateHaveComment(orderId);
		return flag;
	}

	//获取商店的评论信息
	@Override
	public List<Map<String, Object>> getComment(String businessId) {
		// TODO Auto-generated method stub
		List<Map<String,Object>> list = userBusinessDao.getComment(businessId);
		List<Map<String,Object>> commentList = new ArrayList<Map<String,Object>>();
		for(Map<String,Object> map : list) {
			Map<String,Object> commentMap = new HashMap<String,Object>();
			commentMap = map;
			String userId = map.get("userId").toString();
			User user = userDao.getUser(userId);
			commentMap.put("userName", user.getNickName());
			commentList.add(commentMap);
		}
		return commentList;
	}

	//获取商店评分
	@Override
	public String getScore(String id) {
		// TODO Auto-generated method stub
		Map<String,Object> map = userBusinessDao.getCommentNumber(id);
		int count = Integer.parseInt(map.get("count").toString());
		double sum = Double.parseDouble(map.get("sum").toString());
		double dou = sum/count;
		DecimalFormat df = new DecimalFormat("0.0");//格式化小数，不足的补0
		String score = df.format(dou);
		return score;
	}

}
