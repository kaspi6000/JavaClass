<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// 쿠키 제어
// 1. 쿠키에 데이터 쓰기
// a. 쿠키 객체 생성
Cookie cookie = new Cookie("name", "hong");
Cookie cookie2 = new Cookie("age", "20");

String[] list = {"하나", "둘", "셋"};
// Cookie cookie3 = new Cookie("list", list);
String test = Arrays.toString(list);
String temp = test.replace("[", "").replace(",", "").replace("]", "").trim();
System.out.println(temp);
Cookie cookie3 = new Cookie("list", temp);

// b. 쿠키를 브라우제에게 전송
response.addCookie(cookie); // 저장
response.addCookie(cookie2); // 저장
// response.addCookie(cookie3);

// 2. 쿠키내의 데이터 읽기
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
	/* $(() => {
		
	}); */
</script>
</head>
<body>
	<div>쿠키명 : <%= cookie.getName() %></div>
	<div>쿠키값 : <%= cookie.getValue() %></div>
	<div>쿠키만료시간 : <%= cookie.getMaxAge() %></div>
</body>
</html>