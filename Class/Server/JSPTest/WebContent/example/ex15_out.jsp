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
	<%
	int dan = 2;
	%>
	
	<h1><%= dan %>단 - 스크립틀릿 + 표현식</h1>
	
	<% for(int i = 1; i <= 9; i++) { %>
	<div><%= dan %> X <%= i %> = <%= i*dan %></div>
	<% } %>
	
	<h1><%= dan %>단 - out 내장 객체</h1>
	
	<%
	for(int i = 1; i <= 9; i++){
		
		// HTML 출력
		// writer.println("2 X 1 = 2");
		out.println(String.format("<div>%d X %d = %d</div>", dan, i, dan*i));
	}
	%>
</body>
</html>