<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<h1>Session</h1>
	
	<p><%= session.getCreationTime() %></p>
	<p><%= session.getId() %></p>
	<p><%= session.getLastAccessedTime() %></p>
	<p><%= session.isNew() %></p>
	<p><%= session.getMaxInactiveInterval() %></p>
	
	<a href="ex17_session_2.jsp">두번째 페이지</a>
</body>
</html>