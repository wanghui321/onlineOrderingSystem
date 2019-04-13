package com.ordering.user.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ordering.business.bean.Business;
import com.ordering.business.bean.Food;
import com.ordering.user.bean.ConsigneeAddress;
import com.ordering.user.bean.User;
import com.ordering.user.service.UserBusinessService;
import com.ordering.user.service.UserService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("userBusinessController")
public class UserBusinessController {
	
	@Autowired
	private UserBusinessService userBusinessService;
	@Autowired
	private UserService userService;
	
	//获取商家信息
	@RequestMapping("getBusiness")
	@ResponseBody
	public JSONArray getBusiness(String id) {
		List<Map<String,Object>> list = userBusinessService.getBusiness(id);
		JSONArray json = JSONArray.fromObject(list);
		return json;
	}
	
	//根据商家的名称或者商品的名称搜索相关的商店的信息
	@RequestMapping("getBusinessByName")
	public String getBusinessByName(String name,Model model) {
		List<Map<String,Object>> list = userBusinessService.getBusinessByBusinessName(name);
		JSONArray json = JSONArray.fromObject(list);
		model.addAttribute("businessMsg", json);
		return "user/home";
	}
	
	//根据商店的Id获取商店的信息
	@RequestMapping("getBusinessById")
	public String getBusinessById(String id,HttpSession session) {
		Business business = userBusinessService.getBusinessById(id);
		session.setAttribute("business",business);
		String score = userBusinessService.getScore(id);
		session.setAttribute("score", score);
		return "user/businessDetail";
	}
	
	//根据商店的Id获取商店中商品的信息
	@RequestMapping("getFoodByBusinessId")
	@ResponseBody
	public JSONArray getFoodByBusinessId(String id) {
		List<Map<String,Object>> list = userBusinessService.getFoodByBusinessId(id);
		JSONArray json = JSONArray.fromObject(list);
		return json;
	}
	
	//添加商品到该商店的购物车中
	@RequestMapping("addCart")
	@ResponseBody
	public JSONArray addCart(String id,HttpSession session) {
		Food food = userBusinessService.getFoodById(id);
		Business business = (Business)session.getAttribute("business");
		String businessId = business.getBusinessId();
		List<Map<String,Object>> cartList = (List<Map<String, Object>>) session.getAttribute(businessId);
		if(cartList == null) {
			cartList = new ArrayList<Map<String,Object>>();
		}
		Map<String,Object> foodMap = new HashMap<String,Object>();
		foodMap.put("foodId", food.getId());
		foodMap.put("foodName", food.getFoodName());
		foodMap.put("count", "1");
		foodMap.put("price",food.getPrice());
		foodMap.put("totalPrice",food.getPrice());
		cartList.add(foodMap);
		session.setAttribute(businessId, cartList);
		
//		//计算总价格
//		double totalPrice = 0;
//		for(Map<String,Object> map : cartList) {
//			int count = Integer.parseInt(map.get("count").toString());
//			double price = Double.parseDouble(map.get("price").toString());
//			totalPrice += count * price; 
//		}
//		session.setAttribute("totalPrice", totalPrice);
		JSONArray json = JSONArray.fromObject(cartList);
			
		return json;
	}
	
	//获取某个商店中购物车中的信息
	@RequestMapping("getCart")
	@ResponseBody
	public JSONArray getCart(String id,HttpSession session) {
		List<Map<String,Object>> cartList = (List<Map<String, Object>>) session.getAttribute(id);
		if(cartList == null) {
			return null;
		}
		JSONArray json = JSONArray.fromObject(cartList);
		
		return json;
	}
	
	//更改商购物车中商品的数量
	@RequestMapping("changeNumber")
	@ResponseBody
	public JSONArray changeNumber(String businessId,String id,String mark,HttpSession session) {
		List<Map<String,Object>> cartList = (List<Map<String,Object>>) session.getAttribute(businessId);
		List<Map<String,Object>> newCartList = new ArrayList<Map<String,Object>>();
		if(cartList == null || cartList.size() == 0) {
			return null;
		}
		for (Map<String,Object> map : cartList) {
			if(!map.get("foodId").equals(id)) {
				newCartList.add(map);
				continue;
			}
			if(mark.equals("1")) {
				int count = Integer.parseInt(map.get("count").toString());
				double price = Double.parseDouble(map.get("price").toString());
				double totalPrice = Double.parseDouble(map.get("totalPrice").toString());
				count ++;
				totalPrice = count * price;
				Map<String,Object> newMap = new HashMap<String,Object>();
				newMap = map;
				newMap.put("count", count);
				newMap.put("totalPrice", totalPrice);
				
				newCartList.add(newMap);
			}else {
				int count = Integer.parseInt(map.get("count").toString());
				double price = Double.parseDouble(map.get("price").toString());
				double totalPrice = Double.parseDouble(map.get("totalPrice").toString());
				if(count != 1) {
					count --;
					totalPrice = count * price;
					Map<String,Object> newMap = new HashMap<String,Object>();
					newMap = map;
					newMap.put("count", count);
					newMap.put("totalPrice", totalPrice);
					newCartList.add(newMap);
				}
			}
		}
		if(newCartList.size() == 0 || newCartList == null) {
			session.removeAttribute(businessId);
			return null;
		}
		session.setAttribute(businessId, newCartList);
		JSONArray json = JSONArray.fromObject(newCartList);
		
		return json;
	}
	
