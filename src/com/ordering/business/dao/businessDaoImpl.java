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
import com.ordering.business.bean.Comment;
import com.ordering.business.bean.Food;
import com.ordering.business.bean.Order;
import com.ordering.business.bean.OrderFood;
import com.ordering.user.bean.User;


@Repository
@Transactional
public class businessDaoImpl implements businessDao{
	@Autowired
	private SessionFactory sessionFactory;
	
	
	//获取订单类别
	@Override
	public Map<String,String> getState(){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select state from Order");
		List<String> state = query.list();
		List<Map<String,Integer>> list = new ArrayList();
		int a = 0 ;
		int b = 0 ;
		int c = 0 ;
		int d = 0 ;
		int e = 0;
		for (String l : state) {
			if (l.equals("0"))
			a=a+1;
			if (l.equals("1"))
				b=b+1;
			if (l.equals("2"))
				c=c+1;
			if (l.equals("3"))
				d=d+1;
			if (l.equals("4"))
				e=e+1;
			System.out.println(l);
		}
		Map map = new HashMap();
		map.put("newOrder",a );
		map.put("unusualOrder", b);
		map.put("reminder", c);
		map.put("chargeback", d);
		map.put("completedOrder", e);
		return map;
	}
	
	
	//今日销售总金额
	@Override
	public Map<String,String> getsales(){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Order where state = ?");
		query.setString(0, "4");
		List<Order> orders = query.list();
		double a = 0;
		for(Order o : orders) {
			Query query1 = session.createQuery("from OrderFood where orderId = ?");
			String d = o.getId();
			query1.setString(0, d);
			List<OrderFood> of = (List<OrderFood>)query1.list();
			for(OrderFood f : of) {
				Query query2 = session.createQuery("from Food where id = ?");
				String e = f.getFoodId();
				query2.setString(0,e );
				Food b = (Food)query2.uniqueResult();
				a=a+b.getPrice();
			}
		}
		Map map = new HashMap();
		map.put("sales", a);
		return map;
	}
	
	//获取评论类别
	@Override
	public Map<String,String> getCommentState(){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Comment");
		List<Comment> comment = query.list();
		List<Map<String,Integer>> list = new ArrayList();
		int a = 0 ;
		int b = 0 ;
		for (Comment c : comment) {
			if (c.getState()==0) {
			if(c.getLevel()<=2) {
				b=b+1;
				}else {
					a=a+1;
				}
			System.out.println(c);
			}
		}
		Map map = new HashMap();
		map.put("noResponseToComments",a );
		map.put("noResponseToNegativeComment", b);
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
		
		//验证用户账号是否已被使用
		@Override
		public int accountVerification(String accountNumber) {
			// TODO Auto-generated method stub
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from Business where accountNumber = ?");
			query.setString(0, accountNumber);
			List list = query.list();
			int count = 0;
			count = list.size();
			System.out.println(count);
			return count;
		}
}
