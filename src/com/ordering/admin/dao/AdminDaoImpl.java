package com.ordering.admin.dao;

import java.util.UUID;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ordering.admin.bean.Admin;
@Repository
@Transactional
public class AdminDaoImpl implements AdminDao {
	
	@Autowired
    private JdbcTemplate jdbcTemplate;
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public Admin save(Admin entity) {
		String uuid = UUID.randomUUID().toString().replaceAll("-","");
		entity.setAdminId(uuid);
		Session session = sessionFactory.getCurrentSession();
		session.save(entity);
		String sql = "select * from admin a where a.userName = '1'";
		
		Admin admin = jdbcTemplate.queryForObject(sql,new BeanPropertyRowMapper<>(Admin.class));
		System.out.println(admin.getAdminId());
		return entity;
	}
	@Override
	public Admin findAdminById(String adminId) {
		
		String sql = "select * from admin a where a.adminId = '"+adminId+"'";
		return jdbcTemplate.queryForObject(sql,new BeanPropertyRowMapper<>(Admin.class));
	}

}
