<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
//사용자가 입력한 데이터를 받는 구문

request.setCharacterEncoding("UTF-8");

String name = request.getParameter("name");//<input name="name">
String age = request.getParameter("age");//<intput name="age">



%>

        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                    <title>Insert title here</title>
            </head>
            <body>

                <h1>결과</h1>
                입력하신 이름은 '<%=name %>'이고, 나이는
                <%=age%>세 입니다.

            </body>
        </html>
