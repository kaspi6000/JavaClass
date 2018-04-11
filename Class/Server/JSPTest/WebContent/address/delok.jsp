<%@page import="com.test.jsp.DBUtil"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// 1. 데이터 가져오기
// 2. DB 연결 + delete 작업 // JDBC
// 3. 결과 출력

// 1.

String seq = request.getParameter("seq");

// 2.
Connection conn = null;
PreparedStatement stat = null;

int result;

try {
	
conn = DBUtil.open(); // DB 접속

String sql = "DELETE FROM tbladdress WHERE seq = " + seq;

stat = conn.prepareStatement(sql);

result = stat.executeUpdate(); // 결과 (1,0)

stat.close();
conn.close();
} catch (Exception e) {
	result = 0;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록</title>
<%@ include file="inc/asset.jsp" %>
<style>

</style>
<script>
	$(() => {
		<%-- <% if(result == 1) { %>
		alert("등록 완료");
		location.href = "list.jsp";
		<% } else { %>
		alert("등록 실패");
		// location.href = "add.jsp";
		history.back();
		<% } %> --%>
	});
</script>
</head>
<body>
	<div id = "main">
		<%@ include file="inc/header.jsp" %>
		<section id = "section">
			<div class = "panel panel-default">
				<div class = "panel-heading">결과</div>
				
				<div class = "panel-body">
					<% if(result == 1) { %>
					<div>삭제가 완료되었습니다.</div>
					<div><a href="list.jsp">목록으로 이동하기</a></div>
					<% } else { %>
					<div>삭제를 실패했습니다.</div>
					<div><a href="#" onclick = "history.back()">이전 페이지로 돌아가기</a></div>
					<% } %>
				</div>
			</div>
		</section>
		<%@ include file="inc/footer.jsp" %>
	</div>
</body>
</html>