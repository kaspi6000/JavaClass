package com.test.mvc.board;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/board/editok.do")
public class EditOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String path = req.getRealPath("/board/files");
		int size = 100 * 1024 * 1024;
		
		// editok.do == addok.do 유사
		
		// 비회원 접근 금지
		Check check = new Check();
		check.isauth(req, resp);
		
		// 1. 데이터 가져오기(subject, content, tag)
		// 2. DTO 생성 + 데이터 추가
		// 3. DAO 위임(update)
		// 4. 결과 반환 + JSP 호출하기
		
		try {
			
			// req -> (역할교체) -> multi
			MultipartRequest multi = new MultipartRequest(
					req,
					path, 		// 업로드 폴더 지정
					size,		// 파일 최대 크기
					"UTF-8",	// getParameter() 인코딩방식
					new DefaultFileRenamePolicy() // 파일명 관리
					); // 첨부 파일 업로드 완료
		
			// 1.
			req.setCharacterEncoding("UTF-8");
			
			String seq = multi.getParameter("seq");
			String subject = multi.getParameter("subject");
			String content = multi.getParameter("content");
			String tag = multi.getParameter("tag");
			
			BoardDAO dao = new BoardDAO();
			
			// 2.
			BoardDTO dto = new BoardDTO();
			
			String delfile = multi.getParameter("delfile");
			// 첨부파일 삭제 작업(물리 + DB)
			
			BoardDTO temp = dao.get(seq);
			String filename = "";
			String orgfilename = "";
			
			if(delfile.equals("y")) {
				
				File file = new File(path + "\\" + temp.getFilename());
				file.delete();
				
				filename = "";
				orgfilename = "";
				
				// dao.updateFileName(seq);
			} else if (delfile.equals("y")) {
				filename = multi.getFilesystemName("attach");
				orgfilename = multi.getOriginalFileName("attach");
			}
			
			// 첨부 파일명 얻기
			// String filename = multi.getFilesystemName("attach");	// 물리명
			// String orgfilename = multi.getOriginalFileName("attach");	// 원본명
			
			dto.setFilename(filename);
			dto.setOrgfilename(orgfilename);
			
			dto.setSeq(seq);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setTag(tag);
			dto.setId((String)req.getSession().getAttribute("auth"));
			
			// 3.
			
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
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/board/editok.jsp");
		dispatcher.forward(req, resp);
	}
}
