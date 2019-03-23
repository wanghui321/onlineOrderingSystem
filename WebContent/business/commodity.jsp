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
.active{font-weight:bold; background-color: pink; color:#fff;}
</style>
</head>
<body>
<div align="center" style="width:100%;height:1222px;border:1px solid red; background-color: #F4F4F4">
<div 	 style="width:80%;height:oute;border:1px solid red; background-color: #F4F4F4">

<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid" style="background-color: #ac001c">
    <div class="navbar-header">
        <a class="navbar-brand" href="<%=request.getContextPath()%>/business/commodityManagement.jsp" style="color: #fff" target="Frame">全部菜品</a>
    </div>
    <div>
        <form class="navbar-form navbar-left" role="search">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Search">
            </div>
            <button type="submit" class="btn btn-default">提交按钮</button>
        </form>
        <a href="<%=request.getContextPath()%>/business/addProduct.jsp" target="Frame"><button type="button" class="btn btn-default navbar-btn">
            添加菜品
        </button></a>
    </div>
	</div>
</nav>

</div>
<div  style="width:80%;height:100%;border:1px solid red; background-color: #F4F4F4">
      <iframe src="<%=request.getContextPath()%>/business/commodityManagement.jsp" id="mainFrame" name="Frame" 
       frameborder="0" width="100%"  height="100%" frameBorder="0">
       </iframe> 
     </div>
</div>
</body>
</html>