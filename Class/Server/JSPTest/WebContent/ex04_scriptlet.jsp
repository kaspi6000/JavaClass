<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%

// 페이지의 출력 내용에 직접적인 관계없는 코드는 HTML 상단/하단으로 분리(가독성)
Calendar c = Calendar.getInstance();
String txt = String.format("%tF %tT", c, c);

String name = "홍길동"; // select name from
String age = "<input type = 'text' name = 'age' value = '20'>";
String color = "blue";
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
	p {
		color: <%= color %>;
	}
</style>
<script>
	$(() => {
		alert("<%= name %>님 안녕하세요");
	});
</script>
</head>
<body>
	<%
	// 자바영역
	int a = 10;
	int b = 20;
	%>
	<p>a : <%= a %></p>
	<p>b : <%= b %></p>
	<p><%= txt %></p>
	
	<h1>구구단</h1>
	
	<% for(int i = 1; i <= 9; i++) { %>
	<div>9 X <%= i %> = <%= i*9 %></div>
	<% } %>
	
	<h1 style = "border:1px solid black; color:<%= color %>; text-decoration:underline;">표현식</h1>
	
	<p>이름 : <%= name %></p><!-- 변수를 HTML의 PCDATA 영역에 출력 -->
	<p>나이 : <%= age %></p><!-- 동적 태그 생성 -->
</body>
</html>