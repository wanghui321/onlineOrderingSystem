package com.ordering.business.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ordering.business.bean.Business;
import com.ordering.business.dao.businessDao;
import com.ordering.user.bean.User;

@Service
public class businessServiceImpl implements businessService{
	@Autowired
	private businessDao businessDao;
	
//	public List<Map<String,Object>> getData() {
//		List<Map<String,Object>> list = userDao.getData();
//		return list;
//	}

	@Override
	public Map<String,String> getState(){
		// TODO Auto-generated method stub
		Map<String,String> list = businessDao.getState();
		return list;
	}
	
	@Override
	public Map<String,String> getCommentState(){
		// TODO Auto-generated method stub
		Map<String,String> list = businessDao.getCommentState();
		return list;
	}
	
	@Override
	public boolean regist(Business business) {
		// TODO Auto-generated method stub
		boolean flag = businessDao.regist(business);
		return flag;
	}
	
	@Override
	public Business login(Business business) {
		// TODO Auto-generated method stub
		Business b = businessDao.login(business); 
		return b;
	}
	
	//验证账号是否已被注册
		@Override
		public String accountVerification(String accountNumber) {
			// TODO Auto-generated method stub
			int count = businessDao.accountVerification(accountNumber);
			if(count != 0) {
				return "false";
			}
			return "true";
		}
		
		@Override
		public Map<String, String> getsales(){
			Map<String,String> list = businessDao.getsales();
			return list;
		}

}
