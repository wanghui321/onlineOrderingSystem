package com.ordering.business.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
		
		//获取订单
		@Override
		public List<Order> getOrders(String id,String state){
			// TODO Auto-generated method stub
			List<Order> list = businessDao.getOrders(id,state);
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
		
		//获取日期
		@Override
		public String getPastDate(int past) {
			// TODO Auto-generated method stub
			Calendar calendar = Calendar.getInstance();
			calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) - past);
			Date today = calendar.getTime();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			String result = format.format(today);
			System.out.println(result);
			return result;
		}
		
		//获取其日销售金额
		@Override
		public List<String> sumList(List<String> datalist,String id){
			// TODO Auto-generated method stub
			List<String> list = businessDao.sumList(datalist,id);
			return list;
		}
		
		//获取其日订单数量
		@Override
		public List<String> orderList(List<String> datalist,String id){
			// TODO Auto-generated method stub
			List<String> list = businessDao.orderList(datalist,id);
			return list;
		}
		
		//修改店铺照片
		@Override
		public boolean setHeadPicture(String head,String id){
			// TODO Auto-generated method stub
			boolean flag = businessDao.setHeadPicture(head,id);
			return flag;
		}

		//回复评论
		@Override
		public boolean updateComment(String id, String quantity) {
			// TODO Auto-generated method stub
			boolean flag = businessDao.updateComment(id,quantity);
			return false;
		}

		//获取各种类评论数量
		@Override
		public Map<String, Object> getCommentstate(String businessId) {
			// TODO Auto-generated method stub
			Map<String,Object> list = businessDao.getCommentstate(businessId);
			return list;
		}

		
}
