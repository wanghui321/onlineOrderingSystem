package com.ordering.business.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ordering.business.bean.Business;
import com.ordering.business.bean.Food;
import com.ordering.business.bean.Order;
import com.ordering.business.service.businessService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("businessController")
public class businessController {
	@Autowired
	private businessService businessService;
	
	//获取订单状态
	@RequestMapping("getState")
	@ResponseBody
	public JSONObject getState(HttpSession session) {
		System.out.println("213");
		Business b = (Business)session.getAttribute("business");
		String id = b.getBusinessId();
		Map<String,String> map = businessService.getState(id);
		JSONObject data=JSONObject.fromObject(map);
		System.out.println(data);
		return data;
	}
	
	//获取评论状态
		@RequestMapping("getCommentState")
		@ResponseBody
		public JSONObject getCommentState(HttpSession session) {
			System.out.println("213333");
			Business b = (Business)session.getAttribute("business");
			String id = b.getBusinessId();
			Map<String,String> map = businessService.getCommentState(id);
			JSONObject data=JSONObject.fromObject(map);
			System.out.println(data);
			return data;
		}
	
	//新商家注册
		@RequestMapping("newRegist")
		public String newRegist(Model model,Business business) {
			System.out.println("213");
			boolean flag = businessService.regist(business);
			if(flag) {
				model.addAttribute("msg","注册成功");
			} else {
				model.addAttribute("msg","注册失败");
			}
			return "business/regist";
		}
		
		
		//商家登录
		@RequestMapping("login")
		public String login(HttpSession session,Model model,Business business,String loginType) {
			System.out.println(loginType);
			System.out.println(business);
			if(loginType.equals("business")) {
				Business b = businessService.login(business);
				if(b != null) {
					System.out.println(b);
					session.setAttribute("business", b);
					session.setAttribute("bnickName", b.getNickName());
					return "business/home";
				} 
				model.addAttribute("msg","用户名或密码错误");
				return "user/login";
			}
			return "";
		}
		
		//用户账号验证
		@RequestMapping("accountVerification/{accountNumber}")
		@ResponseBody
		public JSONArray accountVerification(@PathVariable String accountNumber) {
			System.out.println(accountNumber);
			String msg = businessService.accountVerification(accountNumber);
			JSONArray json = new JSONArray();
			json.add(msg);
			return json;
		}
		
		//销售金额
		@RequestMapping("getsales")
		@ResponseBody
		public JSONObject getsales(HttpSession session) {
			System.out.println("222222222213");
			Business b = (Business)session.getAttribute("business");
			String id = b.getBusinessId();
			Map<String,String> map = businessService.getsales(id);
			JSONObject data=JSONObject.fromObject(map);
			System.out.println(data);
			return data;
		}
		
		//退出登录
		@RequestMapping("editLogin")
		public String editLogin(HttpSession session) {
			session.removeAttribute("user");
			session.removeAttribute("bnickName");
			return "user/home";
		}
		
		//修改用户信息，并更新session中的用户信息
		@RequestMapping("updateBusiness")
		public String updateBusiness(Business business,HttpSession session,Model model) {
			Business b = (Business)session.getAttribute("business");
			if(business.getNickName()!=null && business.getNickName()!= "")
				b.setNickName(business.getNickName());
			if(business.getPhoneNumber()!=null && business.getPhoneNumber()!= "")
				b.setPhoneNumber( business.getPhoneNumber());
			if(business.getIntroduce()!=null && business.getIntroduce()!= "")
				b.setIntroduce(business.getIntroduce()); 
			if(business.getNotice()!=null && business.getNotice()!= "")
				b.setNotice(business.getNotice());
			if(business.getState()!=null && business.getState()!= "")
				b.setState(business.getState());
			business.setBusinessId(b.getBusinessId());
			Business newBusiness = businessService.updateBusiness(b);
			session.setAttribute("business", newBusiness);
			session.setAttribute("bnickName", newBusiness.getNickName());
			model.addAttribute("msg","修改成功");
			return "business/manager";
		}
		
