<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// 혹시라도 url을 직접 접근하는 경우..
if(session.getAttribute("auth") == null) {
	response.sendRedirect("../index.jsp");
}
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
	<h1>회원 전용 페이지</h1>
	
	<%-- <% if(session.getAttribute("auth") != null) { %> --%>
	<input type = "submit" value = "글쓰기">
	<%-- <% } %> --%>
</body>
</html>