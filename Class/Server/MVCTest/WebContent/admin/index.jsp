<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page = "/inc/asset.jsp">
	<jsp:param value="1" name="board"/>
</jsp:include>
<style>
	.container > div {width: 900px; margin: 30px auto;}
	
	#count > .countItem {width: 200px; height: 150px; padding: 20px; border-radius: 10px; text-align: right; float: left; margin-right: 20px;}
	
	#count > .countItem:nth-child(1) {background-color: #337AB7;}
	#count > .countItem:nth-child(2) {background-color: #5CB85C;}
	#count > .countItem:nth-child(3) {background-color: #F0AD4E;}
	#count > .countItem:nth-child(4) {background-color: #D9534F;}
	
	#count > .countItem > span {color: white; font-size: 40px; float: left;}
	
	#count > .countItem > div {color: white;}
	
	#count > .countItem > div:nth-child(2) {font-size: 30px; font-weight: bold; margin-top: 20px;}
	
	#count > .countItem > div:nth-child(3) {font-size: 20px;}
	
	#postCount {border: 1px solid #ccc; width: 850px; margin: 20px auto; padding: 0; transform: translate(20px, 0);}
</style>
<script src = "/mvc/js/highcharts.js"></script>
<script>
	
</script>
</head>
<body>
	<!--  -->
	<div class="container">
	
		<jsp:include page="/inc/header.jsp"></jsp:include>
	
	
		<h2 class = "page-header"><span class = "glyphicon glyphicon-dashboard" style = "margin-right: 20px;"></span>Dash Board</h2>
	
		<div id = "count">
			
			<div class = "countItem">
				<span class = "glyphicon glyphicon-user"></span>
				<div>${userCount}</div>
				<div>Total Users</div>
			</div>
			
			<div class = "countItem">
				<span class = "glyphicon glyphicon-th-list"></span>
				<div>${postCount}</div>
				<div>Total Post</div>
			</div>
			
			<div class = "countItem">
				<span class = "glyphicon glyphicon-tag"></span>
				<div>${commentCount}</div>
				<div>Total Comment</div>
			</div>
			
			<div class = "countItem">
				<span class = "glyphicon glyphicon-paperclip"></span>
				<div>${mediaCount}</div>
				<div>Total Media</div>
			</div>
		</div>
		
		<div id="postCount" style="min-width: 310px; max-width: 800px; height: 400px; margin: 0 auto; clear: both;"></div>
		
		${names}
		
		${namesData}
		
		${postsData}
		
		${commentsData}
		
	</div>
	
	<script>

		Highcharts.chart('postCount', {
		    chart: {
		        type: 'bar'
		    },
		    title: {
		        text: 'Post Count'
		    },
		    xAxis: {
		        categories: [
		        	
		        	${namesData}
		        ],
		        title: {
		            text: null
		        }
		    },
		    yAxis: {
		        min: 0,
		        title: {
		            text: '게시물 수',
		            align: 'high'
		        },
		        labels: {
		            overflow: 'justify'
		        }
		    },
		    tooltip: {
		        valueSuffix: ' 개'
		    },
		    plotOptions: {
		        bar: {
		            dataLabels: {
		                enabled: true
		            }
		        }
		    },
		    legend: {
		        layout: 'vertical',
		        align: 'right',
		        verticalAlign: 'top',
		        x: -40,
		        y: 80,
		        floating: true,
		        borderWidth: 1,
		        backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
		        shadow: true
		    },
		    credits: {
		        enabled: false
		    },
		    series: [{
		        name: '게시물 수',
		        data: [${postsData}]
		    }, {
		        name: '댓글 수',
		        data: [${commentsData}]
		    }]
		});	
	</script>
		
</body>
</html>