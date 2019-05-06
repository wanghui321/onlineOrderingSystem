<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 引入样式文件和动态控制 -->
        <link href="<%=path %>/css/business/bootstrap.min.css" rel="stylesheet">
        <script src="<%=path %>/js/jquery-1.11.1.min.js"></script>
        <script src="<%=path %>/js/bootstrap.min.js"></script>
        <!--主要样式控制-->
        <link href="<%=path %>/css/business/main.css" rel="stylesheet">
<title>商铺</title>
<style type="text/css">	
.wrap{width: 300px;list-style: none;}	
.wrap li{height: 50px;margin:1px;float: left}	
.active{color:#fff;font-weight:bold; background-color: #ac001c; }
</style>
</head>
<body>
<div align="center" style="width:100%;height:1222px; background-color: #F4F4F4">
<div 	 style="width:80%;height:oute;border-buttom:1px solid red; background-color: #F4F4F4">

<ul class="nav  nav-pills">
   <li role="presentation">
                 <a class="active" href="<%=path %>/business/manager.jsp" target="main_Frame" >营业管理</a>
             </li>
             <li role="presentation">
                 <a href="<%=path %>/business/qualification.jsp" target="main_Frame" >资格认证</a>
             </li>
             
</ul>

</div>
<div  style="width:80%;height:100%;border-top:1px solid red; background-color: #F4F4F4">
      <iframe src="<%=request.getContextPath()%>/business/manager.jsp" id="mainFrame" name="main_Frame" 
       frameborder="0" width="100%"  height="100%" frameBorder="0">
       </iframe> 
     </div>
</div>
 <script type="text/javascript">
 $(".nav li").click(function() {
        $(".active").removeClass('active');
        $(this).addClass("active");
    }); 


 </script>
</body>
</html>