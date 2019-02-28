package com.ordering.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ordering.user.service.UserServiceImpl;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("userController")
public class userController {
	@Autowired
	private UserServiceImpl userService;
	
	@RequestMapping("getClassify.do")
	@ResponseBody
	public JSONArray getClassify() {
		System.out.println("213");
		List list = userService.getClassify();
		JSONArray data=JSONArray.fromObject(list);
		System.out.println(data);
		return data;
	}
}
