<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// 1. 데이터 가져오기(post + 한글)
request.setCharacterEncoding("UTF-8");

String name = request.getParameter("name");
String age = request.getParameter("age");

//2. 업무(DB)
System.out.println("insert .. + 실행");

// 3. 결과 페이지 이동
// 	a. location.href
//	b. response.sendRedirect()
//	c. pageContext.forward()

// response.sendRedirect("ex21_forward_result.jsp");

request.setAttribute("result", 1);

// pageContext.forward("ex21_forward_result.jsp");
%>

<jsp:forward page="ex21_forward_result.jsp" />

<%-- <div></div>
<jsp:div></jsp:div>
jsp: // 접두어 -> 네임스페이스(namespace) == 자바의 패키지 역할
-> 유일한 표현을 사용한다.(지구상) -> 도메인(//http://test.com)

XML -> 태그를 사용자가 맘대로 정의할 수 있다.

- 개발자 : 홍길동
<http://test.com:정보>
	<http://test.com:이름>홍길동</http://test.com:이름>
	<http://test.com:나이>20</http://test.com:나이>
</http://test.com:정보>

<my:정보 xmlns:my="http://test.com">
	<my:이름>홍길동</my:이름>
	<my:나이>20</my:나이>
	<my:색깔>검정</my:색깔>
</my:정보>

- 개발자 : 아무개
<강아지:정보>
	<강아지:이름>멍멍이</강아지:이름>
	<강아지:나이>2</강아지:나이>
</강아지:정보>

<문서>
	<정보>
		<이름>홍길동</이름>
		<나이>20</나이>
		<색깔>검정</색깔>
	</정보>
	<정보>
		<이름>멍멍이</이름>
		<나이>2</나이>
		<색깔>흰색</색깔>
	</정보>
</문서> --%>
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
	
</body>
</html>