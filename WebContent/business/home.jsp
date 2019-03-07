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

<title>bootstrap后台模板设计</title>

</head>
<script type="text/javascript">
window.onload=function(){
var nickName = '${business.nickName}';
var a = 1 ;
alert(nickName);
}
</script>
<body>
<!--顶部导航栏部分-->
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <img src="../images/apex.png" width="175px" height="60px"/>
       </div>
       <div class="collapse navbar-collapse">
           <ul class="nav navbar-nav navbar-right">
               <li role="presentation">
                   <a href="#">当前用户：<span class="badge">${bnickName}</span></a>
               </li>
               <li>
                   <a href="../login/logout">
                         <span class="glyphicon glyphicon-lock"></span>退出登录</a>
                </li>
            </ul>
       </div>
    </div>      
</nav>

<!-- 中间主体内容部分 -->
<div class="pageContainer">
     <!-- 左侧导航栏 -->
     <div class="pageSidebar">
         <ul class="nav nav-stacked nav-pills">
             <li role="presentation">
                 <a href="sales.jsp" target="mainFrame" >商家管理</a>
             </li>
             <li role="presentation">
                 <a href="adminLogin.jsp" target="mainFrame">用户管理</a>
             </li>
             <li role="presentation">
                 <a href="adminLogin.jsp" target="mainFrame">订单管理</a>
             </li>
             <!-- 开始 -->
             <li role="presentation">
                     <a href="adminLogin.jsp" target="mainFrame">个人设置</a>
             </li>
             <!-- 结束 -->
             <li role="presentation">
                 <a href="nav5.html" target="mainFrame">权限设置</a>
             </li>



         </ul>
     </div>

      <!-- 左侧导航和正文内容的分隔线 -->
     <div class="splitter"></div>
     <!-- 正文内容部分 -->
     <div class="pageContent">
       <iframe src="<%=request.getContextPath()%>/business/main.jsp" id="mainFrame" name="mainFrame" 
       frameborder="0" width="100%"  height="100%" frameBorder="0">
       </iframe> 
     </div>

 </div>
  <!-- 底部页脚部分 -->
 <div class="footer">
     <p class="text-center">
         <span style="color:#fff;align-content: center;">&copy; Copyright 2019, A OnlineOrderingSystem Apart</span>&nbsp;&nbsp;
     </p>
 </div>

 <script type="text/javascript">
 $(".nav li").click(function() {
        $(".active").removeClass('active');
        $(this).addClass("active");
    }); 


 </script>
</body>
</html>