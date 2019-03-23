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
<script src="<%=request.getContextPath()%>/js/jquery-1.11.1.min.js"></script>
<body>
<form action="<%=path%>/businessController/addProduct.do" method="post" enctype="multipart/form-data">
 
 
    头像：<input type="file" name="files" > <br />
        
       菜品名称：<input type="text" name="Name"><br />
 	价格：<input type="text" name="price"><br />
 	简介：<input type="text" name="quantity"><br />
 	<input type="submit" value="上传">
 </form>  
</body>
</html>