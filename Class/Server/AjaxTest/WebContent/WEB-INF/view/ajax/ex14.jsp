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
	#search { padding: 50px 20px; position: relative; }
	#query { width: 450px; outline: none; }
	#list { position: absolute; border: 1px solid #ccc; width: 450px; left: 74px; top: 83px; background-color: white; display: none; }
	#list .item { padding: 7px 12px; cursor: pointer; }
	#list #listfooter { padding: 7px 12px; background-color: #eee; text-align: right; }
	#list #listfooter span { cursor: pointer; }
</style>
<script>

	var index = -1;

	$(() => {
		
		$("#query").keyup(() => {
			
			// alert(event.target.value);
			
			// GET
			// 1. 데이터양이 적을 때
			// 2. <form>, 링크, Javascript, Ajax
			// 3. 파라미터가 동일하면 결과값이 동일한 경우 (-> 브라우저 캐시 기능 때문에)
			
			// POST
			// 1. 데이터양이 많을 때
			// 2. <form>, Ajax
			// 3. 파라미터가 동일해도 결과값이 다른 경우(-> 브라우저 캐시 기능 때문에)
			
			if(event.keyCode != 38 && event.keyCode != 40 && event.keyCode != 27) {
				
				if(event.target.value != "") { // 검색어가 있을 때만 Ajax 요청
					
					$.ajax({
						type: "GET",
						url: "/ajax/ex14data.do",
						data: "query=" + event.target.value,
						dataType: "json",
						success: (result) => {
							
							// 이전 목록 초기화
							$("#listitem").html("");
							
							if($(result).length > 0) {
								
								$(result).each((index, item) => {
									
									// console.log(word);
									$("#listitem").append("<div class='item' onmouseover='selitem();' onmouseout='selitem();' onclick='selecteditem();'>" + item.word + "</div>");
								});
								
								$("#list").show();
							} else {
								$("#list").hide();
							}
						},
						error: (a, b, c) => {
							console.log(a, b, c);
						}
					});
				} else {
					
					$("#list").hide();
				}
			}
			
			if(event.keyCode == 38) {
				
				index--;
				if(index < 0) index = 0;
			} else if(event.keyCode == 40) {
				
				index++;
				if($("#listitem > div").length <= index) index--;
			} else if(event.keyCode == 13) {
				
				alert("ok");
			} else if (event.keyCode == 27) {
				
				// esc
				$("#list").hide();
			}
			
			$("#listitem > div").css("background-color", "transparent");
			$("#listitem > div").eq(index).css("background-color", "#F9F9F9");
			
			if(index >= 0){
				$("#query").val($("#listitem > div").eq(index).text());
			}
		});
		
		$("#listfooter span").click(() => {
			$("#list").hide();
		})
	});
	
	function selitem() {
		
		// 1. 주체(객체)
		var item = event.srcElement;
		
		// 2. 이벤트?
		//console.log(event.type);
		
		if(event.type == "mouseover") {
			
			$(item).css("background-color", "#F9F9F9");
		} else if(event.type == "mouseout") {
			
			$(item).css("background-color", "transparent");
		}
		
	}
	
	function selecteditem() {
		
		// 검색어 중 하나를 선택
		$("#query").val($(event.srcElement).text());
		$("#list").hide();
		
		// 검색 버튼 클릭 or form submit
	}
</script>
</head>
<body>
	<div class = "container">
	
		<header class = "form-inline" id = "search">
			<label for = "query">검색어 : </label>
			<input type = "text" id = "query" name = "query" class = "form-control" spellcheck="false">
			<button type = "button" class = "btn btn-success"><span class = "glyphicon glyphicon-search"></span></button>
			
			<div id = "list">
				<div id = "listitem"></div>
				<!-- <div class = "item">wef</div> -->
				<div id = "listfooter"><span class = "glyphicon glyphicon-remove"></span></div>
			</div>
		</header>
		
		<h2 class = "page-header">사이트 제목</h2>
		<section>내용들..</section>
		<section>내용들..</section>
		<section>내용들..</section>
		<section>내용들..</section>
		<section>내용들..</section>
	</div>
</body>
</html>