		//商户营业许可证名修改
		@RequestMapping("updateQualification")
		public String updateQualification(Business business,HttpSession session,Model model) {
			Business b = (Business)session.getAttribute("business");
			if(business.getBusinessLicence()!=null && business.getBusinessLicence()!= "")
				b.setBusinessLicence(business.getBusinessLicence());
			if(business.getCorporation()!=null && business.getCorporation()!= "")
				b.setCorporation(business.getCorporation());
			business.setBusinessId(b.getBusinessId());
			Business newBusiness = businessService.updateQualification(b);
			session.setAttribute("business", newBusiness);
			session.setAttribute("bnickName", newBusiness.getNickName());
			model.addAttribute("msg","修改成功");
			return "business/qualification";
		}
		
		//修改用户密码，并重新登录
		@RequestMapping("updatePassword")
		public String updatePassword(String password,HttpSession session,Model model) {
			Business business = (Business)session.getAttribute("business");
			boolean flag = businessService.updatePassword(business.getBusinessId(),password);
			if(flag) {
				session.removeAttribute("business");
				model.addAttribute("repasswordSeccess","修改密码成功");
				return "business/updatePassword";
			}
			
			return "";
		}
		
		//上传头像
		@RequestMapping("uploadFild")
		@ResponseBody
		public String uploadFild(String Name,@RequestParam(value="files") MultipartFile file,HttpServletRequest request){
			System.out.println("123456789456132");
			if (!file.isEmpty()) {  
	            try {  
	                // 文件保存路径  
	                String filePath = request.getSession().getServletContext().getRealPath("/images/")   
	                        + file.getOriginalFilename();  
	                // 转存文件 
	                String tempPath = this.getClass().getResource("/").toURI().getPath();  
	                System.out.println(tempPath);
	                System.out.println(filePath);
	                file.transferTo(new File(filePath));  
	            } catch (Exception e) {  
	                e.printStackTrace();  
	            }  
	        }
			/*			// 工厂类
	        DiskFileItemFactory dfif = new DiskFileItemFactory();
	        // 用于文件上传
	        ServletFileUpload fileupload = new ServletFileUpload(dfif);
	        // 设置文件大小(单个文件大小限制100k)
	        fileupload.setFileSizeMax(1034 * 100);
	        //设置服务器地址
	        ServletContext servletContext = request.getServletContext();
	        //在服务器创建一个upload文件
	        String realPath = servletContext.getRealPath("/upload");
	        System.out.println("realPath"+realPath);
	        File file = new File(realPath);
	      //判断文件是否为空
	        if(!file.exists()){
	            //如果文件不存在，创建文件
	            file.mkdir();
	        }
	        try {
	            //获取前端上传的文件
	            List<FileItem> fileList=fileupload.parseRequest(request);
	            for(FileItem item:fileList){
	                if(item.isFormField()){
	                    //普通表单项
	                    String name=item.getFieldName();
	                    String value=item.getString("utf-8");
	                    System.out.println(name+":"+value);
	                }else{
	                    //文件表单项
	                    long size=item.getSize();//获取文件格式
	                    //防止上传空文件
	                    if(size ==0){
	                        continue;
	                    }
	                    
	                    System.out.println("size:"+size);
	                    //设置新创建的文件的名字
	                    String contentType = item.getContentType();
	                    String name = item.getName();
	                    if(name.contains("\\")){
	                        name = name.substring(name.lastIndexOf("\\")+1);
	                    }
	                    System.out.println("name:"+name);
	                    //防止同名文件覆盖
	                    String prefix = UUID.randomUUID().toString();
	                    //去除文件中的-
	                    prefix = prefix.replace("-","");
	                    String fileName = prefix+"_"+name;
	                    String fieldName = item.getFieldName();
	                    System.out.println(size+":"+contentType+":--------"+name+":"+fieldName);
	                    
	                    try {
	                        item.write(new File(realPath+"\\"+fileName));
	                    } catch (Exception e) {
	                        // TODO Auto-generated catch block
	                        e.printStackTrace();
	                    }
	                }
	            }
	        }catch(FileSizeLimitExceededException e){
	            System.out.println("文件大小不可以超过50K");
	        } catch (FileUploadException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } */
			return "";
		}
		
		
		//获取商品信息
		@RequestMapping("getCommodity")
		@ResponseBody
		public JSONArray getCommodity(String id) {
			List<Map<String,Object>> list = businessService.getCommodity(id);
			JSONArray json = JSONArray.fromObject(list);
			System.out.println(json);
			return json;
		}
		
