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
	<div class = "container">
		<h1 class = "page-header">주소록 <small>등록하기</small></h1>
		
		<form method = "POST" action = "/mvc/address/addok.html">
			<table class = "table table-bordered">
				<tr>
					<th>이름</th>
					<td><input type = "text" name = "name" required></td>
				</tr>
				
				<tr>
					<th>나이</th>
					<td><input type = "text" name = "age" required></td>
				</tr>
				
				<tr>
					<th>성별</th>
					<td>
						<select name = "gender">
							<option value = "m">남자</option>
							<option value = "f">여자</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<th>전화</th>
					<td><input type = "text" name = "tel" required></td>
				</tr>
				
				<tr>
					<th>주소</th>
					<td><input type = "text" name = "address" required></td>
				</tr>
			</table>
			
			<div>
				<input type = "submit" value = "등록하기">
			</div>
		</form>
	</div>
</body>
</html>