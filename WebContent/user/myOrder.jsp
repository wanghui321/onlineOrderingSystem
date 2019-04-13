<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/easyui.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/css/user/user.css" />
<title>我的订单</title>
</head>
<script src="<%=path%>/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	window.onload = function(){
		if("${msg}" != null && "${msg}" != "" && "${msg}" != undefined){
			alert('${msg}');
		}
		$.ajax({
			type:'post',
			url:'<%=path%>/userBusinessController/getMyOrder.do',
			dataType:'json',
			success:function(msg){
				$("#noOrder").css("display","none");
				$("#order").css("display","");
				var str = "";
				for (var i = 0; i < msg.length; i++){
					str += '<div style="height: 60px;width: 100%;border-bottom: 2px #EBEBEB solid;">';
					str +='<div style="float: left;width: 30%;line-height: 60px;margin-left: 10px" align="left">';
					str += '<span>' + msg[i].businessName + '</span>';
					str += '</div>';
					str += '<div style="height: auto;float: left;margin-left: 50px;line-height: 60px">';
					str += '<span>下单时间：' + msg[i].data + '</span>';
					str += '</div>';
					str += '<div style="height: auto;float: right;margin-left: 18px;line-height: 60px;margin-right: 10px">';
					str += '<span>总售价：￥' + msg[i].totalPrice + '</span>';
					str += '<span style="margin-right: 30px;margin-left: 20px">(' + msg[i].state + ')</span>';
					str += '<a href="javascript:void(0)" onclick="getOrderDetail(' + "'"+msg[i].id+"'" +')" class="orderDetail">订单详情</a>'
					str +='</div>';
					str += '</div>';
				}
				$("#order").html(str);
			},
			error:function(){
				$("#order").css("display","none");
				$("#noOrder").css("display","")
			}
		})
		setTimeout('IFrameResize()','100');
	}
	
	function getOrderDetail(id){
		window.location.href="<%=path%>/user/orderDetail.jsp?id=" + id;
	}
	
	function IFrameResize(){ 
		//alert(this.document.body.scrollHeight); //弹出当前页面的高度 
		var obj = parent.document.getElementById("businessIframe"); //取得父页面IFrame对象 
		//alert(obj.height); //弹出父页面中IFrame中设置的高度 
		obj.height = this.document.body.scrollHeight + 35; //调整父页面中IFrame的高度为此页面的高度 
	} 
</script>
<body>
	<div style="height: auto;width: 100%" align="center">
		<div style="height: auto;width:70%;background-color: #fff;border-radius: 10px;" id="order" >
<!-- 			<div style="height: 60px;width: 100%;border-bottom: 2px #EBEBEB solid;">
				<div style="float: left;width: 30%;line-height: 60px;margin-left: 10px" align="left">
					<span>匹夫涮肉城（中华大街店）</span>
				</div>
				<div style="height: auto;float: left;margin-left: 50px;line-height: 60px">
					<span>下单时间：2019-04-11 14:49:54</span>
				</div>
				<div style="height: auto;float: right;margin-left: 18px;line-height: 60px;margin-right: 10px">
					<span>总售价：￥1230</span>
					<span style="margin-right: 30px;margin-left: 20px">(待配送)</span>
					<a href="#" class="orderDetail">订单详情</a>
				</div>
			</div>  -->
		</div>
		
		<div id="noOrder">
			<img src="<%=path%>/images/order.png" width="20%" height="20%"/>
			<p style="font-size: 20px">暂无订单</p>
		</div>
	</div>
</body>
</html>