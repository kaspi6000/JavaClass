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
		<%
		// String title = "Home";
		%>
		<%-- <%@ include file = "inc/header.jsp" %> --%>
		<jsp:include page = "inc/header.jsp">
			<jsp:param value = "0" name = "mode"/>
		</jsp:include>
		
		
		<!-- ((p.lead>lorem)+(p>lorem100))*3 -->
	</div>
</body>
</html>