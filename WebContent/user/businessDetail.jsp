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
	function IFrameResize(){ 
		//alert(this.document.body.scrollHeight); //弹出当前页面的高度 
		var obj = parent.document.getElementById("businessIframe"); //取得父页面IFrame对象 
		//alert(obj.height); //弹出父页面中IFrame中设置的高度 
		obj.height = this.document.body.scrollHeight + 10; //调整父页面中IFrame的高度为此页面的高度 
	} 
	
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
				str += '<a href="#" class="buy">点击购买</a>';
				str += '</div>';
				str += '</div>';
			}
			$("#businessDetail").html(str);
			IFrameResize();
		}
	})
	
	window.onload = function(){
		var notice = '${business.notice}';
		if(notice != null && notice != "" && notice != undefined){ 
			$("#notice").html("商家公告："+notice);
		} else {
			$("#notice").html("商家公告：暂无");
		}
	}
</script>
<body>
	<div style="background-color: #fff;border-radius: 10px;width: 100%;height: 250px">
		<!-- 左侧简要信息 -->
		<div style="float: left;width: 700px;height: auto;">
			<div style="width: 100%;height: auto;">
				<span style="font-size: 25px;margin: 15px">${business.nickName}</span>
			</div>
			<div style="float: left;width: 700px;height: auto;border-bottom: 2px #EBEBEB solid">
				<div style="width: auto;float:left;align: center;">
					<ul style="list-style: none;padding-left: 0px;margin-left: 15px" >
						<li style="display: inline-block;height: 30px;width: 30px">
							<img src="<%=path%>/images/xingxing1.png" style="height: 100%;width: 100%"/>
						</li>
						<li style="display: inline-block;height: 30px;width: 30px">
							<img src="<%=path%>/images/xingxing1.png" style="height: 100%;width: 100%"/>
						</li>
						<li style="display: inline-block;height: 30px;width: 30px">
							<img src="<%=path%>/images/xingxing1.png" style="height: 100%;width: 100%"/>
						</li>
						<li style="display: inline-block;height: 30px;width: 30px">
							<img src="<%=path%>/images/xingxing1.png" style="height: 100%;width: 100%"/>
						</li>
						<li style="display: inline-block;height: 30px;width: 30px">
							<img src="<%=path%>/images/xingxing1.png" style="height: 100%;width: 100%"/>
						</li>
					</ul>
				</div>
				<div style="width: auto;float:left;line-height: 68px;margin-left: 20px;">
					<span style="font-size: 18px">5分</span>
				</div>
			</div>
			<div style="width: 700px;height: auto;float:left;">
				<p style="margin: 20px">地址：${business.address}</p>
				<p style="margin: 20px">联系电话：${business.phoneNumber}</p>
				<p style="margin: 20px" id="notice">商家公告：</p>
			</div>
		</div>
		<!-- 右侧图片 -->
		<div style="width: 300px;height: 200px;float: right;margin: 10px;padding-top:10px">
			<img src="<%=path%>/images/businessImg/${business.headPicture}" style="height: 100%;width: 100%">
		</div>
	</div>
	
	<!-- 商品详情 -->
	<div style="background-color: #fff;border-radius: 10px;width: 100%;height: auto;margin-top: 20px" id="businessDetail">
<%-- 		<div style="width:95%;height: 200px;margin: 10px;line-height: 39px;border-bottom: 2px #EBEBEB solid;padding-bottom: 20px">
			<div style="height: auto;width:auto;float: left;margin-top: 10px">
				<img src="<%=path%>/images/foodImg/food1.png" width="180px" height="180px"/>
			</div>
			<div style="height: auto;width:auto;float: left;margin-left: 20px;margin-top: 10px">
				<span style="float: left;font-weight: bold;color:black">立即抢购经典清江鱼套餐，建议4人使用</span><br/>
				<span style="float: left;color:black">商品简介商品简介商品简介商品简介商品简介</span><br/>
				<span style="float: left;color:#ac001c;margin-top: 60px;font-size: 50px">￥138</span><br/>
			</div>
			<div>
				<a href="#" class="buy">点击购买</a>
			</div>
		</div> --%>
	</div>
</body>
</html>