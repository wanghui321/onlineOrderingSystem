package com.ordering.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.ordering.admin.bean.Admin;
import com.ordering.admin.dao.AdminDao;
import com.ordering.admin.dao.BaseDao;
@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao adminDao;
	@Autowired
	private BaseDao<Admin> baseDao;
	@Autowired
    private JdbcTemplate jdbcTemplate;
	
	@Override
	public Admin save(Admin entity) {
		return adminDao.save(entity);
	}
	public Admin login(String userName, String password) {
		String sql = "select * from admin a where a.userName = '"+userName+"' and a.password = '"+password+"'";
		List<Map<String, Object>> tempList = jdbcTemplate.queryForList(sql);
		Admin admin = null;
		if(tempList.size()>0) {
			admin = adminDao.findAdminById((String)tempList.get(0).get("adminId"));
		}
		return admin;
	}

}
