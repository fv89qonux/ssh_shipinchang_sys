<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>食品加工厂管理信息系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="shortcut icon" href="icon/icon.ico" />
	<link rel="stylesheet" type="text/css" href="css/admin_style.css">
	<script type="text/javascript" src="js/jquery-1.6.3.min.js"></script>
	<script type="text/javascript" src="js/echarts.min.js"></script>
	
	<script type="text/javascript">
		$(function(){
			$("#refresh").click(function(){
				path = $(this).attr("alt");
				window.location.href = path + "account/Account_refreshNotice";
			});
		});
	</script>
  </head>
  
  <body style="overflow: hidden;">
	<div class="div_title">
		<div class="div_title_img"><img src="image/img/tb.gif" width="14" height="14" /></div>
		<div class="div_title_name">首页</div>
	</div>
	<div style="background-color: #FFF;height: 100%;">
	<div style="float:left;">
	<h1>最近一年入库统计</h1>
		<div id="main" style="width: 500px; height: 300px;"></div> 
           </div>
 			 <script type="text/javascript">  
        // 基于准备好的dom，初始化echarts实例  
        var myChart1 = echarts.init(document.getElementById('main'));  
        var url1 = '${pageContext.request.contextPath}/statistical/Statistical_getInData.action?requestMode=ajax';  
        $.getJSON(url1).done(function(json1) {  
             // 2.获取数据  
           var salesVolume1 = json1.months;//销量  
           var bussinessVolume1 = json1.moneys;//营业额  
           var months1 = json1.months;//月份  
             // 3.更新图表myChart的数据  
          
            option1 = {
            	    xAxis: {
            	        type: 'category',
            	        data: salesVolume1
            	    },
            	    yAxis: {
            	        type: 'value'
            	    },
            	    series: [{
            	        data: bussinessVolume1,
            	        type: 'bar',
            	        showBackground: true,
            	        backgroundStyle: {
            	            color: 'rgba(220, 220, 220, 0.8)'
            	        }
            	    }]
            	};

            myChart1.setOption(option1);  
        })  
    </script>  
    <div style="float:right;">
    <h1>最近一年出库统计</h1>
    <div id="main2" style="width: 500px; height:300px;"></div> 
      </div>     
 			 <script type="text/javascript">  
        // 基于准备好的dom，初始化echarts实例  
        var myChart2 = echarts.init(document.getElementById('main2'));  
        var url2 = '${pageContext.request.contextPath}/statistical/Statistical_getOutData.action?requestMode=ajax';  
        $.getJSON(url2).done(function(json2) {  
             // 2.获取数据  
            var bussinessVolume2 = json2.moneys;//营业额  
           var months2 = json2.months;//月份  
             // 3.更新图表myChart的数据  
          
            option2 = {
            	    xAxis: {
            	        type: 'category',
            	        data: months2
            	    },
            	    yAxis: {
            	        type: 'value'
            	    },
            	    series: [{
            	        data: bussinessVolume2,
            	        type: 'bar',
            	        showBackground: true,
            	        backgroundStyle: {
            	            color: 'rgba(220, 220, 220, 0.8)'
            	        }
            	    }]
            	};

            myChart2.setOption(option2);  
        })  
    </script>  
	</div>
  </body>
</html>
