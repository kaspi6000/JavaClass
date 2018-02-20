package com.cm.controller;

import java.util.Scanner;

import com.cm.auth.Auth;
import com.cm.model.dao.StudentDAO;
import com.cm.model.dao.TeacherDAO;
import com.cm.view.TeacherView;

public class TeacherController implements Controller{
	
	private TeacherDAO tdao;
	private StudentDAO sdao;
	private TeacherView view;
	private Auth auth;
	private Scanner scan;
	
	public TeacherController() {
		
		sdao = new StudentDAO();
		tdao = new TeacherDAO();
		view = new TeacherView();
		auth = new Auth();
		scan = new Scanner(System.in);
	}

	public void start() {
		
		view.menu();
		
		int sel = scan.nextInt();
		scan.skip("\r\n");
		
		switch (sel) {
		case 1:		
			scheduleLook();
			break;
		
		case 2:
			subjectManage();
			break;
			
		case 3:
			scoreManage();
			break;
			
		case 4:
			attendLook();
			break;
			
		default:
			break;
		}
		
	}

	//교육생을 출결상황을 조회한다. 기간별로 조회가 가능해야 한다.
	//교육생의 출결상황을 조회할 수 있다.
	@Override
	public void attendLook() {
		// TODO Auto-generated method stub
		
	}

	//교육생의 성적을 조회, 수정한다.
	private void scoreManage() {
		view.scoreMenu();
		
		int sel = scan.nextInt();
		scan.skip("\r\n");
		
		switch(sel) {
			case 1:
				scoreLook();
				break;
			case 2:
				classScoreInput();
				break;
				
			case 3:
				classScoreMod();
				break;
				
		}
		
	}
	
	//현재 과목에 포함된 학생의 성적을 입력한다.
	private void classScoreInput() {
		// TODO Auto-generated method stub
		
	}
	
	//현재 과목에 포함된 학생의 성적을 수정한다.
	private void classScoreMod() {
		// TODO Auto-generated method stub
		
	}

	//현재 과목에 포함된 학생의 성적을 출력한다.
	public void scoreLook() {
		// TODO Auto-generated method stub
		
	}


	//해당 과목의 필기, 실기 비중을 입력한다.
	private void subjectManage() {
		// TODO Auto-generated method stub
		
	}

	//강의 스케줄을 조회한다. 강의 종료, 강의 중, 강의 예정으로 구분되어야 한다.
	private void scheduleLook() {
		// TODO Auto-generated method stub
		
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


























