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
<script type="text/javascript">
window.onload=function(){
	var msg = '${msg}';
	if(msg != null && msg != "" && msg != undefined){
		if(msg == "添加成功"){
			$("#msg").css('display',"");
			alert(msg);
		}
	}	
}
</script>
<body>
<form action="<%=path%>/businessController/addProduct.do" method="post" enctype="multipart/form-data">
 
 
	菜品图片：<input type="file" name="files" > <br />
        
       菜品名称：<input type="text" name="Name"><br />
 	价格：<input type="text" name="price"><br />
 	简介：<input type="text" name="quantity"><br />
 	<input type="submit" value="添加">
 	<span id="msg" style="display:none">添加成功</span>
 </form>  
</body>
</html>