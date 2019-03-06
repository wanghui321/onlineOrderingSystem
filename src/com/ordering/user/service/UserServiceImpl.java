package com.ordering.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	@Override
	public List getClassify() {
		// TODO Auto-generated method stub
		List list = userDao.getClassify();
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

	//修改用户的昵称，并返回最新的User对象。
	@Override
	public User setNickName(String userId,String nickName) {
		// TODO Auto-generated method stub
		boolean flag = userDao.setNickName(userId,nickName);
		if(flag) {
			User u = userDao.getUser(userId);
			return u;
		}
		return null;
	}

	//修改用户的手机号，并返回最新的User对象。
	@Override
	public User setPhoneNumber(String userId, String phoneNumber) {
		// TODO Auto-generated method stub
		boolean flag = userDao.setPhoneNumber(userId,phoneNumber);
		if(flag) {
			User u = userDao.getUser(userId);
			return u;
		}
		return null;
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

	@Override
	public boolean passwordVerification(String userId, String oldPassword) {
		// TODO Auto-generated method stub
		String password = userDao.passwordVerification(userId,oldPassword);
		if(password.equals(oldPassword)) {
			return true;
		}
		return false;
	}
	
}
