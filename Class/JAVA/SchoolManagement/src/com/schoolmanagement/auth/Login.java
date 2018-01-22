package com.schoolmanagement.auth;


import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Scanner;

import com.schoolmanagement.achievement.Achievement;
import com.schoolmanagement.board.Board;
import com.schoolmanagement.club.Club;
import com.schoolmanagement.evaluation.ScoolEvaluation;
import com.schoolmanagement.info.SchoolInfo;


public class Login {

	public static String schoolName;
	Scanner scan = new Scanner(System.in);
	
	public static ArrayList<Auth> join;
	
	static {
		
		join = new ArrayList<Auth>();
	}
	//static 
	
	
	

	public static void loginStart() {
		boolean loop = true;
		
		
		
		while(loop) {
			
			loginShow();
			
			
			
		} //while
		
		System.out.println("프로그램 종료");
	}

	

	private static void loginShow() {
		
		Scanner scan = new Scanner(System.in);
		
		System.out.println("========================================================================");
		System.out.println("                                                       고등학교 메뉴 관리 프로그램");
		System.out.println("========================================================================");
		
		System.out.println("원하시는 메뉴를 선택하여 주십시오.");
		System.out.println("1. 로그인");
		System.out.println("2. 회원가입");
		
		String num =  scan.nextLine();
		
		
		
		
		
		
		
		
		if(num.equals("1") ) {

			loginMenu();
			schoolsearch();
			showMenu();
			
			
		}else if(num.equals("2")) {
			
			
		signUp();
		
		
			
		}else {
			
			
			System.out.println("잘못된 값을 입력하셧습니다. 1과 2중 하나의 숫자를 입력하여 주세요.");
			loginShow();
		}
	}



	public static void showMenu() {
		
		
		
		
	
		
		Scanner scan = new Scanner(System.in);
		
		String schoolPath = "C:\\SchoolManagement\\" + schoolName; // "C:\\SchoolManagement\\" + schoolName;
		
		//System.out.println(schoolPath);  //학교위치
				
		System.out.println("========================================================================");
		System.out.println("                                                                  주요 메뉴");
		System.out.println("========================================================================");
	
		
		System.out.println("1. 학교 정보");
		System.out.println("2. 평가 하기/보기");
		System.out.println("3. 게시판 관리");
		System.out.println("4. 성적 관리");
		System.out.println("5. CA(개발)활동");
		System.out.println("원하시는 메뉴를 선택하시오 :");
		String menuSelect = scan.nextLine();
		
		


		if(menuSelect.equals("1")){
			//SchoolInfo 학교정보
			SchoolInfo.schoolInfo();
		}else if(menuSelect.equals("2")){
			//평가하기
			ScoolEvaluation.evaluation();
		}else if(menuSelect.equals("3")){
			//게시판 관리
			Board.load();
		}else if(menuSelect.equals("4")){
			//성적관리
			Achievement.achievement();
		}else if(menuSelect.equals("5")){
			//ca(개발) 활동
			Club.startClubMenu();
		}

				
		
	} //showMenu





	private static void signUp() {
		
		Scanner scan = new Scanner(System.in);
		boolean idBoolean = true;
		boolean pwdBoolean = true;
		
		
		Auth j = new Auth();
		
		try {
			
			String file ="C:\\SchoolManagement\\Member\\member.txt"; 
			
			FileWriter writer = new FileWriter(file,true);
		
		
		
			System.out.println("========================================================================");
			System.out.println("                                                                  회원 가입");
			System.out.println("========================================================================");
			System.out.print("아이디(8자 이내 영어(특수문자 제외)) :");
			String id = scan.nextLine();
			j.setId(id);
			//id 중복 검사
			try {
				
				String path = "C:\\SchoolManagement\\Member\\member.txt"; 
				String line ="";
				BufferedReader reader = new BufferedReader(new FileReader(path));
				
				while( (line = reader.readLine()) != null) {
					
					String [] result = line.split(","); //나누기
					
					if(id.equals(result[0])) {
						System.out.println("중복된 ID를 입력하셧습니다.");
						signUp();
					}
					
					reader.close();
				
				}
				
			} catch (Exception e) {
				System.out.println("signUp : " + e.toString());

			}
			
			////////////////////id 중복검사 종료
			
			char c = id.charAt(0);
			char [] listId = id.toCharArray();
			
			for(int i =0; i < id.length(); i++) {
			
				if( id.length() <=8  && ((65 <= listId[i]  && listId[i] <= 90) || (97 <= listId[i] && listId[i] <= 122))   ) {
					idBoolean = true;
					
				}else{
					idBoolean = false;
					System.out.println("잘못된 값을 입력하셧습니다.");
					signUp();
				}
			
			} //for
			
			
	
			
			
			
			if(idBoolean) {
				
				System.out.print("비밀번호(8자에서 12자이내):");
				String pwd = scan.nextLine();
				j.setPwd(pwd);
				
				if(8 <= pwd.length() && pwd.length() <=12 ) {
					System.out.println("1.교육부 2.교사 3.학생");
					Auth.level = scan.nextInt();
					
					
	
				
						
					
						
					writer.write(id +",");
					writer.write(pwd+",");
						
					writer.write(Auth.level+",");
					
						
						
				
					
					
					
					
					
					if(Auth.level ==1 || Auth.level ==2) {
						writer.write(", ");
						writer.write(", ");
						writer.write(", ");
						writer.write(", ");
						
					}else if(Auth.level ==3) {
						
						scan.skip("\r\n");
						System.out.print("4. 이름:");
						String name = scan.nextLine();
						if(name.length() <=5) {
							j.setName(name);
							writer.write(name+",");
							System.out.print("5. 학년:");
							String grade = scan.nextLine();
							if(grade.equals("1") || grade.equals("2") ||  grade.equals("3")) {
								j.setGrade(grade);
								writer.write(grade+",");
								System.out.print("6. 학급:");
								String ban = scan.nextLine();
								if(ban.equals("1") || ban.equals("2") || ban.equals("3") || ban.equals("4") || ban.equals("5") || 
								   ban.equals("6") || ban.equals("7") || ban.equals("8") || ban.equals("9") || ban.equals("10") ||
								   ban.equals("11") || ban.equals("12") || ban.equals("13") || ban.equals("14") || ban.equals("15") ||
								   ban.equals("16") || ban.equals("17") || ban.equals("18") || ban.equals("19") || ban.equals("20")) {
								
									
									j.setBan(ban);
									writer.write(ban+",");
									System.out.print("7. 학기:");
									String semester = scan.nextLine();
									
									if(semester.equals("1") || semester.equals("2")) {
										j.setSemester(semester);
										writer.write(semester+",");
										
									}else {
										System.out.println("1 ~ 2  중 하나의 숫자를 입력해 주십시오.");
										
										signUp();
										
									}
									
								}else {
									
									System.out.println("1 ~ 20까지  중 하나의 숫자를 입력해 주십시오.");
									
									signUp();
									
									
								}
								
								
								
							}else {
								
								System.out.println("1,2,3 중 하나의 숫자를 입력해 주십시오.");
								signUp();
								
							}
							
						}else {
							
							System.out.println("이름의 길이가 너무 깁니다.");
							signUp();
						}
												
							
						
					}else {
						System.out.println("1~3까지의 숫자를 입력하세요.");
						signUp();
					}
					
					
					
					
				}else {
					
					System.out.println("8자 이내 12자 이내의 비밀번호를 입력해주세요.");
					pwdBoolean = false;
					signUp();
				}
				
			
				
			
				
				
			}else {
				System.out.println("8자 이내 영어(특수문자 제외)를 입력해 주십시오.");
				signUp();
			}
			
				
			
				
			join.add(j);
			
			writer.write("\r\n");
			writer.close();
			
	
			System.out.println("회원가입에 성공하였습니다.");
		
		
		} catch (Exception e) {
			System.out.println("signUp : " + e.toString());

		}
			
		
	} //signUp

