package com.ordering.user.dao;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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
}
