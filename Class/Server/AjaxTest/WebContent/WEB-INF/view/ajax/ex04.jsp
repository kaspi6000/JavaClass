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
		
	});
	
	function test() {
		
		// ajax
		// 1. 순수 자바스크립트
		// 2. jQuery
		
		var ajax = new XMLHttpRequest();
		
		// console.log(ajax);
		
		ajax.onreadystatechange = function() {
			
			// console.log(this.readyState); // - 4(응답완료)
			// console.log(this.status); // 상태코드 - 200
			if(this.readyState == 4 && this.status == 200) {
				// console.log("ok");
				// alert("ok");
				alert(this.responseText);
			}
		};
		
		// ajax.open("GET", "/AjaxTest/data.txt", true);
		// ajax.open("GET", "/AjaxTest/ex04data.do", true);
		ajax.open("GET", "/AjaxTest/ex04data2.do", true);
		ajax.send(); // Action -> GET Request -> Server
	}
</script>
</head>
<body>
	
	<div id = "container">
		<h2 class = "page-header">Ajax, Asynchronous JavaScript and XML</h2>
		
		<ul>
			<li>비동기 자바스크립트 & XML</li>
			<li>비동기 자바스크립트 통신</li>
			<li>자바스크립트(소켓)를 사용해서 클라이언트(브라우저)와 서버간의 데이터 통신을 하는 기술</li>
			<li>페이지 로딩과는 별도로 웹서버로부터 데이터를 주고 받을 수 있다.</li>
			<li>페이지 전체가 아닌 필요한 일부분만 가져올 수 있다.</li>
			<li>데이터 주고 받는 과정에 페이지 새로 고침이 없다.(깜빡임 없음)</li>
			<li>백그라운드 통신 작업</li>
		</ul>
		
		<input type = "button" value = "테스트" class = "btn btn-default" onclick = "test()">
		<div id = "result"></div>
	</div>
</body>
</html>