package com.ordering.admin.service;

import com.ordering.admin.bean.Admin;

public interface AdminService {
	public Admin save(Admin entity);

	public Admin login(String userName, String password);
}
