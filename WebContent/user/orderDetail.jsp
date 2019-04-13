<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
	String orderId = request.getParameter("id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/easyui.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/css/user/user.css" />
<title>订单详情</title>
</head>
<script src="<%=path%>/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	function IFrameResize(){ 
		//alert(this.document.body.scrollHeight); //弹出当前页面的高度 
		var obj = parent.document.getElementById("businessIframe"); //取得父页面IFrame对象 
		//alert(obj.height); //弹出父页面中IFrame中设置的高度 
		obj.height = this.document.body.scrollHeight + 18; //调整父页面中IFrame的高度为此页面的高度 
	} 
	window.onload = function(){
		$.ajax({
			type:'post',
			url:'<%=path%>/userBusinessController/getFoodDetail.do',
			data:{
				orderId:'<%=orderId%>'
			},
			dataType:'json',
			success:function(msg){
				var str = "";
				for(var i = 0; i < msg.length; i++){
					str += '<div style="height: 60px;width: 100%;border-bottom: 2px #EBEBEB solid;">';
					str += '<div style="float: left;width: 50%;line-height: 60px;margin-left: 10px" align="left">';
					str += '<span> ' + msg[i].foodName + ' </span>';
					str += '</div>';
					str += '<div style="height: auto;float: left;margin-left: 300px;line-height: 60px">';
					str += '<span>*'+ msg[i].number +'</span>';
					str += '</div>';
					str += '<div style="height: auto;float: right;margin-left: 18px;line-height: 60px;margin-right: 30px">';
					str += '<span style="color: #ac001c;font-size: 20px">￥'+ msg[i].totalPrice +'</span>';
					str += '</div>';
					str += '</div>';
				}
				$("#order").html(str);
			}
		})
		
		$.ajax({
			type:'post',
			url:'<%=path%>/userBusinessController/getOrderDetail.do',
			data:{
				orderId:'<%=orderId%>'
			},
			dataType:'json',
			success:function(msg){
				$("#remake").html(msg[0].remake);
				$("#name").html(msg[0].name);
				$("#address").html(msg[0].address);
				$("#phone").html(msg[0].phone);
				$("#data").html("下单时间：" + msg[0].data);
				$("#totalPrice").html("已支付：￥" + msg[0].totalPrice);
				if(msg[0].state == "0"){
					$("#cancleOrder").css("display","");
					$("#done").css("display","none");
					$("#urge").css("display","none");
					$("#haveUrge").css("display","none");
					$("#haveDone").css("display","none");
					$("#comment").css("display","none");
					$("#refuse").css("display","none");
					$("#cancel").css("display","none");
					$("haveComment").css("display","none");
				} else if(msg[0].state == "1" || msg[0].state == "6"){
					$("#cancleOrder").css("display","");
					$("#done").css("display","");
					$("#urge").css("display","");
					$("#haveUrge").css("display","none");
					$("#haveDone").css("display","none");
					$("#comment").css("display","none");
					$("#refuse").css("display","none");
					$("#cancel").css("display","none");
					$("haveComment").css("display","none");
				} else if (msg[0].state == "2"){
					$("#cancleOrder").css("display","");
					$("#done").css("display","");
					$("#urge").css("display","none");
					$("#haveUrge").css("display","");
					$("#haveDone").css("display","none");
					$("#comment").css("display","none");
					$("#refuse").css("display","none");
					$("#cancel").css("display","none");
					$("haveComment").css("display","none");
				} else if (msg[0].state == "3"){
					$("#cancleOrder").css("display","none");
					$("#done").css("display","none");
					$("#urge").css("display","none");
					$("#haveUrge").css("display","none");
					$("#haveDone").css("display","none");
					$("#comment").css("display","none");
					$("#refuse").css("display","none");
					$("#cancel").css("display","");
					$("haveComment").css("display","none");
				} else if(msg[0].state == "4"){
					$("#cancleOrder").css("display","none");
					$("#done").css("display","none");
					$("#urge").css("display","none");
					$("#haveUrge").css("display","none");
					$("#haveDone").css("display","");
					$("#comment").css("display","");
					$("#refuse").css("display","none");
					$("#cancel").css("display","none");
					$("#haveComment").css("display","none");
				} else if(msg[0].state == "5"){
					$("#cancleOrder").css("display","none");
					$("#done").css("display","none");
					$("#urge").css("display","none");
					$("#haveUrge").css("display","none");
					$("#haveDone").css("display","none");
					$("#comment").css("display","none");
					$("#refuse").css("display","");
					$("#cancel").css("display","none");
					$("haveComment").css("display","none");
				} else if(msg[0].state == "7"){
					$("#cancleOrder").css("display","none");
					$("#done").css("display","none");
					$("#urge").css("display","none");
					$("#haveUrge").css("display","none");
					$("#haveDone").css("display","none");
					$("#comment").css("display","none");
					$("#refuse").css("display","none");
					$("#cancel").css("display","none");
					$("haveComment").css("display","");
				}
			}
		})
		
		setTimeout("IFrameResize()","500");
	}
