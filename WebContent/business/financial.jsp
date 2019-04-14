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
        <script src="<%=path %>/js/echarts.min.js"></script>
<title>Insert title here</title>
</head>
<body style="height: 800px; margin:0;">
<div style="height: 50%;width: 30%;margin-left: 2.5%;margin-right: 2.5%;float: left">
	<div style="width:100%;height: 20%;float: left;background-color: #fff;margin-top: 50px">
		<span style="line-height: 50px;font-weight: 700;color: #7b7b7b;font-size: 20px">今日营业额：</span>
	</div>
	<div align="center" style="width:100%;height: 50%;float: left;background-color: #fff;margin-top: 50px">
		<span id="sales" style="height: 200px;line-height: 200px;font-size: 95px">${todaysum}</span>
	</div>
</div>
<div style="height: 50%;width: 60%;margin-left: 2.5%;margin-right: 2.5%;float: right;" id="sal"></div>
<div style="height: 50%;width: 30%;margin-left: 2.5%;margin-right: 2.5%;float: left">
	<div style="width:100%;height: 20%;float: left;background-color: #fff;margin-top: 50px">
		<span style="line-height: 50px;font-weight: 700;color: #7b7b7b;font-size: 20px">今日订单量：</span>
	</div>
	<div align="center" style="width:100%;height: 50%;float: left;background-color: #fff;margin-top: 50px">
		<span id="sales" style="height: 200px;line-height: 200px;font-size: 95px">${todayorder}</span>
	</div>
</div>
<div style="height: 50%;width: 60%;margin-left: 2.5%;margin-right: 2.5%;float: right;" id="sall"></div>
</body>
       <script type="text/javascript">
       var datalist = ${datalist};
       var sumlist = ${sumlist};
       var orderlist = ${orderlist};
var dom = document.getElementById("sal");
var myChart = echarts.init(dom);
var app = {};
option = null;
option = {
    title: {
        text: '七日营业额'
    },
    tooltip : {
        trigger: 'axis',
        axisPointer: {
            type: 'cross',
            label: {
                backgroundColor: '#6a7985'
            }
        }
    },
    legend: {
        data:['营业额']
    },
    toolbox: {
        feature: {
            saveAsImage: {}
        }
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    xAxis : [
        {
            type : 'category',
            boundaryGap : false,
            data : datalist
        }
    ],
    yAxis : [
        {
            type : 'value'
        }
    ],
    series : [
        
        {
            name:'营业额',
            type:'line',
            stack: '总量',
            label: {
                normal: {
                    show: true,
                    position: 'top'
                }
            },
            areaStyle: {normal: {}},
            data:sumlist
        }
    ]
};
;
if (option && typeof option === "object") {
    myChart.setOption(option, true);
}
var dom1 = document.getElementById("sall");
var myChart1 = echarts.init(dom1);
var app1 = {};
option1 = null;
option1 = {
    title: {
        text: '七日订单量'
    },
    tooltip : {
        trigger: 'axis',
        axisPointer: {
            type: 'cross',
            label: {
                backgroundColor: '#6a7985'
            }
        }
    },
    legend: {
        data:['订单量']
    },
    toolbox: {
        feature: {
            saveAsImage: {}
        }
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    xAxis : [
        {
            type : 'category',
            boundaryGap : false,
            data : datalist
        }
    ],
    yAxis : [
        {
            type : 'value'
        }
    ],
    series : [
        
        {
            name:'订单量',
            type:'line',
            stack: '总量',
            label: {
                normal: {
                    show: true,
                    position: 'top'
                }
            },
            areaStyle: {normal: {}},
            data:orderlist
        }
    ]
};
;
if (option1 && typeof option1 === "object") {
    myChart1.setOption(option1, true);
}
       </script>
</html>