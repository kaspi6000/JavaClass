package com.cm.controller;

import java.util.Scanner;

import com.cm.auth.Auth;
import com.cm.model.dao.AdminDAO;
import com.cm.view.AdminView;

public class AdminController implements Controller{
	
	private AdminDAO dao;
	private Auth auth;
	private AdminView view;
	private Scanner scan;
	
	public AdminController() {
		
		dao = new AdminDAO();
		auth = new Auth();
		view = new AdminView();
		scan = new Scanner(System.in);
	
	}

	public void start() {
		
		view.menu();
		
		int sel = scan.nextInt();
		scan.skip("\r\n");
		
		switch (sel) {
		case 1:
			basicInfoManage();
			break;
			
		case 2:
			teacherInfoManage();
			break;
			
		case 3:
			courseManage();
			break;
		
		case 4:
			subjectManage();
			break;
			
		case 5:
			studentManage();
			break;
		}
		
	}
	
	//기초 정보 관리 메뉴
	private void basicInfoManage() {
		
		view.basicInfo();
		
		int sel = scan.nextInt();
		scan.skip("\r\n");
		
		switch (sel) {
		
		case 1:
			
			break;
			
		case 2:
			
			break;
			
		case 3:
	
			break;

		}
			
	}
	
	//교사 계정 관리 메뉴
	private void teacherInfoManage() {
		
		view.teacherInfo();
		
		int sel = scan.nextInt();
		scan.skip("\r\n");
		
		switch (sel) {
		
		case 1:
			
			break;
			
		case 2:
			
			break;
			
		case 3:
	
			break;

		}
		
		
	}
	
	//개설 과정 관리 메뉴
	private void courseManage() {
		
		view.courseInfo();
		
		int sel = scan.nextInt();
		scan.skip("\r\n");
		
		switch (sel) {
		
		case 1:
			
			break;
			
		case 2:
			
			break;
			
		case 3:
	
			break;

		}
		
		
	}
	
	//개설 과목 관리 메뉴
	private void subjectManage() {
		
		view.subjectInfo();
		
		int sel = scan.nextInt();
		scan.skip("\r\n");
		
		switch (sel) {
		
		case 1:
			
			break;
			
		case 2:
			
			break;
			
		case 3:
	
			break;

		}
		
		
	}

	//교육생 관리 메뉴
	private void studentManage() {
		
		view.studentInfo();
		
		int sel = scan.nextInt();
		scan.skip("\r\n");
		
		switch (sel) {
		
		case 1:
			
			break;
			
		case 2:
			
			
			break;
			
		case 3:
	
			break;
			
		case 4:
			
			break;

		}
		
		
	}

	
	//출결상황을 조회할 수 있다.
	@Override
	public void attendLook() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void scoreLook() {
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























