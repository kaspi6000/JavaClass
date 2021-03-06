package com.schoolmanagement.achievement;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Comparator;
import java.util.Random;
import java.util.Scanner;

import com.schoolmanagement.auth.*;


public class Achievement {
	
	private static Scanner scan;
	//private static String path = "C:\\SchoolManagement\\" + Login.schoolName + "\\" + Login.schoolName + "_Student\\" + Login.schoolName + "_2018.txt";
	//private static String path = "C:\\SchoolManagement\\월봉고등학교\\월봉고등학교_Student\\월봉고등학교_2018.txt";
	private static ArrayList<Student> list;
	public static int level = 2; 
	private static String sel = "";
	private static String next = "";
	private static String name = "";
	private static String grade = "";
	private static String classNum = "";
	private static String semester = "";
	private static String korAchiev = "";
	private static String engAchiev = "";
	private static String mathAchiev = "";
	private static String scienceAchiev = "";
	private static String average = "";
	private static String path = "C:\\SchoolManagement\\" + Login.schoolName + "\\" + Login.schoolName + "_Student\\" + Login.schoolName + "_2018.txt";

	
	static {
		scan = new Scanner(System.in);
		list = new ArrayList<Student>();
		//Login.schoolName = "";
	}
	
	public static void main(String[] args) {
		
		Auth.level = 2;
		
		
		load();
		
		achievement();
				
	}
	
	public static void achievement() {
		
		boolean loop = true;
		
		while (loop) {
		
			System.out.println("===========================================================================");
			System.out.println("\t\t\t성\t적\t 관\t리");
			System.out.println("===========================================================================");
			System.out.println("1. 성적 입력");
			System.out.println("2. 성적 보기");
			System.out.println();
			System.out.print("입력 : ");
			
			sel = scan.nextLine();
			
			if (sel.equals("1")) {
				inputAchiev();
			}
			else if (sel.equals("2")) {
				listAchiev();
			}
			else { 
				System.out.println("올바른 번호를 입력하시오.");
			}
			
		}
		
		
	}
	
	private static void load() {
		
		try {
			
			BufferedReader reader = new BufferedReader(new FileReader(path));
			
			String line = null;
			
			while ((line = reader.readLine()) != null) {
				
				String[] temp = line.split(",");
				
				Student s = new Student();
				s.setName(temp[0]);
				s.setGrade(temp[1]);
				s.setClassNum(temp[2]);
				s.setSemester(temp[3]);
				s.setClub(temp[4]);
				s.setKorAchiev(temp[5]);
				s.setEngAchiev(temp[6]);		
				s.setMathAchiev(temp[7]);
				s.setScienceAchiev(temp[8]);
				s.setAverage(temp[9]);
				
				list.add(s);
				
			}
			
			reader.close();
			
		} catch (IOException e) {
			
			System.out.println("load : " + e.toString());
		}
		
	}

	private static void save() {

		try {
			
			BufferedWriter writer = new BufferedWriter(new FileWriter(path, false));
			
			for (int i=0 ; i<list.size() ; i++) {
				
				Student data = list.get(i);
				
				String line = String.format("%s,%s,%s,%s,%s,%s,%s,%s,%s,%s"
										, data.getName()
										, data.getGrade()
										, data.getClassNum()
										, data.getSemester()
										, data.getClub()
										, data.getKorAchiev()
										, data.getEngAchiev()
										, data.getMathAchiev()
										, data.getScienceAchiev()
										, data.getAverage());
				
				writer.write(line);
				writer.newLine();
				
			}
			
			writer.close();
			
		} catch (IOException e) {
			
			System.out.println("save : " + e.toString());
		}
		
	}

