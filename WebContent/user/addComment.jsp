<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
	String orderId = request.getParameter("orderId");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/easyui.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/css/user/user.css" />
<title>添加评价</title>
</head>
<script src="<%=path%>/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	con=false;
	var num;
	var title;
	var eval;
	window.onload = function(){
		var imgs=$(".star");
		var text=$("#score");
		var evaluate=$("#evaluate");
		for (var i=0;i<imgs.length;i++){
			imgs[i].onmouseover=function(){
				for(var j=0;j<this.title;j++){
					imgs[j].src="<%=path%>/images/xingxing1.png";
					switch(this.title){
						case "1":
						text.html("很差(1分)");
						evaluate.html("1");
						break;
						case "2":
						text.html("差(2分)");
						evaluate.html("2");
						break;
						case "3":
						text.html("一般(3分)");
						evaluate.html("3");
						break;
						case "4":
						text.html("好(4分)");
						evaluate.html("4");
						break;
						case "5":
						text.html("很好(5分)");
						evaluate.html("5");
						break;
					}
				}
			}
		}
		for (var i=0;i<imgs.length;i++){
			imgs[i].onmouseout=function(){
 				if(con==true){
 					for(var j=0;j<imgs.length;j++){
 						if(j <= num-1){
 							imgs[j].src="<%=path%>/images/xingxing1.png";
 						} else {
 							imgs[j].src="<%=path%>/images/xingxing.png";
 						}
 					}
 					text.html(title);
					evaluate.html(eval);
 					return ;
 				}else{
					for(var j=0;j<imgs.length;j++){
						imgs[j].src="<%=path%>/images/xingxing.png";
						text.html("");
						evaluate.html("");
					}
				}
			}
		}
  		for (var i=0;i<imgs.length;i++){
			imgs[i].onclick=function(){
				for(var j=0;j<imgs.length;j++){
					if(j <= this.title-1){
						imgs[j].src="<%=path%>/images/xingxing1.png";
					} else {
						imgs[j].src="<%=path%>/images/xingxing.png";
					}
				}
				num = this.title;
				switch(num){
				case "1":
					title = "很差(1分)";
					eval = "1";
					break;
				case "2":
					title = "差(2分)";
					eval = "2";
					break;
				case "3":
					title = "一般(3分)";
					eval = "3";
					break;
				case "4":
					title = "好(4分)";
					eval = "4";
					break;
				case "5":
					title = "很好(5分)";
					eval = "5";
					break;
				}
				con=true;
			}
		}
	}
	
	function addComment(){
		var id = "<%=orderId%>";
		var scoreVal = $("#evaluate").html();
		var commentVal = $("#comment").val();
		if(scoreVal == "" || scoreVal == null || scoreVal == undefined){
			alert("请添加评分");
		}else if(commentVal == "" || commentVal == null || commentVal == undefined ){
			alert("请添加评论内容");
		} else {
			$.ajax({
				type:'post',
				url:'<%=path%>/userBusinessController/addComment.do',
				data:{
					orderId : id,
					score : scoreVal,
					comment : commentVal
				},
				dataType:'json',
				success:function(msg){
					alert("添加成功");
					window.location.href="<%=path%>/user/myOrder.jsp?";
				}
			})
		}
	}
</script>
<body>
	<div style="height: auto;width: 100%" align="center">
		<div style="height: auto;width:70%;background-color: #fff;border-radius: 10px">
			<!-- 评价 -->
			<div style="height: 60px;width: 100%;border-bottom: 2px #EBEBEB solid;line-height: 60px">
				<div style="height: auto;float: left;margin-left: 10px;">
					<span>评分:</span>	
				</div>
				<div style="float: left;margin-left: 400px;">
					<img src="<%=path%>/images/xingxing.png" title="1" name="star1" class="star" style="width: 30px;height: 30px"/>
					<img src="<%=path%>/images/xingxing.png" title="2" name="star2" class="star" style="width: 30px;height: 30px"/>
					<img src="<%=path%>/images/xingxing.png" title="3" name="star3" class="star" style="width: 30px;height: 30px"/>
					<img src="<%=path%>/images/xingxing.png" title="4" name="star4" class="star" style="width: 30px;height: 30px"/>
					<img src="<%=path%>/images/xingxing.png" title="5" name="star5" class="star" style="width: 30px;height: 30px"/>
				</div>
				<div style="height: auto;float: left;margin-left: 10px;">
					<span style="color: #ff5400" id="score"></span>	
					<span  id="evaluate" style="display:none"></span>
				</div>
			</div>
			
			<!-- 备注 -->
			<div style="height: 60px;width: 100%;border-bottom: 2px #EBEBEB solid;">
				<div style="height: auto;float: left;margin-left: 10px;line-height: 60px">
					<span>评论内容:</span>	
				</div>
				<div style="margin-top: 5px">
					<form>
						<textarea style="width: 922px;height: 50px" id="comment"></textarea>
					</form>
				</div>
			</div>
			<!-- 添加评论 -->
			<div style="height: 60px;width: 100%;border-bottom: 2px #EBEBEB solid;" align="center">
				<a href="javascript:void(0)" onclick="addComment()" class="payFor">添加评论</a>
			</div>
		</div>
	</div>
</body>
</html>