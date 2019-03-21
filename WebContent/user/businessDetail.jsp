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
	<div style="background-color: #F4F4F4;width: 100%;height: 250px">
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
	<div>
		
	</div>
</body>
</html>