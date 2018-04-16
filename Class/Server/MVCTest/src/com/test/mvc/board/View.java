package com.test.mvc.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/view.do")
public class View extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// view.do?seq=1
		// 1. 데이터 가져오기(seq)
		// 2. DAO 위임(select)
		// 3. 결과 반환(dto) + 전달 + JSP 호출하기
		
		// 1.
		String seq = req.getParameter("seq");
		HttpSession session = req.getSession();
		
		// 2.
		BoardDAO dao = new BoardDAO();		
		BoardDTO dto = dao.get(seq);
		
		// 2.4 존재하지 않는 게시물일 경우 예외 처리
		
		/*System.out.println("resp : " + resp.getStatus());
		resp.setStatus(500, "잘못된 페이지 입니다.");
		System.out.println("req : " + req.hashCode());*/
		
		if(dto == null || dto.getSubject() == null) {
			
			resp.setCharacterEncoding("UTF-8");
			resp.getWriter().println("<html><head><meta charset='UTF-8'><script>alert('게시물이 존재하지 않습니다.'); location.href='/mvc/index.do';</script></head></html>");
			resp.getWriter().close();
			
			return;
		}
		
		// 2.2 조회수 증가하기
		if(session.getAttribute("read") != null && session.getAttribute("read").toString().equals("n")) {
			
			dao.updateReadCount(seq);
			int readcount = dto.getReadcount();
			dto.setReadcount(readcount + 1);
			session.setAttribute("read", "y");
		}
		
		// 2.5 데이터 가공
		String content = dto.getContent();
		String subject = dto.getSubject();
		
		// a. <style>, <script> 무조건 적용 안함
		content = content.replace("<script", "&lt;script").replace("<style", "&lt;style").replace("</script", "&lt;/script").replace("</style", "&lt;/style");
		dto.setContent(content);
		
		subject = dto.getSubject().replace("<", "&lt;").replace(">", "&gt;");
		dto.setSubject(subject);
		
		// a. 태그 적용 유무
		if (dto.getTag().equals("n")) {	
			
			content = content.replace("<", "&lt;").replace(">", "&gt;");
			
			dto.setContent(content);
		}
		
		// b. 글 내용에 개행문자 처리
		content = content.replace("\n", "<br>");
		dto.setContent(content);
		
		// 3.
		req.setAttribute("dto", dto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/board/view.jsp");
		dispatcher.forward(req, resp);
	}
}
