package com.ordering.business.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ordering.business.bean.Business;
import com.ordering.business.bean.Food;
import com.ordering.business.bean.Order;
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
		
		//根据商店的名称获取商家的信息
		@Override
		public List<Map<String, Object>> getCommodityByName(String id,String name) {
			// TODO Auto-generated method stub
			/*List<Map<String,Object>> businessList = businessDao.getBusinessByBusinessName(name);*/
			List<Map<String,Object>> foodList = businessDao.getCommodityByName(id,name); 
			/*businessList.removeAll(foodList);
			businessList.addAll(foodList);*/
			return foodList;
		}
		
		//根据商品ID获取商品
		@Override
		public Food getFoodById(String id,String businessId) {
			// TODO Auto-generated method stub
			Food food = businessDao.getFoodById(id,businessId);
			return food;
		}
		
		//修改商品
		@Override
		public Food revise(Food food) {
			// TODO Auto-generated method stub
			Food one = businessDao.revise(food);
			return one;
		}
		
		//删除商品
		@Override
		public boolean deleteFoodById(Food food) {
			// TODO Auto-generated method stub
			boolean flag = businessDao.deleteFoodById(food);
			return flag;
		}
		
		//获取新订单
		@Override
		public List<Order> getNewOrders(String id){
			// TODO Auto-generated method stub
			List<Order> list = businessDao.getNewOrders(id);
			return list;
		}
		
		//通过订单获取食物
		@Override
		public List<Map<String,Object>> getFoodByOrders(String id){
			// TODO Auto-generated method stub
			List<Map<String,Object>> list = businessDao.getFoodByOrders(id);
			return list;
		}
		
		//接受订单
		@Override
		public boolean acceptOrder(String id) {
			// TODO Auto-generated method stub
			boolean flag = businessDao.acceptOrder(id);
			return flag;
		}
		
		//拒绝订单
		@Override
		public boolean denialOrder(String id) {
			// TODO Auto-generated method stub
			boolean flag = businessDao.denialOrder(id);
			return flag;
		}

}
