package com.ordering.business.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ordering.business.bean.Business;
import com.ordering.business.bean.Food;
import com.ordering.business.dao.businessDao;
import com.ordering.user.bean.User;

@Service
public class businessServiceImpl implements businessService{
	@Autowired
	private businessDao businessDao;
	
//	public List<Map<String,Object>> getData() {
//		List<Map<String,Object>> list = userDao.getData();
//		return list;
//	}

	@Override
	public Map<String,String> getState(String id){
		// TODO Auto-generated method stub
		Map<String,String> list = businessDao.getState(id);
		return list;
	}
	
	@Override
	public Map<String,String> getCommentState(String id){
		// TODO Auto-generated method stub
		Map<String,String> list = businessDao.getCommentState(id);
		return list;
	}
	
	@Override
	public boolean regist(Business business) {
		// TODO Auto-generated method stub
		boolean flag = businessDao.regist(business);
		return flag;
	}
	
	@Override
	public Business login(Business business) {
		// TODO Auto-generated method stub
		Business b = businessDao.login(business); 
		return b;
	}
	
	//验证账号是否已被注册
		@Override
		public String accountVerification(String accountNumber) {
			// TODO Auto-generated method stub
			int count = businessDao.accountVerification(accountNumber);
			if(count != 0) {
				return "false";
			}
			return "true";
		}
		
		//获取销售金额
		@Override
		public Map<String, String> getsales(String id){
			Map<String,String> list = businessDao.getsales(id);
			return list;
		}
		
		//修改用户信息，并返回最新的用户对象
		@Override
		public Business updateBusiness(Business business) {
			// TODO Auto-generated method stub
			boolean flag = businessDao.updateBusiness(business);
			if(flag) {
				Business b = businessDao.getBusiness(business.getBusinessId());
				return b;
			}
			return null;
		}
		
		//修改用户信息，并返回最新的用户对象
		@Override
		public Business updateQualification(Business business) {
			// TODO Auto-generated method stub
			boolean flag = businessDao.updateQualification(business);
			if(flag) {
				Business b = businessDao.getBusiness(business.getBusinessId());
				return b;
			}
			return null;
		}
				
		//修改密码
		@Override
		public boolean updatePassword(String businessId, String password) {
			// TODO Auto-generated method stub
			boolean flag = businessDao.updatePassword(businessId,password);
			return flag;
		}
		
		//获得商品信息
		@Override
		public List<Map<String, Object>> getCommodity(String id) {
			// TODO Auto-generated method stub
			List<Map<String,Object>> list = businessDao.getCommodity(id);
			return list;
		}
		
		//添加商品
		@Override
		public boolean addProduct(Food food) {
			// TODO Auto-generated method stub
			boolean flag = businessDao.addProduct(food);
			return flag;
		}

}
