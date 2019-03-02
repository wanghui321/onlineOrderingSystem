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
<script src="<%=request.getContextPath()%>/js/jquery.easyui.min.js"></script>
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
	
	window.onload = function(){
		/*$('#loginWindow').window('close');*/
	}
	
	//显示登录窗口
	function showWindow(msg){
		if(msg == 'login'){
			$('#loginWindow').window({title: "登录"});
		} else{
			$('#loginWindow').window({title: "新用户注册"});
		}
		$('#loginWindow').window('open');
	}
	
	//账号验证
	function accountVerification(){
		debugger;
		var accountNumber = $("#newAccountNumber").val();
		$.ajax({
			type:'post',
			url:"<%=request.getContextPath()%>/userController/accountVerification.do?accountNumber="+accountNumber,
			data:'',
			dataType:'json',
			success:function(msg){
				alert(msg);
				if(msg != null && msg != ""){
					$("#newAccountNumberMsg").html(msg);
				}
			}
		})
		if(accountNumber == null || accountNumber == ""){
			$("#newAccountNumberMsg").html("账号不能为空");
		} else {
			$("#newAccountNumberMsg").html("");
		}
	}
	
	//密码验证
	function passwordVerification(){
		var newPassword = $("#newPassword").val();
		var rePassword = $("#rePassword").val();
		if(newPassword != rePassword){
			$("#rePasswordMsg").html("与用户密码不一致");
		} else {
			$("#rePasswordMsg").html("");
		}
	}
</script>
<body>
	<div align="center" style="width:100%;height: auto;border:1px solid red;float: left">
		<!-- 页面头部 -->
		<div style="width:70%;height:73px;border:1px solid red;margin-top: 20px" align="left">
			<div style="width:auto;height: auto;float: left">
				<img src="../images/logo4.png" width="233px" height="73px"/>
			</div>
 			<div style="width:auto;height: auto;float: right;line-height: 73px" >
				<form style="float: left;margin-right: 70px">
					<input type="text">
					<button type="button">搜索</button>
				</form>
				<a href="#" style="text-decoration:none" onclick="showWindow('login')">登录|</a>
				<a href="#" style="text-decoration:none" onclick="showWindow('regist')">注册</a>
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
        
        <div id="loginWindow" class="easyui-window" style="width:470px;height: 230px;top:50px;left:450px"
	 		data-options="collapsible:false,minimizable:false,maximizable:false,modal:true,draggable:true">
	 		<!-- 注册功能 -->
	 		<div id="regist" style="line-height: 30px;margin-top: 20px;margin-left: 120px">
	 			<form action="<%=request.getContextPath()%>/userController/newRegist.do">
	 				<table>
	 					<tr>
	 						<td>用户账号：</td>
	 						<td>
		 						<input id="newAccountNumber" name="accountNumber" type="text" onblur="accountVerification()"/>
		 						<span id="newAccountNumberMsg" style="color: red"></span>
		 					</td>
	 					</tr>
	 					<tr>
	 						<td>用户昵称：</td>
	 						<td><input id="newNickName" name="nickName" type="text" /></td>
	 					</tr>
	 					<tr>
	 						<td>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
	 						<td>
	 							<input id="newPassword" name="password" type="password"/>
	 							<span id="newPasswordMsg" style="color: red"></span>
	 						</td>
	 					</tr>
	 					<tr>
	 						<td>确认密码：</td>
	 						<td>
	 							<input id="rePassword" name="rePassword" type="password" onblur="passwordVerification()"/>
	 							<span id="rePasswordMsg" style="color: red"></span>
	 						</td>
	 					</tr>
	 				</table>
	 				<table style="margin-top: 20px">
	 					<tr>
	 						<td width="100px" align="center"><button type="submit">注册</button></td>
	 						<td width="100px" align="center"><button type="reset">重置</button></td>
	 					</tr>
	 				</table>
	 			</form>
			</div>
		</div>
	</div>
</body>
</html>