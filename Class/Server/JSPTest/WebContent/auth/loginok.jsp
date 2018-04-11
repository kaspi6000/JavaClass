<%@page import="com.test.jsp.DBUtil"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// 1. 데이터 가져오기(id, pw)
// 2. DB 작업(select)
// 3. 결과에 따라 인증 처리

// 1.
String id = request.getParameter("id");
String pw = request.getParameter("pw");

Connection conn = null;
PreparedStatement stat = null;
ResultSet rs = null;
	
String sql = "SELECT * FROM tblMember WHERE id = ? and pw = ?";

conn = DBUtil.open();
stat = conn.prepareStatement(sql);


stat.setString(1, id);
stat.setString(2, pw);

rs = stat.executeQuery();

int result = 0;

if (rs.next()) {
	result = 1;
}

// 인증 처리
if (result == 1) {
	// 로그인 성공(**)
	
	// 인증 티켓 발급 -> 고유 식별자(id)
	session.setAttribute("auth", id);
	
	// 인증티켓 + 부가정보
	// select
	session.setAttribute("name", rs.getString("name"));
	session.setAttribute("lv", rs.getInt("lv"));
} else {
	// 로그인 실패
}

rs.close();
stat.close();
conn.close();
%>
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
		<% if (result == 1) { %>
		// alert("로그인 성공");
		// location.href = "index.jsp";
		location.href = "../code/index.jsp";
		<% } else { %>
		alert("아이디나 암호가 일치하지 않습니다.");
		history.back();
		<% } %>
	});
</script>
</head>
<body>
	
</body>
</html>