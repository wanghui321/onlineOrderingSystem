<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户个人信息</title>
</head>
<script src="<%=path%>/js/jquery-1.11.1.min.js"></script>
<script  type="text/javascript">
	
	window.onload = function(){
		var msg = '${msg}';
		if (msg != "" && msg != null && msg =="修改成功"){
			alert("修改成功");
		}
	}
	
	function setNickName(){
		var nickName = $("#nickName").val();
		if(nickName == "" || nickName == null){
			alert("昵称不能为空");
		}
	}
	
	function setPhoneNumber(){
		debugger;
		var phoneNumber = $("#phone").val();
		if(phoneNumber != "" && phoneNumber != null){
			var length = phoneNumber.length;
			if(length != 11){
				alert("电话号码格式不正确");
			}
		}
	}
</script>
<body>
	<div style="margin: 20px">
		<form action="<%=path%>/userController/updateUser.do">
			<table border="1px" bordercolor="#EBEBEB" cellspacing="0px">
				<tr>
					<td>用户账号：</td>
					<td>
						<input id="accountNumber" name="accountNumber" type="text"  style="height: 25px;
							width: 200px; background-color: #EBEBEB" value="${user.accountNumber}" readonly="readonly"/>
					</td>
				</tr>
				<tr>
 					<td>用户昵称：</td>
 					<td><input id="nickName" name="nickName" type="text"  style="height: 25px;width: 200px"
 						value="${user.nickName}" onblur="setNickName()"/></td>
 				</tr>
  				<tr>
					<td>联系电话：</td>
					<td>
						<input id="phone" name="phone" type="text" style="height: 25px;width: 200px"
							value="${user.phone}" onblur="setPhoneNumber()"/>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><button type="submit">修改</button></td>
				</tr>
			</table>
	 	</form>
 	</div>
</body>
</html>