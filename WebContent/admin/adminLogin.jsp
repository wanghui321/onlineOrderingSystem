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
                <a class="brand" href="index.html"><span class="first">网上订餐系统</span> <span class="second">管理员系统</span></a>
        </div>
    </div>
    


    

    
        <div class="row-fluid">
    <div class="dialog">
        <div class="block">
            <p class="block-heading">登录</p>
            <div class="block-body">
                <form id="form">
                    <label>用户名</label>
                    <input type="text" class="span12" name="userName">
                    <label>密码</label>
                    <input type="password" class="span12" name="password">
                    <label>验证码</label>
                    <input type="text" class="span5">
                    <a onclick="login();" class="btn btn-primary pull-right">登录</a>
                    
                    <div class="clearfix"></div>
                </form>
            </div>
        </div>
        <p class="pull-right" style=""><a onclick="saveInfo();">注册帐号</a></p>
        <p><a href="reset-password.html">Forgot your password?</a></p>
    </div>
</div>
<script type="text/javascript">
 function saveInfo(){
	$.ajax({
        type:"POST",
        url:"<%=request.getContextPath()%>/adminController/saveInfo.do",
        data:$("#form").serialize(),
        async: false,
        success:function(data){
        	if(data == DATA_STATE_FAIL){
            	layer.msg("操作失败！");
               
            }else if(data == DATA_STATE_UPDATE){
            	layer.msg("修改成功！");
                
            }else{
            	layer.msg("保存成功！");
            	
            	
            	
            }
        }
    });
 }
 function login(){
		$.ajax({
	        type:"POST",
	        url:"<%=request.getContextPath()%>/adminController/login.do",
	        data:$("#form").serialize(),
	        async: false,
	        success:function(data){
	        	if(data == 'success'){
	            	layer.msg("登陆成功！");
	            	window.location.href = "<%=request.getContextPath()%>/admin/adminMain.jsp";
	               
	            }else{
	            	layer.msg("用户名密码不对！");
	            }
	        }
	    });
	 }
</script>
</body>
</html>