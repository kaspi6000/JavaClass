package com.test.mvc.member.view;

import com.test.mvc.member.auth.Auth;

public class MemberView {

	public void menu() {
		
		System.out.println("======================");
		System.out.println("회원");
		System.out.println("======================");
		if (!Auth.isAuth) System.out.println("1. 회원 가입");
		if (Auth.isAuth) System.out.println("2. 회원 탈퇴");
		if (!Auth.isAuth) System.out.println("3. 로그인");
		if (Auth.isAuth) System.out.println("4. 로그아웃");
		System.out.println("5. 상위 메뉴로 이동");
		System.out.print("선택 : ");
	}

	public void header(String text) {
		
		System.out.printf("[%s]\n", text);
	}

	public void result(String text) {
		
		System.out.printf("**%s\n", text);
	}

}
