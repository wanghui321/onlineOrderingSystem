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
<title>Insert title here</title>
</head>
<script src="<%=path%>/js/jquery-1.11.1.min.js"></script>
<script  type="text/javascript">
/* 0:闭店 1： 开店 3：没资格 */
	
	window.onload = function(){
		var msg = "${business.state}";
		if(msg ==3){
			$("#msg2").css("display","none");
		}else{
			$("#msg1").css("display","none");
		}
	}
	$("#bnickName", window.parent.parent.document).html('${bnickName}');
	var msg1 = "${msg1}";
	if(msg1=="修改成功"){
		alert(msg1);
		window.location.reload(); 
	}
</script>
<body>
<div align="center" style="width:100%;height:100%;float: left; background-color: #F4F4F4">
	<div align="center" style="width:90%;height:auto; background-color: #fff">
	<div align="center" style="width:100%;height:95px;line-height:95px;float: left;border:1px solid #d0d0d0; background-color: #fff;border-radius: 10px">
	<div align="center" style="width:20%;height:95px;line-height:95px;float: left;">店铺照片</div>
	<div align="center" style="width:78%;height:auto;float: left;">
	<img alt="123" src="<%=path%>/images/businessImg/${business.headPicture}" style="width: 100px;height: 90px">
	<button type="submit"><a href="<%=path %>/business/headPicture.jsp" target="main_Frame">修改图片</a></button> 
	</div>
	</div>
	
	<div align="center" style="width:100%;height:95px;line-height:95px;float: left;border:1px solid #d0d0d0; background-color: #fff;border-radius: 10px;margin-top: 5px">
	<div align="center" style="width:20%;height:auto;float: left; ">店铺名称</div>
	<div align="center" style="width:78%;height:auto;float: left; ">
	<form action="<%=path%>/businessController/updateBusiness.do" method="post">
	<input style="width:80%;height:100%" value="${business.nickName}" name="nickName"/> 
	<button type="submit">修改</button>
	</div>
	</div>
	
		<div align="center" style="width:100%;height:95px;line-height:95px;float: left;border:1px solid #d0d0d0; background-color: #fff;border-radius: 10px;margin-top: 5px">
	
	<div align="center" style="width:20%;height:auto;float: left; ">联系电话</div>
	<div align="center" style="width:78%;height:auto;float: left; ">

	<input style="width:80%;height:100%" value="${business.phoneNumber}" name="phoneNumber"/> 
	<button type="submit">修改</button>

	</div>
	</div>
	
			<div align="center" style="width:100%;height:95px;line-height:95px;float: left;border:1px solid #d0d0d0; background-color: #fff;border-radius: 10px;margin-top: 5px">
	
	<div align="center" style="width:20%;height:auto;float: left; ">店铺地址</div>
	<div align="center" style="width:78%;height:auto;float: left; ">

	<input style="width:80%;height:100%" value="${business.address}" name="address"/> 
	<button type="submit">修改</button>

	</div>
	</div>
	
	<div align="center" style="width:100%;height:95px;line-height:95px;float: left;border:1px solid #d0d0d0; background-color: #fff;border-radius: 10px;margin-top: 5px">
	
	<div align="center" style="width:20%;height:auto;float: left; ">店铺简介</div>
	<div align="center" style="width:78%;height:auto;float: left; ">

	<input style="width:80%;height:100%" value="${business.introduce}" name="introduce"/> 
	<button type="submit">修改</button>

	</div>
	</div>
	
	<div align="center" style="width:100%;height:95px;line-height:95px;float: left;border:1px solid #d0d0d0; background-color: #fff;border-radius: 10px;margin-top: 5px">
	
	<div align="center" style="width:20%;height:auto;float: left; ">店铺公告</div>
	<div align="center" style="width:78%;height:auto;float: left; ">

	<input style="width:80%;height:100%" value="${business.notice}" name="notice"/> 
	<button type="submit">修改</button>

	</div>
	</div>
	
	<div align="center" style="width:100%;height:40px;line-height:40px;float: left;border:1px solid #d0d0d0; background-color: #fff;border-radius: 10px;margin-top: 5px">
	
	<div align="center" style="width:20%;height:auto;float: left; ">是否开店</div>
	<div id="msg1" align="center" style="width:78%;height:auto;float: left;display:''" >
	无开店资格
	</div>
	<div id="msg2" align="center" style="width:78%;height:auto;float: left;display:''" >
	
	<c:choose> 
     					<c:when test="${business.state == '0'}"> 
							<input name="state" type="radio" value="0" checked="checked"/>闭店
							<input name="state" type="radio" value="1"/>开店
 						</c:when>      
     					<c:otherwise> 
							<input name="state" type="radio" value="0"/>闭店
							<input name="state" type="radio" value="1"  checked="checked"/>开店			
  						</c:otherwise> 
				</c:choose>
	<button type="submit">修改</button>
</form>
	</div>
	</div>
	</div>
</div>
</body>
</html>