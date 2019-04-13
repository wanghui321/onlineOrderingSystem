<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/easyui.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/css/user/user.css" />
<title>网上订餐系统</title>
</head>
<script src="<%=path%>/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	
	window.onload = function(){
		//获取用户名
		var nickName = '${nickName}';
		if(nickName != null && nickName != ""){
			$(".noLogin").css("display","none");
			$("#noLogin1").css("display","none");
			$("#logined").css("display","");
			$("#editLogin").css("display","");
			$("#nickName").text('${nickName}');
		} else {
			$("#logined").css("display","none");
			$("#editLogin").css("display","none");
		}
		
		$("#businessData").html("");
		var businessData = '${businessMsg}';
		if(businessData != null && businessData != '' && businessData != '[]'){
			$("#businessData").html(businessData);
		}
		$("#businessIframe").attr('src','<%=request.getContextPath()%>/user/businessMsg.jsp');
	}
	
	function getMyOrder(){
		var nickName = '${nickName}';
		if(nickName != null && nickName != ""){
			$("#businessIframe").attr('src','<%=request.getContextPath()%>/user/myOrder.jsp');
		} else {
			alert("登录之后才能查看我的订单信息");
		}
	}
	
/* 	function getBusinessByName(){
		debugger;
		var businessName = $("#name").val();
		var childWindow = $("#businessIframe")[0].contentWindow;
		childWindow.getBusinessByName(businessName);
	} */
</script>
<body>
	<div align="center" style="width:100%;height: auto;float: left">
		<!-- 页面头部 -->
		<div style="width:70%;height:73px;margin-top: 20px;align-content: left">
			<div style="width:auto;height: auto;float: left">
				<img src="../images/logo4.png" width="233px" height="73px"/>
			</div>
 			<div style="width:auto;height: auto;float: left;line-height: 73px;margin-left: 250px" >
				<form style="float: left;margin-right: 70px" method="post" action="<%=path%>/userBusinessController/getBusinessByName.do">
					<input type="text" name="name" id="name" />
					<button type="submit">搜索</button>
				</form>
			</div>
			<div id="noLogin1" style="width:auto;height: auto;float: left;line-height: 73px;display:''">
				<a href="<%=path%>/user/login.jsp" style="text-decoration:none">登录|</a>
				<a href="<%=path%>/user/regist.jsp" style="text-decoration:none">注册</a>
			</div>
			<div id="logined" style="width:auto;height: auto;float: left;line-height: 73px;display:none">
				<span>欢迎您：</span><a href="<%=path%>/user/personalHomepage.jsp" id="nickName">${user.nickName}</a>
			</div>
			<div style="width:auto;height: auto;float: left;line-height: 73px;margin-left: 20px">
				<a class="noLogin" href="<%=path%>/business/regist.jsp" style="text-decoration:none">我要开店</a>
				<a id="editLogin" href="<%=path%>/userController/editLogin.do" style="text-decoration: none">退出登录</a>
				<a href="javascript:void(0)" onclick="getMyOrder()" style="text-decoration: none">我的订单</a> 
				<a href="<%=path%>/user/home.jsp" style="text-decoration: none">首页</a>
			</div>
		</div>
		
		<!-- 商店分类和商店信息 -->
		<div style="width:100%;line-height:33px;background-color: #EBEBEB;" align="center">
			<div id="businessBottom" style="text-align:center;width:100%;min-height:605px;border-radius: 10px;">
				<span style="display: none" id="businessData"></span>
				<iframe id="businessIframe" frameborder="0" width="100%"></iframe>
			</div>
        </div>
		
		<!-- 商家分类 -->
<!-- 		<div style="width:70%;height:73px;margin-top: 20px;background-color: #F4F4F4" align="center">
			<div style="width:auto;height:auto;float:left;line-height:73px">
				<span>商家分类</span>
			</div>
			<div style="width:auto;height:auto;float:left;line-height:73px;margin-left: 20px" id="business">
			</div>
		</div> -->
		
		<!-- 商家信息 -->
<!-- 		<div style="width:70%;height:auto;margin-top: 20px;background-color: #F4F4F4" id="businessMsg">
		</div> -->
		
		<!-- 页面底部 -->
		<div style="width:100%;height:33px;background-color: #ac001c;line-height:33px;" align="center">
           <span style="color:#fff;align-content: center;">&copy; Copyright 2019, A OnlineOrderingSystem Apart</span>&nbsp;&nbsp;
        </div>
        
	</div>
</body>
</html>