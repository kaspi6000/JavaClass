<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<h1>파일 업로드</h1>
	
	<!--
		1. 파일 업로드 > 대량의 데이터 > 반드시 POST
		2. enctype 지정
			- application/x-www-form-urlencoded : 전송되는 데이터가 문자열로 구성
			- multipart/form-data : 문자열 + 비문자열 데이터 전송
	-->
	
	<form method = "POST" action = "ex28_upload_process.jsp" enctype = "multipart/form-data">
		<div>제목 : <input type = "text" name = "subject"></div>
		<div>이름 : <input type = "text" name = "name"></div>
		<div>파일 : <input type = "file" name = "attach"></div> <!-- 파일 업로드 컨트롤 -->
		<div><input type = "submit" value = "보내기"></div>
	</form>
</body>
</html>