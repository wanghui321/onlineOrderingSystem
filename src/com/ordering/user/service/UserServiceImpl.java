package com.ordering.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ordering.user.bean.ConsigneeAddress;
import com.ordering.user.bean.User;
import com.ordering.user.dao.UserDao;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDao userDao;
	
//	public List<Map<String,Object>> getData() {
//		List<Map<String,Object>> list = userDao.getData();
//		return list;
//	}

	//获取商店类别
	@Override
	public List<Map<String,Object>> getClassify() {
		// TODO Auto-generated method stub
		List<Map<String,Object>> list = userDao.getClassify();
		return list;
	}

	//新用户注册
	@Override
	public boolean regist(User user) {
		// TODO Auto-generated method stub
		boolean flag = userDao.regist(user);
		return flag;
	}

	//验证账号是否已被注册
	@Override
	public String accountVerification(String accountNumber) {
		// TODO Auto-generated method stub
		int count = userDao.accountVerification(accountNumber);
		if(count != 0) {
			return "false";
		}
		return "true";
	}

	//用户登录
	@Override
	public User login(User user) {
		// TODO Auto-generated method stub
		User u = userDao.login(user);
		return u;
	}

	//修改用户信息，并返回最新的用户对象
	@Override
	public User updateUser(User user) {
		// TODO Auto-generated method stub
		boolean flag = userDao.updateUser(user);
		if(flag) {
			User u = userDao.getUser(user.getUserId());
			return u;
		}
		return null;
	}

	//修改密码
	@Override
	public boolean updatePassword(String userId, String password) {
		// TODO Auto-generated method stub
		boolean flag = userDao.updatePassword(userId,password);
		return flag;
	}

	//添加用户收货地址
	@Override
	public boolean addAddress(ConsigneeAddress address) {
		// TODO Auto-generated method stub
		boolean flag = userDao.addAddress(address);
		return false;
	}

	//获取用户收货地址
	@Override
	public List<Map<String, Object>> getAddress(String userId) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = userDao.getAddress(userId);
		return list;
	}

	//删除用户地址
	@Override
	public boolean delAddress(String id) {
		// TODO Auto-generated method stub
		boolean flag = userDao.delAddress(id);
		return flag;
	}

	//获得详细地址
	@Override
	public ConsigneeAddress getOneAddress(String id) {
		// TODO Auto-generated method stub
		ConsigneeAddress address = userDao.getOneAddress(id);
		return address;
	}
	
	//修改用户地址
	@Override
	public boolean updateAddress(ConsigneeAddress address) {
		// TODO Auto-generated method stub
		boolean flag = userDao.updateAddress(address);
		return flag;
	}

	//获得商家信息
	@Override
	public List<Map<String, Object>> getBusiness(String id) {
		// TODO Auto-generated method stub
		List<Map<String,Object>> list = userDao.getBusiness(id);
		return list;
	}
	
}

