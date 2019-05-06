<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人主页</title>
</head>
<body>
	<div align="center" style="width:100%;height: auto;float: left">
		<!-- 页面头部 -->
		<div style="width:70%;height:73px;margin-top: 20px;background-color: #ac001c" align="left">
			<div style="width:auto;height: auto;float: left">
				<img src="../images/apex.png" width="233px" height="73px"/>
			</div>
 			<div style="width:auto;height: auto;float: left;line-height: 73px;margin-left: 250px" >
				<font color="#fff" size="25px">个人中心</font>
			</div>
		</div>
		
		<!-- 中间内容 -->
		<div style="width:70%;height:575px;margin-top: 20px;line-height:33px;" align="center">
			<div id="bottom_1" style="text-align:center;float:left"><iframe src="<%=request.getContextPath()%>/user/menu.jsp" width="200px" height="575px"></iframe></div>
			<div id="bottom_2" style="text-align:center;float:left"><iframe src="<%=request.getContextPath()%>/user/blank.jsp" width="840px" height="575px" name="view_frame"></iframe></div>
        </div>
		
		<!-- 页面底部 -->
		<div style="width:70%;height:33px;margin-top: 20px;background-color: #ac001c;line-height:33px;" align="center">
           <span style="color:#fff;align-content: center;">&copy; Copyright 2019, A OnlineOrderingSystem Apart</span>&nbsp;&nbsp;
        </div>
        
	</div>
</body>
</html>