package com.ordering.business.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
@Transactional
public class businessDaoImpl implements businessDao{
	@Autowired
	private SessionFactory sessionFactory;
	
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
}
