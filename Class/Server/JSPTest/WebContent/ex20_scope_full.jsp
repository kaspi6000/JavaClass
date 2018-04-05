<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// 지역 ~ 멤버 ~ pageContext ~ request ~ session ~ application
String name = "홍길동";
%>
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
	<h1>일반 페이지</h1>
	
	<p>내용</p>
	<p>내용</p>
	<p>내용</p>
	
	<%@ include file="ex20_scope_part.jsp" %>
	
	<p>내용</p>
	<p>내용</p>
	<p>내용</p>
	
	<p>age : <%= age %></p>
	
</body>
</html>