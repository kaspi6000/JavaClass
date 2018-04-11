<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id = "header">
	<ul>
		<li><a href = "#">Home</a></li>
		<li><a href = "/JSPTest/auth/login.jsp">Auth</a></li>
		<li><a href = "/JSPTest/code/index.jsp">Code</a></li>
		<li>
			<% if (session.getAttribute("auth") == null) { %>
			Guest
			<% } else { %>
			<%= session.getAttribute("name") %>(<%= session.getAttribute("auth") %>)
			<% } %>
		</li>
	</ul>
</div>