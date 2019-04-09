<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Bootstrap 实例 - 折叠（Collapse）插件事件</title>
	<link href="<%=path %>/css/business/bootstrap.min.css" rel="stylesheet">
        <script src="<%=path %>/js/jquery-1.11.1.min.js"></script>
        <script src="<%=path %>/js/bootstrap.min.js"></script>
</head>

<body>

<div class="panel-group" id="accordion">
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
</div>

<script type="text/javascript">
	$(function () { 
		$('#collapseexample').on('show.bs.collapse', function () {
			alert('嘿，当您展开时会提示本警告');})
	});
</script> 


</body>
</html>