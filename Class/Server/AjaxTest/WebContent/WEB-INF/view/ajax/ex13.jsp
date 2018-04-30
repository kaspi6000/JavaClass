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
<script src = "/ajax/js/jquery-ui.js"></script>
<style>
	#btnAdd {
		font-size: 3em;
		border: 3px solid #ccc;
		padding: 5px;
		border-radius: 50%;
		position: fixed;
		right: 10px;
		top: 10px;
		cursor: pointer;
	}
</style>
<script>
	
	var n = ${list.size() + 1}; // 고양이 번호
	

	$(() => {
		
		$(".cat").draggable({
			
			stop: (event, ui) => {
				
				// alert(event.target.id);
				
				var left = ui.position.left;
				var top = ui.position.top;
				console.log(left, top);
				
				$.ajax({
					type: "POST",
					url: "/ajax/ex13data.do",
					data: {
						"id": event.target.id,
						"left": left,
						"top": top
					},
					dataType: "json",
					success: (result) => {
						if(result == 0) {
							alert("저장 실패");
						}
					},
					error: (a,b,c) => {
						console.log(a,b,c);
						alert("저장 실패");
					}
				});
			}
		});
		
		// 고양이 초기 위치 지정
		<c:forEach items="${list}" var = "dto">
			$("#${dto.id}").css("left", "${dto.left}px");
			$("#${dto.id}").css("top", "${dto.top}px");
		</c:forEach>
		
		$("#btnAdd").click(() => {
			
			$(document.body).append('<img src = "/ajax/images/catty01.png" id = "cat' + n++ + '" class = "cat">');
			
			$(".cat").draggable({
				
				stop: (event, ui) => {
					
					// alert(event.target.id);
					
					var left = ui.position.left;
					var top = ui.position.top;
					console.log(left, top);
					
					$.ajax({
						type: "POST",
						url: "/ajax/ex13data.do",
						data: {
							"id": event.target.id,
							"left": left,
							"top": top
						},
						dataType: "json",
						success: (result) => {
							if(result == 0) {
								alert("저장 실패");
							}
						},
						error: (a,b,c) => {
							console.log(a,b,c);
							alert("저장 실패");
						}
					});
				}
			});
		});
		
	});
</script>
</head>
<body>
	<!-- <img src = "/ajax/images/catty01.png" id = "cat1"> -->
	<c:forEach items = "${list}" var = "dto">
		<img src = "/ajax/images/catty01.png" id = "${dto.id}" class = "cat">
	</c:forEach>
	
	<span class = "glyphicon glyphicon-plus" id = "btnAdd"></span>
</body>
</html>