<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.util.*" %>
       <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
   <%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/easyui.css" />
<script src="<%=request.getContextPath()%>/js/json2.js"></script>
<title>网上订餐系统</title>
</head>
<script src="<%=request.getContextPath()%>/js/jquery-1.11.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.easyui.min.js"></script>
<script type="text/javascript">
debugger;
	$.ajax({
		type:"post",
		url:"<%=request.getContextPath()%>/businessController/getState.do",
		dataType:'json',
		success:function(msg){
			alert(msg.newOrder);
 			if(msg != null && msg != undefined){
 				var value = msg.newOrder;
 				 
			} 
 			if(value == 3){
 				$("#busi").css("color","red");
 			}else{
 				$("#busi").css("color","orange");
 			}
			$("#business").html(value);
			alert(value);
		}
	})
	
	//显示登录窗口
	function showWindow(){
		$('#loginWindow').window('open');
	}
</script>
<body onload="$('#loginWindow').window('close');" background="#000" >


            
	<div align="center" style="width:100%;height:1222px;border:1px solid red;float: left; background-color: #F4F4F4">
		<div style="width:60%;height: auto;float: left;background-color: #fff;border:1px solid red">
			<div style="width:100%;height: 50px;background-color: #fff;border:1px solid red"align="left"><span style="line-height: 50px;margin-left:25px ">待处理订单：</span></div>
			<div style="width:25%;height: auto;float: left;background-color: #fff"><span>新订单</span></div>
			<div style="width:25%;height: auto;float: left;background-color: #fff"><span>催单</span></div>
			<div style="width:25%;height: auto;float: left;background-color: #fff"><span>退单</span></div>
			<div style="width:25%;height: auto;float: left;background-color: #fff"><span>异常订单</span></div>
			<div style="width:25%;height: auto;float: left;background-color: #fff"><span id="business" style="font-size: 7;font-weight: 2"></span></div>
			<div style="width:25%;height: auto;float: left;background-color: #fff;font-size: 55px" id="busi">444<span  style="font-size: 95px">jjj</span></div>
			<div style="width:25%;height: auto;float: left;background-color: #fff">${business}</div>
			<div style="width:25%;height: auto;float: left;background-color: #fff">sdsfsdfsdfdfs</div>
		</div>
		<div style="width:30%;height: auto;float: right;background-color: #fff;border:1px solid red">sdsfsdfsdfdfs</div>
		<div style="width:60%;height: auto;float: left;background-color: #fff;border:1px solid red">sdsfsdfsdfdfs</div>
		<div style="width:30%;height: auto;float: right;background-color: #fff;border:1px solid red">sdsfsdfsdfdfs</div>
	</div>
	



	

</body>
</html>