	private static void inputAchiev() {
		
		System.out.println("===========================================================================");
		System.out.println("\t\t\t성\t적\t 입\t력");
		System.out.println("===========================================================================");
		
		System.out.print("학생 이름 : ");
		name = scan.nextLine();
		
		grade();
		
		classNum();
		
		semester();
			
		while (true) {
			System.out.print("국어 : ");
			korAchiev = scan.nextLine();
			
			if (Integer.parseInt(korAchiev) >=0 && Integer.parseInt(korAchiev) <=100) break;
			else {
				System.out.println("국어 점수를 다시 입력하시오.");			
			}
		}
		
		while (true) {
			System.out.print("영어 : ");
			engAchiev = scan.nextLine();
			
			if (Integer.parseInt(engAchiev) >=0 && Integer.parseInt(engAchiev) <=100) break;
			else {
				System.out.println("영어 점수를 다시 입력하시오.");			
			}
		}
		
		while (true) {
			System.out.print("수학 : ");
			mathAchiev = scan.nextLine();
			
			if (Integer.parseInt(mathAchiev) >=0 && Integer.parseInt(mathAchiev) <=100) break;
			else {
				System.out.println("수학 점수를 다시 입력하시오.");			
			}
		}
	
		while (true) {
			System.out.print("과학 : ");
			scienceAchiev = scan.nextLine();
			
			if (Integer.parseInt(scienceAchiev) >=0 && Integer.parseInt(scienceAchiev) <=100) break;
			else {
				System.out.println("과학 점수를 다시 입력하시오.");			
			}
		}
		
		System.out.println();
		System.out.println("입력이 완료되었습니다.");
		
		Student s = new Student();
		s.setName(name);
		s.setGrade(grade);
		s.setClassNum(classNum);
		s.setSemester(semester);
		s.setKorAchiev(korAchiev);
		s.setEngAchiev(engAchiev);
		s.setMathAchiev(mathAchiev);
		s.setScienceAchiev(scienceAchiev);
		s.setAverage(average);
		
		list.add(s);
		
		save();
		
		//System.out.println(list);
		
		System.out.println();
		System.out.println("1. 점수 계속 입력하기");
		System.out.println("2. 나가기");
		System.out.println();
		
		while (true) {
			System.out.print("입력 : ");
			next = scan.nextLine();
			
			if (next.equals("1")) {
				inputAchiev();
			}
			if (next.equals("2")) {
				achievement();
			}
			else System.out.println("올바른 번호를 입력하시오.");
				
		}	
			
	}

	private static void listAchiev() {
		
		boolean loop = true;
		
		while (loop) {
		
			System.out.println("===========================================================================");
			System.out.println("\t\t\t성\t적\t 보\t기");
			System.out.println("===========================================================================");
			System.out.println("1. 전교 성적");
			System.out.println("2. 학급별 성적");
			System.out.println("3. 학생별 성적");
			System.out.println("4. 나가기");
			System.out.println();
			System.out.print("입력 : ");
			
			sel = scan.nextLine();
			
			if (sel.equals("1")) {
				wholeSchoolGrade();
			}
			else if (sel.equals("2")) {
				classGrade();
			}
			else if (sel.equals("3")) {
				studentGrade();
			}
			else if (sel.equals("4")) {
				achievement();
			}
			else {
				loop = false;
				System.out.println("올바른 번호를 입력하시오.");
			}
		}	
		
	}
	
	private static void wholeSchoolGrade() {
		
		ArrayList<Student> temp = new ArrayList<Student>();
		
		System.out.println("===========================================================================");
		System.out.println("\t\t\t전\t교\t 성\t적");
		System.out.println("===========================================================================");
		
		grade();
		
		semester();
	
		for (Student s : list) {
			if (s.getGrade().contains(grade) && s.getSemester().contains(semester)) {
				temp.add(s);
			}	
		} 
		
		System.out.println();
		System.out.printf("%s학년 총 %d명의 학생이 검색되었습니다.\n", grade, temp.size());
		System.out.println();
		
		temp.sort(new Comparator<Student>() {

			@Override	
			public int compare(Student o1, Student o2) {

				return o2.getAverage() - o1.getAverage();
			}
		});
		
		if (temp.size() >0) {
			
			System.out.println("[이름]\t[학년]\t[학기]\t[학급]\t[국어]\t[영어]\t[수학]\t[과학]\t[평균]");
		
			for (Student s : temp) {
				System.out.printf("%s\t%5s\t%5s\t%5s\t%5d\t%5d\t%5d\t%5d\t%5d\n"
									,s.getName()
									,s.getGrade()
									,s.getSemester() 
									,s.getClassNum()
									,s.getKorAchiev() 
									,s.getEngAchiev()
									,s.getMathAchiev()
									,s.getScienceAchiev()
									,s.getAverage());
			} 
		} else {
				System.out.println("검색된 학생이 없습니다.");
			}
		
		end();
		
		if (next.equals("1")) {
			wholeSchoolGrade(); 
		}
		if (next.equals("2")) {
			listAchiev();
		}

		

	} 
	
