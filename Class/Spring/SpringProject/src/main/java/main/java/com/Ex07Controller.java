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
		
		// ����
		// 1. ������ ��������
		// 2. DTO ����
		// 3. DAO ȣ�� + DTO ����
		
		Ex07DAO dao = new Ex07DAO();
		
		// ���1. ���� ���
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
		
		// ���2. �Ű����� ���
		/*Ex07DTO dto = new Ex07DTO();
		
		dto.setName(name);
		dto.setAge(age);
		dto.setAddress(address);
		dto.setTel(tel);
		
		dao.add(dto);*/
		
		// ���3. DTO ���
		dao.add(dto);
		
		return "ex07ok";
	}
}
