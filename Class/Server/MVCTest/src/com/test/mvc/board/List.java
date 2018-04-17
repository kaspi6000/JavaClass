package com.test.mvc.board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// @XXX : annotation(프로그래밍 기능 주석)
@WebServlet("/board/list.do")
public class List extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		process(req, resp);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		process(req, resp);
	}

	private void process(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		// 페이징 사전 작업
		int nowPage = 0;	// 현재 페이지 번호
		int totalCount = 0;	// DB 총 게시물 수
		int pageSize = 5;	// 한페이지에서 보여줄 게시물 수
		int totalPage = 0;	// 총 페이지 수
		int start = 0;		// 쿼리의 조건절 rnum >= start
		int end = 0;		// rnum <= end
		
		int n = 0;
		int loop = 0;
		int blockSize = 10;
		
		// list.do -> list.do?page=1
		// list.do?page=2
		String page = req.getParameter("page");
		
		if(page == null) {
			nowPage = 1;
		} else {
			nowPage = Integer.parseInt(page);
		}
		
		// nowPage : 현재 보고 싶은 페이지
		// 1 > where rnum >= 1 and rnum <= 5
		// 2 > where rnum >= 6 and rnum <= 10
		// 3 > where rnum >= 11 and rnum <= 15
		
		start = ((nowPage - 1) * pageSize) + 1;
		end = start + pageSize - 1;
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("start", start + "");
		map.put("end", end + "");
		
		// 그냥 목록보기
		// - list.do
		// 검색결과 목록보기
		// - list.do + column + word
		req.setCharacterEncoding("UTF-8");
		
		boolean isSearch = false;
		String column = req.getParameter("column");
		String word = req.getParameter("word");
		
		if(column != null && word != null) {
			isSearch = true;
		}
		
		// System.out.println(isSearch);
		
		// 비회원 접근 금지
		Check check = new Check();
		check.isauth(req, resp);
		
		// 읽음 표시에 사용할 세션 저장
		HttpSession session = req.getSession();
		session.setAttribute("read", "n");
		
		// 1. DAO 위임(select)
		// 2. 결과 전달 + JSP
		
		// 1.
		BoardDAO dao = new BoardDAO();
		
		// 임시 상자
		
		map.put("isSearch", isSearch + "");
		map.put("column", column);
		map.put("word", word);
		
		// 총 페이지 수 계산하기
		totalCount = dao.getTotalCount(map); // 총 게시물 수
		
		// 16 / 5 -> 3.2 -> 4페이지
		totalPage = (int)Math.ceil((double)totalCount / pageSize);		
		
		ArrayList<BoardDTO> list = dao.list(map); // isSearch, column, word
		
		// 1.5 데이터 가공
		for (BoardDTO dto : list) {
			
			// c. 최근에 쓴글인지? - 1시간 이내
			// 현재 시각 - 글쓴 시각 = 차이가 1시간 이내?
			
			/*Calendar calendar = Calendar.getInstance();
			System.out.println(calendar.get(Calendar.HOUR));
			String regdate = dto.getRegdate();
			System.out.println(regdate);
			System.out.println(regdate.substring(12, 13));*/
			
			// a. 날짜 포맷 설정
			// - 오늘 쓴 글 : 시분초
			// - 어제 이전 쓴 글 : 년월일
			Calendar now = Calendar.getInstance();
			String temp = String.format("%tF", now); // 2018-04-16
			
			if(dto.getRegdate().startsWith(temp)) {
				// 오늘 쓴 글 : 시분초
				dto.setRegdate(dto.getRegdate().substring(10, dto.getRegdate().length() - 2));
			} else {
				// 어제 이전 쓴 글: 년월일
				dto.setRegdate(dto.getRegdate().substring(0, 10)); // 덮어쓰기
			}
			
			// b. 제목이 길면 자르기
			String subject = dto.getSubject();
			
			subject = dto.getSubject().replace("<", "&lt;").replace(">", "&gt;");
			dto.setSubject(subject);
			
			if(subject.length() > 30) {
				subject = subject.substring(0, 30) + "...";
				dto.setSubject(subject);
			}
			
			// e. 제목을 검색 > 검색어를 표시
			if(isSearch && column.equals("subject")) {
				subject = dto.getSubject();
				
				// 게시판 테스트입니다.
				// 게시판 <span style = "">테스트</span>입니다.
				subject = subject.replace(word, "<span style = 'background-color: yellow; color: red;'>" + word + "</span>");
				dto.setSubject(subject);
			}
			
		}
		
		// 2.
		req.setAttribute("list", list);
		
		// 검색중이라면
		req.setAttribute("map", map); // isSearch, cloumn, word
		
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("nowPage", nowPage);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/board/list.jsp");
		dispatcher.forward(req, resp);
	}
}
