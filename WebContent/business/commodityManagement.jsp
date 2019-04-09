<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.util.*" %>
       <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
   <%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/easyui.css" />
<script src="<%=request.getContextPath()%>/js/json2.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/easyui.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/css/user/user.css" />
<title>Insert title here</title>
</head>
<script src="<%=path%>/js/jquery-1.11.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-1.11.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.easyui.min.js"></script>

<script type="text/javascript">
	var id = ${business.businessId};
	window.onload=function(){
		var msg = '${msg}';
		if(msg != null && msg != "" && msg != undefined){
			if(msg == "删除成功"){
				alert(msg);
			}
		}	
	}
	 $.ajax({
		type:'post',
		url:"<%=path%>/businessController/getCommodity.do",
		data:{
			id:id,
		},
		dataType:'json',
		success:function(data){
			<%-- var str = "<a href='<%=path%>/userController/getBusiness.do?id=0' style='text-decoration: none'>全部商家</a>&nbsp;&nbsp;&nbsp;";
			str = "<a href='#' onclick='getBusiness(0)' style='text-decoration: none'>全部商家</a>&nbsp;&nbsp;&nbsp;";
			for(var i = 0; i < data.length; i++){
				str += "<a href='<%=path%>/userController/getBusiness.do?id="+data[i].id+"' style='text-decoration: none'>"+data[i].typeName+"</a>&nbsp;&nbsp;&nbsp;"
				 str += "<a href='#' onclick='getBusiness("+data[i].id+")' style='text-decoration: none'>"+data[i].typeName+"</a>&nbsp;&nbsp;&nbsp;" --%>
				 var str = ""; 
			for(var i = 0; i< data.length; i++){
				str +='<div style="width:23%;margin: 0.9%;float: left;background-color:#fff;border:1px solid #e0e0e0;">';
				str +='<div style="width:40%;border:1px solid black;float: left">';
				str +='<img alt="sss" src="<%=path%>/images/'+[i]+'.jpg"  width="100%" height="70px"></div>';
				str +='<div style="width:50%;float: left">';
				str +='<div style="width: 100%;height:auto; margin-top: 10px"><span style="float: left">名称：</span>'+data[i].foodName+'</div>';
				str +='<div style="width: 100%;height:auto; margin-top: 10px"><span style="float: left">价格：</span>'+data[i].price+'</div></div>';
				str +='<div style="width: 80%;float: left"><span style="float: left;margin-left:20px;"><a href="<%=path%>/businessController/getFoodById.do?id='+data[i].id+'" target="Frame">修改</a></span><span style="float: right"><a href="<%=path%>/businessController/deleteFoodById.do?id='+data[i].id+'" target="Frame">删除</a></span> </div></div>';
				
				}
				 
			 $("#business").html(str);  
			
			}
	})
	 
</script>
<body>
<div align="center" style="width:100%;height:100%;border:1px solid red;float: left; background-color: #F4F4F4">
		<!-- <div style="width:90%;height:100%;border:1px solid red">
		<div style="width:80%;height:auto;border:1px solid red">
			<span style="float: left"><form><input value="搜索菜品" type="text" class="aa"><button type="submit">搜索</button> </form> </span>    
			<span><a href="#"><button>添加菜品</button></a></span>
		</div> -->
		<div style="width:80%;height:auto;border:1px solid red" id="business">
			<%-- <div style="width:23%;height:auto;border:1px solid red;margin: 1%;float: left" id="#business">
				<div style="width:80%;height:auto;border:1px solid red">
				<div style="width:40%;height:auto;border:1px solid red;float: left">
				<img alt="sss" src="<%=path%>/images/1.jpg"  width="100%" height="70px">
				</div>
				<div style="width:50%;height:auto;border:1px solid red;float: right">
				<div style="width: 100%;height:auto; margin-top: 10px">AFASFA</div>
				<div style="width: 100%;height:auto; margin-top: 10px">SADFASDFA</div>
				</div>
				</div>
				<div style="width: 80%;height:auto;border:1px solid red;float: left"><a href="<%=path%>/businessController/revise.do?id=1" target="Frame">修改</a><a>删除</a> </div>
			</div>  --%>
		</div>
</div>
</body>
</html>