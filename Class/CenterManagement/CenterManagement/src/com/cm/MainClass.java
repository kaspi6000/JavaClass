package com.cm;

import java.util.Scanner;

import com.cm.auth.Auth;
import com.cm.controller.AdminController;
import com.cm.controller.StudentController;
import com.cm.controller.TeacherController;
import com.cm.model.dao.AuthDAO;
import com.cm.view.StudentView;

public class MainClass {

	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);
		AdminController ac = new AdminController();
		TeacherController tc = new TeacherController();
		StudentController sc = new StudentController();
		StudentView sview = new StudentView();
		AuthDAO dao = new AuthDAO();

		boolean loop = true;
		
		while (loop) {

			System.out.println("아이디 : ");
			String id = scan.nextLine();

			System.out.println("비밀번호 : ");
			String pw = scan.nextLine();
			
			if(Auth.check() == 1) {
				Auth.login(); //1: 교육생, 2: 강사, 3: 관리자
				
				if(Auth.isAuth == 1) {
					System.out.println("로그인에 성공했습니다.");
					Auth.isAuth = 1;
					System.out.printf("%s님 환영합니다. 교육생 계정입니다.", dao.getName());
					sview.login();
					sc.start();
					
				} else if(Auth.isAuth == 2) {
					System.out.println("로그인에 성공했습니다.");
					Auth.isAuth = 2;
					System.out.printf("%s님 환영합니다. 강사 계정입니다.", dao.getName());
					tc.start();
					
				} else if(Auth.isAuth == 3) {
					System.out.println("로그인에 성공했습니다.");
					Auth.isAuth = 3;
					System.out.printf("%s님 환영합니다. 관리자 계정입니다.", dao.getName());
					ac.start();
				} else {
					System.out.println("로그인 오류");
				}
				
			} else {
				System.out.println("로그인에 실패했습니다.");
				Auth.isAuth = 0;
				loop = true;
			}
			
		}

	}

}




















