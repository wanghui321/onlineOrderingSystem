package com.ordering.business.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ordering.business.bean.Business;
import com.ordering.business.service.businessServiceImpl;
import com.ordering.user.bean.User;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("businessController")
public class businessController {
	@Autowired
	private businessServiceImpl businessService;
	
	//获取订单状态
	@RequestMapping("getState")
	@ResponseBody
	public JSONObject getState() {
		System.out.println("213");
		Map<String,String> map = businessService.getState();
		JSONObject data=JSONObject.fromObject(map);
		System.out.println(data);
		return data;
	}
	
	//新商家注册
		@RequestMapping("newRegist")
		public String newRegist(Model model,Business business) {
			System.out.println("213");
			boolean flag = businessService.regist(business);
			if(flag) {
				model.addAttribute("msg","注册成功");
			} else {
				model.addAttribute("msg","注册失败");
			}
			return "business/regist";
		}
		
		
		//商家登录
		@RequestMapping("login")
		public String login(HttpSession session,Model model,Business business,String loginType) {
			System.out.println(loginType);
			if(loginType.equals("business")) {
				Business b = businessService.login(business);
				if(b != null) {
					session.setAttribute("business", b);
					return "business/home";
				} 
				model.addAttribute("msg","用户名或密码错误");
				return "user/login";
			}
			return "";
		}

}
