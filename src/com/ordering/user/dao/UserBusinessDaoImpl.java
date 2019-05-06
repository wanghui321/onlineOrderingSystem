package com.ordering.user.dao;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ordering.business.bean.Business;
import com.ordering.business.bean.Comment;
import com.ordering.business.bean.Food;
import com.ordering.business.bean.Order;
import com.ordering.business.bean.OrderFood;

@Repository
@Transactional
public class UserBusinessDaoImpl implements UserBusinessDao{
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private SessionFactory sessionFactory;
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

	@Override
	public boolean addToOrder(Order order) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(order);
		return true;
	}

	@Override
	public void addToOrderFood(OrderFood orderFood) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(orderFood);
	}

	//根据用户Id获取用户的所有订单
	@Override
	public List<Map<String, Object>> getMyOrder(String userId) {
		// TODO Auto-generated method stub
		String sql = "select * from orders where userId = '" + userId + "'" + "order by data desc";
		List<Map<String,Object>> list = jdbcTemplate.queryForList(sql);
		return list;
	}

	//根据订单Id,获取订单中的商品的信息
	@Override
	public List<Map<String, Object>> getFoodDetail(String orderId) {
		// TODO Auto-generated method stub
		String sql = "select * from order_food where orderId = '" + orderId + "'";
		List<Map<String,Object>> list = jdbcTemplate.queryForList(sql);
		return list;
	}

	@Override
	public Order getOrderDetail(String orderId) {
		// TODO Auto-generated method stub
		String sql = "select * from orders where id = '" + orderId + "'";
		Order order = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Order.class));
		return order;
	}

	//确认收货
	@Override
	public double updateOrder(String orderId,String state,double balance,String userId) {
		// TODO Auto-generated method stub
		if(state.equals("4")) {
			String sql = "update orders set state = '4' where id = '" + orderId + "'";
			jdbcTemplate.batchUpdate(sql);
		} else if(state.equals("2")) {
			String sql = "update orders set state = '2' where id = '" + orderId + "'";
			jdbcTemplate.batchUpdate(sql);
		} else if(state.equals("3")){
			Order order = this.getOrderDetail(orderId);
			String data = order.getData();
			String totalPrice = order.getTotalPrice();
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
			Date nowData = new Date();
			try {
				Date data1 = df.parse(data);
				Date data2 = df.parse(df.format(nowData));
				long diff = data2.getTime()- data1.getTime();
				long minutes = diff/(1000*60);
				if(minutes <= 5) {
					String sql = "update orders set state = '3' where id = '" + orderId + "'";
					double total = Double.parseDouble(totalPrice);
					double newBalance = total + balance;
					String sql1 = "update user set balance = " + newBalance + "where userId = '" + userId +"'";
					jdbcTemplate.batchUpdate(sql);
					jdbcTemplate.batchUpdate(sql1);
					return newBalance;
				} else {
					String sql = "update orders set state = '6' where id = '" + orderId + "'";
					jdbcTemplate.batchUpdate(sql);
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return balance;
	}

	//添加评论
	@Override
	public boolean addComment(Comment com) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(com);
		return true;
	}
	//修改订单状态为已评论
	@Override
	public void updateHaveComment(String orderId) {
		// TODO Auto-generated method stub
		String sql = "update orders set state = '7' where id = '" + orderId + "'";
		jdbcTemplate.batchUpdate(sql);
	}
	
	//获取商店的评论
	@Override
	public List<Map<String, Object>> getComment(String businessId) {
		// TODO Auto-generated method stub
		String sql = "select * from comment where businessId = '" + businessId + "' order by data desc";
		List<Map<String,Object>> list = jdbcTemplate.queryForList(sql);
		return list;
	}
	
	//获取商店评论个数
	@Override
	public Map<String,Object> getCommentNumber(String id) {
		// TODO Auto-generated method stub
		String sql = "select count('level') count,SUM(`level`) sum from comment where businessId = '" + id + "'";
		Map<String,Object> map = jdbcTemplate.queryForMap(sql);
		return map;
	}
}
