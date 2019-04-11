package com.ordering.user.dao;

import java.util.List;
import java.util.Map;

import com.ordering.business.bean.Business;
import com.ordering.business.bean.Food;

public interface UserBusinessDao {
	public List<Map<String, Object>> getBusiness(String id);

	public List<Map<String, Object>> getBusinessByBusinessName(String name);

	public List<Map<String, Object>> getBusinessByFoodName(String name);

	public Business getBusinessById(String id);

	public List<Map<String, Object>> getFoodByBusinessId(String id);

	public Food getFoodById(String id);
}
