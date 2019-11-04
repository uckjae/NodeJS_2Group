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
</head>
<body>
	<div id="container" style=" min-width: 310px; height: 400px; margin: 0 auto"></div>
	<script language="JavaScript">
		Highcharts.chart('container', {
		  chart: {
		    type: 'line'
		  },
		  title: {
		    text: '여행객 수'
		  },
		  subtitle: {
		    text: 'Team 2'
		  },
		  xAxis: {
		    categories: ['07년', '08년', '09년', '10년', '11년', '12년', '13년', '14년', '15년', '16년', '17년', '18년']
		  },
		  yAxis: {
		    title: {
		      text: '여행객 (백만명)'
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
		    name: '국내 여행객',
		    data: [13.6, 12.3, 9.8, 12.8, 13.0, 14.0, 15.1, 16.3, 19.5, 22.6, 26.7 , 28.9]
		  }, {
		    name: '해외 여행객',
		    data: [6.4, 6.8, 7.8, 8.7, 9.7, 11.1, 12.2, 14.2, 13.3, 17.4, 13.5, 15.6]
		  }]
		});
	</script>
</body>
</html>