<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/easyui.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/css/user/user.css" />
<title>商店详情页面</title>
</head>
<script src="<%=path%>/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	var totalPrice = 0;
	window.onload = function(){
		var i = '${score}';
		var q = i * 30;
		$("#xing").css("width",q);
		if(i == '0'){
			$("#score").html("暂无评价");
		} else {
			$("#score").html(i + "分");
		}
		
		//加载商店中商品的信息
		$.ajax({
			type:'post',
			url:"<%=path%>/userBusinessController/getFoodByBusinessId.do",
			data:{
				id:${business.businessId},
			},
			dataType:'json',
			success:function(data){
				var str = "";
				for(var i = 0; i < data.length; i++){
					str += '<div style="width:95%;height: 200px;margin: 10px;line-height: 39px;border-bottom: 2px #EBEBEB solid;padding-bottom: 20px">';
					str += '<div style="height: auto;width:auto;float: left;margin-top: 10px">';
					str += '<img src="<%=path%>/images/foodImg/' + data[i].imgUrl + ' " width="180px" height="180px"/>';
					str += '</div>';
					str += '<div style="height: auto;width:auto;float: left;margin-left: 20px;margin-top: 10px">';
					str += '<span style="float: left;font-weight: bold;color:black">' + data[i].foodName + '</span><br/>';
					str += '<span style="float: left;color:black">'+ data[i].introduction +' </span><br/>'
					str += '<span style="float: left;color:#ac001c;margin-top: 60px;font-size: 50px">￥'+ data[i].price +' </span>'
					str += '</div>';
					str += '<div>';
					str += '<a href="javascript:void(0)" class="buy" onclick="addCart('+data[i].id+')" id="'+data[i].id+'">点击购买</a>';
					str += '</div>';
					str += '</div>';
				}
				$("#businessDetail").html(str);
				IFrameResize();
			}
		})
	
		setTimeout('getCart()',20);
		
		var introduce = '${business.introduce}';
		var notice = '${business.notice}';
		if(introduce != null && introduce != "" && introduce != undefined){ 
			$("#introduce").html("商家简介："+introduce);
		} else {
			$("#introduce").html("商家简介：暂无");
		}
		
		if(notice != null && notice != "" && notice != undefined){ 
			$("#businessNotice").html(notice);
		} else {
			$("#noticeMsg").attr("align","center");
			$("#noNotice").css("display","");
			$("#businessNotice").html("暂无公告");
		}
		IFrameResize();
	}
	
	//延迟加载购物车中的内容
	function getCart(){
		//获取购物车中的信息
		var businessId = '${business.businessId}'
		$.ajax({
				type:'post',
				url:"<%=path%>/userBusinessController/getCart.do",
				data:{
					id:businessId,
				},
				dataType:'json',
				success:function(msg){
					$("#noCart").css("display","none");
					getCartList(msg);
				},
				error:function(){
					$("#noCart").css("display","");
				}
			})
	}
	
	function IFrameResize(){ 
		//alert(this.document.body.scrollHeight); //弹出当前页面的高度 
		var obj = parent.document.getElementById("businessIframe"); //取得父页面IFrame对象 
		//alert(obj.height); //弹出父页面中IFrame中设置的高度 
		obj.height = this.document.body.scrollHeight + 18; //调整父页面中IFrame的高度为此页面的高度 
	} 
	
	//将添加到购物车中的商品的按钮变为不可点击状态
	function changeUnchack(data){
		$("#" + data).css({"background-color":"#EBEBEB","color":"black"});
		$("#" + data).html("已购买");
		$("#" + data).removeAttr("onclick");
	}
	
	function addCart(data){
		var nickName = '${nickName}'
		if(nickName == '' || nickName == null){
			alert("请先登录");
		} else {
			changeUnchack(data);
			$.ajax({
				type:'post',
				url:"<%=path%>/userBusinessController/addCart.do",
				data:{
					id:data,
				},
				dataType:'json',
				success:function(msg){
					$("#noCart").css("display","none");
					getCartList(msg);
				}
			})
		}
	}
	
	//将信息添加到购物车中
	function getCartList(msg){
		$("#cart").css("display","");
		var str = "";
		totalPrice = 0;
		for(var i = 0; i < msg.length; i++){
			changeUnchack(msg[i].foodId);
			var price = msg[i].totalPrice;
			totalPrice += price;
			str += '<div style="height: 60px;width: 98%;margin-left: 2px;border-bottom: 2px #EBEBEB solid;">';
			str += '<div style="float: left;width: 50%;display: table;margin-top: 10px;height: 40px">';
			str += '<span style="display: table-cell;vertical-align: middle;padding-left: 5px">' + msg[i].foodName + '</span>';
			str += '</div>';
			str += '<div style=";height: auto;float: left;margin-top:15px;margin-left: 18px">';
			str += '<table border="1px" bordercolor="gray" cellspacing="0px" class="numberTable">';
			str += '<tr>';
			str += '<td><a href="javascript:void(0)" onclick="changeNumber('+msg[i].foodId+','+msg[i].count+',1)" style="text-decoration:none;">+</a></td>';
			str += '<td><span>' + msg[i].count + '</span></td>';
			str += '<td><a href="javascript:void(0)" onclick="changeNumber('+msg[i].foodId+','+msg[i].count+',2)" style="text-decoration:none;">-</a></td>';
			str += '</tr>';
			str += '</table>';
			str += '</div>';
			str += '<div style="height: auto;float: left;margin-top: 16px;margin-left: 18px">';
			str += '<span style="color: #ac001c;font-size: 17px">￥'+msg[i].totalPrice+'</span>';
			str += '</div>';
			str += '</div>';
		}
		$("#cart").html(str);
		$("#totalPrice").html("￥" + totalPrice);		
	}
	
	function changeNumber(foodId,count,sign){
		if(sign == 2 && count == 1){
			$("#" + foodId).css({"background-color":"#ac001c","color":"#fff"});
			$("#" + foodId).html("点击购买");
			$("#" + foodId).attr("onclick","addCart("+ foodId +")");
		}
		var business = '${business.businessId}';
		$.ajax({
			type:'post',
			url:'<%=path%>/userBusinessController/changeNumber.do',
			data:{
				businessId:business,
				id:foodId,
				mark:sign
			},
			dataType:'json',
			success:function(data){
				$("#noCart").css("display","none");
				getCartList(data);
			},
			error:function(){
				$("#noCart").css("display","");
				$("#cart").css("display","none");
				$("#totalPrice").html("￥0");
			}
			
		})
	}
	
	function pay(){
		if(totalPrice == 0){
			alert("暂无可支付的商品");
		} else {
			 window.location.href="<%=path%>/user/pay.jsp?totalPrice=" + totalPrice;
		}
		
	}
	
	function deleteCart(){
		$.ajax({
			type:'post',
			url:'<%=path%>/userBusinessController/deleteCart.do',
			dataType:'json',
			success:function(data){
				for(var i = 0; i < data.length; i++){
					$("#" + data[i].foodId).css({"background-color":"#ac001c","color":"#fff"});
					$("#" + data[i].foodId).html("点击购买");
					$("#" + data[i].foodId).attr("onclick","addCart("+ data[i].foodId +")");
				}
				$("#noCart").css("display","");
				$("#cart").css("display","none");
				$("#totalPrice").html("￥0");	
				totalPrice = 0;
			}
		})
	}
	
	function getFoodMsg(){
		$("#businessDetail").css("display","");
		$("#commentDetail").css("display","none");
		IFrameResize()
	}
	function getComment(){
		$("#businessDetail").css("display","none");
		$("#commentDetail").css("display","");
		$.ajax({
			type:'post',
			url:"<%=path%>/userBusinessController/getComment.do",
			dataType:'json',
			success:function(msg){
				var str = "";
				for(var i = 0; i < msg.length; i++){
					str += '<div style="width:95%;height: auto;margin: 10px;line-height: 39px;border-bottom: 2px #EBEBEB solid;padding-bottom: 20px">';
					str += '<div>';
					str += '<span style="font-size: 20px">'+ msg[i].userName +'</span>';
					str += '<span style="float: right">'+ msg[i].data +'</span><br/>';
					for(var j = 1; j <= 5;j++){
						if(j <= msg[i].level){
							str += '<img src="<%=path%>/images/xingxing1.png" class="star" style="width: 20px;height: 20px"/>';
						} else {
							str += '<img src="<%=path%>/images/xingxing.png" class="star" style="width: 20px;height: 20px"/>';
						}
					}
					str += '</div>';
					str += '<div>';
					str += '<span>'+ msg[i].content +'</span>';
					str += '</div>';
					if(msg[i].state == "1"){
						str += '<div style="background-color:#EBEBEB">';
						str += '<span style="font-size: 20px">商家回复</span>';
						str += '<span style="float: right">'+msg[i].businessData+'</span>';
						str += '</div>';
						str += '<div style="background-color:#EBEBEB">';
						str += '<span>'+ msg[i].businessContent +'</span>';
						str += '</div>';
					}
					str += '</div>';
				}
				$("#commentDetail").html(str);
			}
		})
		setTimeout("IFrameResize()","100");
	}
	
