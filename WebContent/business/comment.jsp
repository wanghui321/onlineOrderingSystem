<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="<%=path %>/css/business/bootstrap.min.css" rel="stylesheet">
        <script src="<%=path %>/js/jquery-1.11.1.min.js"></script>
        <script src="<%=path %>/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/easyui.css" />
<title>Insert title here</title>
</head>
<script type="text/javascript">
var flage='${msg}';
if(flage != null&&flage!=""){
	alert(flage);
}
$.ajax({
	type:'post',
	url:"<%=path%>/businessController/getCommentstate.do",
	dataType:'json',
	success:function(msg){
		var comment = msg.comment;
		var bed = msg.bed;
		var nobed = msg.nobed;
		var str3 = "买家评论总数："+comment;
		var str4 = "差评数："+bed;
		var str5 = "未回复差评数："+nobed;
		$("#comment").html(str3);
		$("#bed").html(str4);
		$("#nobed").html(str5);
	}
})
	$.ajax({
		type:'post',
		url:"<%=path%>/userBusinessController/getComment.do",
		dataType:'json',
		success:function(msg){
			var str = "";
			for(var i = 0; i < msg.length; i++){
				str += '<div style="width:95%;height: auto;margin: 10px;line-height: 39px;border-bottom: 2px #EBEBEB solid;padding-bottom: 20px">';
				str += '<div>';
				str += '<span style="font-size: 20px">'+ msg[i].userName +'</span>';
				str += '<span style="float: right">'+ msg[i].data +'</span><br/>';
				for(var j = 1; j <= 5;j++){
					if(j <= msg[i].level){
						str += '<img src="<%=path%>/images/xingxing1.png" class="star" style="width: 20px;height: 20px"/>';
					} else {
						str += '<img src="<%=path%>/images/xingxing.png" class="star" style="width: 20px;height: 20px"/>';
					}
				}
				str += '</div>';
				str += '<div>';
				str += '<span>'+ msg[i].content +'</span>';
				str += '</div>';
				if(msg[i].state == "1"){
					str += '<form action="<%=path%>/businessController/updateComment.do?id='+msg[i].id+'" method="post">';
					str += '<div style="width:100%;float: right;margin-right: 50px;"><span style="float: right;"><button type="submit">修改</button></span></div>';
					str += '<div>';
					str += '<span style="font-size: 20px">商家回复</span>';
					str += '<span style="float: right">'+msg[i].businessData+'</span>';
					str += '</div>';
					str += '<div>';
					str += '<textarea rows="2" cols="100" name="quantity" style="height: 100%;font-size: 25px;width:800px;">'+msg[i].businessContent+'</textarea><br />';
					str += '</div>';
				}else{
					str += '<form action="<%=path%>/businessController/updateComment.do?id='+msg[i].id+'" method="post">';
					str += '<div style="width:100%;float: right;margin-right: 50px;"><span style="float: right;"><button type="submit">回复</button></span></div>';
					str += '<div>';
					str += '<span style="font-size: 20px">商家回复</span>';
					str += '<span style="float: right"></span>';
					str += '</div>';
					str += '<div>';
					str += '<textarea rows="2" cols="200" name="quantity" style="height: 100%;font-size: 25px;width:800px;">未对该评论回复</textarea><br />';
					str += '</div>';
				}
				str += '</div>';
			}
			$("#commentDetail").html(str);
		}
	})

</script>
<body>
<div style="width:100%;min-height: 800px;float: left;border:1px solid red;background-color: #F4F4F4">
<div id="commentDetail" style="width: 60%;height: auto;background-color: #fff;float: left;margin:20px;border-radius: 10px;border: 1px solid #D0D0D0">
<div style="width:95%;height: auto;margin: 10px;line-height: 39px;border-bottom: 2px #EBEBEB solid;padding-bottom: 20px">
				<!-- 用户评论 -->
				<div>
					<span style="font-size: 20px">张三</span>
					<span style="float: right">2019-04-12 16:57:36</span><br/>
					<img src="<%=path%>/images/xingxing1.png" title="1" class="star" style="width: 20px;height: 20px"/>
					<img src="<%=path%>/images/xingxing1.png" title="2" class="star" style="width: 20px;height: 20px"/>
					<img src="<%=path%>/images/xingxing1.png" title="3" class="star" style="width: 20px;height: 20px"/>
					<img src="<%=path%>/images/xingxing1.png" title="4" class="star" style="width: 20px;height: 20px"/>
					<img src="<%=path%>/images/xingxing1.png" title="5" class="star" style="width: 20px;height: 20px"/>
				</div>
				<div>
					<span>asdsdasdasdasd</span>
				</div>
				<form action="<%=path%>/businessController/updateComment.do" method="post">
				<div style="width:100%;float: right;margin-right: 50px;"><span style="float: right;"><button type="submit">修改</button></span></div>
				
				<!-- 商家回复 -->
				<div style="background-color: #EBEBEB;margin-top: 40px;">
					<span style="font-size: 20px;">商家回复</span>
					<span style="float: right">2019-04-12 16:57:36</span>
				</div>
				<div style="background-color: #EBEBEB">
					<textarea rows="2" cols="20" name="quantity" style="height: 100%;font-size: 25px"></textarea><br />
				</div>
				</form>
			</div>
</div>
<div style="width: 30%;height: auto;background-color: #fff;float: right;margin:20px;border-radius: 10px;border: 1px solid #D0D0D0">
<div style="width: 100%;height: 25px;line-height: 25px;margin-top: 50px;margin-left: 20px;"><span style="font-size: 20px;" id="comment">asadad</span></div>
<div style="width: 100%;height: 25px;line-height: 25px;margin-left: 20px;"><span style="font-size: 20px;" id="bed">asadad</span></div>
<div style="width: 100%;height: 25px;line-height: 25px;margin-bottom: 50px;margin-left: 20px;"><span style="font-size: 20px;" id="nobed">asadad</span></div>
</div>

</div>

</body>
</html>