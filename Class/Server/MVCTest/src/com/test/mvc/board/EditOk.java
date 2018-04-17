package com.test.mvc.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/editok.do")
public class EditOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// editok.do == addok.do 유사
		
		// 비회원 접근 금지
		Check check = new Check();
		check.isauth(req, resp);
		
		// 1. 데이터 가져오기(subject, content, tag)
		// 2. DTO 생성 + 데이터 추가
		// 3. DAO 위임(update)
		// 4. 결과 반환 + JSP 호출하기
		
		// 1.
		req.setCharacterEncoding("UTF-8");
		
		String seq = req.getParameter("seq");
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		String tag = req.getParameter("tag");
		
		// 2.
		BoardDTO dto = new BoardDTO();
		
		dto.setSeq(seq);
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setTag(tag);
		dto.setId((String)req.getSession().getAttribute("auth"));
		
		// 3.
		BoardDAO dao = new BoardDAO();
		
		int result = -1;
		
		BoardDTO dto2 = dao.get(seq);
		
		if(dto2.getId().equals((String)req.getSession().getAttribute("auth"))) {
			result = dao.edit(dto);
		} else {
			result = 2;
		}
		
		// 4.
		req.setAttribute("result", result);
		req.setAttribute("seq", seq);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/board/editok.jsp");
		dispatcher.forward(req, resp);
	}
}
