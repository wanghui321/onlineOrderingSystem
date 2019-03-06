<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
</head>
<script src="<%=request.getContextPath()%>/js/jquery-1.11.1.min.js"></script>
<script  type="text/javascript">
	//账号验证
	function accountVerification(){
		var accountNumber = $("#newAccountNumber").val();
		if(accountNumber == null || accountNumber == ""){
			$("#newAccountNumberMsg").html("账号不能为空");
			$("#newAccountNumberMsg").attr("style","color:red");
		} else {
			$.ajax({
				type:'post',
				url:"<%=request.getContextPath()%>/userController/accountVerification/"+accountNumber+".do",
				data:"",
				dataType:"json",
				success:function(msg){
					if(msg != null && msg != "" && msg == "true"){
						$("#newAccountNumberMsg").html("该账号可以使用");
						$("#newAccountNumberMsg").attr("style","color:green");
						
					} else {
						$("#newAccountNumberMsg").html("该账号已被注册");
						$("#newAccountNumberMsg").attr("style","color:red");
					}
					
				}
			})
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
	
	window.onload=function(){
		var msg = '${msg}';
		if(msg != null && msg != "" && msg != undefined){
			if(msg == "注册成功"){
				$("#msg").css("display","");
			}
		}
	}
	
</script>
<body>
	<div style="width:100%;height: auto;float: left">
		<!-- 页面内容 -->
		<div style="margin-top: 150px;margin-left: 580px">
			<table>
				<tr>
 					<td colspan="2" align="center"><img src="../images/logo4.png" width="290px" height="80px"></td>
 				</tr>
			</table>
 			<form action="<%=request.getContextPath()%>/userController/newRegist.do" method="post">
 				<table>
 					<tr>
 						<td>用户账号：</td>
 						<td>
	 						<input id="newAccountNumber" name="accountNumber" type="text"
	 							 style="height: 25px;width: 200px" onblur="accountVerification()"/>
	 						<span id="newAccountNumberMsg" style="color: red"></span>
	 					</td>
 					</tr>
 					<tr height="20px"></tr>
 					<tr>
 						<td>用户昵称：</td>
 						<td><input id="newNickName" name="nickName" type="text"  style="height: 25px;width: 200px"/></td>
 					</tr>
 					<tr height="20px"></tr>
 					<tr>
 						<td>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
 						<td>
 							<input id="newPassword" name="password" type="password" style="height: 25px;width: 200px"/>
 							<span id="newPasswordMsg" style="color: red"></span>
 						</td>
 					</tr>
 					<tr height="20px"></tr>
 					<tr>
 						<td>确认密码：</td>
 						<td>
 							<input id="rePassword" name="rePassword" type="password" 
 							 	style="height: 25px;width: 200px" onblur="passwordVerification()"/>
 							<span id="rePasswordMsg" style="color: red"></span>
 						</td>
 					</tr>
 				</table>
 				<table style="margin-top: 20px" width="300px">
 					<tr>
 						<td width="100px" align="center"><button type="submit">注册</button></td>
 						<td width="100px" align="center"><button type="reset">重置</button></td>
 					</tr>
 					<tr>
						<td colspan="2" id="msg" style="display:none">
							<span>注册成功，请<a href="login.jsp">登录</a></span>
						</td>
					</tr>
 				</table>
 			</form>
		</div>
		
		<!-- 页面底部 -->
		<div style="width:100%;height:33px;border:1px solid red;background-color: #ac001c;line-height:33px;margin-top: 225px" align="center">
	          <span style="color:#fff;align-content: center;">&copy; Copyright 2019, A OnlineOrderingSystem Apart</span>&nbsp;&nbsp;
	   	</div>
   	</div>
</body>
</html>