		//上传菜品
		@RequestMapping("addProduct")
		public String addProduct(String Name,String price,String quantity,@RequestParam(value="files") MultipartFile file,HttpServletRequest request,HttpSession session,Model model){
			System.out.println("123456789456132");
			String filePath = null;
			if (!file.isEmpty()) {  
	            try {  
	                // 文件保存路径  
	                filePath = request.getSession().getServletContext().getRealPath("/images/")   
	                        + file.getOriginalFilename();  
	                // 转存文件 
	                String tempPath = this.getClass().getResource("/").toURI().getPath();  
	                System.out.println(tempPath);
	                file.transferTo(new File(filePath));  
	            } catch (Exception e) {  
	                e.printStackTrace();  
	            }  
	        }
			Food food = new Food();
			String uuid = UUID.randomUUID().toString().replaceAll("-","");
			Business b = (Business)session.getAttribute("business");
			String id = b.getBusinessId();
			double value = Double.valueOf(price.toString());
			food.setBusinessId(id);
			food.setFoodName(Name);
			food.setId(uuid);			
			food.setImgUrl(file.getOriginalFilename());
			food.setPrice(value);
			food.setIntroduction(quantity);
			boolean flag = businessService.addProduct(food);
			if(flag) {
				model.addAttribute("msg","添加成功");
			} else {
				model.addAttribute("msg","添加失败");
			}
			return "business/addProduct";
		}
		
		//商品的名称搜索相关的商品的信息
		@RequestMapping("getCommodityByName")
		public String getCommodityByName(String name,HttpSession session,Model model) {
			Business b = (Business)session.getAttribute("business");
			String id = b.getBusinessId();
			System.out.println(id);
			List<Map<String,Object>> list = businessService.getCommodityByName(id,name);
			JSONArray json = JSONArray.fromObject(list);
			System.out.println(json);
			model.addAttribute("msg",json);
			return "business/searchGoods";
		}
		
		//根据id获取商品
		@RequestMapping("getFoodById")
		public String getFoodById(String id,HttpSession session,Model model) {
			Business b = (Business)session.getAttribute("business");
			String businessId = b.getBusinessId();
			Food food = businessService.getFoodById(id,businessId);
			JSONArray json = JSONArray.fromObject(food);
			System.out.println(json);
			model.addAttribute("msg",food);
			return  "business/revise";
		}
		
		//修改商品
		@RequestMapping("revise")
		public String revise(String img,String id,String Name,String price,String quantity,@RequestParam(value="files") MultipartFile file,HttpServletRequest request,HttpSession session,Model model){
			String filePath = null;
			Food food = new Food();
			if (!file.isEmpty()) {  
	            try {  
	                // 文件保存路径  
	                filePath = request.getSession().getServletContext().getRealPath("/images/")   
	                        + file.getOriginalFilename();  
	                // 转存文件 
	                String tempPath = this.getClass().getResource("/").toURI().getPath();  
	                System.out.println(tempPath);
	                file.transferTo(new File(filePath));
	                food.setImgUrl(file.getOriginalFilename());
	            } catch (Exception e) {  
	                e.printStackTrace();  
	            }  
	        }else {
	        	food.setImgUrl(img);
	        }
			Business b = (Business)session.getAttribute("business");
			String businessId = b.getBusinessId();
			double value = Double.valueOf(price.toString());
			food.setBusinessId(businessId);
			food.setFoodName(Name);
			food.setId(id);			
			food.setPrice(value);
			food.setIntroduction(quantity);
			Food flag = businessService.revise(food);
			if(flag!=null) {
				model.addAttribute("msg1","修改成功");
				model.addAttribute("msg",flag);
			} else {
				model.addAttribute("msg1","修改失败");
			}
			return "business/revise";
		}
		
		//修改商品
		@RequestMapping("deleteFoodById")
		public String deletFoodById(String id,HttpSession session,Model model) {
			Business b = (Business)session.getAttribute("business");
			String businessId = b.getBusinessId();
			Food food = new Food();
			food.setId(id);
			boolean flag = businessService.deleteFoodById(food);
			if(flag) {
				model.addAttribute("msg","删除成功");
			} else {
				model.addAttribute("msg","删除失败");
			}
			return  "business/commodityManagement";
		}
		
