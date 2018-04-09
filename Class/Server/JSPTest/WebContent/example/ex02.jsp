<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage = "error.jsp"%>
<%@ page import = "java.util.Random" %>
<%@ page import = "java.util.Calendar" %>

<%@ page import = "java.util.Random, java.util.Calendar" %>
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
		int num = 10;
		num *= 2;
		
		Random rnd = new Random();
		
		num = 0;
		int result = 100 / num;
		
		// 버퍼 테스트
		for(int i = 0; i < 1000000; i++) {
			Thread.sleep(10); // 이 라인에서 10ms만큼 멈춰라.
	%>
		<p>안녕하세요 <%= i %></p>
	<%
		}
	%>
	<p>num : <%= num %></p>
	<p><%= rnd.nextInt() %></p>
</body>
</html>