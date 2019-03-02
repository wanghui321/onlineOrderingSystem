package com.ordering.user.service;

import java.util.List;

import com.ordering.user.bean.User;

public interface UserService {
	public List getClassify();
	
	public boolean regist(User user);
	
	public String accountVerification(String accountNumber);
}
