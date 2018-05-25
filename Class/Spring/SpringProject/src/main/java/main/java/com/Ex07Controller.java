package main.java.com;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Ex07Controller {

	@RequestMapping(value="/ex07")
	public String ex07() {
		
		return "ex07";
	}
	
	@RequestMapping(value="/ex07ok")
	public String ex07Ok(HttpServletRequest req/*, String name, String age, String address, String tel*/, Ex07DTO dto) {
		
		// 업무
		// 1. 데이터 가져오기
		// 2. DTO 포장
		// 3. DAO 호출 + DTO 전달
		
		Ex07DAO dao = new Ex07DAO();
		
		// 방법1. 기존 방식
		/*String name = req.getParameter("name");
		String age = req.getParameter("age");
		String address = req.getParameter("address");
		String tel = req.getParameter("tel");
		
		Ex07DTO dto = new Ex07DTO();
		
		dto.setName(name);
		dto.setAge(age);
		dto.setAddress(address);
		dto.setTel(tel);
		
		dao.add(dto);*/
		
		// 방법2. 매개변수 사용
		/*Ex07DTO dto = new Ex07DTO();
		
		dto.setName(name);
		dto.setAge(age);
		dto.setAddress(address);
		dto.setTel(tel);
		
		dao.add(dto);*/
		
		// 방법3. DTO 사용
		dao.add(dto);
		
		return "ex07ok";
	}
}
