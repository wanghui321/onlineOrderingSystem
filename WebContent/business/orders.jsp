<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=path %>/css/business/orders.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<script src="<%=request.getContextPath()%>/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	$.ajax({
		type:"post",
		url:"<%=request.getContextPath()%>/businessController/getState.do",
		dataType:'json',
		success:function(msg){
 			if(msg != null && msg != undefined){
 				var newOrder = msg.newOrder;
 				var reminder = msg.reminder;
 				var chargeback = msg.chargeback;
 				var unusualOrder = msg.unusualOrder;
 				var completedOrder = msg.completedOrder;
			}
 			var str = "订单量"+completedOrder+"量";
 			$("#completedOrder").html(str);
		}
	})
		$.ajax({
		type:"post",
		url:"<%=request.getContextPath()%>/businessController/getsales.do",
		dataType:'json',
		success:function(msg1){
 			if(msg1 != null && msg1 != undefined){
 				var sales = msg1.sales;
			} 
			var str = "营业额"+sales+"元";
			$("#sales").html(str);
		
		}
	})
</script>
<body>
<div align="center" style="width:100%;;height: auto;float: left;background-color: #F4F4F4">
	<div style="width:95%;height:60px;background-color: #fff">
		<ul class="menu">
			<li><a class="active" href="<%=request.getContextPath()%>/business/newOrders.jsp" target="ordersFrame">新订单</a></li>
			<li><a class="unactive" href="<%=request.getContextPath()%>/business/cancelOrder.jsp" target="ordersFrame">取消订单</a></li>
			<li><a class="unactive" href="<%=request.getContextPath()%>/business/reminder.jsp" target="ordersFrame">催单</a></li>
			<li><a class="unactive" href="<%=request.getContextPath()%>/business/unusualOrder.jsp" target="ordersFrame">配送异常</a></li>
			<li><a class="unactive" href="<%=request.getContextPath()%>/business/chargeback.jsp" target="ordersFrame">售后退款</a></li>
			<li><a class="unactive" href="<%=request.getContextPath()%>/business/completedOrder.jsp" target="ordersFrame">所有订单</a></li>
		</ul>
	</div>
	<div align="center" style="width:98%;min-height:800px;">
		<div style="width:64%;min-height:20px;float: left;background-color: #fff;margin: 1%">
			<iframe src="<%=request.getContextPath()%>/business/newOrders.jsp" style="background-color: #000;" id="ordersFrame" name="ordersFrame" frameborder="0" width="100%" frameBorder="0">
	       </iframe> 
		</div>
		<div align="center" style="width:32%;height:auto;float: left;margin: 1%">
			<div align="center" style="width:100%;height:auto;background-color: #fff;border:1px solid #e0e0e0;">
				<div style="width:95%;height:60px;line-height:60px;border-bottom:3px solid #f9f9f9;">
					<span style="font-weight: bold;float: left;color: #383838;font-size: 25px">今日营业总揽</span>
				</div>
				<div style="width:95%;height:auto;line-height:auto;padding-bottom: 60px;padding-top: 60px;">
					<div style="width:95%;height:40px;"><span id="completedOrder" style="float: left;color: #828282;font-size: 20px">订单量</span></div>
					<div style="width:95%;height:40px;"><span id="sales" style="float: left;color: #828282;font-size: 20px">营业额</span></div>
				</div>
			</div>
			<div align="center" style="width:100%;height:auto;background-color: #fff;border:1px solid #e0e0e0;margin-top: 30px">
				<div style="width:95%;height:60px;line-height:60px;border-bottom:3px solid #f9f9f9;">
					<span style="font-weight: bold;float: left;color: #383838;font-size: 25px">订单小贴士</span>
				</div>
				<div style="width:95%;height:auto;line-height:auto;padding-bottom: 60px;padding-top: 20px;">
					<div style="width:95%;height:40px;"><span style="float: left;color: #828282;font-size: 20px">建议每天10点之前进行开店</span></div>
					<div style="width:95%;height:40px;"><span style="float: left;color: #828282;font-size: 20px">建议填写接单手机号</span></div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
$(".menu li a").click(function() {
    $(".menu li a").removeClass('active');
    $(this).removeClass('unactive');
    $(this).addClass("active");
    $(".menu li a").addClass("unactive");
}); 
</script>
</html>