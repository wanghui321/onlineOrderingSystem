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
import com.ordering.user.service.UserBusinessService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("userBusinessController")
public class UserBusinessController {
	
	@Autowired
	private UserBusinessService userBusinessService;
	
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
	
	
	
	
	
	
	
	
	
	
	
	
}
