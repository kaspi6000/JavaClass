package main.java.com;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

// �ټ��� ���� ���� -> 1���� ��Ʈ�ѷ�
@Controller
public class BoardController {

	// ���� ����
	// private BoardDAO dao;
	
	@RequestMapping(value = "/board/add.action", method = {RequestMethod.GET})
	public String add() {
		
		return "board/add"; //"WEB-INF/views/board/add.jsp"
	}
	
	@RequestMapping(value = "/board/addok.action", method = {RequestMethod.POST})
	public String addok() {
		
		// DB �۾�
		
		return "board/addok"; //"WEB-INF/views/board/add.jsp"
	}
	
	@RequestMapping(value = "/board/list.action", method = {RequestMethod.GET})
	public String list() {
		
		return "board/list"; //"WEB-INF/views/board/add.jsp"
	}
	
	@RequestMapping(value = "/board/view.action", method = {RequestMethod.GET})
	public String view() {
		
		return "board/view"; //"WEB-INF/views/board/add.jsp"
	}
}
