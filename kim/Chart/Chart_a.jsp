<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script type="text/javascript">
$(function(){
	var car = [];
	var city = [];
	 $.getJSON("http://openapi.seoul.go.kr:8088/6b727477516368643733494e454d76/json/octastatapi255/1/26",function(data){
		 $.each(data.octastatapi255.row,function(index,obj){
			 console.log(data.octastatapi255.row[index].SOGYE_1);
			 city.unshift(data.octastatapi255.row[index].JACHIGU);
			 car.unshift(parseInt(data.octastatapi255.row[index].SOGYE_1));
		 });
		 car.pop();
		 Highcharts.chart('container', {
			  chart: {
			    type: 'line'
			  },
			  title: {
			    text: '서울시 자동차 등록'
			  },
			  subtitle: {
			    text: 'Team 2'
			  },
			  xAxis: {
			    categories: city
			  },
			  yAxis: {
			    title: {
			      text: '자동차(대)'
			    }
			  },
			  plotOptions: {
			    line: {
			      dataLabels: {
			        enabled: true
			      },
			      enableMouseTracking: false
			    }
			  },
			  series: [{
			    name: '서울 자동차',
			    data: car
			  }]
			  
			
			
		 });
});
	 
});
</script>
</head>
<body>
	<div id="container"
		style="min-width: 310px; height: 400px; margin: 0 auto"></div>

</body>
</html>