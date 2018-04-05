<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
/*
	response.sendRedirect(url) vs pageContext.forwar(url)
	- 둘 다 서버측 이동
	- 표면상
		a. sendRedirect() : 두번째 페이지의 URL로 이동
		b. forward() : 첫번째 페이지의 URL이 고정
*/

// ** 첫번째 페이지에서 업무를 마친 뒤 데이터 산출 -> 두번째 페이지에서도 계속 사용해야 하는 경우
// ** 모든 서블릿 or JSP 에서 사용한 자원한 다른 서블릿 or JSP 로 이동하는 시점에서 모두 소멸
// = 상태 유지 불가능(웹 프로그래밍이 어려운 이유)
// 첫번째 페이지 -> 두번째 페이지

int data = 100;
// data += 100;

request.setAttribute("data", data);

// 1.
// response.sendRedirect("ex13_pagecontext_two.jsp");

// 2.
pageContext.forward("ex13_pagecontext_two.jsp");
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
	<h1>첫번째 페이지</h1>
</body>
</html>