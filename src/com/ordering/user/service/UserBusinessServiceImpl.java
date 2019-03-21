package com.ordering.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ordering.business.bean.Business;
import com.ordering.user.dao.UserBusinessDao;

@Service
public class UserBusinessServiceImpl implements UserBusinessService {

	@Autowired
	private UserBusinessDao userBusinessDao;
	
	//获得商家信息
	@Override
	public List<Map<String, Object>> getBusiness(String id) {
		// TODO Auto-generated method stub
		List<Map<String,Object>> list = userBusinessDao.getBusiness(id);
		return list;
	}

	//根据商店的名称获取商家的信息
	@Override
	public List<Map<String, Object>> getBusinessByBusinessName(String name) {
		// TODO Auto-generated method stub
		List<Map<String,Object>> businessList = userBusinessDao.getBusinessByBusinessName(name);
		List<Map<String,Object>> foodList = userBusinessDao.getBusinessByFoodName(name); 
		businessList.removeAll(foodList);
		businessList.addAll(foodList);
		return businessList;
	}

	@Override
	public Business getBusinessById(String id) {
		// TODO Auto-generated method stub
		Business business = userBusinessDao.getBusinessById(id);
		return business;
	}

}
