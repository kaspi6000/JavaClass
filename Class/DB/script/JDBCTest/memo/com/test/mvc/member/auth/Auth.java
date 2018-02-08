package com.test.mvc.member.auth;

import java.util.Scanner;

import com.test.mvc.member.model.MemberDAO;
import com.test.mvc.member.model.MemberDTO;

public class Auth {
	
	private MemberDAO dao;
	public static boolean isAuth = false;
	
	public Auth() {
		dao = new MemberDAO();
	}

	//MemberClass
	public void login() {
		
		Scanner scan = new Scanner(System.in);
		
		System.out.println("[회원 로그인]");
		
		System.out.print("이메일 : ");
		String email = scan.nextLine();
		
		System.out.print("비밀번호 : ");
		String pw = scan.nextLine();
		
		MemberDTO dto = new MemberDTO();
		dto.setEmail(email);
		dto.setPw(pw);
		
		if(dao.auth(dto) == 1) {

			//성공
			Auth.isAuth = true;
			System.out.println("**로그인 성공.");
		} else {
			
			//실패
			Auth.isAuth = false;
			System.out.println("**로그인 실패.");
		}
	}

	public void logout() {
		
		
	}

}
