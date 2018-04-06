<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
session.setMaxInactiveInterval(30);

response.sendRedirect("ex26_session.jsp");
%>