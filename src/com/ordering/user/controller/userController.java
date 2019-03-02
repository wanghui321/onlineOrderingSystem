package com.ordering.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ordering.user.bean.User;
import com.ordering.user.service.UserServiceImpl;

import net.sf.json.JSON;
import net.sf.json.JSONArray;

@Controller
@RequestMapping("userController")
public class userController {
	@Autowired
	private UserServiceImpl userService;
	
	@RequestMapping("getClassify")
	@ResponseBody
	public JSONArray getClassify() {
		List list = userService.getClassify();
		JSONArray data=JSONArray.fromObject(list);
		System.out.println(data);
		return data;
	}
	
	//用户账号验证
	@RequestMapping("accountVerification")
	@ResponseBody
	public JSONArray accountVerification(@PathVariable String accountNumber) {
		String msg = userService.accountVerification(accountNumber);
		JSONArray json = new JSONArray();
		json.add(msg);
		return json;
	}
	
	//新用户注册
	@RequestMapping("newRegist")
	public String newRegist(Model model,User user) {
		boolean flag = userService.regist(user);
		if(flag) {
			model.addAttribute("msg","注册成功");
		} else {
			model.addAttribute("msg","注册失败");
		}
		return "";
	}
}
