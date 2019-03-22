package com.ordering.user.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ordering.business.bean.Business;
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
	@ResponseBody
	public JSONArray getBusinessByName(String name) {
		List<Map<String,Object>> list = userBusinessService.getBusinessByBusinessName(name);
		JSONArray json = JSONArray.fromObject(list);
		return json;
	}
	
	//根据商店的Id获取商店的信息
	@RequestMapping("getBusinessById")
	public String getBusinessById(String id,Model model) {
		Business business = userBusinessService.getBusinessById(id);
		model.addAttribute("business",business);
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
}
