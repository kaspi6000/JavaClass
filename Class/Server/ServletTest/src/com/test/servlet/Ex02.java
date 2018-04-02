package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex02 extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		
		
		//3. 메소드 내부 구현
		// - 동적 HTML 작성하는 업무를 구현
		PrintWriter writer = res.getWriter();
		
//		writer.print();
//		writer.println(x);
//		writer.printf(format, args);
		
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<title>5단</title>");
		writer.println("</head>");
		writer.println("<body>");
		
		for (int i = 1; i <= 9; i++) {
			writer.printf("<div>5 X %d = %d", i, 5*i);
		}
		
		writer.println("</body>");
		writer.println("</html>");
		
		writer.close();
		
		System.out.println("doGet() 호출");
	}
	
	@Override
	public void init() throws ServletException {
		
		super.init();
		System.out.println("init() 호출");
	}
	
	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException {
		
		System.out.println("service() 호출 전");
		super.service(arg0, arg1);
		System.out.println("service() 호출 후");
	}
}
