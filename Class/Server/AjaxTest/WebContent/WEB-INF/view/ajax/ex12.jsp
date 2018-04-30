<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src = "/ajax/js/highcharts.js"></script>
<style>

</style>
<script>
	$(() => {
		
	});
	
	function view(id) {
		
		// console.log(department_id);
		
		$("table td").css("background-color", "transparent");
		$(event.srcElement).css("background-color", "#ddd");
		// console.log($(evt.target));
		
		// 특정 부서의 구성된 연봉 비율 가져와서 차트에 출력
		console.log(id);
		
		$.ajax({
			url: "/ajax/ex12data.do",
			type: "POST",
			data: "id=" + id,
			dataType: "json",
			success: function(result) {
				
				/* $(result).each((index, item) => {
					console.log(item.cnt, item.salary);
				}); */
				
				// result -> chart data format
				var dataArray = [];
				
				$(result).each((index, item) => {
					
					var obj = {};
					obj.name = item.salary;
					obj.y = item.cnt;
					dataArray.push(obj);
				});
				
				Highcharts.chart('chart', {
				    chart: {
				        plotBackgroundColor: null,
				        plotBorderWidth: null,
				        plotShadow: false,
				        type: 'pie'
				    },
				    title: {
				    	text: ""
				    },
				    tooltip: {
				        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
				    },
				    plotOptions: {
				        pie: {
				            allowPointSelect: true,
				            cursor: 'pointer',
				            dataLabels: {
				                enabled: true,
				                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
				                style: {
				                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
				                }
				            }
				        }
				    },
				    series: [{
				        name: 'Brands',
				        colorByPoint: true,
				        data: [{
				            name: 'Chrome',
				            y: 61.41,
				            sliced: true,
				            selected: true
				        }, {
				            name: 'Internet Explorer',
				            y: 11.84
				        }, {
				            name: 'Firefox',
				            y: 10.85
				        }, {
				            name: 'Edge',
				            y: 4.67
				        }, {
				            name: 'Safari',
				            y: 4.18
				        }, {
				            name: 'Sogou Explorer',
				            y: 1.64
				        }, {
				            name: 'Opera',
				            y: 1.6
				        }, {
				            name: 'QQ',
				            y: 1.2
				        }, {
				            name: 'Other',
				            y: 2.61
				        }]
				    }]
				});
			}
		});
	}
</script>
</head>
<body>
	<div class = "container">
	
		<h2 class = "page-header">Departments - Salary</h2>
		
		<table class = "table table-bordered">
			<tr>
				<th>Salary</th>
				<td>Department</td>
			</tr>
			
			<tr>
				<td rowspan = "${list.size() + 1}"><div id = "chart" style = "width: 800px; margin: 20px auto;'"></div></td>
			</tr>
			
			<c:forEach items = "${list}" var = "dto">
				<tr>
					<td style = "cursor: pointer;" onclick = "view(${dto.id})">${dto.name}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<script type="text/javascript">

		
	</script>
		
</body>
</html>