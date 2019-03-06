package com.ordering.business.dao;

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

import com.ordering.business.bean.Business;
import com.ordering.user.bean.User;


@Repository
@Transactional
public class businessDaoImpl implements businessDao{
	@Autowired
	private SessionFactory sessionFactory;
	
	
	//获取订单类别
	public Map<String,String> getState(){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select state from Order");
		List<String> state = query.list();
		List<Map<String,Integer>> list = new ArrayList();
		int a = 0 ;
		int b = 0 ;
		int c = 0 ;
		int d = 0 ;
		for (String l : state) {
			if (l.equals("0"))
			a=a+1;
			if (l.equals("1"))
				b=b+1;
			if (l.equals("2"))
				c=c+1;
			if (l.equals("3"))
				d=d+1;
			System.out.println(l);
		}
		Map map = new HashMap();
		map.put("newOrder",a );
		map.put("unusualOrder", b);
		map.put("reminder", c);
		map.put("chargeback", d);
		return map;
	}
	
	//新用户注册
		@Override
		public boolean regist(Business business) {
			// TODO Auto-generated method stub
			String uuid = UUID.randomUUID().toString().replaceAll("-","");
			business.setBusinessId(uuid);
			Session session = sessionFactory.getCurrentSession();
			session.save(business);
			return true;
		}
		
		//用户登录
		@Override
		public Business login(Business business) {
			// TODO Auto-generated method stub
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from Business where accountNumber = ? and password = ?");
			query.setString(0, business.getAccountNumber());
			query.setString(1, business.getPassword());
			Business b = (Business)query.uniqueResult();
			return b;
		}
}
