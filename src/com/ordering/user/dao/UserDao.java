package com.ordering.user.dao;

import java.util.List;

import com.ordering.user.bean.User;

public interface UserDao {
	public List getClassify();
	
	public boolean regist(User user);

	public int accountVerification(String accountNumber);

	public User login(User user);

	public boolean setNickName(String userId, String nickName);

	public User getUser(String userId);

	public boolean setPhoneNumber(String userId, String phoneNumber);

	public boolean updateUser(User user);

	public String passwordVerification(String userId, String oldPassword);
}
