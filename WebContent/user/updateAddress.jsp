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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/easyui.css" />
<title>修改地址</title>
</head>
<script src="<%=request.getContextPath()%>/js/jquery-1.11.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.easyui.min.js"></script>
<script type="text/javascript">
	
</script>
<body>
	<form action="<%=path%>/userController/updateAddress.do" method="post">
		<input type="text" id="id" name="id" style="display:none" value="${address.id}"/>
		<table style="text-align: center;" cellspacing="0px" border="1px" bordercolor="#EBEBEB">
			<tr>
				<td>收货人：</td>
				<td width="228px"><input type="text" id="name" name="name" style="width: 228px" value="${address.name}"></td>
				<td>性别：</td>
				<td>
					<c:choose> 
     					<c:when test="${address.sex == '先生'}"> 
							<input name="sex" type="radio" value="先生" checked="checked"/>男
							<input name="sex" type="radio" value="女士"/>女
 						</c:when>      
     					<c:otherwise> 
							<input name="sex" type="radio" value="先生"/>男
							<input name="sex" type="radio" value="女士"  checked="checked"/>女			
  						</c:otherwise> 
				</c:choose>
				</td>
			</tr>
			<tr>
				<td>联系电话：</td>
				<td colspan="3"><input type="text" id="phone" name="phone" style="width: 528px" value="${address.phone}"/></td>
			</tr>
			<tr>
				<td>收货地址：</td>
				<td colspan="3"><textarea id="address" name="address" cols="80" rows="3">${address.address}</textarea></td>
			</tr>
			<tr>
				<td colspan="4"><button type="submit">修改</button></td>
			</tr>
		</table>
	</form>
</body>
</html>