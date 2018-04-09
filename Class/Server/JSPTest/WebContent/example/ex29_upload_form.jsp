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
	div {
		margin: 10px;
	}
</style>
<script>
	$(() => {
		
		var n = 2;
		
		$("#addfile").click((e) => {
			// href="#" -> 스크롤바가 꼭대기로 이동
			e.preventDefault();
			
			//파일 컨트롤 추가
			$("#attachlist").append("<div>파일 : <input type = 'file' name = 'attach"+ n +"'></div>");
			n++;
		});
	});
</script>
</head>
<body>
	<h1>파일 업로드</h1>
	
	<form method = "POST" action = "ex29_upload_process.jsp" enctype = "multipart/form-data">
		<div>제목 : <input type = "text" name = "subject"></div>
		<div>이름 : <input type = "text" name = "name"></div>
		<div id = "attachlist">
			<div>파일 : <input type = "file" name = "attach1"></div>
		</div>
		<div><a href = "#" id = "addfile">첨부 파일 추가하기</a></div>
		<div><input type = "submit" value = "보내기"></div>
	</form>
</body>
</html>