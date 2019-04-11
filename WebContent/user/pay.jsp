<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
	String totalPrice = request.getParameter("totalPrice");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/easyui.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/css/user/user.css" />
<title>支付页面</title>
</head>
<script src="<%=path%>/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	var businessId = '${business.businessId}'
	window.onload = function(){
		$.ajax({
			type:'post',
			url:"<%=path%>/userBusinessController/getCart.do",
			data:{
				id:businessId,
			},
			dataType:'json',
			success:function(msg){
				var str = "";
				for (var i = 0; i < msg.length; i++){
					str += '<div style="height: 60px;width: 100%;border-bottom: 2px #EBEBEB solid;">';
					str += '<div style="float: left;width: 50%;line-height: 60px">';
					str += '<span>' + msg[i].foodName + '</span>';
					str += '</div>'
					str += '<div style="height: auto;float: left;margin-left: 300px;line-height: 60px">';
					str += '<span>* ' + msg[i].count + ' </span>';
					str += '</div>';
					str += '<div style="height: auto;float: right;margin-left: 18px;line-height: 60px;margin-right: 30px">';
					str += '<span style="color: #ac001c;font-size: 20px">￥ ' + msg[i].totalPrice + ' </span>';
					str += '</div>'
					str += '</div>';
				}
				$("#order").html(str);
			}
		})
		
		IFrameResize();
	}
	
	function IFrameResize(){ 
		//alert(this.document.body.scrollHeight); //弹出当前页面的高度 
		var obj = parent.document.getElementById("businessIframe"); //取得父页面IFrame对象 
		//alert(obj.height); //弹出父页面中IFrame中设置的高度 
		obj.height = this.document.body.scrollHeight + 380; //调整父页面中IFrame的高度为此页面的高度 
	} 
	
	function goPay(){
		var balance = '${user.balance}';
		if(balance < <%=totalPrice%>){
			alert("余额不足");
		} else {
			
		}
	}
</script>
<body>
	<div style="height: auto;width: 100%" align="center">
		<div style="height: auto;width:70%;background-color: #fff;border-radius: 10px" id="cart" >
			<!-- 订单信息 -->
			<div id="order">
<!-- 				<div style="height: 60px;width: 100%;border-bottom: 2px #EBEBEB solid;">
					商品名称
					<div style="float: left;width: 50%;line-height: 60px">
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
			<div style="height: 60px;width: 100%;border-bottom: 2px #EBEBEB solid;">
				<div style="height: auto;float: left;margin-left: 18px;line-height: 60px">
					<span>备注:</span>	
				</div>
				<div style="margin-top: 5px">
					<form>
						<textarea style="width: 922px;height: 50px" id="remake"></textarea>
					</form>
				</div>
			</div>
			<div style="height: 60px;width: 100%;border-bottom: 2px #EBEBEB solid;" align="center">
				<a href="javascript:void(0)" onclick="goPay()" class="payFor">支付：￥<%=totalPrice%></a>
			</div>
		</div>
	</div>
</body>
</html>