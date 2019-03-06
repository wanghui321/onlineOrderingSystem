package com.ordering.user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ordering.user.bean.User;
import com.ordering.user.service.UserServiceImpl;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("userController")
public class userController {
	@Autowired
	private UserServiceImpl userService;
	private JSONArray json;
	
	@RequestMapping("getClassify")
	@ResponseBody
	public JSONArray getClassify() {
		List list = userService.getClassify();
		JSONArray data=JSONArray.fromObject(list);
		System.out.println(data);
		return data;
	}
	
	//用户账号验证
	@ResponseBody
	@RequestMapping("accountVerification/{accountNumber}")
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
		return "user/regist";
	}
	
	//用户登录
	@RequestMapping("login")
	public String login(HttpSession session,Model model,User user,String loginType) {
		if(loginType.equals("user")) {
			User u = userService.login(user);
			if(u != null) {
				session.setAttribute("user", u);
				session.setAttribute("nickName", u.getNickName());
				return "user/home";
			} 
			model.addAttribute("msg","用户名或密码错误");
			return "user/login";
		}
		return "";
	}
	
	//退出登录
	@RequestMapping("editLogin")
	public String editLogin(HttpSession session) {
		session.removeAttribute("user");
		session.removeAttribute("nickName");
		return "user/home";
	}
	
	//修改昵称，并更新session中的用户信息
	@ResponseBody
	@RequestMapping("setNickName/{nickName}")
	public JSONArray setNickName(@PathVariable String nickName,HttpSession session) {
		User user = (User) session.getAttribute("user");
		User newUser = userService.setNickName(user.getUserId(),nickName);
		session.setAttribute("user", newUser);
		session.setAttribute("nickName", newUser.getNickName());
		JSONArray json = new JSONArray();
		json.add("true");
		return json;
	}
	
	//修改电话号码，并更新session中的用户信息
	@ResponseBody
	@RequestMapping("setPhoneNumber/{phoneNumber}")
	public JSONArray setPhoneNumber(@PathVariable String phoneNumber,HttpSession session) {
		int length = phoneNumber.length();
		JSONArray json = new JSONArray();
		if(length != 11) {
			json.add("false");
		} else {
			User user = (User) session.getAttribute("user");
			User newUser = userService.setPhoneNumber(user.getUserId(),phoneNumber);
			session.setAttribute("user", newUser);
			json.add("true");
		}
		
		return json;
	}
	
	//修改用户信息，并更新session中的用户信息
	@RequestMapping("updateUser")
	public String updateUser(User user,HttpSession session,Model model) {
		User u = (User)session.getAttribute("user");
		user.setUserId(u.getUserId());
		User newUser = userService.updateUser(user);
		session.setAttribute("user", newUser);
		session.setAttribute("nickName", newUser.getNickName());
		model.addAttribute("msg","修改成功");
		return "user/getUser";
	}
	
	//验证初始密码
	@ResponseBody
	@RequestMapping("passwordVerification/{oldPassword}")
	public JSONArray passwordVerification(@PathVariable String oldPassword,HttpSession session) {
		User user = (User)session.getAttribute("user");
		boolean flag = userService.passwordVerification(user.getUserId(),oldPassword);
		JSONArray json = new JSONArray();
		if(!flag) {
			json.add("false");
		}
		return json;
	}
	
	
	
	
	
	
}
