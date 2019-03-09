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
	$.ajax({
		type:"post",
		url:"<%=path%>/userController/getClassify.do",
		dataType:'json',
		success:function(data){
			<%-- var str = "<a href='<%=path%>/userController/getBusiness.do?id=0' style='text-decoration: none'>全部商家</a>&nbsp;&nbsp;&nbsp;"; --%>
			str = "<a href='#' onclick='getBusiness(0)' style='text-decoration: none'>全部商家</a>&nbsp;&nbsp;&nbsp;";
			for(var i = 0; i < data.length; i++){
				<%-- str += "<a href='<%=path%>/userController/getBusiness.do?id="+data[i].id+"' style='text-decoration: none'>"+data[i].typeName+"</a>&nbsp;&nbsp;&nbsp;" --%>
				 str += "<a href='#' onclick='getBusiness("+data[i].id+")' style='text-decoration: none'>"+data[i].typeName+"</a>&nbsp;&nbsp;&nbsp;"
			}
			$("#business").html(str);
		}
	})
	
	function getBusiness(id){
		$.ajax({
			type:'post',
			url:"<%=path%>/userController/getBusiness.do",
			data:{
				id:id,
			},
			dataType:'json',
			success:function(data){
				var str = "";
				for(var i = 0; i < data.length; i++){
					str += '<a href="#">';
					str += '<div style="width:95%;height: 115px;margin: 10px;line-height: 39px" class="business">';
					str += '<div style="height: auto;width:auto;float: left">';
					str += '<img src="<%=path%>/images/businessImg/' + data[i].headPicture + ' " width="200px" height="115px"/>';
					str += '</div>';
					str += '<div style="height: auto;width:auto;float: left;margin-left: 20px">';
					str += '<span style="float: left;font-weight: bold;color:black">' + data[i].nickName + '</span><br/>';
					str += '<span style="float: left;color:black">地址：'+ data[i].address +' </span><br/>'
					str += '<span style="float: left;color:black">联系电话：'+ data[i].phoneNumber +' </span>'
					str += '</div>'
					str += '</div>';
					str += '</a>';
				}
				$("#businessMsg").html(str);
			}
					
		})
	}

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
		
		getBusiness(0);
		
	}
</script>
<body>
	<div align="center" style="width:100%;height: auto;float: left">
		<!-- 页面头部 -->
		<div style="width:70%;height:73px;margin-top: 20px;background-color: #F4F4F4" align="left">
			<div style="width:auto;height: auto;float: left">
				<img src="../images/logo4.png" width="233px" height="73px"/>
			</div>
 			<div style="width:auto;height: auto;float: left;line-height: 73px;margin-left: 250px" >
				<form style="float: left;margin-right: 70px">
					<input type="text">
					<button type="button">搜索</button>
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
				<a href="#" style="text-decoration: none">我的订单</a> 
			</div>
		</div>
		
		<!-- 商家分类 -->
		<div style="width:70%;height:73px;margin-top: 20px;background-color: #F4F4F4" align="center">
			<div style="width:auto;height:auto;float:left;line-height:73px">
				<span>商家分类</span>
			</div>
			<div style="width:auto;height:auto;float:left;line-height:73px;margin-left: 20px" id="business">
			</div>
		</div>
		
		<!-- 商家信息 -->
		<div style="width:70%;height:auto;margin-top: 20px;background-color: #F4F4F4" id="businessMsg">
		</div>
		
		<!-- 页面底部 -->
		<div style="width:100%;height:33px;margin-top: 20px;background-color: #ac001c;line-height:33px;" align="center">
           <span style="color:#fff;align-content: center;">&copy; Copyright 2019, A OnlineOrderingSystem Apart</span>&nbsp;&nbsp;
        </div>
        
	</div>
</body>
</html>