</script>
<body>
	<div style="height: auto;width: 100%" align="center">
		<div style="height: auto;width:70%;background-color: #fff;border-radius: 10px">
			<!-- 订单信息 -->
			<div id="order">
<!--  				<div style="height: 60px;width: 100%;border-bottom: 2px #EBEBEB solid;">
					商品名称
					<div style="float: left;width: 50%;line-height: 60px;margin-left: 10px" align="left">
						<span>莲藕排骨锅套餐</span>
					</div>
					数量
					<div style="height: auto;float: left;margin-left: 300px;line-height: 60px">
						<span>*1</span>
					</div>
					商品价格
					<div style="height: auto;float: right;margin-left: 18px;line-height: 60px;margin-right: 30px">
						<span style="color: #ac001c;font-size: 20px">￥1230</span>
					</div>
				</div> -->
			</div>
			<!-- 备注 -->
			<div style="height: 60px;width: 100%;border-bottom: 2px #EBEBEB solid;line-height: 60px">
				<div style="height: auto;float: left;margin-left: 10px;">
					<span>备注:</span>	
				</div>
				<div align="center">
					<p id="remake"></p>
				</div>
			</div>
			<!-- 收货地址 -->
			<div style="height: 60px;width: 100%;border-bottom: 2px #EBEBEB solid;">
				<div style="height: auto;float: left;margin-left: 10px;line-height: 60px">
					<span>收货地址:</span>	
				</div>
 				<table id="selectAddress" style="text-align: center;margin: 5px" cellspacing="0px" border="1px" bordercolor="#EBEBEB">
 					<tr><th>收货人</th><th>收货地址</th><th>联系电话</th></tr>
 					<tr>
 						<td align="center" style="width: 80px" id="name"></td>
 						<td align="center" style="width: 580px" id="address"></td>
 						<td align="center" style="width: 80px" id="phone"></td>
 					</tr>
 				</table>
			</div>
			<div style="height: 60px;width: 100%;border-bottom: 2px #EBEBEB solid;">
				<div style="height: 60px;float: left;margin-left: 10px;line-height: 60px;">
					<span id="data"></span>
				</div>
				<div style="height: 60px;float: left;margin-left: 200px;line-height: 60px;">
					<span id="totalPrice"></span>
				</div>
				<div style="height: 60px;float: right;margin-left: 18px;line-height: 60px;margin-right: 10px" align="center">
					<a href="<%=path%>/userBusinessController/updateOrder.do?orderId=<%=orderId%>&state=4" class="orderDetail" id="done" style="display:none">确认收货</a>
					<a href="#" class="orderDetail" id="haveDone" style="background-color: #EBEBEB;color:black">已收货</a>
				</div>
			</div>
			<div style="height: 60px;width: 100%;border-bottom: 2px #EBEBEB solid;line-height: 60px" align="center">
				<a href="<%=path%>/userBusinessController/updateOrder.do?orderId=<%=orderId%>&state=3" class="orderDetail" id="cancleOrder" style="margin-right: 400px">取消订单</a>
				<a href="<%=path%>/user/addComment.jsp?orderId=<%=orderId%>" class="orderDetail" id="comment" style="margin-right: 500px">添加评论</a>
				<a href="#" class="orderDetail" id="haveComment" style="margin-right: 500px;background-color: #EBEBEB;color:black">已评论</a>
				<a href="<%=path%>/userBusinessController/updateOrder.do?orderId=<%=orderId%>&state=2" class="orderDetail" id="urge" style="margin-right: 10px">催单</a>
				<a href="#" class="orderDetail" id="haveUrge" style="background-color: #EBEBEB;color:black">已催单</a>
				<p id="refuse">商家已拒绝</p>
				<p id="cancel">订单已取消</p>
			</div>
		</div>
	</div>
</body>
</html>