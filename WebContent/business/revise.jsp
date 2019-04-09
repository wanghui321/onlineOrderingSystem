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
<script type="text/javascript">
var fileObj = "";
var imgData = "";
window.onload=function(){
	var msg = '${msg}';
	if(msg != null && msg != "" && msg != undefined){
		if(msg == "修改成功"){
			$("#msg").css('display',"");
			alert(msg);
		}
	}
}
$(function() {
$("#upload_file").change(function () {
	var imgUrl = document.getElementById("upload_file").files[0];		
	var src = window.URL.createObjectURL(imgUrl);		
	$("#showImg").attr("src",src);	
});
})
</script>
<body>
<%-- <form action="<%=path%>/businessController/revise.do" method="post" enctype="multipart/form-data">
 	<span style="display: none"><input type="text" name="id" value="${msg.id}"></span>
 	<span style="display: none"><input type="text" name="img" value="${msg.imgUrl}"></span>
 	图片： 
 	<img src="<%=path%>/images/${msg.imgUrl}" width="100px" height="100px"/>  <br /> 
 	<input type="file"  id="upload_file" style="display: none;" name="files" onchange="change();">  
    <button type="button" class="file" id="select_file"  onclick="upload_file.click();" >  
        选择图片
    </button><br />
       菜品名称：<input type="text" name="Name" value="${msg.foodName}"></input><br />
 	价格：<input type="text" name="price" value="${msg.price}"></input><br />
 	简介：<input type="text" name="quantity" value="${msg.introduction}"></input><br />
 	<input type="submit" value="上传">
 </form> --%> 
 <div style="border:1px solid yellow;overflow: auto;width: 100%;height: auto">
<div  style="border:1px solid red;width: 25%;overflow: auto;margin-left: 20%;height: 700px" align="center">
<form action="<%=path%>/businessController/revise.do" style="border:1px solid yellow" method="post" enctype="multipart/form-data">
<span style="display: none"><input type="text" name="id" value="${msg.id}"></span>
 	<span style="display: none"><input type="text" name="img" value="${msg.imgUrl}"></span> 
	<div style="margin: 20px">
	<span style="border:1px solid yellow;float: left;margin-top: 25px">菜品图片：</span>
	<img id="showImg" alt="food" src="<%=path%>/images/${msg.imgUrl}" width="200px" height="220px"><br />
	<input type="file"  id="upload_file" style="display: none;" name="files">  
    <button type="button" class="file" id="select_file"  onclick="upload_file.click();" >  
        选择图片
    </button><br />
    </div>
    <div style="margin: 20px;height: 70px;line-height: 50px;border-bottom:1px solid #c9c9c9">   
       	<span style="border:1px solid yellow;float: left">菜品名称：</span>
       	<input type="text" name="Name" style="height: 50px;font-size: 25px" value="${msg.foodName}"><br />
    </div>
    <div style="margin: 20px;height: 70px;line-height: 50px;border-bottom:1px solid #c9c9c9">   
       	<span style="border:1px solid yellow;float: left">菜品价格：</span>
       	<input type="text" name="price" style="height: 50px;font-size: 25px" value="${msg.price}"><br />
    </div>
    <div style="margin: 20px;height: 150px;line-height: 50px;border-bottom:1px solid #c9c9c9">
       	<span style="border:1px solid yellow;float: left">菜品简介：</span>
       	<textarea rows="2" cols="20" name="quantity" style="height: 70px;font-size: 25px">${msg.introduction}</textarea><br />
    </div>
    <div style="height: 50px;line-height: 50px"> 
 		<input type="submit" class="file" id="select_file" style="margin-top: 0px" value="修改菜品"><br />
 	</div>
 </form> 
 
 </div>
 </div>  
</body>
</html>