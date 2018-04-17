package com.test.mvc.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/edit.do")
public class Edit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 1. 데이터 가져오기
		// 2. DAO위임(select) - 글의 원본 내용을 가져오기
		// 3. 결과 반환(dto) + JSP 호출하기
		
		// 1.
		String seq = req.getParameter("seq");
		
		// 2.
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = dao.get(seq);
		
		dto.setSubject(dto.getSubject().replace("\"", "&quot;"));
		
		// 3.
		req.setAttribute("dto", dto);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/board/edit.jsp");
		dispatcher.forward(req, resp);
	}
}
