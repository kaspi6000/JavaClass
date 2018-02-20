package com.cm.controller;

import java.util.ArrayList;
import java.util.Scanner;

import com.cm.auth.Auth;
import com.cm.db.DataSource;
import com.cm.model.CourseDTO;
import com.cm.model.CourseListDTO;
import com.cm.model.CourseListInfoDTO;
import com.cm.model.dao.AdminDAO;
import com.cm.view.AdminView;

public class AdminController implements Controller {

	private AdminDAO dao;
	private Auth auth;
	private AdminView view;
	private Scanner scan;
	private DataSource ds;

	public AdminController() {

		dao = new AdminDAO();
		auth = new Auth();
		view = new AdminView();
		scan = new Scanner(System.in);
		ds = new DataSource();
	}

	public static void main(String[] args) {

		Auth.isAuth = 3;

		AdminController admin = new AdminController();

		admin.start();
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

	// 기초 정보 관리 메뉴
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

	// 교사 계정 관리 메뉴
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

	// 개설 과정 관리 메뉴
	private void courseManage() {

		view.courseInfo();

		int sel = scan.nextInt();
		scan.skip("\r\n");

		switch (sel) {

		case 1:
			addCourse();
			break;

		case 2:
			courseList();
			break;

		case 3:

			break;

		}

	}

	private void courseList() {
		
		System.out.println("[과정 리스트]");
		
		ArrayList<CourseListDTO> list = dao.courseList();
		
		System.out.println("번호\t과정 이름\t\t\t\t시작 날짜 \t\t종료 날짜\t\t정원\t반 번호");
		
		for (CourseListDTO dto : list) {
			System.out.printf("%s\t%s\t\t%s\t%s\t%s\t%s\n"
					, dto.getSeq()
					, dto.getName()
					, dto.getStartDate().substring(0, 10)
					, dto.getEndDate().substring(0, 10)
					, dto.getPopulation() + "명"
					, dto.getRseq() + "반");
		}
		
		System.out.println("과정 번호를 선택하여 주십시오 : ");
		String seq = scan.nextLine();
		
		ArrayList<CourseListInfoDTO> list1 = dao.courseListInfo(seq);
		
		System.out.println("과목이름\t\t과목날짜\t\t\t\t반 번호\t정원");
		
		for (CourseListInfoDTO dto : list1) {
			System.out.printf("%s\t\t%s\t\t%s\t%s\n"
					, dto.getSubjectName()
					, dto.getSubjectDate()
					, dto.getRoomName()
					, dto.getCoursePopulation());
		}
	}

	private void addCourse() {
		
		System.out.println("과정 이름 : ");
		String name = scan.nextLine();

		System.out.println("과정 시작 날짜 : ");
		String startDate = scan.nextLine();

		System.out.println("과정 종료 날짜 : ");
		String endDate = scan.nextLine();

		System.out.println("과정 정원 : ");
		int population = scan.nextInt();
		scan.skip("\r\n");

		System.out.println("과정 반(1 ~ 6) : ");
		String classRoom = scan.nextLine();

		CourseDTO dto = new CourseDTO();

		dto.setName(name);
		dto.setStartDate(startDate);
		dto.setEndDate(endDate);
		dto.setPopulation(population);
		dto.setClassroom(classRoom);

		if (dao.courseAdd(dto) == 1) {
			System.out.println("추가 성공.");
		} else {
			System.out.println("추가 실패.");
		}
	}

	// 개설 과목 관리 메뉴
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

	// 교육생 관리 메뉴
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

	// 출결상황을 조회할 수 있다.
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
