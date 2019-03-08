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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/easyui.css" />
<title>地址管理</title>
</head>
<script src="<%=request.getContextPath()%>/js/jquery-1.11.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.easyui.min.js"></script>
<script type="text/javascript">
	$.ajax({
		type:'post',
		url:'<%=path%>/userController/getAddress.do',
		data:"",
		dataType:"json",
		success:function(data){
			var str = '<tr><th width="80px">收货人</th><th width="580px">收获地址</th><th width="80px">联系电话</th><th width="80px">操作</th></tr>'
			for(var i = 0; i < data.length; i++){
				str += '<tr>',
				str += '<td align="center" width="80px">' + data[i].name + '</td>';
				str += '<td align="center" width="580px">' + data[i].address + '</td>';
				str += '<td align="center" width="80px">' + data[i].phone + '</td>';
				str += '<td align="center" width="80px">';
				str += '<a href="<%=path%>/userController/getOneAddress.do?id='+data[i].id+'">修改|';
				str += '<a href="#" onclick=delAddress('+ '"' +data[i].id + '"'+')>删除';
				str += '</td>';
				str += '</tr>';
			}
			$("#myAddress").html(str);
			
		}
		
	})
	
	function delAddress(id){
		if(confirm('是否确认删除地址？')){
			$.ajax({
				type:'post',
				url:'<%=path%>/userController/delAddress/'+id+'.do',
				data:'',
			})
		}
	}
	
	function updateAddress(id,name,sex,phone,address){
		          
	}
	
	window.onload = function(){
		var msg = '${msg}'
		if(msg != "" && msg != null){
			alert(msg);
		}
	}
</script>
<body>
	<form action="<%=path%>/userController/addAddress.do" method="post">
		<input type="text" id="id" name="id" style="display:none"/>
		<table style="text-align: center;" cellspacing="0px" border="1px" bordercolor="#EBEBEB">
			<tr>
				<td>收货人：</td>
				<td width="228px"><input type="text" id="name" name="name" style="width: 228px"></td>
				<td>性别：</td>
				<td>
 					<input name="sex" type="radio" checked="checked" value="先生"/>男
					<input name="sex" type="radio" value="女士"/>女
				</td>
			</tr>
			<tr>
				<td>联系电话：</td>
				<td colspan="3"><input type="text" id="phone" name="phone" style="width: 528px"/></td>
			</tr>
			<tr>
				<td>收货地址：</td>
				<td colspan="3"><textarea id="address" name="address" cols="80" rows="3"></textarea></td>
			</tr>
			<tr>
				<td colspan="4"><button type="submit">保存</button></td>
			</tr>
		</table>
	</form>
	
	<p>我的收货地址：</p>
 	<table id="myAddress" style="text-align: center;" cellspacing="0px" border="1px" bordercolor="#EBEBEB"></table>
	
</body>
</html>