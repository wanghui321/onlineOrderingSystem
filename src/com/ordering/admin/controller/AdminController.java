package com.ordering.admin.controller;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ordering.admin.bean.Admin;
import com.ordering.admin.service.AdminService;


@Controller
@RequestMapping("adminController")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	@RequestMapping("saveInfo")
	public String saveInfo(Admin entity){
		try {
			if(entity != null && !StringUtils.isEmpty(entity.getAdminId())){
				//修改方法
				//passportService.update(entity);
				return "ss"; 
			}else{
				//新增方法
				Admin dbEntity = adminService.save(entity);
				if(dbEntity != null && !StringUtils.isEmpty(dbEntity.getAdminId())){
					return dbEntity.getAdminId(); 
				}
				return ""; 
			}
		}catch(Exception e){
			e.printStackTrace();
			
			return "fail"; 
		}
	}
	@RequestMapping("login")
	@ResponseBody
	public String login(HttpSession session,Model model,Admin entity) {
		Admin admin = adminService.login(entity.getUserName(),entity.getPassword());
		if(admin!=null) {
			session.setAttribute("admin", admin);
			session.setAttribute("adminName", admin.getUserName());
			return "success";	
		}else {
			model.addAttribute("msg","用户名或密码错误");
			return "fail";
		}
	}
}
