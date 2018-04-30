package com.test.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

@WebServlet("/ex13data.do")
public class Ex13Data extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("id");
		String left = req.getParameter("left");
		String top = req.getParameter("top");
		
		/*System.out.println(id);
		System.out.println(left);
		System.out.println(top);*/
		
		// cat1의 레코드가 있는지?
		// - 없으면 insert
		// - 있으면 update
		
		CatDTO dto = new CatDTO();
		dto.setId(id);
		dto.setLeft(left);
		dto.setTop(top);
		
		AjaxDAO dao = new AjaxDAO();
		int result = -1;
		
		if(dao.check(id)) {
			
			result = dao.updatePosition(dto);
		} else {
			
			result = dao.insertPosition(dto);
		}
		
		resp.setHeader("Content-type", "application/json");
		resp.setCharacterEncoding("UTF-8");
		
		JSONObject obj = new JSONObject();
		obj.put("result", result);
		
		resp.getWriter().print(obj);
		resp.getWriter().close();
	}
}
