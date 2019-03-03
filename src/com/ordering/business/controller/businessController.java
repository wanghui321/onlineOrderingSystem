package com.ordering.business.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ordering.business.service.businessServiceImpl;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("businessController")
public class businessController {
	@Autowired
	private businessServiceImpl businessService;
	
	@RequestMapping("getState")
	@ResponseBody
	public JSONObject getState() {
		System.out.println("213");
		Map<String,String> map = businessService.getState();
		JSONObject data=JSONObject.fromObject(map);
		System.out.println(data);
		return data;
	}

}
