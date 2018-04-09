<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// 첨부파일 처리 -> 웹작업(X) -> 로컬작업(O)
// : 웹경로 사용(X) -> 파일경로 사용(O)
// : "./files"  -> ".\files"
// : "/WebContent/files" -> "D:\Class\JSPTest\WebContent\files"

// 첨부파일을 저장할 경로
// String path = "./files";

// 웹 경로 표현 -> 파일(로컬) 경로 표현
String path = application.getRealPath("./files");
System.out.println(path);

// 준비 작업
// - 업로드 파일의 최대 크기
// - 가능한 작게
// - 바이트 단위
// - 100MB
int size = 100 * 1024 * 1024;

// 변수
String subject = "";	// 제목
String name = "";		// 이름
String filename = "";	// 첨부파일명
String orgfilename = "";// 첨부파일명

// <form enctype = "multipart/form-data"> 설정되어 있으면 requset.getParameter 가 동작하지 않는다.
// subject = request.getParameter("subject");
// System.out.println(subject);

try {
	
	// request -> MultipartRequest 사용(cos.jar)
	MultipartRequest mreq = new MultipartRequest(
			request, // 기존 request 객체
			path, // 업로드 경로
			size, // 최대 업로드 크기
			"UTF-8", // 인코딩
			new DefaultFileRenamePolicy()
			); // 업로드 작업 완료(**)
	
	// 일반 데이터(텍스트 데이터)
	subject = mreq.getParameter("subject");
	name = mreq.getParameter("name");
	
	// 첨부 파일
	// -> 첨부된 파일이 뭔지?? -> 첨부 파일명을 확인
			
	// <input type = "file"> 의 이름들을 반환
	// Enumeration e = mreq.getFileNames();
	
	/* while(e.hasMoreElements()) {
		System.out.println(e.nextElement());
	} */
	
	// 첨부파일명을 반환
	filename = mreq.getFilesystemName("attach"); // 첨부파일 컨트롤의 이름
	System.out.println(filename); // w6.jpg
	
	orgfilename = mreq.getOriginalFileName("attach");
	System.out.println("org : " + orgfilename); // w.jpg
	
	// 제목, 이름 -> DB에 저장
	// 첨부파일 -> DB에 저장 ? -> 첨부파일명 -> DB에 저장(O)
	
} catch(Exception e) {
	
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
	<div>파일명(서버측에 저장된 실제이름) : <%= filename %></div>
	<div>파일명(유저가 기억하는 이름) : <%= orgfilename %></div>
	
	<% if(filename.endsWith(".png") || filename.endsWith(".jpg") || filename.endsWith(".gif")) { %>
	<img src = "files/<%= filename %>">
	<% } %>
	
	<hr>
	<div>다운로드 : <a href = "files/<%= filename %>"><%= orgfilename %></a></div>
	
	<div>다운로드 : <a href = "download.jsp?file=<%= filename %>&orgfile=<%= orgfilename %>"><%= orgfilename %></a></div>
</body>
</html>