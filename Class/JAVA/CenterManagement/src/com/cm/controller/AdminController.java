package com.cm.controller;

import java.util.ArrayList;
import java.util.Scanner;

import com.cm.auth.Auth;
import com.cm.db.DataSource;
import com.cm.model.CourseDTO;
import com.cm.model.CourseListDTO;
import com.cm.model.CourseListInfoDTO;
import com.cm.model.SubjectDTO;
import com.cm.model.SubjectInfoDTO;
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
			cousreMod();
			break;
		
		case 4:
			courseDelete();
			break;
		case 5:
			completeCourseUpdate();
			break;
		}

	}

	private void completeCourseUpdate() {
			
		System.out.println("[수료 과정 처리 리스트]");
		
		ArrayList<CourseListDTO> list = dao.completeCourseList();
		
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
		
		System.out.println("교육생들 수료 처리 할 과정 번호를 선택하여 주십시오 : ");
		String seq = scan.nextLine();
		
		if (dao.courseComplete(seq) == 1) {
			System.out.println("처리 완료.");
		} else {
			System.out.println("처리 실패.");
		}
	}

	private void courseDelete() {
		
		test();
		
		System.out.println("삭제할 과정 번호를 선택하여 주십시오 : ");
		String seq = scan.nextLine();
		
		if (dao.courseDelete(seq) == 1) {
			System.out.println("삭제 완료.");
		} else {
			System.out.println("삭제 실패.");
		}
	}

	private void cousreMod() {
		
		test();
		
		System.out.println("수정할 과정 번호를 선택하여 주십시오 : ");
		String seq = scan.nextLine();
		
		CourseListDTO test = dao.test(seq);
		
		System.out.println("과정 이름 : ");
		String name = scan.nextLine();
		
		System.out.println("시작 날짜 : ");
		String startDate = scan.nextLine();
		
		System.out.println("종료 날짜 : ");
		String endDate = scan.nextLine();
		
		System.out.println("정원 : ");
		int population = scan.nextInt();
		scan.skip("\r\n");
		
		System.out.println("반 번호 : ");
		String classRoom = scan.nextLine();
		
		CourseDTO dto = new CourseDTO();
		
		if (name.equals("")) name = test.getName();
		if (startDate.equals("")) startDate = test.getStartDate();
		if (endDate.equals("")) endDate = test.getEndDate();
		if (Integer.toString(population).equals("")) population = Integer.parseInt(test.getPopulation());
		if (classRoom.equals("")) classRoom = test.getRseq();
		
		dto.setName(name);
		dto.setStartDate(startDate);
		dto.setEndDate(endDate);
		dto.setPopulation(population);
		dto.setClassroom(classRoom);
		
		if (dao.courseMod(dto, seq) == 1) {
			System.out.println("수정 완료.");
		} else {
			System.out.println("수정 실패.");
		}
	}
	
	private void test() {
		
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
	}

	private void courseList() {
		
		test();
		
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
			subjectInfoView();
			break;

		case 3:
			subjectMod();
			break;
		case 4:
			
			break;

		}

	}
	
	private void subjectList() {
		
		System.out.println("[과목 리스트]");
		
		ArrayList<SubjectDTO> list = dao.subjectList();
		
		System.out.println("");
		
		for (SubjectDTO dto : list) {
			System.out.printf("%s\t%s\t\t%s\t%s\t%s\t%s\n"
					, dto.getSeq()
					, dto.getName()
					, dto.getStartDate().substring(0, 10)
					, dto.getEndDate().substring(0, 10)
					, dto.getWritten()
					, dto.getPerformance());
		}
	}

	private void subjectMod() {
		
		subjectList();
		
		System.out.println("수정할 과목 번호를 선택하여 주십시오 : ");
		String seq = scan.nextLine();
		
		System.out.println("과목 이름 : ");
		String name = scan.nextLine();
		
		System.out.println("시작 날짜 : ");
		String startDate = scan.nextLine();
		
		System.out.println("종료 날짜 : ");
		String endDate = scan.nextLine();
		
		System.out.println("필기비중 : ");
		int written = scan.nextInt();
		scan.skip("\r\n");
		
		System.out.println("실기 비중 : ");
		int performance = scan.nextInt();
		scan.skip("\r\n");
		
		SubjectDTO dto = dao.subjectT(seq);
		
		if (name.equals("")) name = dto.getName();
		if (startDate.equals("")) startDate = dto.getStartDate();
		if (endDate.equals("")) endDate = dto.getEndDate();
		if (Integer.toString(written).equals("")) written = dto.getWritten();
		if (Integer.toString(performance).equals("")) written = dto.getPerformance();
		
		dto.setName(name);
		dto.setStartDate(startDate);
		dto.setEndDate(endDate);
		dto.setWritten(written);
		dto.setPerformance(performance);
		
		if (dao.subjectMod(dto, seq) == 1) {
			System.out.println("수정 완료.");
		} else {
			System.out.println("수정 실패.");
		}
	}

	private void subjectInfoView() {
		
		System.out.println("[과목 정보 조회]");
		
		ArrayList<SubjectInfoDTO> list = dao.subjectInfoView();
		
		System.out.println("과정 이름\t\t과정 기간\t\t반 번호\t반 정원\t과목 이름\t과목 기간\t\t책 이름\t\t강사 이름");
		
		for (SubjectInfoDTO dto : list) {
			System.out.printf("%s\t\t%s\t\t%s\t%s\t%s\t%s\t\t%s\t\t%s\n"
					, dto.getCourseName()
					, dto.getCourseDate()
					, dto.getRoomName()
					, dto.getRoomLimit()
					, dto.getSubjectName()
					, dto.getSubjectDate()
					, dto.getBookName()
					, dto.getTeacherName());
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
