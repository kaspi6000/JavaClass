package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//1. 서블릿 클래스 선언
//a. javax.servlet.Servlet 인터페이스를 구현해야 된다.(상속)
//	- 복잡함. 모든 내용을 직접 구현
//b. javax.servlet.http.HttpServlet 클래스를 상속받아야 한다.(상속)
//	- 간편함. 대부분의 코드를 미리 구현해놨기 때문

public class Ex01 extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		
		
		//3. 메소드 내부 구현
		// - 동적 HTML 작성하는 업무를 구현
		PrintWriter writer = res.getWriter();
		
//		writer.print();
//		writer.println(x);
//		writer.printf(format, args);
		
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<title>Hello Page</title>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<h1>HELLO</h1>");
		writer.println("<p>Servlet Page</p>");
		
		Calendar c = Calendar.getInstance();
		writer.printf("%tF %tT", c, c);
		
		writer.println("</body>");
		writer.println("</html>");
		
		writer.close(); // 동적으로 HTML 페이지 작성 완료
		
		//http://localhost:8082/ServletTest/servlet/com.test.servlet.Ex01
		// - 브라우저가 서버를 통해서 클래스를 호출 -> 클래스는 웹 기반 요소가 아니다. -> 웹을 통해서 클래스를 접근 가능한 가상 주소를 미리 생성 -> 가상 호출
	}
}
