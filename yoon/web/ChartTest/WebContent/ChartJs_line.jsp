<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>������ ���� ����</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://www.chartjs.org/dist/2.9.2/Chart.min.js"></script>
<script src="https://www.chartjs.org/samples/latest/utils.js"></script>
<style>
	canvas {
		-moz-user-select: none;
		-webkit-user-select: none;
		-ms-user-select: none;
	}
</style>
<script type="text/javascript">
	$(function() {
		let cities = [ {name : "����", code : 1}
					 ,{name : "��⵵", code : 31}
					 ,{name : "��õ", code : 2}];

	 	let myKey = "o2dopDVzLQoFs5lEezEbhHtXdV5dzsM33ApDJHV5cQwaf3b8lc3d6EQZyiar3sm8uB60h53CrvB00yqzaoNt7g%3D%3D";

	 	for (var i = 0; i < cities.length; i++) {
			let apiLink = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey="
				+ myKey
				+ "&areaCode="+ cities[i].code
				+ "&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=&pageNo=1";
			
			let category = [ { name : "������", id : 12 }
							,{ name : "��ȭ�ü�", id : 14 }
							,{ name : "���/����/����", id : 15 }
							,{ name : "�����ڽ�", id : 25 }
							,{ name : "������", id : 28 }
							,{ name : "����", id : 32 }
							,{ name : "����", id : 38 }
							,{ name : "������", id : 39 }];
			
			cities[i].category = category;

			for (let j = 0; j < cities[i].category.length; j++) {
				test1(apiLink, j, cities[i].category);
			}  
		}

		let successCount = 0;
		function test1(apiLink, index, category){
			let link = apiLink + "&contentTypeId=" + category[index].id + "&_type=json";
			$.getJSON(link, function(data) {
				console.log(data);
				category[index].totalCount = data.response.body.totalCount;

				 if(++successCount == category.length * cities.length) 
					setChart(); 
			})
		}
		
		function setChart(){
			console.log(cities);
 			let labels= [];
			let values= [];
			let datasets = [];
			$.each(cities, function(index, element){
				let city = element.name;
				let values= [];
				$.each(element.category, function(){
					if(index==0)
						labels.push(this.name);

					 values.push(this.totalCount); 
				});
				let color= getAnotherChartColor(index);
				console.log(color);
				datasets.push({
					label: city,
					backgroundColor: color,
					borderColor: color,
					data: values,
					fill: false,
				});
			})

			 let config = {
					type: 'line',
					data: {
						labels: labels,
						datasets: datasets
					},
					options: {
						responsive: true,
						title: {
							display: true,
							text: '������ ���� ����'
						},
						tooltips: {
							mode: 'index',
							intersect: false,
						},
						hover: {
							mode: 'nearest',
							intersect: true
						},
						scales: {
							xAxes: [{
								display: true,
								scaleLabel: {
									display: true,
									labelString: 'ī�װ�'
								}
							}],
							yAxes: [{
								display: true,
								scaleLabel: {
									display: true,
									labelString: '����'
								}
							}]
						}
					}
				};
			
			window.myLine = new Chart($('#canvas'), config);
		}
		
		let colorNames = Object.keys(window.chartColors);
		function getAnotherChartColor(dataLength){
			let colorName = colorNames[dataLength % colorNames.length];

			return window.chartColors[colorName];
		}
	});
</script>
</head>
<body>
	<div style="width:75%;">
		<canvas id="canvas"></canvas>
	</div>
</body>

</html>
