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
<link rel="shortcut icon" href="../images/logo.png" type="image/x-icon" />
<!-- 引入样式文件和动态控制 -->
        <link href="<%=path %>/css/admin/bootstrap.css" rel="stylesheet">
        <script src="<%=path %>/js/jquery-1.11.1.min.js"></script>
        <script src="<%=path %>/js/admin/bootstrap.min.js"></script>
        <script src="<%=path %>/js/admin/layer.js"></script>
        <!--主要样式控制-->
        <link href="<%=path %>/css/admin/theme.css" rel="stylesheet">
       
<style type="text/css">
        #line-chart {
            height:300px;
            width:800px;
            margin: 0px auto;
            margin-top: 1em;
        }
        .brand { font-family: georgia, serif; }
        .brand .first {
            color: #ccc;
            font-style: italic;
        }
        .brand .second {
            color: #fff;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="navbar">
        <div class="navbar-inner">
                <ul class="nav pull-right">
                    
                </ul>
                <a class="brand" href="index.html"><span class="first">欢迎你</span> <span class="second">${adminName}</span></a>
        </div>
    </div>
    


    

    
        <div class="row-fluid">
    
</div>
<script type="text/javascript">
 
</script>
</body>
</html>