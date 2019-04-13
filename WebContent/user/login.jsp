<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
</head>
<script src="<%=request.getContextPath()%>/js/jquery-1.11.1.min.js"></script>
<script  type="text/javascript">
	
</script>
<body>
	<div style="width:100%;height: auto;float: left">
		<!-- 页面内容 -->
		<div style="margin-top: 150px;margin-left: 600px">
			<table>
				<tr>
 					<td colspan="2" align="center"><img src="../images/logo4.png" width="290px" height="80px"></td>
 				</tr>
			</table>
 			<form action="<%=request.getContextPath()%>/userController/login.do" method="post">
 				<table>
 					<tr>
 						<td>用户账号：</td>
 						<td>
	 						<input id="accountNumber" name="accountNumber" type="text"
	 							 style="height: 25px;width: 200px" />
	 					</td>
 					</tr>
 					<tr height="20px"></tr>
 					<tr>
 						<td>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
 						<td>
 							<input id="password" name="password" type="password" style="height: 25px;width: 200px"/>
 						</td>
 					</tr>
 					<tr height="20px"></tr>
 					<tr>
 						<td>用户类别：</td>
 						<td>
 							<select style="width: 205px;height: 30px" name="loginType">
							  <option value ="user">用户登录</option>
							  <option value ="business">商家登录</option>
							</select>
 						</td>
 					</tr>
 				</table>
 				<table style="margin-top: 20px" width="300px">
 					<tr>
 						<td width="100px" align="center"><button type="submit">登录</button></td>
 						<td width="100px" align="center"><button type="reset">重置</button></td>
 					</tr>
 					<tr height="20px"></tr>
 					<tr>
						<td colspan="2" id="msg" align="center" height="30px">
							<span style="color: red">${msg}</span>
						</td>
					</tr>
 				</table>
 			</form>
		</div>
		
		<!-- 页面底部 -->
		<div style="width:100%;height:33px;border:1px solid red;background-color: #ac001c;line-height:33px;margin-top: 230px" align="center">
	          <span style="color:#fff;align-content: center;">&copy; Copyright 2019, A OnlineOrderingSystem Apart</span>&nbsp;&nbsp;
	   	</div>
   	</div>
</body>
</html>