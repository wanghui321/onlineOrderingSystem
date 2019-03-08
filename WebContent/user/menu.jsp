<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人中心左侧菜单栏</title>
</head>
<body>
	<ul>
		<li><a href="<%=path%>/userController/editLogin.do" target="_parent">退出登录</a></li>
		<li><a href="<%=path%>/user/getUser.jsp" target="view_frame">个人信息</a></li>
		<li><a href="<%=path%>/user/updatePassword.jsp" target="view_frame">修改密码</a></li>
		<li><a href="<%=path%>/userController/histeryOrder.do" target="view_frame">历史订单</a></li>
		<li><a href="<%=path%>/user/addressManager.jsp" target="view_frame">地址管理</a></li>
		<li><a href="<%=path%>/user/home.jsp" target="_parent">返回首页</a></li>
	</ul>
</body>
</html>