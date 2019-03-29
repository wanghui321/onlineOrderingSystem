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
<link href="<%=path %>/css/business/updatefile.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
function change(){  
    document.getElementById("upload_file_tmp").value=document.getElementById("upload_file").value; 
} 
</script>
<body>
<form action="<%=path%>/businessController/revise.do" method="post" enctype="multipart/form-data">
 	<span style="display: none"><input type="text" name="id" value="${msg.id}"></span>
 	<span style="display: none"><input type="text" name="img" value="${msg.imgUrl}"></span>
 	图片： 
 	<img src="<%=path%>/images/${msg.imgUrl}" width="100px" height="100px"/>  <br /> 
 	<input type="file"  id="upload_file" style="display: none;" name="files" onchange="change();">  
    <button type="button" class="file" id="select_file"  onclick="upload_file.click();" >  
        选择文件
    </button><br />
       菜品名称：<input type="text" name="Name" value="${msg.foodName}"></input><br />
 	价格：<input type="text" name="price" value="${msg.price}"></input><br />
 	简介：<input type="text" name="quantity" value="${msg.introduction}"></input><br />
 	<input type="submit" value="上传">
 </form>  
</body>
</html>