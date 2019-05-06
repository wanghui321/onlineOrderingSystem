<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="<%=path %>/css/business/bootstrap.min.css" rel="stylesheet">
        <script src="<%=path %>/js/jquery-1.11.1.min.js"></script>
        <script src="<%=path %>/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/easyui.css" />
<title>Insert title here</title>
</head>
<script type="text/javascript">
window.onload=function(){
	var msg = '${msg}';
	if(msg != null && msg != "" && msg != undefined){
			alert(msg);	
	}

}
var state = "0";
$.ajax({
	type:"post",
	url:"<%=path%>/businessController/getOrders.do",
	data:{
		state:state,
	},
	dataType:'json',
	success:function(data){
		var str = "";
		var a = ""
		for(var i = 0; i < data.length; i++){
			str += '<div class="panel panel-default">';
			str += '<div align="center" style="width: 100%;height: 180px;background-color: #fff;">';
			str += '<div style="width: 98%;height: 60px;line-height:60px; background-color: #fff;">';
			str += '<span style="font-size: 30px;float: left;">'+data[i].name+'</span>';
			str += '<span style="font-size: 15px;float: right;color: #ac001c;">'+data[i].phone+'</span>';
			str += '<img alt="phone" src="<%=path %>/images/phone.png" height="20px" width="20px" style="float: right;margin-top: 20px"/></div>';
			str += '<div style="width: 98%;height: 30px;line-height:30px; background-color: #fff;">';
			str += '<span style="font-size: 15px;float: left;color: #666">'+data[i].address+'</span>';
			str += '<span style="font-size: 15px;float: right;">￥'+data[i].totalPrice+'</span></div>';
			str += '<div style="width: 98%;height: 50px;line-height:50px; background-color: #fff;border-bottom:5px solid #f0f0f0;">';
			str += '<span style="font-size: 25px;float: left;">'+data[i].remake+'</span>';//无备注信息
			str += '<span style="font-size: 25px;float: right;margin-right: 50px;"><a href="<%=path%>/businessController/acceptOrder.do?id='+data[i].id+'">接受订单</a></span>';
			str += '<span style="font-size: 25px;float: right;margin-right: 50px;"><a href="<%=path%>/businessController/denialOrder.do?id='+data[i].id+'">拒绝订单</a></span></div>';
			str += '<span style="float: left;;height: 30px;line-height: 30px;font-size: 15px;margin-left: 100px;">商品</span>';
			str += '<span style="float: right;height: 30px;line-height: 30px;font-size: 15px;margin-right: 90px;">';
			str += '<a class="show" data-toggle="collapse" data-parent="#accordion" href="#'+data[i].id+'" style="text-decoration:none;margin-right: 20px">展开</a></span></div>';
			str += '<div id="'+data[i].id+'" align="center" class="panel-collapse collapse">';
			str += '<div class="panel-body">';
			str += '<div style="width: 98%;height: 50px;line-height:50px; background-color: #fff;">';
			str += '<span style="font-size: 25px;float: left;">展开展开</span>';
			str += '<span style="font-size: 25px;float: right;">12</span>';
			str += '<span style="font-size: 25px;float: right;margin-right: 100px">8912</span>';
			str += '</div></div></div></div>';
		}
		$("#accordion").html(str);
		IFrameResize();
		$(".show").click(function() {
			var c = this.href;
			a =c.split("#");
			var str1 = this.innerHTML;
			var str2 = "收起";
			$(".show").html("展开");
			$(this).html("收起");
			if(str1==str2){
				$(this).html("展开");
			}	
		});
		$(function () { 
			$(".collapse").on('show.bs.collapse', function () {
				var b = "#"+a[1];
				getFoodByOrders(a[1]);
				IFrameResize1();
			})
		});
		$(function () { 
			$(".collapse").on('shown.bs.collapse', function () {
				IFrameResize();
			})
		});
	}
})
function getFoodByOrders(ordersId){
	$.ajax({
		type:'post',
		url:"<%=path%>/businessController/getFoodByOrders.do",
		data:{
			id:ordersId,
		},
		dataType:'json',
		success:function(data){
			var str1 = "";
			for(var i = 0; i < data.length; i++){
				str1 += '<div style="width: 98%;height: 50px;line-height:50px; background-color: #fff;">';
				str1 += '<span style="font-size: 25px;float: left;width: 20%">'+data[i].foodName+'</span>';
				str1 += '<span style="font-size: 25px;float: right;width: 20%">'+data[i].price+'</span>';
				str1 += '<span style="font-size: 25px;float: right;width: 20%">'+data[i].number+'</span>';
				str1 += '</div>';
			}
/* 			var str = getBusinessList(data); */
			$('.panel-body').html(str1);
		}
	})
}
</script>
<body style="background-color: #F4F4F4">
<div class="panel-group" id="accordion">
	<div class="panel panel-default">
		<div align="center" style="width: 100%;height: 180px;background-color: #fff;">
			<div style="width: 98%;height: 60px;line-height:60px; background-color: #fff;">
				<span style="font-size: 30px;float: left;">展开</span>
				<span style="font-size: 15px;float: right;color: #ac001c;">12345678912</span>
				<img alt="phone" src="<%=path %>/images/phone.png" height="20px" width="20px" style="float: right;margin-top: 20px"/>
			</div>
			<div style="width: 98%;height: 30px;line-height:30px; background-color: #fff;">
				<span style="font-size: 15px;float: left;color: #aaa">展开展开展开展开展开展开展开</span>
				<span style="font-size: 15px;float: right;">展开8912</span>
			</div>
			<div style="width: 98%;height: 50px;line-height:50px; background-color: #fff;border-bottom:5px solid #f0f0f0;">
				<span style="font-size: 25px;float: left;">展开展开展开展开展开展开展开</span>
				<span style="font-size: 25px;float: right;margin-right: 50px;"><a href="#">展开展开</a></span>
				<span style="font-size: 25px;float: right;margin-right: 50px;"><a href="#">展开展开</a></span>
			</div>
			<span style="float: left;;height: 30px;line-height: 30px;font-size: 15px;margin-left: 100px;">展开</span>
			<span style="float: right;height: 30px;line-height: 30px;font-size: 15px;margin-right: 90px;">
				<a id="1" class="show" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" style="text-decoration:none;margin-right: 20px">展开</a>
			</span>
		</div>
		<div id="collapseOne" align="center" class="panel-collapse collapse">
			<div class="panel-body">
				<div style="width: 98%;height: 50px;line-height:50px; background-color: #fff;">
					<span style="font-size: 25px;float: left;">展开展开</span>
					<span style="font-size: 25px;float: right;">12</span>
					<span style="font-size: 25px;float: right;margin-right: 100px">8912</span>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- <div class="panel-group" id="accordion">
	<div class="panel panel-info">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion" 
				   href="#collapseexample">
					点击我进行展开，再次点击我进行折叠。--shown 事件
				</a>
			</h4>
		</div>
		<div id="collapseexample" class="panel-collapse collapse">
			<div class="panel-body">
				Nihil anim keffiyeh helvetica, craft beer labore wes anderson 
				cred nesciunt sapiente ea proident. 
				Ad vegan excepteur butcher vice lomo.
			</div>
		</div>
	</div>
</div> -->


</body>
<script type="text/javascript">
	function IFrameResize(){ 
		//alert(this.document.body.scrollHeight); //弹出当前页面的高度 
		var obj = parent.document.getElementById("ordersFrame"); //取得父页面IFrame对象 
		//alert(obj.height); //弹出父页面中IFrame中设置的高度 
		obj.height =window.document.body.clientHeight+20; //调整父页面中IFrame的高度为此页面的高度 
	}
	function IFrameResize1(){ 
		//alert(this.document.body.scrollHeight); //弹出当前页面的高度 
		var obj = parent.document.getElementById("ordersFrame"); //取得父页面IFrame对象 
		//alert(obj.height); //弹出父页面中IFrame中设置的高度 
		obj.height =window.document.body.clientHeight+100; //调整父页面中IFrame的高度为此页面的高度 
	}
	
	$(".show").click(function() {
		var str1 = this.innerHTML;
		var str2 = "收起";
		$(this).html("收起");
		if(str1==str2){
			$(this).html("展开");
		}
	    });

	var q = "#collapseexample";
	$(function () { 
		$(q).on('show.bs.collapse', function () {
			alert(this.id);})
	});
</script>
</html>