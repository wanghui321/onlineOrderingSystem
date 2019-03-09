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
<title>修改密码</title>
</head>
<script src="<%=path%>/js/jquery-1.11.1.min.js"></script>
<script  type="text/javascript">
	window.onload = function(){
		var msg = "${repasswordSeccess}"
		if(msg != "" && msg != null){
			$("#msg3").css("display","");
		}
	}
	
	function passwordVerification(){
		var oldPassword = $("#oldPassword").val();
		if(oldPassword != "${business.password}"){
			$("#msg1").css("display","");
			$("#oldPassword").val("");
		} else {
			$("#msg1").css("display","none");
		}
	}
	
	function passwordVerification2(){
		var password = $("#password").val();
		var rePassword = $("#rePassword").val();
		if(password != rePassword){
			$("#msg2").css("display","");
			$("#password").val("");
			$("#rePassword").val("");
		} else {
			$("#msg2").css("display","none");
		}
	}
</script>
<body>
	<div style="margin: 20px">
		<form action="<%=path%>/businessController/updatePassword.do">
			<table>
				<tr>
					<td>初始密码：</td>
					<td>
						<input id="oldPassword" name="oldPassword" type="password"  style="height: 25px;width: 200px;" 
							onblur="passwordVerification()"/>
					</td>
					<td id="msg1" style="display: none"><font color="red">原始密码不正确</font></td>
				</tr>
				<tr><td height="10px"></td></tr>
				<tr>
 					<td>新密码：</td>
 					<td><input id="password" name="password" type="password"  style="height: 25px;width: 200px"/></td>
 				</tr>
 				<tr><td height="10px"></td></tr>
  				<tr>
 					<td>确认密码：</td>
 					<td><input id="rePassword" name="rePassword" type="password"  style="height: 25px;width: 200px"
 						onblur="passwordVerification2()"/></td>
 					<td id="msg2" style="display: none"><font color="red">与新密码不一致</font></td>
 				</tr>
 				<tr><td height="10px"></td></tr>
				<tr>
					<td colspan="2" align="center"><button type="submit">修改</button></td>
				</tr>
				<tr>
					<td colspan="2" align="center" id="msg3" style="display: none">
						修改成功，请重新<a href="<%=path%>/user/login.jsp" target="_parent">登录</a>
					</td>
				</tr>
			</table>
	 	</form>
 	</div>
</body>
</html>