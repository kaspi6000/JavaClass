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
<style>

</style>
<script>
	$(() => {
		
		<c:if test = "${result == 1}">
			location.href = "/mvc/address/list.html";
		</c:if>
		
		<c:if test = "${result == 0}">
			alert("등록 실패");
			history.back();
		</c:if> 
	});
</script>
</head>
<body>
	<div class = "container">
		<%-- <%= request.getAttribute("result") %> --%>
		
	</div>
</body>
</html>