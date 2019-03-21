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
<title>商家信息</title>
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
		type:"post",
		url:"<%=path%>/userController/getClassify.do",
		dataType:'json',
		success:function(data){
			str = "<a href='#' onclick='getBusiness(0)' style='text-decoration: none'>全部商家</a>&nbsp;&nbsp;&nbsp;";
			for(var i = 0; i < data.length; i++){
				 str += "<a href='#' onclick='getBusiness("+data[i].id+")' style='text-decoration: none'>"+data[i].typeName+"</a>&nbsp;&nbsp;&nbsp;"
			}
			$("#business").html(str);
			
		}
	})
	
	function getBusiness(id){
		$.ajax({
			type:'post',
			url:"<%=path%>/userBusinessController/getBusiness.do",
			data:{
				id:id,
			},
			dataType:'json',
			success:function(data){
			<%-- 	var str = "";
				for(var i = 0; i < data.length; i++){
					str += '<a href="#">';
					str += '<div style="width:95%;height: 115px;margin: 10px;line-height: 39px" class="business">';
					str += '<div style="height: auto;width:auto;float: left">';
					str += '<img src="<%=path%>/images/businessImg/' + data[i].headPicture + ' " width="200px" height="115px"/>';
					str += '</div>';
					str += '<div style="height: auto;width:auto;float: left;margin-left: 20px">';
					str += '<span style="float: left;font-weight: bold;color:black">' + data[i].nickName + '</span><br/>';
					str += '<span style="float: left;color:black">地址：'+ data[i].address +' </span><br/>'
					str += '<span style="float: left;color:black">联系电话：'+ data[i].phoneNumber +' </span>'
					str += '</div>'
					str += '</div>';
					str += '</a>';
				} --%>
				var str = getBusinessList(data);
				$("#businessMsg").html(str);
				IFrameResize();
			}
					
		})
	}
	
	function getBusinessByName(businessName){
		$.ajax({
			type:'post',
			url:"<%=path%>/userBusinessController/getBusinessByName.do",
			data:{
				name:businessName,
			},
			dataType:'json',
			success:function(data){
				var str = getBusinessList(data);
				$("#businessMsg").html(str);
				IFrameResize();
			}
		})
	}
	
	function getBusinessList(data){
		var str = "";
		for(var i = 0; i < data.length; i++){
			str += '<a href="<%=path%>/userBusinessController/getBusinessById.do?id='+ data[i].businessId +'">';
			str += '<div style="width:95%;height: 115px;margin: 10px;line-height: 39px" class="business">';
			str += '<div style="height: auto;width:auto;float: left">';
			str += '<img src="<%=path%>/images/businessImg/' + data[i].headPicture + ' " width="200px" height="115px"/>';
			str += '</div>';
			str += '<div style="height: auto;width:auto;float: left;margin-left: 20px">';
			str += '<span style="float: left;font-weight: bold;color:black">' + data[i].nickName + '</span><br/>';
			str += '<span style="float: left;color:black">地址：'+ data[i].address +' </span><br/>'
			str += '<span style="float: left;color:black">联系电话：'+ data[i].phoneNumber +' </span>'
			str += '</div>'
			str += '</div>';
			str += '</a>';
		}
		return str;
	}

	window.onload = function(){
		getBusiness(0);
	}
</script>

<body>
	<!-- 商家分类 -->
 		<div style="width:100%;height:73px;background-color: #F4F4F4" align="center">
			<div style="width:auto;height:auto;float:left;line-height:73px">
				<span>商家分类</span>
			</div>
			<div style="width:auto;height:auto;float:left;line-height:73px;margin-left: 20px" id="business">
			</div>
		</div>
		
		<!-- 商家信息 -->
 		<div style="width:100%;height:auto;margin-top: 20px;background-color: #F4F4F4" id="businessMsg">
		</div>
</body>
</html>