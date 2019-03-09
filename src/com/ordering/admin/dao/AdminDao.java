package com.ordering.admin.dao;

import com.ordering.admin.bean.Admin;

public interface AdminDao {
	public Admin save(Admin entity);

	public Admin findAdminById(String adminId);
}
