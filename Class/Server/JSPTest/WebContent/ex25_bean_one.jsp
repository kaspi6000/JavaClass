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
	<h1>첫번째 페이지</h1>
	
	<!-- useBean의 scope : page ~ request -->
	
	<jsp:useBean id = "item" class = "com.test.jsp.Item" scope = "application" />
	
	<jsp:setProperty property = "name" value = "홍길동" name = "item" />
	<jsp:setProperty property = "nick" value = "개발자" name = "item" />
	
	<jsp:getProperty property = "name" name = "item" />
	-
	<jsp:getProperty property = "nick" name = "item" />
	
	<jsp:forward page = "ex25_bean_two.jsp" />
</body>
</html>