	//支付订单
	@RequestMapping("pay")
	@ResponseBody
	public JSONArray pay(HttpSession session,String addressId,String totalPrice,String remarke) {
		Business business = (Business)session.getAttribute("business");
		String businessId = business.getBusinessId();
		User user = (User)session.getAttribute("user");
		String userId = user.getUserId();
		//修改客户的余额
		userService.reduce(userId,user.getBalance(),totalPrice);
		double total = Double.parseDouble(totalPrice);
		double newBalance = user.getBalance() - total;
		user.setBalance(newBalance);
		//根据地址Id获取地址的信息
		ConsigneeAddress address = userService.getAddressById(addressId);
		//向订单表中添加基本信息
		String orderId = userBusinessService.addToOrder(address,userId,businessId,remarke,totalPrice);
		//获取购物车中的信息
		List<Map<String,Object>> cartList = (List<Map<String,Object>>) session.getAttribute(businessId);
		//向中间表添加数据
		boolean flag = userBusinessService.addToOrderFood(cartList,orderId);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "true");
		JSONArray json = JSONArray.fromObject(map);
		session.removeAttribute(businessId);
		return json;
	}
	
	//删除购物车中的信息
	@RequestMapping("deleteCart")
	@ResponseBody
	public JSONArray deleteCart(HttpSession session) {
		Business business = (Business)session.getAttribute("business");
		String businessId = business.getBusinessId();
		List<Map<String,Object>> cartList = (List<Map<String,Object>>) session.getAttribute(businessId);
		session.removeAttribute(businessId);
		JSONArray json = JSONArray.fromObject(cartList);
		return json;
	}
	
	//获得我的订单
	@RequestMapping("getMyOrder")
	@ResponseBody
	public JSONArray getMyOrder(HttpSession session) {
		User user = (User)session.getAttribute("user");
		List<Map<String,Object>> orderList = userBusinessService.getMyOrder(user.getUserId());
		if(orderList.size() > 0) {
			JSONArray json = JSONArray.fromObject(orderList);
			return json;
		} else {
			return null;
		}
	}
	
	//获取订单中的商品信息
	@RequestMapping("getFoodDetail")
	@ResponseBody
	public JSONArray getFoodDetail(String orderId) {
		List<Map<String,Object>> list = userBusinessService.getFoodDetail(orderId);
		JSONArray json = JSONArray.fromObject(list);
		return json;
	}
	
	//获取订单的基本信息
	@RequestMapping("getOrderDetail")
	@ResponseBody
	public JSONArray getOrderDetail(String orderId) {
		Map<String,Object> map = userBusinessService.getOrderDetail(orderId);
		JSONArray json = JSONArray.fromObject(map);
		return json;
	}
	
	//改变订单状态
	@RequestMapping("updateOrder")
	public String updateOrder(String orderId,String state,Model model,HttpSession session) {
		User user = (User)session.getAttribute("user");
		double balance = user.getBalance();
		String userId = user.getUserId();
		double newBalance = userBusinessService.updateOrder(orderId,state,balance,userId);
		if(balance != newBalance) {
			model.addAttribute("msg","时间超过五分钟，已无法取消，如要取消，请于商家联系");
			user.setBalance(newBalance);
		}
		return "user/myOrder";
	}
	
	//添加评论
	@RequestMapping("addComment")
	@ResponseBody
	public JSONArray addComment(String orderId,String score,String comment,HttpSession session) {
		User user = (User)session.getAttribute("user");
		String userId = user.getUserId();
		boolean flag = userBusinessService.addComment(orderId,score,comment,userId);
		if(flag){
			JSONArray json = new JSONArray();
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("msg", "true");
			json.fromObject(map);
			return json;
		}
		return null;
	}
	
	//获取评论内容
	@RequestMapping("getComment")
	@ResponseBody
	public JSONArray getComment(HttpSession session) {
		Business business = (Business)session.getAttribute("business");
		List<Map<String,Object>> list = userBusinessService.getComment(business.getBusinessId());
		JSONArray json = JSONArray.fromObject(list);
		return json;
	}
	
	
	
	
	
	
	
	
	
}
