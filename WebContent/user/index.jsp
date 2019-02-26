<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>test</title>
</head>
<script src="<%=request.getContextPath()%>/js/jquery-1.11.1.min.js"></script>
<script>
	$.ajax({
		type:"GET",
		url:"../userController/test1",
		dataType:"json",
		success:function(msg){
			alert(msg);
			console.log(msg);
		}
		
	})
</script>
<body>
	
</body>
</html>