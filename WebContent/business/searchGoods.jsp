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

<script type="text/javascript">
window.onload = function(){
	debugger;
    var msg = '${msg}';
	var data = JSON.parse(msg);
	var str = getfoodlist(data);
	$("#business").html(str); 
}

		function getfoodlist(data){
				 var str = ""; 
			for(var i = 0; i< data.length; i++){
				<%-- str +='<div style="width:23%;border:1px solid red;margin: 1%;float: left">';
				str +='<div style="width:40%;border:1px solid red;float: left">';
				str +='<img alt="sss" src="<%=path%>/images/'+[i]+'.jpg"  width="100%" height="70px"></div>';
				str +='<div style="width:50%;border:1px solid red;float: left">';
				str +='<div style="width: 100%;height:auto; margin-top: 10px">'+data[i].foodName+'</div>';
				str +='<div style="width: 100%;height:auto; margin-top: 10px">'+data[i].price+'</div></div>';
				str +='<div style="width: 80%;float: left"><a>修改</a><a>删除</a> </div></div>'; --%>
				
				str +='<div style="width:23%;margin: 0.9%;float: left;background-color:#fff;border:1px solid #e0e0e0;">';
				str +='<div style="width:40%;border:1px solid black;float: left">';
				str +='<img alt="sss" src="<%=path%>/images/'+[i]+'.jpg"  width="100%" height="70px"></div>';
				str +='<div style="width:50%;float: left">';
				str +='<div style="width: 100%;height:auto; margin-top: 10px"><span style="float: left">名称：</span>'+data[i].foodName+'</div>';
				str +='<div style="width: 100%;height:auto; margin-top: 10px"><span style="float: left">价格：</span>'+data[i].price+'</div></div>';
				str +='<div style="width: 80%;float: left"><span style="float: left;margin-left:20px;"><a href="<%=path%>/businessController/getFoodById.do?id='+data[i].id+'" target="Frame">修改</a></span><span style="float: right"><a href="<%=path%>/businessController/deleteFoodById.do?id='+data[i].id+'" target="Frame">删除</a></span> </div></div>';
				}
			return str; 
			
			}

	 
</script>
<body>
<div align="center" style="width:100%;height:100%;float: left; background-color: #F4F4F4">
		<div style="width:80%;height:auto;" id="business">
		</div></div>
</body>
</html>