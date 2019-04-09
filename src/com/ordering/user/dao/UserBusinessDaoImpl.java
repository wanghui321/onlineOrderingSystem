package com.ordering.user.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.ordering.business.bean.Business;
import com.ordering.business.bean.Food;

@Repository
public class UserBusinessDaoImpl implements UserBusinessDao{
	@Autowired
	private JdbcTemplate jdbcTemplate;
	//获得商店信息
	@Override
	public List<Map<String, Object>> getBusiness(String id) {
		// TODO Auto-generated method stub
		StringBuilder str = new StringBuilder();
		str.append("select * from business ");
		if(!id.equals("0")) {
			str.append("where typeId = '" + id + "'");
		}
		List<Map<String,Object>> list = jdbcTemplate.queryForList(str.toString());
		return list;
	}

	//根据商店的名称获取商店的信息
	@Override
	public List<Map<String, Object>> getBusinessByBusinessName(String name) {
		// TODO Auto-generated method stub
		String str = "select * from business where nickName like '%"+ name +"%'";
		List<Map<String,Object>> list = jdbcTemplate.queryForList(str);
		return list;
	}

	//根据商品的信息获取相关商店的信息
	@Override
	public List<Map<String, Object>> getBusinessByFoodName(String name) {
		// TODO Auto-generated method stub
		String str = "select distinct businessId from food where foodName like '%"+ name +"%'";
		List<String> list = jdbcTemplate.queryForList(str, String.class);
		List<Map<String,Object>> businessList = new ArrayList<Map<String,Object>>();
		if(list.size() > 0) {
			for (String businessId : list) {
				Map<String,Object> map = new HashMap<String,Object>();
				String sql = "select * from business where businessId = '" + businessId + "'";
				map = jdbcTemplate.queryForMap(sql);
				businessList.add(map);
			}
		}
		return businessList;
	}

	//根据商店的Id获取商店的信息
	@Override
	public Business getBusinessById(String id) {
		String sql = "select * from business where businessId = '" + id + "'";
		Business business = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Business.class));
		return business;
	}

	//根据商店的Id获取商店中商品的信息
	@Override
	public List<Map<String, Object>> getFoodByBusinessId(String id) {
		// TODO Auto-generated method stub
		String sql = "select * from food where businessId = '" + id + "'";
		List<Map<String,Object>> list = jdbcTemplate.queryForList(sql);
		return list;
	}

	@Override
	public Food getFoodById(String id) {
		// TODO Auto-generated method stub
		String sql = "select * from food where id = '" + id + "'";
		Food food = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Food.class));
		return food;
	}

}
