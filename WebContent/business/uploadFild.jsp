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
 <form action="<%=path%>/businessController/uploadFild.do" method="post" enctype="multipart/form-data">
 昵称：<input type="text" name="Name"><br />
 
 <input type="file" name="files" > <br />
        <input type="submit" value="上传">
 
 </form>  
        
</body>
</html>