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
	function passwordVerification(){
		var oldPassword = $("#oldPassword").val();
		if(oldPassword != "" && oldPassword != null){
			$.ajax({
				type:'post',
				url:"<%=path%>/userController/passwordVerification/"+oldPassword+".do",
				data:"",
				dataType:"json",
				success:function(msg){
					if(msg == "false"){
						alert("初始密码错误");
					}
				}
			})
		}
	}
</script>
<body>
	<div style="margin: 20px">
		<form action="<%=path%>/userController/updatePassword.do">
			<table border="1px">
				<tr>
					<td>初始密码：</td>
					<td>
						<input id="oldPassword" name="oldPassword" type="password"  style="height: 25px;width: 200px;" 
							onblur="passwordVerification()"/>
					</td>
				</tr>
				<tr>
 					<td>新密码：</td>
 					<td><input id="password" name="password" type="password"  style="height: 25px;width: 200px"/></td>
 				</tr>
  				<tr>
 					<td>确认密码：</td>
 					<td><input id="rePassword" name="rePassword" type="password"  style="height: 25px;width: 200px"/></td>
 				</tr>
				<tr>
					<td colspan="2" align="center"><button type="submit">修改</button></td>
				</tr>
			</table>
	 	</form>
 	</div>
</body>
</html>