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
var fileObj = "";
var imgData = "";
window.onload=function(){
	var img = '${business.headPicture}';
	if(img == null || img == "" || img == undefined){
		var src = "<%=request.getContextPath()%>/images/blank.png";
		$("#showImg").attr("src",src);
	}else{
		var src = "<%=path%>/images/businessImg/${business.headPicture}";
		$("#showImg").attr("src",src);
	}
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
	/* $(".jcrop-holder img").attr("src",src);
    // 构造一个文件渲染对象
    var reader = new FileReader();
    // 得到文件列表数组
    fileObj = $(this)[0].files[0];
    // 拿到文件数据
    reader.readAsDataURL(fileObj);

    reader.onload = function() {
        // 获取文件信息
        imgData = reader.result;
        // 显示图片
        $("#showImg").attr("src", imgData);
        $("#showImg").show();
    } */
});
})
</script>
<body>
<div style="overflow: auto;width: 100%;height: auto">
<div  style="width: 25%;overflow: auto;margin-left: 20%;height: 700px" align="center">
<form action="<%=path%>/businessController/setHeadPicture.do" method="post" enctype="multipart/form-data"> 
	<div style="margin: 20px">
	<span style="float: left;margin-top: 25px">商店照片：</span>
	<img id="showImg" alt="food" width="200px" height="220px"><br />
	<input type="file"  id="upload_file" style="display: none;" name="files">  
    <button type="button" class="file" id="select_file"  onclick="upload_file.click();" >  
        选择图片
    </button><br />
    </div>
    <div style="margin: 20px;height: 50px;line-height: 50px"> 
 		<input type="submit" class="file" id="select_file" style="margin: 20px;margin-top: 50px" value="修改照片">
 	</div>	
 </form> 
 </div>
 </div> 
</body>
</html>