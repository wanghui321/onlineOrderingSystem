package com.ordering.user.dao;

import java.util.List;

import com.ordering.user.bean.User;

public interface UserDao {
	public List getClassify();
	
	public boolean regist(User user);

	public int accountVerification(String accountNumber);
}
