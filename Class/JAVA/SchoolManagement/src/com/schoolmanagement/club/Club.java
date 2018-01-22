package com.schoolmanagement.club;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Scanner;
import java.util.TreeMap;

public class Club {
	
	public static String schoolName = "";
	public static String studentName = "";
	private static String teacherName = "";
	private static String clubName = "";
	public static int level = 2;
	private static Scanner scan;
	private static TreeMap<Integer, String> clubNameList;
	private static ArrayList<ClubData> clubDataList;
	private static ArrayList<Student> studentDataList;
	private static ArrayList<ClubRecordData> clubRecordDataList;
	
	static {
		scan = new Scanner(System.in);
		clubNameList = new TreeMap<Integer, String>();
		clubDataList = new ArrayList<ClubData>();
		studentDataList = new ArrayList<Student>();
		clubRecordDataList = new ArrayList<ClubRecordData>();
	}
	
	public static void startClubMenu() {
		readClubFile();
		readStudentFile();
		readClubRecordFile();
		
		boolean loop = true;
		
		while(loop) {
			
			System.out.println("========================================================================");
			System.out.println("                               CA(개발) 활동");
			System.out.println("========================================================================");
			System.out.println("1. 동아리 리스트");
			System.out.println("2. 동아리 만들기");
			System.out.println("3. 동아리 일지");
			System.out.println("6. 프로그램 종료");
			System.out.println();
			System.out.print("메뉴 선택 : ");
			int select = Integer.parseInt(scan.nextLine());
			
			switch(select) {
				
				case 1:
					showClubList();
					showClubInfo(clubName);
					break;
					
				case 2:
					makeClub();
					break;
					
				case 3:
					showClubList();
					showClubRecordList();
					break;
					
				case 4:
				case 5:
				case 6:
					System.out.println("프로그램이 종료됩니다.");
					loop = false;
					break;
					
				default :
					System.out.println("정확한 메뉴를 선택하세요.");
			
			}//switch	
			
		}//while
		
		writeClubFile();
		writeClubRecordFile();
		writeStudentFile();
	}

	private static void showClubRecordList() {
		
		for(int i=0 ; i<clubRecordDataList.size() ; i++) {

			ClubRecordData data = clubRecordDataList.get(i);
			
			if(clubName.equals(data.getClubName())) {
				System.out.printf("%s 일지\n", data.getDate());
			}			
		}//for
		
		System.out.println("========================================================================");
		System.out.println("                                      동아리 일지 관리");
		System.out.println("========================================================================");
		
		System.out.println("1. 일지 등록");
		System.out.println("2. 일지 수정");
		System.out.println("3. 일지 보기");
		System.out.println("4. 나가기");
		System.out.printf("메뉴 입력 : ");
		String select = scan.nextLine();
		
		if(select.equals("1")) {
			makeClubRecord();
			
		} else if(select.equals("2")) {
			System.out.print("수정할 일자를 적으세요(ex 2018.1.1) : ");
			String date = scan.nextLine();
			
			for(int i=0 ; i<clubRecordDataList.size() ; i++) {
				ClubRecordData data = clubRecordDataList.get(i);
				
				if(clubName.equals(data.getClubName()) && date.equals(data.getDate())) {
					rewriteClubRecord(i);
				} else {
					System.out.printf("%s의 일지가 존재하지 않습니다.\n", date);
					break;
				}
			}//for
			
		} else if(select.equals("3")) {
			System.out.print("열람할 일자를 적으세요(ex 2018.1.1) : ");
			String date = scan.nextLine();
			
			for(int i=0 ; i<clubRecordDataList.size() ; i++) {
				
				ClubRecordData data = clubRecordDataList.get(i);
				
				if(clubName.equals(data.getClubName()) && date.equals(data.getDate())) {
	
					showSelectedRecord(i);
				} else {
					System.out.printf("%s의 일지가 존재하지 않습니다.", date);
				}
			}//for		
			
		} else if(select.equals("4")) {
			return;
		} else {
			System.out.println("정확한 메뉴를 선택하세요.");
			return;
		}
		
	}//showClubRecordList();