		//获取订单
		@RequestMapping("getOrders")
		@ResponseBody
		public JSONArray getOrders(String state,HttpSession session) {
			Business b = (Business)session.getAttribute("business");
			String id = b.getBusinessId();
			List<Order> list = businessService.getOrders(id,state);
			JSONArray json = JSONArray.fromObject(list);
			System.out.println(json);
			return json;
		}
		
		//通过订单获取食物
		@RequestMapping("getFoodByOrders")
		@ResponseBody
		public JSONArray getFoodByOrders(String id) {
			System.out.println(id);
			List<Map<String,Object>> list = businessService.getFoodByOrders(id);
			JSONArray json = JSONArray.fromObject(list);
			System.out.println(json);
			return json;
		}
		
		//接受订单
		@RequestMapping("acceptOrder")
		public String acceptOrder(String id,Model model) {
			boolean flag = businessService.acceptOrder(id);
			if(flag) {
				model.addAttribute("msg","成功接受");
			} else {
				model.addAttribute("msg","接受失败");
			}
			return  "business/newOrders";
			
		}
		
		//拒绝订单
		@RequestMapping("denialOrder")
		public String denialOrder(String id,Model model) {
			boolean flag = businessService.denialOrder(id);
			if(flag) {
				model.addAttribute("msg","成功拒绝");
			} else {
				model.addAttribute("msg","拒绝失败");
			}
			return  "business/newOrders";
			
		}
		
		//拒绝订单
		@RequestMapping("financial")
		public String financial(Model model,HttpSession session) {
			Business b = (Business)session.getAttribute("business");
			String id = b.getBusinessId();
			List<String> datalist = new ArrayList();
			for(int i = 6;i >= 0;i --) {
				String flag = businessService.getPastDate(i);
				datalist.add(flag);
			}
			List<String> sumlist = businessService.sumList(datalist,id);
			List<String> orderlist = businessService.orderList(datalist,id);
			
			System.out.println(datalist);
			System.out.println(sumlist);
			System.out.println(orderlist);
			model.addAttribute("datalist",datalist);
			model.addAttribute("sumlist",sumlist);
			model.addAttribute("orderlist",orderlist);
			model.addAttribute("todaysum",sumlist.get(0));
			model.addAttribute("todayorder",orderlist.get(0));
			return  "business/financial";
			
		}
		
		//上传头像
		@RequestMapping("setHeadPicture")
		public String setHeadPicture(@RequestParam(value="files") MultipartFile file,HttpServletRequest request,Model model,HttpSession session){
			Business b = (Business)session.getAttribute("business");
			String id = b.getBusinessId();
			String filePath = null;
		System.out.println("123456789456132");
					if (!file.isEmpty()) {  
			            try {  
			            	// 文件保存路径  
			                filePath = request.getSession().getServletContext().getRealPath("/images/businessImg/")   
			                        + file.getOriginalFilename();  
			                // 转存文件 
			                String tempPath = this.getClass().getResource("/").toURI().getPath();  
			                System.out.println(tempPath);
			                file.transferTo(new File(filePath));
			            } catch (Exception e) { 
			                e.printStackTrace();  
			            }
			            
			        }
					String head = file.getOriginalFilename();
					boolean flag = businessService.setHeadPicture(head,id);
					b.setHeadPicture(head);
					session.setAttribute("business", b);
					session.setAttribute("bnickName", b.getNickName());
					if(flag) {
						model.addAttribute("msg","修改成功");
					} else {
						model.addAttribute("msg","修改失败");
					}
					return  "business/headPicture";
		}
		
		//获取评论内容
		@RequestMapping("updateComment")
		public String updateComment(HttpSession session,String id,String quantity,Model model) {
			Business business = (Business)session.getAttribute("business");
			boolean flag = businessService.updateComment(id,quantity);
			if(flag) {
				model.addAttribute("msg","保存成功");
			} else {
				model.addAttribute("msg","保存失败");
			}
			return "business/comment";
		}
		
		//获取评论数量
		@RequestMapping("getCommentstate")
		@ResponseBody
		public JSONObject getCommentstate(HttpSession session) {
			Business business = (Business)session.getAttribute("business");
			Map<String,Object> list = businessService.getCommentstate(business.getBusinessId());
			JSONObject data=JSONObject.fromObject(list);
			System.out.println(list);
			System.out.println(list);
			return data;
		}
		
}
