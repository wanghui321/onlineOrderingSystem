package com.ordering.user.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ordering.user.bean.ConsigneeAddress;
import com.ordering.user.bean.User;

@Repository
@Transactional
public class UserDaoImpl implements UserDao{
	@Autowired
	private SessionFactory sessionFactory;
	
	public List<Map<String,Object>> getData(){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Book");
		List<Map<String,Object>> list = query.list();
		return list;
	}

	@Override
	public List getClassify() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select typeName from ShopType");
		List list = query.list();
		return list;
	}

	//新用户注册
	@Override
	public boolean regist(User user) {
		// TODO Auto-generated method stub
		String uuid = UUID.randomUUID().toString().replaceAll("-","");
		user.setUserId(uuid);
		Session session = sessionFactory.getCurrentSession();
		session.save(user);
		return true;
	}

	//验证用户账号是否已被使用
	@Override
	public int accountVerification(String accountNumber) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from User where accountNumber = ?");
		query.setString(0, accountNumber);
		List list = query.list();
		int count = list.size();
		System.out.println(count);
		return count;
	}

	//用户登录
	@Override
	public User login(User user) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from User where accountNumber = ? and password = ?");
		query.setString(0, user.getAccountNumber());
		query.setString(1, user.getPassword());
		User u = (User)query.uniqueResult();
		return u;
	}

	//根据userId获取User对象
	@Override
	public User getUser(String userId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from User where userId = ?");
		query.setString(0, userId);
		User user = (User)query.uniqueResult();
		return user;
	}

	//修改用户信息
	@Override
	public boolean updateUser(User user) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("update User set nickName=?,phone=? where userId=?");
		query.setString(0, user.getNickName());
		query.setString(1, user.getPhone());
		query.setString(2, user.getUserId());
		int count = query.executeUpdate();
		if(count > 0) {
			return true;
		}
		return false;
	}

	//修改用户密码
	@Override
	public boolean updatePassword(String userId, String password) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("update User set password = ? where userId = ?");
		query.setString(0, password);
		query.setString(1, userId);
		int count = query.executeUpdate();
		if(count > 0) {
			return true;
		}
		return false;
	}

	//添加用户收货地址
	@Override
	public boolean addAddress(ConsigneeAddress address) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String uuid = UUID.randomUUID().toString().replaceAll("-","");
		address.setId(uuid);
		session.save(address);
		return true;
	}

	//获取用户收货地址
	@Override
	public List<Map<String, Object>> getAddress(String userId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from ConsigneeAddress where userId = ?");
		query.setString(0, userId);
		List<ConsigneeAddress> list = query.list();
		List<Map<String,Object>> addressList = new ArrayList<Map<String,Object>>();
		for(ConsigneeAddress address : list) {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("id", address.getId());
			map.put("address",address.getAddress());
			map.put("phone",address.getPhone());
			map.put("name", address.getName());
			map.put("sex",address.getSex());
			addressList.add(map);
			
		}
		return addressList;
	}

	//删除用户地址
	@Override
	public boolean delAddress(String id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("delete from ConsigneeAddress where id = ?");
		query.setString(0, id);
		int count = query.executeUpdate();
		if(count > 0) {
			return true;
		}
		return false;
	}

	//获取用户详细地址信息
	@Override
	public ConsigneeAddress getOneAddress(String id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from ConsigneeAddress where id = ?");
		query.setString(0, id);
		ConsigneeAddress address = (ConsigneeAddress)query.uniqueResult();
		return address;
	}

	//修改用户地址
	@Override
	public boolean updateAddress(ConsigneeAddress address) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("update ConsigneeAddress set name=?,sex=?,phone=?,address=? where id = ?");
		query.setString(0, address.getName());
		query.setString(1,address.getSex());
		query.setString(2,address.getPhone());
		query.setString(3,address.getAddress());
		query.setString(4,address.getId());
		int count = query.executeUpdate();
		if(count > 0)
			return true;
		return false;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