	private static void showSelectedRecord(int index) {
		
		ClubRecordData data = clubRecordDataList.get(index);
		System.out.println("========================================================================");
		System.out.printf("                                                                 일지 보기\n");
		System.out.println("========================================================================");
		
		System.out.printf("%s 동아리\n", clubName);
		System.out.printf("일자 : %s\n\n", data.getDate());
		
		System.out.printf("내용 : %s\n", data.getClubDailyRecord());
		
		return;
		
	}//showSelectedRecord();

	private static void rewriteClubRecord(int index) {
		
		Calendar now = Calendar.getInstance();
		
		String clubRecordFilePath = "C:\\SchoolManagement\\" + schoolName + "\\"
				+ schoolName + "_Club" + "\\" + "ClubRecord_" + now.get(Calendar.YEAR) + ".txt";
		
		String date = String.format("%s.%s.%s"
				, now.get(Calendar.YEAR)
				, now.get(Calendar.MONTH) + 1
				, now.get(Calendar.DATE));
		
			ClubRecordData data = clubRecordDataList.get(index);
			
			if(data.getClubName().equals(clubName)) {
				
					System.out.println("========================================================================");
					System.out.println("                                                             동아리 일지 수정");
					System.out.println("========================================================================");
				
					System.out.printf("동아리명 : %s", clubName);
					System.out.println();
					System.out.printf("일시 : %s", data.getDate());
					System.out.println();				
					System.out.printf("기존 내용 : %s\n\n", data.getClubDailyRecord());
					
					System.out.print("수정할 내용을 입력하세요 : ");
					String temp = scan.nextLine();
					
					data.setClubDailyRecord(temp);
					
					writeClubRecordFile();
					
					System.out.println("성공적으로 수정이 완료되었습니다");					
					
			}
				
	}//reWriteClubRecord();

