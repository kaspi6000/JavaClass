package com.cm.view;

public class StudentView {

	public void menu() {
		
		System.out.println("1. 입실/퇴실");
		System.out.println("2. 초회");
		
	}

	//StudentClass에서 조회메뉴 선택시...
	public void lookView() {
		
		System.out.println("1. 과정 조회"); //과정명, 과정 정보, 과목 정보등을 출력한다.
		System.out.println("2. 성적 조회"); //현재 로그인한 학생의 성적을 출력한다.
		System.out.println("3. 출결 조회"); //현재 로그인한 학생의 출결상황을 출력한다.
		System.out.print("선택 : ");
		
	}

	//MainClass에서 교육생 로그인 성공시...
	//교육생 로그인 성공시, 교육생 개인 정보와 수강한 과정명, 과정기간, 강의실이 타이틀로 출력된다.
	public void login() {
		
		
	}

}
