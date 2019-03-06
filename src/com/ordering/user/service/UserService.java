package com.ordering.user.service;

import java.util.List;

import com.ordering.user.bean.User;

public interface UserService {
	public List getClassify();
	
	public boolean regist(User user);
	
	public String accountVerification(String accountNumber);
	
	public User login(User user);
	
	public User setNickName(String userId,String nickName);
	
	public User setPhoneNumber(String userId,String phoneNumber);
	
	public User updateUser(User user);
	
	public boolean passwordVerification(String userId,String oldPassword);
}
