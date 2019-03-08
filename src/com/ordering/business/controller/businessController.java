package com.ordering.business.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	//获取评论状态
		@RequestMapping("getCommentState")
		@ResponseBody
		public JSONObject getCommentState() {
			System.out.println("213333");
			Map<String,String> map = businessService.getCommentState();
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
			System.out.println(business);
			if(loginType.equals("business")) {
				Business b = businessService.login(business);
				if(b != null) {
					System.out.println(b);
					session.setAttribute("business", b);
					session.setAttribute("bnickName", b.getNickName());
					return "business/home";
				} 
				model.addAttribute("msg","用户名或密码错误");
				return "user/login";
			}
			return "";
		}
		
		//用户账号验证
		@RequestMapping("accountVerification/{accountNumber}")
		@ResponseBody
		public JSONArray accountVerification(@PathVariable String accountNumber) {
			System.out.println(accountNumber);
			String msg = businessService.accountVerification(accountNumber);
			JSONArray json = new JSONArray();
			json.add(msg);
			return json;
		}
		
		//
		@RequestMapping("getsales")
		@ResponseBody
		public JSONObject getsales() {
			System.out.println("222222222213");
			Map<String,String> map = businessService.getsales();
			JSONObject data=JSONObject.fromObject(map);
			System.out.println(data);
			return data;
		}

}
