package com.test.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex05data.do")
public class Ex05Data extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		AjaxDAO dao = new AjaxDAO();
		
		String seq = "1";
		ResearchDTO dto = dao.getResearch(seq);
		
		// ajax 객체에게 반환
		// 제목, 항목 1~4, 카운트 1~4
		// -> 구조 필요(스키마)
		// 	1. 텍스트(, )
		// 	2. XML
		// 	3. JSON
		
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		writer.printf("%s,", dto.getQuestion());
		writer.printf("%s,", dto.getAnswer1());
		writer.printf("%s,", dto.getAnswer2());
		writer.printf("%s,", dto.getAnswer3());
		writer.printf("%s,", dto.getAnswer4());
		writer.printf("%s,", dto.getCnt1());
		writer.printf("%s,", dto.getCnt2());
		writer.printf("%s,", dto.getCnt3());
		writer.printf("%s,", dto.getCnt4());
		
		writer.close();
	}
}
