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
function change(){  
    document.getElementById("upload_file_tmp").value=document.getElementById("upload_file").value; 
} 
$(function() {
$("#asd").change(function () {
	alert("123465");
	var imgUrl = document.getElementById("asd").files[0];		
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
window.onload = function(){
	var i = 3.5;
	var q = i * 12;
	$("#xing").css("width",q);	
}

</script>

<style>
input[type="text"] {
	height: 20px;
	border: none;
	border-bottom: 1px solid #ccc;
	width: 150px;
	margin-right: 10px;
	outline: none;
	height: 25px;
}

.file {
	outline: none;
	border: none;
	background: #67BEF4;
	border-radius: 4px;
	padding: 4px 12px;
	cursor: pointer;
	color: #fff;
	font-size: 18px;
	line-height: 20px;
	vertical-align: middle;
}

.menu {
	font-size: 18px;
	font-weight: bold;
}

.menu li {
	text-decoration: none;
	list-style: none;
	display: inline; 
	
	background-color: #30DDEB;
		
}

.menu li a {
	text-decoration: none; //
	margin-right: 20px;
	margin-left: 20px;
	height: 40px;
	line-height: 40px;
	text-align: center;
}


.menu li a:hover {
	background-color: #FCFCFC;
	
}
.unactive{
	color: #000;
	padding-bottom:20px;
}
.active{
	color: #ac001c;
	padding-bottom:20px;
	border-bottom: 3px solid #ac001c;
}
.menu li a:visited{
	
}
</style>

<body>
	<ul class="menu">
		<li><a class="active" href="#">123</a></li>
		<li><a href="#">123</a></li>
		<li><a href="#">123</a></li>
		<li><a href="#">123</a></li>
	</ul>
	
	<span style="width: 60px;height: 12px;line-height: 12px;overflow: hidden;background-image: url(<%=path%>/images/xingxing.png);background-repeat: repeat-x;display: inline-block;background-size: contain;">
	<span id="xing" style="width: 60px;height: 12px;line-height: 12px;overflow: hidden;background-image: url(<%=path%>/images/xingxing2.png);background-repeat: repeat-x;display: inline-block;background-size: contain;"></span>
	</span>
contain 
 <form action="<%=path%>/businessController/uploadFild.do" method="post" enctype="multipart/form-data">
 昵称：<input type="text" name="Name"><br />
 <img id="showImg" alt="123" src="" style="width: 100px;height: 100px">
 <input id="asd" type="file" name="files" > <br />
        <input type="submit" value="上传">
 
 </form>  
      <div>
    <span class="active">上传文件：</span>
    <input type="file"  id="upload_file" style="display: none;" onchange="change();">  
    <button type="button" class="file" id="select_file"  onclick="upload_file.click();" >  
        选择文件
    </button>
</div>  
</body>
<script type="text/javascript">
$(".menu li a").click(function() {
    $(".menu li a").removeClass('active');
    $(this).removeClass('unactive');
    $(this).addClass("active");
    $(".menu li a").addClass("unactive");
}); 
</script>
</html>