	private static void showClubRecord() {
		
		Calendar now = Calendar.getInstance();
		
		String clubRecordFilePath = "C:\\SchoolManagement\\" + schoolName + "\\"
				+ schoolName + "_Club" + "\\" + "ClubRecord_" + now.get(Calendar.YEAR) + ".txt";
		
		try {

			BufferedReader reader = new BufferedReader(new FileReader(clubRecordFilePath));
			
			String line = "";
			
			String[] temp = new String[3];
			
			while((line = reader.readLine()) != null) {
				
				temp = line.split("`");
				
				if(temp[0].equals(clubName)) {
					System.out.println("========================================================================");
					System.out.println("                                                           동아리 일지 내용 보기");
					System.out.println("========================================================================");
					System.out.printf("%s", clubName);
					System.out.println();
					System.out.printf("일시 : %s\n\n내용 : %s\n\n", temp[1], temp[2]);
				}
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}//showClubRecord();

	private static void makeClubRecord() {
		
		Calendar now = Calendar.getInstance();
		
		String clubRecordFilePath = "C:\\SchoolManagement\\" + schoolName + "\\"
				+ schoolName + "_Club" + "\\" + "ClubRecord_" + now.get(Calendar.YEAR) + ".txt";
		
		if(level != 2) {
			System.out.println("동아리 일지 등록은 교사만 가능합니다.");
			return;
		}//if
		
		System.out.println("========================================================================");
		System.out.println("                                                            CA(개발)활동 일지");
		System.out.println("========================================================================");
		
		try {
			
			String date = String.format("%s.%s.%s"
									, now.get(Calendar.YEAR)
									, now.get(Calendar.MONTH) + 1
									, now.get(Calendar.DATE));
			
			for(int i=0 ; i<clubRecordDataList.size() ; i++) {
				
				if((clubRecordDataList.get(i).getDate()).equals(date) && clubRecordDataList.get(i).getClubName().equals(clubName)) {
					System.out.println("동아리 일지는 요일별로 하나만 만들 수 있습니다.");
					return;
				}				
			}
			
			System.out.printf("%s 동아리\n", clubName);
			System.out.printf("일시 : %s", date);
			System.out.println();			
			System.out.print("동아리 일지 내용 : ");
			String newClubRecord = scan.nextLine();	//동아리 내용을 입력받음
			
			ClubRecordData data = new ClubRecordData();
			
			data.setClubName(clubName);
			data.setDate(date);
			data.setClubDailyRecord(newClubRecord);
			data.setClubTeacherName(teacherName);
			
			clubRecordDataList.add(data);
			
			writeClubRecordFile();
			
			System.out.println("동아리 일지 등록이 정상적으로 완료되었습니다.");
			
		} catch (Exception e) {
			System.out.println("makeClub : " + e.toString());
		}
		
	}//makeClubRecord();

	private static void writeClubRecordFile() {
		
		Calendar now = Calendar.getInstance();
		
		String clubRecordFilePath = "C:\\SchoolManagement\\" + schoolName + "\\"
				+ schoolName + "_Club" + "\\" + "ClubRecord_" + now.get(Calendar.YEAR) + ".txt";
		
		try {
			
			BufferedWriter writer = new BufferedWriter(new FileWriter(clubRecordFilePath, false));
			
			for(int i=0 ; i<clubRecordDataList.size() ; i++) {
				
				ClubRecordData data = clubRecordDataList.get(i);
				
				//동아리명,일시,일지				
				String line = String.format("%s`%s`%s`%s"
						, data.getClubName()				//동아리명
						, data.getDate()					//일시
						, data.getClubDailyRecord()			//일지 내용
						, data.getClubTeacherName());		//선생님 이름
						
				
				writer.write(line);
				writer.newLine();
				
			}//for
			
			writer.close();
			
		} catch (Exception e) {
			System.out.println("writeClubRecordFile : " + e.toString());
		}
		
	}//writeClubRecordFile();

	private static void readClubRecordFile() {
		
		Calendar now = Calendar.getInstance();
		
		String clubRecordFilePath = "C:\\SchoolManagement\\" + schoolName + "\\"
				+ schoolName + "_Club" + "\\" + "ClubRecord_" + now.get(Calendar.YEAR) + ".txt";
		
		try {
			
			BufferedReader reader = new BufferedReader(new FileReader(clubRecordFilePath));
			
			String line = "";
			
			String[] temp = new String[3];
			
			while((line = reader.readLine()) != null) {
				
				temp = line.split("`");
				
				ClubRecordData data = new ClubRecordData();
				
				data.setClubName(temp[0]);
				data.setDate(temp[1]);
				data.setClubDailyRecord(temp[2]);
				data.setClubTeacherName(temp[3]);
				
				clubRecordDataList.add(data);
			}
			
		} catch (Exception e) {
			System.out.println("readClubRecordFile : " + e.toString());
		}
		
	}//readClubRecordFile();

	private static void writeClubFile() {
		
		Calendar now = Calendar.getInstance();
		
		String clubFilePath = "C:\\SchoolManagement\\" + schoolName + "\\"
				+ schoolName + "_Club" + "\\" + "Club_" + now.get(Calendar.YEAR) + ".txt";
		
		try {
			
			BufferedWriter writer = new BufferedWriter(new FileWriter(clubFilePath, false));
			
			for(int i=0 ; i<clubDataList.size() ; i++) {
				
				String line = String.format("%s,%s,%s,%s"
						, clubDataList.get(i).getClubName()
						, clubDataList.get(i).getClubExp()
						, clubDataList.get(i).getLimit()
						, clubDataList.get(i).getPeople());
				
				writer.write(line);
				writer.newLine();
				
			}//for
			
			writer.close();
			
			
		} catch (Exception e) {
			System.out.println("writeClubFile : " + e.toString());
		}
		
	}//writeClubFile();

	private static void readClubFile() {
		
		Calendar now = Calendar.getInstance();
		
		String clubFilePath = "C:\\SchoolManagement\\" + schoolName + "\\"
				+ schoolName + "_Club" + "\\" + "Club_" + now.get(Calendar.YEAR) + ".txt";
		
		try {
			
			BufferedReader reader = new BufferedReader(new FileReader(clubFilePath));
			
			String line = "";
			
			String[] temp = new String[4];
			
			while((line = reader.readLine()) != null) {
				
				temp = line.split(",");
				
				ClubData data = new ClubData();
				
				data.setClubName(temp[0]);
				data.setClubExp(temp[1]);
				data.setLimit(temp[2]);
				data.setPeople(temp[3]);
				
				clubDataList.add(data);
			}
			
		} catch (Exception e) {
			System.out.println("showClubList : " + e.toString());
		}
		
	}//readClubFile()
	
	private static void writeStudentFile() {
		
		Calendar now = Calendar.getInstance();
		
		String studentFilePath = "C:\\SchoolManagement\\" + schoolName + "\\"
				+ schoolName + "_Student" + "\\" + schoolName + "_" + now.get(Calendar.YEAR) + ".txt";
		
		try {
			
			BufferedWriter writer = new BufferedWriter(new FileWriter(studentFilePath, false));
			
			for(int i=0 ; i<studentDataList.size() ; i++) {
				
				Student data = studentDataList.get(i);
				
				//이름,학년,반,학기,동아리 ,국,영,수,과,평균				
				String line = String.format("%s,%s,%s,%s,%s,%s,%s,%s,%s,%s"
						, data.getName()				//이름
						, data.getGrade()				//학년
						, data.getClass()+""			//반
						, data.getSemester()			//학기
						, data.getClub()				//동아리
						, data.getKorAchiev()+""		//국어
						, data.getEngAchiev()+""		//영어
						, data.getMathAchiev()+""		//수학
						, data.getScienceAchiev()+""	//과학
						, data.getAverage()+"");		//평균
				
				writer.write(line);
				writer.newLine();
				
			}//for
			
			writer.close();
			
		} catch (Exception e) {
			System.out.println("writeClubFile : " + e.toString());
		}
		
		
	}//saveStudentFile();

	private static void readStudentFile() {
		
		Calendar now = Calendar.getInstance();
		
		String studentFilePath = "C:\\SchoolManagement\\" + schoolName + "\\"
				+ schoolName + "_Student" + "\\" + schoolName + "_" + now.get(Calendar.YEAR) + ".txt";
		
		try {
			
			BufferedReader reader = new BufferedReader(new FileReader(studentFilePath));
			
			String line = "";
			
			String[] temp = new String[4];
			
			while((line = reader.readLine()) != null) {
				
				temp = line.split(",");
				
				Student data = new Student();
				
				data.setName(temp[0]);			//학생 이름
				data.setGrade(temp[1]);			//학생 학년
				data.setClassNum(temp[2]);		//학생 반
				data.setSemester(temp[3]);		//학생 학기
				data.setClub(temp[4]);			//학생 동아리
				data.setKorAchiev(temp[5]);		//학생 국어점수
				data.setEngAchiev(temp[6]);		//학생 영어점수
				data.setMathAchiev(temp[7]);	//학생 수학점수
				data.setScienceAchiev(temp[8]);	//학생 과학점수
				data.setAverage(temp[9]);		//학생 평균점수
				
				studentDataList.add(data);
				
			}
			
		} catch (Exception e) {
			System.out.println("showClubList : " + e.toString());
		}
		
	}//readClubFile()
	
	private static void showClubList() {
		
		Calendar now = Calendar.getInstance();
		int number = 1;
		
		String clubFilePath = "C:\\SchoolManagement\\" + schoolName + "\\"
				+ schoolName + "_Club" + "\\" + "Club_" + now.get(Calendar.YEAR) + ".txt";
		
		try {
			
			BufferedReader reader = new BufferedReader(new FileReader(clubFilePath));
			
			String line = "";
			
			String[] temp = new String[4];
			
			System.out.println("========================================================================");
			System.out.println("                                                                동아리 리스트");
			System.out.println("========================================================================");
			
			while((line = reader.readLine()) != null) {
				
				temp = line.split(",");
				
				clubNameList.put(number, temp[0]);
				System.out.printf("%d. %s\n", number, temp[0]);
				number++;
			}
			
			System.out.print("원하는 동아리를 선택하세요 : ");
			String sel = scan.nextLine();
			System.out.println();
			
			if(Integer.parseInt(sel) >= 0 && Integer.parseInt(sel) <= clubNameList.size()) {
				clubName = clubNameList.get(Integer.parseInt(sel));
			} else {
				System.out.println("올바른 값을 입력해주세요.");
				showClubList();
			}
			
		} catch (Exception e) {
			System.out.println("showClubList : " + e.toString());
		}
		
	}//showClubList()
	
	private static void showClubInfo(String showClubName) {
		
		Calendar now = Calendar.getInstance();
		
		String clubFilePath = "C:\\SchoolManagement\\" + schoolName + "\\"
				+ schoolName + "_Club" + "\\" + "Club_" + now.get(Calendar.YEAR) + ".txt";
		
		String[] info = new String[4];
		
		try {
			
			BufferedReader reader = new BufferedReader(new FileReader(clubFilePath));
			
			String line = "";
					
			while((line = reader.readLine()) != null) {
				if(line.startsWith(showClubName)) {
					info = line.split(",");
				}
			}//while
			
			System.out.println("========================================================================");
			System.out.println("                                                                 동아리 정보");
			System.out.println("========================================================================");
			System.out.println(info[0]);
			System.out.println();
			System.out.println(info[1]);
			System.out.println();
			System.out.println();
			System.out.printf("정원 : %s           신청인원 : %s ", info[2], info[3]);
			System.out.println();
			System.out.println();
			
			System.out.println("신청(1), 관리(2), 나가기(3)을 입력하시오.");
			String select = scan.nextLine();
			
			if(select.equals("1")) {
				
				if(level != 1) {
					System.out.println("동아리 신청은 학생만 가능합니다.");
					showClubInfo(clubName);
				}				
				applyClub();
			} else if(select.equals("2")) {
				
				if(level != 2) {
					System.out.println("동아리 관리는 교사만 가능합니다.");
					showClubInfo(clubName);
				}
				
				modifyClub();
			} else if(select.equals("3")) {
				showClubList();
			}
			
		} catch (Exception e) {
			System.out.println("showClubInfo : " + e.toString());
		}
		
	}//showClubInfo(String showClubName)

	private static void applyClub() {
		
		//학생 데이터
		//	- 이름[0],학년[1],반[2],학기[3],동아리[4],국[5],영[6],수[7],과[8]
		
		//동아리 데이터
		//	- 동아리명[0],동아리내용[1],정원[2],신청인원[3]
		
		Calendar now = Calendar.getInstance();
		
		String studentFilePath = "C:\\SchoolManagement\\" + schoolName + "\\"
							+ schoolName + "_Student" + "\\" + schoolName + "_" + now.get(Calendar.YEAR) + ".txt";
		
		String clubFilePath = "C:\\SchoolManagement\\" + schoolName + "\\"
							+ schoolName + "_Club" + "\\" + "Club_" + now.get(Calendar.YEAR) + ".txt";
		
		String line = "";
		
		try {
			
			BufferedWriter writerStudent = new BufferedWriter(new FileWriter(studentFilePath, false));
			BufferedWriter writerClub = new BufferedWriter(new FileWriter(clubFilePath, false));
			
			for(int i=0 ; i<clubDataList.size() ; i++) {
				
				ClubData data = clubDataList.get(i);
				
				if(Integer.parseInt(data.getPeople()) < Integer.parseInt(data.getLimit())) {				
					if(clubName.equals(data.getClubName())) {
						
						int people = Integer.parseInt(data.getPeople());
						
						people += 1;
						
						String temp = people +"";
						
						clubDataList.get(i).setPeople(temp);
						break;
					}					
				} else {
					System.out.println("정원이 가득 찼습니다.");
				}
				
			}//for
			
			for(int i=0 ; i<studentDataList.size() ; i++) {
				
				Student StudentData = studentDataList.get(i);
				
				if(studentName.equals(StudentData.getName())) {
					
					StudentData.setClub(clubName);
					break;
				}
				
			}//for			
			
			writeClubFile();
			writeStudentFile();
			
		} catch (Exception e) {
			System.out.println("applyClub : " + e.toString());
		}		
		
	}//applyClub()

	private static void modifyClub() {
		
		System.out.println("========================================================================");
		System.out.println("                                                              동아리 정보 수정");
		System.out.println("========================================================================");
		System.out.println("1.이름 수정");
		System.out.println();
		System.out.println("2.내용 수정");
		System.out.println();
		System.out.println("3.정원 수정(10~20)");
		System.out.println();
		System.out.println();
		System.out.println();
		System.out.println("수정하고 싶은 메뉴를 선택하시오.");
		
		String sel = scan.nextLine();
		
		switch(sel){
			
			case "1":
				changeClubName();
				break;
			case "2":
				changeClubExp();
				break;
			case "3":
				changeClubFull();
				break;	
		
		}
		
	}//modifyClub()

	private static void changeClubFull() {
		
		for(int i=0 ; i<clubDataList.size() ; i++) {
			
			String desExp = clubDataList.get(i).getClubName();
			
			if(clubName.equals(desExp)) {
				
				System.out.printf("기존 정원 : %s\n\n", clubDataList.get(i).getLimit());
				
				System.out.print("바꿀 정원 입력 : ");
				String changedClubLimit = scan.nextLine();
				
				clubDataList.get(i).setLimit(changedClubLimit);
				break;
			}				
							
		}//for
		
		writeClubFile();
		
	}//changeClubFull()

	private static void changeClubExp() {
		
		for(int i=0 ; i<clubDataList.size() ; i++) {
			
			String desExp = clubDataList.get(i).getClubName();
			
			if(clubName.equals(desExp)) {
				
				System.out.printf("기존 내용 : %s\n\n", clubDataList.get(i).getClubExp());
				
				System.out.print("바꿀 내용 입력 : ");
				String changedClubExp = scan.nextLine();
				
				clubDataList.get(i).setClubExp(changedClubExp);
				break;
			}				
		}//for
		
		writeClubFile();
		
	}//changeClubExp()

	private static void changeClubName() {
		
		for(int i=0 ; i<clubDataList.size() ; i++) {
			
			String desName = clubDataList.get(i).getClubName();
			
			if(clubName.equals(desName)) {
				
				System.out.printf("기존 동아리 이름 : %s\n\n", desName);
				
				System.out.print("바꿀 이름 입력 : ");
				String changedClubName = scan.nextLine();
				
				clubDataList.get(i).setClubName(changedClubName);
				break;
			}				
		}//for
		
		writeClubFile();
			
	}//changeClubName();

	private static void makeClub() {
		
		Calendar now = Calendar.getInstance();
		boolean flag = true;
		String clubFilePath = "C:\\SchoolManagement\\" + schoolName + "\\"
				+ schoolName + "_Club" + "\\" + "Club_" + now.get(Calendar.YEAR) + ".txt";
		
		if(level != 2) {
			System.out.println("동아리 등록은 교사만 가능합니다.");
			return;
		}//if
		
		System.out.println("========================================================================");
		System.out.println("                               CA(개발)활동 등록");
		System.out.println("========================================================================");
		
		try {
			
			BufferedWriter writer = new BufferedWriter(new FileWriter(clubFilePath, true));
			
			
			String newClubName = ""; //새로 입력받은 동아리 이름을 저장할 변수
			while(flag) {
				System.out.print("동아리 이름 : ");
				newClubName = scan.nextLine();	//새로운 동아리 이름을 입력받음
			
				if(clubNameList.containsValue(newClubName)){	//이미 등록된 동아리이면 경고 후 다시
					System.out.println("이미 등록된 동아리 입니다.");
					flag = true;
				} else {
					flag = false;
				}
			}
			
			int full = 0;
			
			System.out.print("동아리 내용 : ");
			String newClubExp = scan.nextLine();	//동아리 내용을 입력받음
			
			flag = true;
			
			while(flag) {
				System.out.print("정원(10~20) : ");
				full = Integer.parseInt(scan.nextLine());
				
				if(full<=20 && full>=10) {	//정원이 미달이거나 초과시 경고 출력
					flag = false;
				} else if(full == 0){
					System.out.println("정원이 0명일 수 없습니다.");
				}else {
					System.out.println("정원에 맞게 입력해주세요.");
					flag = true;
				}
			}//while			
			
			String save = String.format("%s,%s,%d,0" //동아리명, 동아리 내용, 동아리 정원, 동아리 인원수
										, newClubName
										, newClubExp
										, full);
			
			writer.write(save);
			writer.newLine();
			
			writer.close();

			System.out.println("동아리 등록이 정상적으로 완료되었습니다.");
			
			readClubFile();
			
		} catch (Exception e) {
			System.out.println("makeClub : " + e.toString());
		}
		
	}//makeClub();

}//Class Club































