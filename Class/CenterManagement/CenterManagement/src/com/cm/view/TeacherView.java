package com.cm.view;

public class TeacherView {
	
	public void menu() {
		
		System.out.println("1. 강의 스케줄 조회");
		System.out.println("2. 배점 입출력");
		System.out.println("3. 성적 입출력");
		System.out.println("4. 교육생 출결 조회");
		System.out.print("선택 : ");
		
	}

	public void scoreMenu() {
		System.out.println("1. 성적 조회");
		System.out.println("2. 성적 입력");
		System.out.println("3. 성적 수정");
	}
	
	public void attendmenu() {
		System.out.println("1. 교육생 출결 조회");		
	}

}
