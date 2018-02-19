package com.cm.controller;

import java.util.Scanner;

import com.cm.auth.Auth;
import com.cm.model.dao.StudentDAO;
import com.cm.view.StudentView;

public class StudentController implements Controller{

	private StudentDAO dao;
	private StudentView view;
	private Auth auth;
	private Scanner scan;
	
	public StudentController() {
		dao = new StudentDAO();
		auth = new Auth();
		scan = new Scanner(System.in);
		view = new StudentView();
	}
	
	public void start() {
		
		boolean loop = true;
		
		while (loop) {
			
			view.menu();
			int sel = scan.nextInt();
			scan.skip("\r\n");
			switch(sel) {
				
				case 1:
					attend();
					break;
				case 2:
					look();
					break;
				default:
					loop = false;
					break;
			
			}
			
		}
		
	}

	//StudentDAO를 이용하여, 데이터를 받아오고 출력한다.
	private void look() {
		view.lookView();
		
		int sel = scan.nextInt();
		scan.skip("\r\n");
		switch(sel) {
			case 1:
				courseLook();//수강중인 과정 정보 조회
				break;
			case 2:
				scoreLook();//학생 성적 조회
				break;
			case 3:
				attendLook();//출결 정보 조회
				break;
		}
		
	}

	//현재 로그인한 교육생의 출결상황을 조회한다.
	//기간을 지정해서 조회할 수 있어야 한다.
	public void attendLook() {
		// TODO Auto-generated method stub
		
	}

	//현재 로그인한 교육생의 성적을 조회한다.
	public void scoreLook() {
		// TODO Auto-generated method stub
		
	}

	//현재 로그인한 교육생의 현재 수강중인 과정 정보를 조회한다.
	private void courseLook() {
		
	}

	//StudentDAO를 이용하여 DB작업을 해야 한다. 그날의 첫번쨰 등록시 입실, 그 후로 모두 퇴실에 데이터 저장
	private void attend() {
		dao.attendCheck();
		if() {
			System.out.println("입실 처리 되었습니다.");
		} else {
			System.out.println("퇴실 처리 되었습니다.");
		}
	}


	@Override
	public void input() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void view() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modify() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete() {
		// TODO Auto-generated method stub
		
	}

}

























