<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// index.jsp
// index.jsp?mode=0

String mode = request.getParameter("mode");

if(mode == null || mode == "") {
	mode = "0";
}

String url = "";
String title = "";

if (mode.equals("0")) {
	url = "home.jsp";
	title = "Home";
} else if (mode.equals("1")) {
	url = "board.jsp";
	title = "Board";
} else if (mode.equals("2")) {
	url = "admin.jsp";
	title = "Administrator";
}
%>
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
						<li><a href = "index.jsp?mode=0">Home</a></li>
						<li><a href = "index.jsp?mode=1">Board</a></li>
						<li><a href = "index.jsp?mode=2">Administrator</a></li>
						<li><a href = "#">Info</a></li>
					</ul>
				</div>
			</nav>
		</header>
		
		<h2 class = "page-header"><%= title %> <small><i>This is Code Project.</i></small></h2>
		
		<!-- ((p.lead>lorem)+(p>lorem100))*3 -->
		<jsp:include page = '<%= "content/" + url %>'></jsp:include>
	</div>
</body>
</html>