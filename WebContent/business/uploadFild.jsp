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
</script>

<style>
input[type="text"] {
    height:20px;
    border:none;
    border-bottom:1px solid #ccc;
    width:150px;
    margin-right:10px; 
    outline:none;
    height:25px;
     
}
.file {
   outline: none;
       border:none;
    background: #67BEF4;
    border-radius: 4px;
    padding: 4px 12px;
   cursor:pointer;
    color: #fff;
    font-size:18px;
    line-height: 20px;
    vertical-align: middle;
}
</style>

<body>
 <form action="<%=path%>/businessController/uploadFild.do" method="post" enctype="multipart/form-data">
 昵称：<input type="text" name="Name"><br />
 
 <input type="file" name="files" > <br />
        <input type="submit" value="上传">
 
 </form>  
      <div>
    <span>上传文件：</span>
    <input type="file"  id="upload_file" style="display: none;" onchange="change();">  
    <button type="button" class="file" id="select_file"  onclick="upload_file.click();" >  
        选择文件
    </button>
</div>  
</body>
</html>