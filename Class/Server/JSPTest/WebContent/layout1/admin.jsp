<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>

</style>
<script>
	$(() => {
		
	});
</script>
</head>
<body>
	<div class = "container">
		<header>
			<nav class = "navbar navbar-default">
				<div class = "container-fluid">
					<div class = "navbar-header">
						<a class = "navbar-brand" href = "#">
							<span class = "glyphicon glyphicon-blackboard"></span>
							Code Project
						</a>
					</div>
					<ul class = "nav navbar-nav">
						<li><a href = "index.jsp">Home</a></li>
						<li><a href = "board.jsp">Board</a></li>
						<li><a href = "admin.jsp">Administrator</a></li>
						<li><a href = "#">Info</a></li>
					</ul>
				</div>
			</nav>
		</header>
		
		<h2 class = "page-header">Admin <small><i>..</i></small></h2>
		
		<h3>lorem3</h3>
		<p>lorem20</p>
		
		<!-- 미디어 오브젝트 : 이미지, 동영상 태그 배치(float) -->
		<div class = "media">
			<div class = "media-left">
				<img src = "images/job/job01.png" style = "width: 100px">
			</div>
			<div class = "media-body">
				<h4 class = "media-heading">Adminstrator <small><i>hong@gmail.com</i></small></h4>
				p>lorem100
			</div>
			
			<hr>
			
			<div class = "media-left">
				<img src = "images/job/job02.png" style = "width: 100px">
			</div>
			<div class = "media-body">
				<h4 class = "media-heading">System Engineer <small><i>syslee@gmail.com</i></small></h4>
				p>lorem100
			</div>
			
			<hr>
			
			<div class = "media-left">
				<img src = "images/job/job03.png" style = "width: 100px">
			</div>
			<div class = "media-body">
				<h4 class = "media-heading">Software Architect <small><i>test@gmail.com</i></small></h4>
				p>lorem100
			</div>
		</div>
	</div>
</body>
</html>