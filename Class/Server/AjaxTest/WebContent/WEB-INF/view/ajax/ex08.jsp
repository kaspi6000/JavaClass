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
		
		$("#btn1").click(() => {
			
			// jQuery 사용해서 ajax 요청 ~ 응답
			$.ajax({
				url: "/ajax/ex08data.do", // 요청 URL
				type: "GET", // 메소드 방식
				dataType: "text", // 응답 데이터의 형태
				success: (result) => {
					$("#result").text(result); // 응답 데이터
				}, // 성공 콜백 함수
				error: (req, msg, error) => {
					alert(req + msg + error + "ERROR");
					console.log("req : " + req);
					console.log(req);
					console.log("msg : " + msg);
					console.log(msg);
					console.log("error : " + error);
				} // 실패 콜백 함수
			});
		});
		
		$("#btn2").click(() => {
			
			$.ajax({
				url: "/ajax/ex08data.do",
				type: "GET",
				success: (result) => {
					$("#result").text(result);
				}
			});
		});
		
		$("#btn3").click(() => {
			
			$.ajax({
				url: "/ajax/ex08data.do",
				type: "POST",
				success: (result) => {
					$("#result").text(result);
				}
			});
		});
		
		$("#btn4").click(() => {
			
			$.ajax({
				url: "/ajax/ex08data.do",
				data: "id=hong&age=20",
				type: "GET",
				success: (result) => {
					$("#result").text(result);
				}
			});
		});
		
		$("#btn5").click(() => {
			
			$.ajax({
				url: "/ajax/ex08data.do",
				type: "POST",
				data : "id=test&age=25",
				success: (result) => {
					$("#result").text(result);
				}
			});
		});
		
		$("#btnSend").click(() => {
			
			// 폼전송(X) -> Ajax 전송(O)
			
			// var data = "name=" + $("#name").val() + "&id=" + $("#id").val() + "&age=" + $("#age").val() + "&tel=" + $("#tel").val() + "&intro="  + $("#intro").val();
			
			// 반드시 <form> 태그 존재 <- jQuery 기능
			var data = $("#form1").serialize(); // 직렬화
			
			// alert(data);
			console.log($("#name").val());
			$.ajax({
				url: "/ajax/ex08data.do",
				type: "POST",
				data: {
					"name": $("#name").val(),
					"id": $("#id").val(),
					"age": $("#age").val(),
					"tel": $("#tel").val(),
					"intro": $("#intro").val()
				},
				success: (result) => {
					if(result == "1") {
						$("#result").text("OK!");
					} else {
						$("#result").text("FAIL!");
					}
				}
			});
		});
	});
</script>
</head>
<body>
	<div class = "container">
		<h2 class = "page-header">페이지 요청</h2>
		<input type = "button" value = "jQuery 방식" id = "btn1" class = "btn btn-default">
		<input type = "button" value = "1. GET요청" id = "btn2" class = "btn btn-default">
		<input type = "button" value = "2. POST요청" id = "btn3" class = "btn btn-default">
		
		<input type = "button" value = "3. GET요청 + 데이터 전송" id = "btn4" class = "btn btn-default">
		<input type = "button" value = "4. POST요청 + 데이터 전송" id = "btn5" class = "btn btn-default">
		<hr>
		<div id = "result" class = "well">결과</div>
		
		<h2 class = "page-header">회원 가입</h2>
		
		<form id = "form1">
		
			<table class = "table table-bordered">
				
				<tr>
					<th>이름</th>
					<td><input type = "text" name = "name" id = "name" class = "form-control"></td>
				</tr>
				
				<tr>
					<th>아이디</th>
					<td><input type = "text" name = "id" id = "id" class = "form-control"></td>
				</tr>
				
				<tr>
					<th>나이</th>
					<td><input type = "text" name = "age" id = "age" class = "form-control"></td>
				</tr>
				
				<tr>
					<th>전화번호</th>
					<td><input type = "text" name = "tel" id = "tel" class = "form-control"></td>
				</tr>
				
				<tr>
					<th>자기소개</th>
					<td><input type = "text" name = "intro" id = "intro" class = "form-control"></td>
				</tr>
			</table>
			
			<input type = "button" id = "btnSend" value = "가입하기" class = "btn btn-default">
		</form>
	</div>
</body>
</html>