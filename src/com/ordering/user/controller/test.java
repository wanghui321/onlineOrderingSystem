package com.ordering.user.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ordering.user.service.UserService;

@Controller
@RequestMapping("userController")
public class test {
	@Autowired
	private UserService userService;
	
	@RequestMapping("test1")
	@ResponseBody
	public String test1() {
		System.out.println("213");
		List<Map<String,Object>> list = userService.getData();
		String str = list.toString();
		return str;
	}
}