</script>
<body>
	<div style="width: 100%;height: auto;overflow: hidden">
		<div style="background-color: #fff;border-radius: 10px;width: 70%;float:left;height: 300px;">
			<!-- 左侧简要信息 -->
			<div style="float: left;width: 680px;height: auto;">
				<div style="width: 100%;height: auto;">
					<span style="font-size: 25px;margin: 15px">${business.nickName}</span>
				</div>
				<div style="float: left;width: 700px;height: auto;border-bottom: 2px #EBEBEB solid">
					<div style="width: auto;float:left;align: center;margin-top: 15px;margin-left: 15px">
						<span style="width: 150px;height: 30px;line-height: 12px;overflow: hidden;background-image: url(<%=path%>/images/xingxing.png);background-repeat: repeat-x;display: inline-block;background-size: contain;">
							<span id="xing" style="width: 150px;height: 30px;line-height: 12px;overflow: hidden;background-image: url(<%=path%>/images/xingxing1.png);background-repeat: repeat-x;display: inline-block;background-size: contain;"></span>
						</span>
					</div>
					<div style="width: auto;float:left;line-height: 68px;margin-left: 20px;">
						<span style="font-size: 18px" id="score"></span>
					</div>
				</div>
				<div style="width: 600px;height: auto;float:left;">
					<p style="margin: 20px">地址：${business.address}</p>
					<p style="margin: 20px">联系电话：${business.phoneNumber}</p>
					<p style="margin: 20px" id="introduce">商家简介：</p>
					<a href="javascript:void(0)" onclick="getFoodMsg()" class="comment">商品信息</a>
					<a href="javascript:void(0)" onclick="getComment()" class="comment">评论内容</a>
				</div>
			</div>
			<!-- 右侧图片 -->
			<div style="width: 300px;height: 200px;float: right;margin: 10px;padding-top:10px">
				<img src="<%=path%>/images/businessImg/${business.headPicture}" style="height: 100%;width: 100%">
			</div>
		</div>
		<!-- 商店公告 -->
		<div style="background-color: #fff;border-radius: 10px;width: 28%;height: 300px;float: right">
			<!-- 头部内容 -->
			<div style="border-bottom: 2px #EBEBEB solid;width: 100%" align="center">
				<div style="width: 15%;height: auto;float: left">
					<img src="<%=path%>/images/laba.png" width=100% height="30%"/>
				</div>
				<div style="line-height: 60px;margin-left: 10px">
					<font size="5px">商店公告</font>
				</div>
			</div>
			<!-- 公告内容 -->
			<div style="width: 90%;margin-left: 20px" id="noticeMsg">
				<img src="<%=path%>/images/noNotice.png" style="display: none;margin-top: 20px" 
					id="noNotice" width="50%" height="50%"/>
				<p style="width: 100%" id="businessNotice"></p>
			</div>
		</div>
	</div>
	
	<!-- 商品详情 -->
	<div style="width: 100%;height: auto;overflow: hidden">
		<!-- 商品列表 -->
		<div style="background-color: #fff;float:left;border-radius: 10px;width: 70%;height: auto;margin-top: 20px;" id="businessDetail">
		</div>
		
		<!-- 评论列表 -->
		<div style="background-color: #fff;float:left;border-radius: 10px;width: 70%;height: auto;margin-top: 20px;display: none" id="commentDetail">
			<%-- <div style="width:95%;height: auto;margin: 10px;line-height: 39px;border-bottom: 2px #EBEBEB solid;padding-bottom: 20px">
				<!-- 用户评论 -->
				<div>
					<span style="font-size: 20px">张三</span>
					<span style="float: right">2019-04-12 16:57:36</span><br/>
					<img src="<%=path%>/images/xingxing1.png" title="1" class="star" style="width: 20px;height: 20px"/>
					<img src="<%=path%>/images/xingxing1.png" title="2" class="star" style="width: 20px;height: 20px"/>
					<img src="<%=path%>/images/xingxing1.png" title="3" class="star" style="width: 20px;height: 20px"/>
					<img src="<%=path%>/images/xingxing1.png" title="4" class="star" style="width: 20px;height: 20px"/>
					<img src="<%=path%>/images/xingxing1.png" title="5" class="star" style="width: 20px;height: 20px"/>
				</div>
				<div>
					<span>asdsdasdasdasd</span>
				</div>
				
				<!-- 商家回复 -->
				<div>
					<span style="font-size: 20px">商家回复</span>
					<span style="float: right">2019-04-12 16:57:36</span>
				</div>
				<div>
					<span>asdsdasdasdasd</span>
				</div>
			</div> --%>
		</div>
		
		<!-- 购物车 -->
		<div style="background-color: #fff;border-radius: 10px;width: 28%;height: aut0;margin-top:20px;float: right">
			<!-- 头部内容 -->
			<div style="border-bottom: 2px #EBEBEB solid;width: 100%;height:60px" align="center">
				<div style="width: 22%;height: auto;float: left;margin-top: 10px">
					<img src="<%=path%>/images/cart.png" width=100% height="30%"/>
				</div>
				<div style="line-height: 60px;margin-left: 80px;width: 20%;float: left">
					<font size="5px">购物车</font>
				</div>
				<div style="width: 9%;height: auto;margin-top: 12px;float:right;margin-right: 10px">
					<a href="javascript:void(0)" onclick="deleteCart()">
						<img src="<%=path%>/images/delete.png" width=100% height="30%"/>
					</a>
				</div>
			</div>
			<!-- 商品信息 -->
			<div>
				<!-- 购物车内无商品 -->
				<div style="width: 100%;border-bottom: 2px #EBEBEB solid" id="noCart" align="center">
					<img src="<%=path%>/images/noCart.png" style="margin-top: 20px" 
						id="noNotice" width="40%" height="40%"/>
					<p style="width: 100%">无商品信息</p>
				</div>
				
				<!-- 购物车内有商品 -->
				<div style="height: auto" id="cart">
					<!-- <div style="height: 60px;width: 98%;margin-left: 2px;border-bottom: 2px #EBEBEB solid;">
						商品名称
						<div style="float: left;width: 50%;display: table;margin-top: 10px;height: 40px">
							<span style="display: table-cell;vertical-align: middle;padding-left: 5px">莲藕排骨锅套餐</span>
						</div>
						
						商品数量
						<div style=";height: auto;float: left;margin-top:15px;margin-left: 18px">
							<table border="1px" bordercolor="gray" cellspacing="0px" class="numberTable">
								<tr>
									<td><a href="#" style="text-decoration:none;">+</a></td>
									<td><span>1</span></td>
									<td><a href="#" style="text-decoration:none;">-</a></td>
								</tr>
							</table>
						</div>
						
						商品价格
						<div style="height: auto;float: left;margin-top: 16px;margin-left: 18px">
							<span style="color: #ac001c;font-size: 20px">￥1230</span>
						</div>
					</div> -->
				</div>
			</div>
			<!-- 商品结算结算 -->
			<div style="width:99%;height: 50px">
				<div style="width: 50%;height: 50px;float: left;border-bottom-left-radius:10px;
					background-color:#ff9600;line-height: 50px" align="center">
					<span style="color: #ac001c;font-size: 25px" id="totalPrice">￥0</span>
				</div>
				<div style="float: left;">
					<a href="javascript:void(0)" class="pay" onclick="pay()">去支付</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>