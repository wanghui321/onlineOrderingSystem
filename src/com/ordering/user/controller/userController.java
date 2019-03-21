package com.ordering.user.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ordering.user.bean.ConsigneeAddress;
import com.ordering.user.bean.User;
import com.ordering.user.service.UserServiceImpl;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("userController")
public class userController {
	@Autowired
	private UserServiceImpl userService;
	
	@RequestMapping("getClassify")
	@ResponseBody
	public JSONArray getClassify() {
		List<Map<String,Object>> list = userService.getClassify();
		JSONArray data=JSONArray.fromObject(list);
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
	
	//修改用户密码，并重新登录
	@RequestMapping("updatePassword")
	public String updatePassword(String password,HttpSession session,Model model) {
		User user = (User)session.getAttribute("user");
		boolean flag = userService.updatePassword(user.getUserId(),password);
		if(flag) {
			session.removeAttribute("user");
			model.addAttribute("repasswordSeccess","修改密码成功");
			return "user/updatePassword";
		}
		
		return "";
	}
	
	//添加收货地址
	@RequestMapping("addAddress")
	public String addAddress(ConsigneeAddress address,HttpSession session,Model model,
			HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		User user = (User)session.getAttribute("user");
		address.setUser(user);
		boolean flag = userService.addAddress(address);
		model.addAttribute("msg","添加成功");
		return "user/addressManager";
	}
	
	//获取用户收货地址
	@RequestMapping("getAddress")
	@ResponseBody
	public JSONArray getAddress(HttpSession session) {
		User user = (User)session.getAttribute("user");
		List<Map<String,Object>> list = userService.getAddress(user.getUserId());
		JSONArray json = JSONArray.fromObject(list);
		return json;
	}
	
	//删除用户地址
	@RequestMapping("delAddress/{id}")
	public String delAddress(@PathVariable String id,Model model) {
		boolean flag = userService.delAddress(id);
		if(flag) {
			model.addAttribute("msg","删除成功");
		} else {
			model.addAttribute("msg","删除失败");
		}
		return "user/addressManager";
	}
	
	//获取用户详细地址
	@RequestMapping("getOneAddress")
	public String getOneAddress(String id,Model model) {
		ConsigneeAddress address = userService.getOneAddress(id);
		model.addAttribute("address",address);
		return "user/updateAddress";
	}
	
	//修改用户地址
	@RequestMapping("updateAddress")
	public String updateAddress(ConsigneeAddress address,Model model) {
		boolean flag = userService.updateAddress(address);
		if(flag) {
			model.addAttribute("msg","修改成功");
			return "user/addressManager";
		}
		model.addAttribute("msg","修改失败");
		return "user/updateAddress";
	}
	
	
	
}