	private static void classGrade() {
		
		ArrayList<Student> temp = new ArrayList<Student>();
		
		System.out.println("===========================================================================");
		System.out.println("   \t\t학\t급\t별\t 성\t적");
		System.out.println("===========================================================================");
	
		grade();
		
		classNum();
	
		semester();
		
		System.out.println();
		
		for (Student s : list) {
			if(s.getGrade().contains(grade) && s.getClassNum().contains(classNum) && s.getSemester().contains(semester)) {
				temp.add(s);
			}	
		} 
		
		temp.sort(new Comparator<Student>() {

			@Override
			public int compare(Student o1, Student o2) {
				return  o2.getAverage() - o1.getAverage();
			}
			
		});
		
		if (temp.size() >0) {	
			System.out.printf("%s학년 %s반 %d명의 학생이 검색되었습니다.\n", grade, classNum, temp.size());
			System.out.println();
			
			System.out.println("[이름]\t[학기]\t[국어]\t[영어]\t[수학]\t[과학]\t[평균]");
			
			for (Student s : temp) {
				System.out.printf("%s\t%5s\t%5d\t%5d\t%5d\t%5d\t%5d\n"
									,s.getName()
									,s.getSemester() 
									,s.getKorAchiev()
									,s.getEngAchiev() 
									,s.getMathAchiev() 
									,s.getScienceAchiev()
									,s.getAverage());
			} 
		} else {
				System.out.println("검색된 학생이 없습니다.");
			}
		
		end();
		
		if (next.equals("1")) {
			classGrade(); 
		}
		if (next.equals("2")) {
			achievement();
		}
					
	}
	
	private static void studentGrade() {
		
		ArrayList<Student> temp = new ArrayList<Student>();
		
		System.out.println("===========================================================================");
		System.out.println("\t\t학\t생\t별\t 성\t적");
		System.out.println("===========================================================================");
		
		while (true) {
			System.out.print("학생 이름 : ");
			name = scan.nextLine();
			
			if (name.length() >0 && name.length() <5) break;
			else {
				System.out.println("이름을 다시 입력하시오.");
			}
		
		}
	
		grade();
		
		classNum();
		
		System.out.println();
		
		for (Student s : list) {
			if (s.getName().contains(name) && s.getGrade().contains(grade) && s.getClassNum().contains(classNum)) {
				temp.add(s);
			}	
		}
		
		temp.sort(new Comparator<Student>() {

			@Override
			public int compare(Student o1, Student o2) {
				return  o1.getSemester().compareTo(o2.getSemester());
			}
			
		});
		
		if (temp.size() >0) {
			System.out.printf("%s학년 %s반 %s 학생이 검색되었습니다.\n", grade, classNum, name);
			System.out.println();
			System.out.println("[학기]\t[국어]\t[영어]\t[수학]\t[과학]\t[평균]");
		
			for (Student s : temp) {
				System.out.printf("%5s\t%5d\t%5d\t%5d\t%5d\t%5d\n"
									,s.getSemester() 
									,s.getKorAchiev() 
									,s.getEngAchiev()
									,s.getMathAchiev()
									,s.getScienceAchiev()
									,s.getAverage());
			} 
		} else {
				System.out.println("검색된 학생이 없습니다.");
			}
			
		end();
		
		if (next.equals("1")) {
			studentGrade(); 
		}
		if (next.equals("2")) {
			listAchiev();
		}

	}

