<%@ page import="com.test.jsp.Address" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// 현재 페이지의 목적 : 입력 데이터 수신 -> 객체화(DTO, Bean 등..) -> 업무 적용

request.setCharacterEncoding("UTF-8");

/* String name = request.getParameter("name");
String age = request.getParameter("age");
String gender = request.getParameter("gender");
String tel = request.getParameter("tel");
String address = request.getParameter("address"); */

/* Address addr = new Address();

addr.setName(name);
addr.setAge(Integer.parseInt(age));
addr.setGender(gender);
addr.setTel(tel);
addr.setAddress(address); */

/* HTML 태그 name 값 == 자바 빈의 멤버 변수명 == DTO의 멤버 변수명 == 오라클 테이블의 컬럼명 */

%>

<jsp:useBean id="addr" class = "com.test.jsp.Address"></jsp:useBean>

<%-- <jsp:setProperty name = "addr" property="name" value = "<%= name %>" />
<jsp:setProperty name = "addr" property="age" value = "<%= Integer.parseInt(request.getParameter("age")) %>" />
<jsp:setProperty name = "addr" property="gender" value = "<%= gender %>" />
<jsp:setProperty name = "addr" property="tel" value = "<%= tel %>" />
<jsp:setProperty name = "addr" property="address" value = "<%= address %>" /> --%>

<jsp:setProperty property="*" name="addr"/>

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
	<h1>결과</h1>
	
	<p>이름 : <%= addr.getName() %></p>
	<%-- <p>나이 : <jsp:getProperty property = "age" name = "addr" /></p> --%>
	<p>나이 : <%= addr.getAge() %></p>
	<p>성별 : <%= addr.getGender() %></p>
	<p>전화 : <%= addr.getTel() %></p>
	<p>주소 : <%= addr.getAddress() %></p>
</body>
</html>