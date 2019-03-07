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
 				var newOrder = msg.newOrder;
 				var reminder = msg.reminder;
 				var chargeback = msg.chargeback;
 				var unusualOrder = msg.unusualOrder;
			} 
 			if(newOrder == 0){
 				$("#new").css("color","#c9c9c9");
 			}else{
 				$("#new").css("color","#0085e6");
 			}
			$("#newOrder").html(newOrder);
			if(reminder == 0){
 				$("#rem").css("color","#c9c9c9");
 			}else{
 				$("#rem").css("color","orange");
 			}
			$("#reminder").html(reminder);
			if(chargeback == 0){
 				$("#cha").css("color","#c9c9c9");
 			}else{
 				$("#cha").css("color","#C91D32");
 			}
			$("#chargeback").html(chargeback);
			if(unusualOrder == 0){
 				$("#unu").css("color","#c9c9c9");
 			}else{
 				$("#unu").css("color","#E3DE02");
 			}
			$("#unusualOrder").html(unusualOrder);
			alert(newOrder);
		}
	})
	
	
 	$.ajax({
		type:"post",
		url:"<%=request.getContextPath()%>/businessController/getCommentState.do",
		dataType:'json',
		success:function(msg1){
			alert(msg1.noResponseToNegativeComment);
 			if(msg1 != null && msg1 != undefined){
 				var noResponseToComments = msg1.noResponseToComments;
 				var noResponseToNegativeComment = msg1.noResponseToNegativeComment;
			} 
 			if(noResponseToComments == 0){
 				$("#nor").css("color","#c9c9c9");
 			}else{
 				$("#nor").css("color","#FF6B07");
 			}
			$("#noResponseToComments").html(noResponseToComments);
			if(noResponseToNegativeComment == 0){
 				$("#nrn").css("color","#c9c9c9");
 			}else{
 				$("#nrn").css("color","#676767");
 			}
			$("#noResponseToNegativeComment").html(noResponseToNegativeComment);
		
		}
	}) 
	
	//显示登录窗口
	function showWindow(){
		$('#loginWindow').window('open');
	}
</script>
<body onload="$('#loginWindow').window('close');" background="#000" >


            
	<div align="center" style="width:100%;height:1222px;border:1px solid red;float: left; background-color: #F4F4F4">
		<div style="width:65%;height: auto;float: left;background-color: #fff;border:1px solid red;margin-top: 10px;margin-left: 10px">
			<div style="width:100%;height: 50px;background-color: #fff;border-bottom:1px solid #c9c9c9"align="left"><span style="line-height: 70px;margin-left:25px;font-weight: 700 ;font-size: 20px">待处理订单：</span></div>
			<div style="width:25%;height: auto;float: left;background-color: #fff;margin-top: 50px"><span style="line-height: 50px;font-weight: 700;color: #7b7b7b;font-size: 20px">新订单</span></div>
			<div style="width:25%;height: auto;float: left;background-color: #fff;margin-top: 50px"><span style="line-height: 50px;font-weight: 700;color: #7b7b7b;font-size: 20px">催单</span></div>
			<div style="width:25%;height: auto;float: left;background-color: #fff;margin-top: 50px"><span style="line-height: 50px;font-weight: 700;color: #7b7b7b;font-size: 20px">退单</span></div>
			<div style="width:25%;height: auto;float: left;background-color: #fff;margin-top: 50px"><span style="line-height: 50px;font-weight: 700;color: #7b7b7b;font-size: 20px">异常订单</span></div>
			<div style="width:25%;height: auto;float: left;background-color: #fff;margin-bottom: 50px" id="new"><span id="newOrder" style="font-size: 95px"></span></div>
			<div style="width:25%;height: auto;float: left;background-color: #fff;margin-bottom: 50px" id="rem"><span id="reminder" style="font-size: 95px"></span></div>
			<div style="width:25%;height: auto;float: left;background-color: #fff;margin-bottom: 50px" id="cha"><span id="chargeback" style="font-size: 95px"></span></div>
			<div style="width:25%;height: auto;float: left;background-color: #fff;margin-bottom: 50px" id="unu"><span id="unusualOrder" style="font-size: 95px"></span></div>
		</div>
		<div style="width:32%;height: auto;float: right;background-color: #fff;border:1px solid red;margin-right: 10px;margin-top: 10px">
			 <div style="width:100%;height: 50px;background-color: #fff;border-bottom:1px solid #c9c9c9"align="left"><span style="line-height: 70px;margin-left:25px;font-weight: 700 ;font-size: 20px">待处理订单：</span></div>
			<div style="width:50%;height: auto;float: left;background-color: #fff;margin-top: 50px"><span style="line-height: 50px;font-weight: 700;color: #7b7b7b;font-size: 20px">未回复差评</span></div>
			<div style="width:50%;height: auto;float: left;background-color: #fff;margin-top: 50px"><span style="line-height: 50px;font-weight: 700;color: #7b7b7b;font-size: 20px">未回复评论</span></div>
			<div style="width:50%;height: auto;float: left;background-color: #fff;margin-bottom: 50px" id="nrn"><span id="noResponseToNegativeComment" style="font-size: 95px"></span></div>
			<div style="width:50%;height: auto;float: left;background-color: #fff;margin-bottom: 50px" id="nor"><span id="noResponseToComments" style="font-size: 95px"></span></div>
		</div>
		<div style="width:60%;height: auto;float: left;background-color: #fff;border:1px solid red">sdsfsdfsdfdfs</div>
		<div style="width:30%;height: auto;float: right;background-color: #fff;border:1px solid red">sdsfsdfsdfdfs</div>
	</div>
	



	

</body>
</html>