	private static void schoolsearch() {
		
		Scanner scan = new Scanner(System.in);
		
		System.out.println("========================================================================");
		System.out.println("                                                                  학교 검색");
		System.out.println("========================================================================");
		
		System.out.println("업무를 볼 학교 이름을 입력하십시오.");
		System.out.print("학교 이름 :");
		schoolName = scan.nextLine();
		Club.schoolName = schoolName; //추가해야 함 그래야 클럽이 됨
		Board.schoolName = schoolName;
		ScoolEvaluation.schoolName = schoolName;
		
	} //schoolsearch

	private static void loginMenu() {
		
		Scanner scan = new Scanner(System.in);
		
		System.out.println("========================================================================");
		System.out.println("                                                                   로 그 인");
		System.out.println("========================================================================");
		
		System.out.print("아이디 :");
		String id = scan.nextLine();
		
		System.out.print("비밀번호 : ");
		String pwd = scan.nextLine();
		
		
		
		
	
		
		
	
		try {
			
			String file ="C:\\SchoolManagement\\Id\\login.txt"; 
			
			FileWriter writer = new FileWriter(file,true);
			
			writer.write(id +",");
			writer.write(pwd);
			writer.write("\r\n");
			
			writer.close();
			
			
			
			
			
			
		} catch (Exception e) {
			System.out.println("main : " + e.toString());

		}
		
		////////////////////////////////////////////////////////////// 로그인 정보를 입력 
		
		boolean loginCheck = false;
		
		try {
			
			String path = "C:\\SchoolManagement\\Member\\member.txt"; 
			String line ="";
			BufferedReader reader = new BufferedReader(new FileReader(path));
			
			while( (line = reader.readLine()) != null) {
				
				String [] result = line.split(","); //나누기
			
				if(id.equals(result[0]) && pwd.equals(result[1]))  {
					
					Auth.level = Integer.parseInt(result[2]);
					Club.studentName = result[3]; // 추가해야 함 동아리 활동을 하기위해서
					loginCheck = true;
					break;
				}
				
				
				
				
			} //while
			
			
			//예외처리 존재하지 않은 id 비밀번호와 id가 일치하지 않습니다.? 
			if(loginCheck ==false) {
				System.out.println("id와 비밀번호가 일치하지 않습니다.");
				loginShow();
				
			}else {
				System.out.println("로그인에 성공하였습니다.");
				//System.out.println(Auth.level); level 전역변수 확인
			}
			
			
			reader.close();
			
		} catch (Exception e) {
			System.out.println("loginMenu : " + e.toString());

		}
		
		
		
		
		//로그인 파일을 읽어와서 id와 비밀번호를 저장
		
		
		
		
		//member 파일을 읽어와서 id와 비밀번호와 level을 저장
		
		
		
		
		
		
		
		// id와 비밀번호를 비교해서 서로 맞으면 로그인 성공 level을 전역변수에 넣고 다음 페이지 (학교 검색으로) 넘어간다. ( main에 메소드가 이미 만들어져 있어서 끝남)
		
		
		
		
		
		
		
		
		
		
		
	} //loginMenu
	
	
	
	
	
} // Login