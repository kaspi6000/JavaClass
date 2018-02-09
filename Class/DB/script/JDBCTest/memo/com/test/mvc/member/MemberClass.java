package com.test.mvc.member;

import java.util.Scanner;

import com.test.mvc.member.auth.Auth;
import com.test.mvc.member.model.MemberDAO;
import com.test.mvc.member.model.MemberDTO;
import com.test.mvc.member.view.MemberView;

public class MemberClass {

	private MemberDAO dao;
	private MemberView view;
	private Auth auth;
	private Scanner scan;
	
	public MemberClass() {
		
		dao = new MemberDAO();
		view = new MemberView();
		auth = new Auth();
		scan = new Scanner(System.in);
	}

	public void start() {
		
		boolean loop = true;
		
		while (loop) {
			
			view.menu();
			int sel = scan.nextInt();
			scan.skip("\r\n");
			switch (sel) {
			case 1:
				if(!Auth.isAuth)
					add();
				break;
			case 2:
				if(Auth.isAuth)
					del();
				break;
			case 3:
				if(!Auth.isAuth)
					auth.login();
				break;
			case 4:
				if(Auth.isAuth)
					auth.logout();
				break;
			default: loop = false;
				break;
			}
		}
	}

	private void add() {
		
		view.header("회원 가입");
		
		System.out.print("이름 : ");
		String name = scan.nextLine();
		
		System.out.print("비밀번호 : ");
		String pw = scan.nextLine();
		
		System.out.print("나이 : ");
		String age = scan.nextLine();
		
		System.out.print("번호 : ");
		String tel = scan.nextLine();
		
		System.out.print("이메일 : ");
		String email = scan.nextLine();
		
		//데이터 확보 -> MemberDAO에게 위임 DB INSERT
		//dao.add(name, age, tel, email, pw);
		
		MemberDTO dto = new MemberDTO();
		
		dto.setAge(age);
		dto.setEmail(email);
		dto.setName(name);
		dto.setPw(pw);
		dto.setTel(tel);
		
		if (dao.add(dto) == 1) {
			view.result("성공했습니다.");
		} else {
			view.result("실패했습니다.");
		}
	}

	private void del() {
		
		//회원 탈퇴
		//1. DELETE
		//	a. tbl_memo -> 게시물 삭제
		//	b. tbl_member -> 회원 삭제
		//2. UPDATE
		//	a. tbl_member -> 회원 삭제 상태로 변경
		System.out.println("[회원 탈퇴]");
		
		System.out.print("**탈퇴를 하면 작성하신 모든 게시물이 사라집니다. 계속 진행하시겠습니까?(yes|no) : ");
		if (scan.nextLine().equals("yes")) {
			
			if (dao.del(Auth.mseq) == 1) {
				System.out.println("**탈퇴 성공");
				Auth.isAuth = false;
			} else {
				System.out.println("**탈퇴 실패");
			}
		} else {
			System.out.println("**탈퇴 취소");
		}
	}
}
