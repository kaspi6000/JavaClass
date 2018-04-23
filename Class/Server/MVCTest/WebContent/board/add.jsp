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

	var key;

	function handleAdd() {
		
		// 업무
		$("#movie").val(key);
		$("#movieKey").text(key);
		
		// 창 닫기
		$("#myModal").modal("hide");
	}
	
	function previewMovie() {
		
		var url = $("#movieUrl").val();
		
		key = url.substring(url.lastIndexOf("/") + 1);
		// console.log(key);
		
		$("#preview").html("<iframe width='420' height='380' src='https://www.youtube.com/embed/" + key + "?autoplay=1&loop=1' frameborder='0' allow='autoplay; encrypted-media' allowfullscreen></iframe>");
	}
	
	function handleClose() {
		
		// 동영상 없애기
		$("#preview").html("");
		$("#movieUrl").val("");
		
		$("#myModal").modal("hide");
	}
</script>
</head>
<body>
	<!--  -->
	<div class="container">
	
	<jsp:include page="/inc/header.jsp"></jsp:include>
	
	
	<h2 class = "page-header">게시판 <small>글쓰기</small></h2>
	
		<form method = "POST" action = "/mvc/board/addok.do" enctype = "multipart/form-data">
			<table id = "tbl1" class = "table table-striped">
			
				<c:if test = "${lv > 1 && mode == 'new'}">
				<tr>
					<th>공지</th>
					<td><input type = "checkbox" name = "notice" id = "notice"> <label for = "notice" style = "font-weight: normal;">공지글입니다.</label></td>
				</tr>
				</c:if>
				
				<tr>
					<th>제목</th>
					<td><input type = "text" name = "subject" id = "subject" class = "form-control" required></td>
				</tr>
				
				<tr>
					<th>내용</th>
					<td>
						<textarea name = "content" id = "content" class = "form-control" required></textarea>
					</td>
				</tr>
				
				<tr>
					<th>태그</th>
					<td>
						<select name = "tag" id = "tag" class = "form-control short">
							<option value = "n">적용안함</option>
							<option value = "y">적용함</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<th>비밀글</th>
					<td>
						<input type = "checkbox" name = "secret" id = "secret">
						<label for = "secret" style = "font-weight: normal;">관리자만 볼 수 있습니다.</label>
					</td>
				</tr>
				
				<tr>
					<th>파일</th>
					<td><input type = "file" name = "attach" class = "form-control middle"></td>
				</tr>
				
				<tr>
					<th>동영상</th>
					<td>
						<button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">
  							동영상을 선택하세요.
  							<span class = "" id = "movieKey"></span>
						</button>
					</td>
				</tr>
				
				<tr>
					<th>해시태그</th>
					<td><input type = "text" name = "hashtag" id = "hashtag" class = "form-control"></td>
				</tr>
			</table>
			
			<div id = "btns">
				<input type = "button" value = "뒤로가기" class = "btn btn-default" onclick = "history.back()">
				<input type = "submit" value = "글쓰기" class = "btn btn-primary">
			</div>
			
			<input type = "hidden" name = "mode" value = "${mode}">
			<input type = "hidden" name = "thread" value = "${thread}">
			<input type = "hidden" name = "depth" value = "${depth}">
			<input type = "hidden" name = "movie" id = "movie">
		</form>
		
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
		  		<div class="modal-content">
		  		
		      		<div class="modal-header">
		        		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        		<h4 class="modal-title" id="myModalLabel">동영상 선택</h4>
		      		</div>
		      		
		      		<div class="modal-body">
		      		
		        		<table class = "table table-striped">
		        			<tr>
		        				<th>유투브 URL</th>
		        				<td class = "form-inline">
		        					<input type = "text" class = "form-control" style = "width: 350px;" value = "" id = "movieUrl">
		        					<input type = "button" value = "가져오기" class = "btn btn-default" onclick = "previewMovie()">
		        				</td>
		        			</tr>
		        			
		        			<tr>
		        				<th>미리보기</th>
		        				<td id = "preview"></td>
		        			</tr>
		        		</table>
		      		</div>
		      		
		      		<div class="modal-footer">
		        		<button type="button" class="btn btn-default" data-dismiss="modal" onclick = "handleClose()">닫기</button>
		        		<button type="button" class="btn btn-primary" onclick = "handleAdd()">추가하기</button>
		      		</div>
		    	</div>
		  	</div>
		</div>
		
	</div>
</body>
</html>