<%@page import="java.lang.reflect.Array"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// 파일경로
String path = application.getRealPath("files");

// 최대크기(100MB)
int size = 100 * 1024 * 1024;

// 변수
String subject = "";
String name = "";

List<String> filename = new ArrayList<String>();
List<String> orgfilename = new ArrayList<String>();

try {
	
	MultipartRequest mreq = new MultipartRequest(
			request,
			path,
			size,
			"UTF-8",
			new DefaultFileRenamePolicy()
			); // 멀티 파일 업로드 완료
			
	subject = mreq.getParameter("subject");
	name = mreq.getParameter("name");
	
	// 첨부 파일들의 이름들 가져오기
	Enumeration e = mreq.getFileNames();
	
	while(e.hasMoreElements()) {
		String attachname = (String)e.nextElement();
		// System.out.println(attachname);
		
		String temp = mreq.getFilesystemName(attachname);
		String orgtemp = mreq.getOriginalFileName(attachname);
		
		// System.out.println(temp);
		// System.out.println("org : " + orgtemp);
		
		if(temp != null) { // 첨부 파일을 선택했다면
			filename.add(temp);
			orgfilename.add(orgtemp);
		}
	}
} catch(Exception e) {
	e.printStackTrace();
}
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
		
	});
</script>
</head>
<body>
	<h1>결과</h1>
	
	<div>제목 : <%= subject %></div>
	<div>이름 : <%= name %></div>
	<div>
		<% 
		for(int i = 0; i<filename.size(); i++) { 
		%>
		<div>
			<%= filename.get(i) %> / 
			<%= orgfilename.get(i) %> / 
			<a href = "download.jsp?file=<%= filename.get(i) %>&orgfile=<%= orgfilename.get(i) %>"><%= orgfilename.get(i) %></a>
		</div>
		<% } %>
	</div>
</body>
</html>