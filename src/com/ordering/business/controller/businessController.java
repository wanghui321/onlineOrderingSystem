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
	public JSONObject getState(HttpSession session) {
		System.out.println("213");
		Business b = (Business)session.getAttribute("business");
		String id = b.getBusinessId();
		Map<String,String> map = businessService.getState(id);
		JSONObject data=JSONObject.fromObject(map);
		System.out.println(data);
		return data;
	}
	
	//获取评论状态
		@RequestMapping("getCommentState")
		@ResponseBody
		public JSONObject getCommentState(HttpSession session) {
			System.out.println("213333");
			Business b = (Business)session.getAttribute("business");
			String id = b.getBusinessId();
			Map<String,String> map = businessService.getCommentState(id);
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
		
		//销售金额
		@RequestMapping("getsales")
		@ResponseBody
		public JSONObject getsales(HttpSession session) {
			System.out.println("222222222213");
			Business b = (Business)session.getAttribute("business");
			String id = b.getBusinessId();
			Map<String,String> map = businessService.getsales(id);
			JSONObject data=JSONObject.fromObject(map);
			System.out.println(data);
			return data;
		}
		
		//退出登录
		@RequestMapping("editLogin")
		public String editLogin(HttpSession session) {
			session.removeAttribute("user");
			session.removeAttribute("bnickName");
			return "user/home";
		}
		
		//修改用户信息，并更新session中的用户信息
		@RequestMapping("updateBusiness")
		public String updateBusiness(Business business,HttpSession session,Model model) {
			Business b = (Business)session.getAttribute("business");
			if(business.getNickName()!=null && business.getNickName()!= "")
				b.setNickName(business.getNickName());
			if(business.getPhoneNumber()!=null && business.getPhoneNumber()!= "")
				b.setPhoneNumber( business.getPhoneNumber());
			if(business.getIntroduce()!=null && business.getIntroduce()!= "")
				b.setIntroduce(business.getIntroduce()); 
			if(business.getNotice()!=null && business.getNotice()!= "")
				b.setNotice(business.getNotice());
			if(business.getState()!=null && business.getState()!= "")
				b.setState(business.getState());
			business.setBusinessId(b.getBusinessId());
			Business newBusiness = businessService.updateBusiness(b);
			session.setAttribute("business", newBusiness);
			session.setAttribute("bnickName", newBusiness.getNickName());
			model.addAttribute("msg","修改成功");
			return "business/manager";
		}
		
		//商户营业许可证名修改
		@RequestMapping("updateQualification")
		public String updateQualification(Business business,HttpSession session,Model model) {
			Business b = (Business)session.getAttribute("business");
			if(business.getBusinessLicence()!=null && business.getBusinessLicence()!= "")
				b.setBusinessLicence(business.getBusinessLicence());
			if(business.getCorporation()!=null && business.getCorporation()!= "")
				b.setCorporation(business.getCorporation());
			business.setBusinessId(b.getBusinessId());
			Business newBusiness = businessService.updateQualification(b);
			session.setAttribute("business", newBusiness);
			session.setAttribute("bnickName", newBusiness.getNickName());
			model.addAttribute("msg","修改成功");
			return "business/qualification";
		}
		
		//修改用户密码，并重新登录
		@RequestMapping("updatePassword")
		public String updatePassword(String password,HttpSession session,Model model) {
			Business business = (Business)session.getAttribute("business");
			boolean flag = businessService.updatePassword(business.getBusinessId(),password);
			if(flag) {
				session.removeAttribute("business");
				model.addAttribute("repasswordSeccess","修改密码成功");
				return "business/updatePassword";
			}
			
			return "";
		}
		

}
