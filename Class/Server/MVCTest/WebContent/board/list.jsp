<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page = "/inc/asset.jsp">
	<jsp:param value="1" name="board"/>
</jsp:include>
<style>
	#tbl1 th:nth-child(1) { width: 70px; }
	#tbl1 th:nth-child(2) { width: 1500px; }
	#tbl1 th:nth-child(3) { width: 200px; }
	#tbl1 th:nth-child(4) { width: 200px; }
	#tbl1 th:nth-child(5) { width: 70px; }
	#tbl1 th { text-align: center; }
	
	#tbl1 td { text-align: center; }
	#tbl1 td:nth-child(2) { text-align: left; }
	
	#tbl1 td span.label { font-size: 6px; padding: 1px 5px; }
	
	#search { text-align: center; }
	#search #word { width: 300px; }
</style>
<script>
	$(() => {
		
		// 검색중이라면.. 컨트롤들을 이전 상태와 동일하게 유지
		<c:if test = "${map.isSearch == 'true'}">
			$("#column").val("${map.column}");
			$("#word").val("${map.word}");
		</c:if>
	});
</script>
</head>
<body>
	<!--  -->
	<div class="container">
	
	<jsp:include page="/inc/header.jsp"></jsp:include>
	
	
	<h2 class = "page-header">게시판 <small>
	<c:if test = "${map.isSearch == 'false'}">
	목록보기
	</c:if>
	<c:if test = "${map.isSearch == 'true'}">
	검색 결과 보기
	</c:if>
	</small></h2>
	
		<c:if test = "${map.isSearch == 'true'}">
		<div id = "message" style = "text-align: center; color: red; font-size: 13px;">
			'${map.column}'에서 '${map.word}'(으)로 검색된 결과 ${list.size()}건 입니다.
		</div>
		</c:if>
		
		<form class = "form-inline" style = "text-align: right;" action = "/mvc/board/list.do" method = "GET">
			페이지 : <input type = "number" name = "page" id = "page" class = "form-control" min = "1" max = "${totalPage}" value = "${nowPage}">
			<input type = "submit" value = "이동하기" class = "btn btn-default">
			
			<c:if test = "${map.isSearch == 'true'}">
			<input type = "hidden" name = "column" value = "${map.column}">
			<input type = "hidden" name = "word" value = "${map.word}">
			</c:if>
		</form>
	
		<table id = "tbl1" class = "table table-striped">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>이름</th>
				<th>날짜</th>
				<th>읽음</th>
			</tr>
			
			<c:if test="${list.size() == 0}">
				<tr>
					<td colspan = "5">게시물이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach items = "${list}" var = "dto">
			<tr>
				<td>${dto.seq}</td>
				<td>
				
					<c:if test = "${map.isSearch == 'false'}">
					<a href="/mvc/board/view.do?seq=${dto.seq}">${dto.subject}</a>
					</c:if>
					<c:if test = "${map.isSearch == 'true'}">
					<a href="/mvc/board/view.do?seq=${dto.seq}&column=${map.column}&word=${map.word}">${dto.subject}</a>
					</c:if>
					
					<c:if test = "${dto.gap < 90}">
					<span class = "label label-danger">new</span>
					</c:if>
				</td>
				<td>${dto.name}</td>
				<td>${dto.regdate}</td>
				<td>${dto.readcount}</td>
			</tr>
			</c:forEach>
		</table>
		
		<div id = "search">
			<form method = "GET" class = "form-inline" action = "/mvc/board/list.do">
				<select name = "column" id = "column" class = "form-control">
					<option value = "subject">제목</option>
					<option value = "content">내용</option>
					<option value = "name">이름</option>
				</select>
				<input type = "text" name = "word" id = "word" class = "form-control">
				<input type = "submit" value = "검색하기" class = "btn btn-default">
			</form>
		</div>
		
		<div id = "btns">
			<input type = "button" value = "목록보기" class = "btn btn-default" onclick = "location.href='/mvc/board/list.do'">
			<input type = "button" value = "글쓰기" class = "btn btn-primary" onclick = "location.href='/mvc/board/add.do'">
		</div>
		
	</div>
</body>
</html>