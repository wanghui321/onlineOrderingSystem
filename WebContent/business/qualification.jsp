<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center" style="width:100%;height:100%;border:1px solid red;float: left; background-color: #F4F4F4">
	<div align="center" style="width:90%;height:auto;border:1px solid red; background-color: #fff">
	<div align="center" style="width:20%;height:auto;border:1px solid red;float: left; background-color: #fff">营业许可证</div>
	<div align="center" style="width:78%;height:auto;border:1px solid red;float: left; background-color: #fff">
	<form action="<%=path%>/businessController/updateQualification.do" method="post">
	<input style="width:80%;height:100%" value="${business.businessLicence}" name="businessLicence"/> 
	</div>
	<div align="center" style="width:20%;height:auto;border:1px solid red;float: left; background-color: #fff">法定代表人</div>
	<div align="center" style="width:78%;height:auto;border:1px solid red;float: left; background-color: #fff">
	<input style="width:80%;height:100%" value="${business.corporation}" name="corporation"/> 
	</div>
	<div style="width:90%;height:auto;border:1px solid red; background-color: #fff">
	<button type="submit" style="float: right">修改</button></div>
	</form>
	</div>
	</div>
</body>
</html>