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
	#tbl1 th {
		width: 150px;
		text-align: right;
		vertical-align: middle;
	}
	
	#tbl1 td {
		width: 750px;
		padding-right: 50px;
	}
	
	#tbl1 #content {
		height: 450px;
	}
</style>
<script>
	$(() => {
		/* $("#subject").val("${dto.subject}");
		$("#content").val("${dto.content}"); */
	})
	
	function delfile() {
		// 첨부 파일 삭제
		// $(event.srcElement).hide();
		if ($(event.srcElement).css("opacity") == "1"){
			$(event.srcElement).css({
				"opacity": ".4",
				"text-decoration": "line-through"
			});
			$("#delfile").val("y"); // 첨부파일 삭제O
		} else {
			$(event.srcElement).css({
				"opacity": "1",
				"text-decoration": "none"
			});
			$("#delfile").val("n"); // 첨부파일 삭제X
		}
		console.log($("#delfile").val());
	}
</script>
</head>
<body>
	<!--  -->
	<div class="container">
	
	<jsp:include page="/inc/header.jsp"></jsp:include>
	
	
	<h2 class = "page-header">게시판 <small>수정하기</small></h2>
	
		<form method = "POST" action = "/mvc/board/editok.do" enctype = "multipart/form-data">
			<table id = "tbl1" class = "table table-striped">
				<tr>
					<th>제목</th>
					<td><input type = "text" name = "subject" id = "subject" class = "form-control" value = "${dto.subject}" required></td>
				</tr>
				
				<tr>
					<th>내용</th>
					<td>
						<textarea name = "content" id = "content" class = "form-control" required>${dto.content}</textarea>
					</td>
				</tr>
				
				<tr>
					<th>태그</th>
					<td>
						<select name = "tag" id = "tag" class = "form-control short">
							<option value = "n" <c:if test = "${dto.tag == 'n'}">selected</c:if>>적용안함</option>
							<option value = "y" <c:if test = "${dto.tag == 'y'}">selected</c:if>>적용함</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<th>파일</th>
					<td class = "form-inline">
						<input type = "file" name = "attach" class = "form-control middle">
						<code style = "cursor: pointer;" title = "파일을 삭제합니다." onclick = "delfile();">${dto.orgfilename} &times;</code>
					</td>
				</tr>
			</table>
			
			<div id = "btns">
				<input type = "button" value = "뒤로가기" class = "btn btn-default" onclick = "history.back()">
				<input type = "submit" value = "수정하기" class = "btn btn-primary">
			</div>
			
			<input type = "hidden" name = "seq" value = "${dto.seq}">
			<input type = "hidden" name = "delfile" id = "delfile" value = "n">
		</form>
		
	</div>
</body>
</html>