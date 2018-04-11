<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(session.getAttribute("auth") == null) {
%>
<script>
	location.href = "index.jsp";
	alert("회원만 접근 가능합니다.");
</script>
<%
}
%>