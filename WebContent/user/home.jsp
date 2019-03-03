<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/easyui.css" />
<title>网上订餐系统</title>
</head>
<script src="<%=request.getContextPath()%>/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	$.ajax({
		type:"post",
		url:"<%=request.getContextPath()%>/userController/getClassify.do",
		dataType:'json',
		success:function(msg){
 			if(msg != null && msg != undefined){
 				msg = msg.toString();
				msg = msg.split(",");
				var str = '<a href="#" style="text-decoration: none">全部商家</a>&nbsp;&nbsp;&nbsp;';
 				for(var i = 0; i < msg.length; i++){
					str += "<a href='#' style='text-decoration: none'>"+msg[i]+"</a>&nbsp;&nbsp;&nbsp;";
				} 
			} 
			$("#business").html(str);
		}
	})
	debugger;
	var nickName = '${user}';
	if(nickName != null && nickName != ""){
		$("#noLogin").css("display","none");
		$("#logined").css("display","");
	} else {
		$("#logined").css("display","none");
	}
	

</script>
<body>
	<div align="center" style="width:100%;height: auto;border:1px solid red;float: left">
		<!-- 页面头部 -->
		<div style="width:70%;height:73px;border:1px solid red;margin-top: 20px" align="left">
			<div style="width:auto;height: auto;float: left">
				<img src="../images/logo4.png" width="233px" height="73px"/>
			</div>
 			<div style="width:auto;height: auto;float: left;line-height: 73px;margin-left: 300px" >
				<form style="float: left;margin-right: 70px">
					<input type="text">
					<button type="button">搜索</button>
				</form>
			</div>
			<div id="noLogin" style="width:auto;height: auto;float: left;line-height: 73px">
				<a href="login.jsp" style="text-decoration:none">登录|</a>
				<a href="regist.jsp" style="text-decoration:none">注册</a>
			</div>
			<div id="logined" style="width:auto;height: auto;float: left;line-height: 73px;display: none">
				<span>欢迎您：</span><a href="#">${user.nickName}</a>
			</div>
			<div style="width:auto;height: auto;float: left;line-height: 73px;margin-left: 30px">
				<a href="#" style="text-decoration:none">我要开店</a>
				<a href="#" style="text-decoration: none">我的订单</a> 
			</div>
		</div>
		
		<!-- 商家分类 -->
		<div style="width:70%;height:73px;border:1px solid red;margin-top: 20px" align="center">
			<div style="width:auto;height:auto;float:left;line-height:73px">
				<span>商家分类</span>
			</div>
			<div style="width:auto;height:auto;float:left;line-height:73px;margin-left: 20px" id="business">
			</div>
		</div>
		
		<!-- 商家信息 -->
		<div style="width:70%;height:573px;border:1px solid red;margin-top: 20px" align="center">
		
		</div>
		
		<!-- 页面底部 -->
		<div style="width:70%;height:33px;border:1px solid red;margin-top: 20px;background-color: #ac001c;line-height:33px;" align="center">
           <span style="color:#fff;align-content: center;">&copy; Copyright 2019, A OnlineOrderingSystem Apart</span>&nbsp;&nbsp;
        </div>
        
		</div>
</body>
</html>