	private static void classNum() {
		
		while (true) {
			System.out.print("반 : ");
			classNum = scan.nextLine();
			
			if (Integer.parseInt(classNum) >0 && Integer.parseInt(classNum) <20) break;
			else {
				System.out.println("반을 다시 입력하시오.");			
			}
		}
	}

	private static void semester() {
		
		while (true) {
			System.out.print("학기 : ");
			semester = scan.nextLine();
			
			if (Integer.parseInt(semester) >0 && Integer.parseInt(semester) <3) break;
			else {
				System.out.println("학기를 다시 입력하시오.");			
			}
		}
	}

	private static void grade() {
		
		while (true) {
			System.out.print("학년 : ");
			grade = scan.nextLine();
			
			if (Integer.parseInt(grade) >0 && Integer.parseInt(grade) <4) break;
			else {
				System.out.println("학년을 다시 입력하시오.");			
			}
		}
	}
	
	private static void end() {
		
		System.out.println();
		System.out.println("1. 다시 검색");
		System.out.println("2. 나가기");
		
		while (true) {
			System.out.println();
			System.out.print("입력 : ");
			next = scan.nextLine();
			
			if (next.equals("1")) break; 
			if (next.equals("2")) break;
			else System.out.println("올바른 번호를 입력하시오.");
				
		}
			
	}
	
	
	
	
	
/*
 * 학생 더미 데이터
 * 
	private static void dummy() {
		
		try {
			String dummyPath = "C:\\SchoolManagement\\청명고등학교\\청명고등학교_Student\\청명고등학교_2018.txt";
			
			BufferedWriter writer = new BufferedWriter(new FileWriter(dummyPath, true));
			
			int count = 33;					//학생수
			
			int grade = 3;					//학년
			int classNum = 13;  			//반
			
			
		
			int semester = 1;				//학기
			
			Random rnd = new Random();
			
			String[] name1 = { "김", "이", "박", "정", "심", "장", "강", "최" };
			String[] name2 = { "윤", "은", "재", "준", "진", "미", "경", "가", "나", "지", "수", "서" };
			String[] name3 = { "대", "범", "연", "희", "필", "우", "정", "찬" , "영", "구", "일"};
			
			String[] club = { "영화감상", "봉사활동", "댄스부", "축구부", "독서논술", "과학실험", "영자신문", "요리부" };
			
			
			String[] name = new String[count];
			String[] cb = new String[count];
			int[] kor = new int[count];
			int[] eng = new int[count];
			int[] math = new int[count];
			int[] sience = new int[count];
			
			
			for (int i = 0; i < count; i++) {
				
				name[i] = name1[rnd.nextInt(name1.length)] + name2[rnd.nextInt(name2.length)]
						+ name3[rnd.nextInt(name3.length)];
				cb[i] = club[rnd.nextInt(club.length)];
				kor[i] = rnd.nextInt(91) + 10;
				eng[i] = rnd.nextInt(91) + 10;
				math[i] = rnd.nextInt(91) + 10;
				sience[i] = rnd.nextInt(91) + 10;
				
			}
			
			for (int i = 0; i < count; i++) {

				String line = String.format("%s,%d,%d,%d,%s,%d,%d,%d,%d,%d"
											, name[i]
											, grade
											, classNum
											, semester
											, cb[i]
											, kor[i]
											, eng[i]
											, math[i]
											, sience[i]
											, (kor[i] + eng[i] + math[i] + sience[i]) / 4);

				writer.write(line);
				writer.newLine();

			}
			
			for (int i = 0; i < count; i++) {

				String line2 = String.format("%s,%d,%d,%d,%s,%d,%d,%d,%d,%d"
											, name[i]
											, grade
											, classNum
											, semester + 1
											, cb[i]
											, kor[i] - 4
											, eng[i] - 6, math[i] - 7
											, sience[i] - 9
											,(kor[i] - 4 + eng[i] - 6 + math[i] - 7 + sience[i] - 9) / 4);
				
				writer.write(line2);
				writer.newLine();

			} 
			
			writer.close();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	

*/
}