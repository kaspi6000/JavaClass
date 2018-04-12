<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file = "inc/asset.jsp" %>
<style>

</style>
<script>
	$(() => {
		
	});
</script>
</head>
<body>
	<div class = "container">
		<%-- <%
		String title = "Admin";
		String subtitle = "..";
		%>
		
		<%@ include file = "inc/header.jsp" %> --%>
		
		<jsp:include page = "inc/header.jsp">
			<jsp:param value = "2" name = "mode"/>
		</jsp:include>
		
		<!-- <h2 class = "page-header">Admin <small><i>..</i></small></h2> -->
		
		<h3>lorem3</h3>
		<p>lorem20</p>
		
		<!-- 미디어 오브젝트 : 이미지, 동영상 태그 배치(float) -->
		<div class = "media">
			<div class = "media-left">
				<img src = "images/job/job01.png" style = "width: 100px">
			</div>
			<div class = "media-body">
				<h4 class = "media-heading">Adminstrator <small><i>hong@gmail.com</i></small></h4>
				p>lorem100
			</div>
			
			<hr>
			
			<div class = "media-left">
				<img src = "images/job/job02.png" style = "width: 100px">
			</div>
			<div class = "media-body">
				<h4 class = "media-heading">System Engineer <small><i>syslee@gmail.com</i></small></h4>
				p>lorem100
			</div>
			
			<hr>
			
			<div class = "media-left">
				<img src = "images/job/job03.png" style = "width: 100px">
			</div>
			<div class = "media-body">
				<h4 class = "media-heading">Software Architect <small><i>test@gmail.com</i></small></h4>
				p>lorem100
			</div>
		</div>
	</div>
</body>
</html>