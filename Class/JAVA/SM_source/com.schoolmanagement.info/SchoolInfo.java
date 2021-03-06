package com.schoolmanagement.info;

import java.io.BufferedReader;


import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.Scanner;

import com.schoolmanagement.auth.Auth;
import com.schoolmanagement.auth.Login;

public class SchoolInfo {
	

	public static void schoolInfo() {
		
		
	
	//	System.out.println(Auth.level);
	//	System.out.println(Login.schoolName);
	//확인
		
		//Auth.level = 1;
		//Login.schoolName = "공항고등학교"; //확인하기 위해서 넣은것 
		////// 실행하기 위해서 변수에 값 넣기/// 10개중 9개는 잘 나오는데 영덕 고등학교는 잘 안나옴 
		Scanner scan = new Scanner(System.in);
		
		try {
			
			String path = "C:\\SchoolManagement\\" +Login.schoolName + "\\" + Login.schoolName + "_Info.txt"; 
			String line ="";
			BufferedReader reader = new BufferedReader(new FileReader(path));
			
		while( (line = reader.readLine()) != null) {
				
				String [] result = line.split(","); //나누기
				
				System.out.println("===========================================");
				System.out.println("                 학교정보                  ");
				System.out.println("===========================================");
				
				System.out.println("이름\t\t\t: " +result[0]);
				System.out.println("주소\t\t\t: " +result[1]);
				System.out.println("연락처\t\t: " +result[2]);
				System.out.println("홈페이지\t\t: " +result[3]);
				System.out.println("설립일자\t\t: " +result[4]);
				System.out.println("학생 수\t\t: " +result[5]);
				System.out.println("학년별 인원수\t: " +result[6]);
				System.out.println("학급별 인원수\t: " +result[7]);
				System.out.println("학생 성비 \t\t: " +result[8]);
				System.out.println("교사 인원수 \t\t: " +result[9]);
				System.out.println("교사 성비 \t\t: " +result[10]);
				System.out.println("교사당 학생수 \t: " +result[11]);
				
				System.out.println("1. 교사 세부정보 보기");
				System.out.println("m. 학교 정보 수정(주소, 연락처, 홈페이지, 설립일자)" +result[0]);
				System.out.println("b. 메뉴로 돌아가기");
				String select = scan.nextLine();
				
				if( select.equals( "1") && (Auth.level ==1 || Auth.level == 3)) {
					teacherShow();
				}else if(select.equals("m") && Auth.level ==1) {
					SchoolModify();
				}
				else if (select.equals( "b")) {
					Login.showMenu(); //호출 합칠때
				}else {
					System.out.println("권한을 가지고 있지 않거나 유효하지 않은 숫자를 입력하셧습니다.");
					schoolInfo();
					
				}
				
				
				
			} //while
			
			
			
			
			reader.close();
			
		
		} catch (Exception e) {
			System.out.println("schoolInfo : " + e.toString());

		}
		
		
		
		
		
		
		
	} //schoolInfo

	
	
	
	
	

	
	private static void SchoolModify() {
		
		Scanner scan = new Scanner(System.in);
		
		System.out.println("===========================================");
		System.out.println("            학교정보 첨삭 메뉴            ");
		System.out.println("===========================================");
		
		System.out.println("1. 주소");
		System.out.println("2. 연락처");
		System.out.println("3. 홈페이지");
		System.out.println("4. 설립일자");
		System.out.println("수정하고 싶은 번호를 선택하여 주십시오.");
		String modifySchoolInfo = scan.nextLine();
		
		if(modifySchoolInfo.equals("1") ) {
			addressModify();
			schoolInfo();
			
		}else if(modifySchoolInfo.equals("2")) {
			telModify();
			schoolInfo();
		}else if(modifySchoolInfo.equals("3")) {
			homepageModify();
			schoolInfo();
		}else if(modifySchoolInfo.equals("4")) {
			dayModify();
			schoolInfo();
		}
		
		
		
		
	}

	private static void dayModify() {
		
		Scanner scan = new Scanner(System.in);
		
		try {
			
			System.out.println("===========================================");
			System.out.println("               학교정보 첨삭           ");
			System.out.println("===========================================");
			
			String path = "C:\\SchoolManagement\\" +Login.schoolName + "\\" + Login.schoolName + "_Info.txt";; //"E:\\SchoolManagement\\SchoolName\\월봉고등학교\\월봉고등학교_Info.txt"
			String line ="";
			String text ="";
			String day = "";
			BufferedReader reader = new BufferedReader(new FileReader(path));
			
			
			while( (line = reader.readLine()) != null) {
				
				String [] result = line.split(","); //나누기
				
				System.out.println(result[4]); //주소 화면 보여 줌
				day = result[4];
				text = text + line;
			}
			
			
			
			
			System.out.println("수정하고 싶은 내용을 입력하시오 :");
			String modify = scan.nextLine();
			
			text = text.replace(day,modify);
			reader.close();
			
			BufferedWriter writer = new BufferedWriter(new FileWriter("C:\\SchoolManagement\\" +Login.schoolName + "\\" + Login.schoolName + "_Info.txt")); 
			writer.write(text);
			writer.close();
			
			System.out.println("수정이 완료되었습니다.");
			
		} catch (Exception e) {
			System.out.println("addressModify : " + e.toString());

		}
		
		
		
		
		
	}

	private static void homepageModify() {
		Scanner scan = new Scanner(System.in);
		
		try {
			
			System.out.println("===========================================");
			System.out.println("               학교정보 첨삭           ");
			System.out.println("===========================================");
			
			String path = "C:\\SchoolManagement\\" +Login.schoolName + "\\" + Login.schoolName + "_Info.txt"; //E:\\SchoolManagement\\SchoolName\\월봉고등학교\\월봉고등학교_Info.txt"
			String line ="";
			String text ="";
			String homepage = "";
			BufferedReader reader = new BufferedReader(new FileReader(path));
			
			
			while( (line = reader.readLine()) != null) {
				
				String [] result = line.split(","); //나누기
				
				System.out.println(result[3]); //주소 화면 보여 줌
				homepage = result[3];
				text = text + line;
			}
			
			
			
			
			System.out.println("수정하고 싶은 내용을 입력하시오 :");
			String modify = scan.nextLine();
			
			text = text.replace(homepage,modify);
			reader.close();
			
			BufferedWriter writer = new BufferedWriter(new FileWriter("C:\\SchoolManagement\\" +Login.schoolName + "\\" + Login.schoolName + "_Info.txt")); //"E:\\\\SchoolManagement\\\\SchoolName\\\\월봉고등학교\\\\월봉고등학교_Info.txt"
			
			writer.write(text);
			writer.close();
			
			System.out.println("수정이 완료되었습니다.");
			
		} catch (Exception e) {
			System.out.println("addressModify : " + e.toString());

		}
		
		
		
		
	}

	private static void telModify() {
		
		Scanner scan = new Scanner(System.in);
		
		try {
			
			System.out.println("===========================================");
			System.out.println("               학교정보 첨삭           ");
			System.out.println("===========================================");
			
			String path = "C:\\SchoolManagement\\" +Login.schoolName + "\\" + Login.schoolName + "_Info.txt"; //E:\\SchoolManagement\\SchoolName\\월봉고등학교\\월봉고등학교_Info.txt
			String line ="";
			String text ="";
			String tel = "";
			BufferedReader reader = new BufferedReader(new FileReader(path));
			
			
			while( (line = reader.readLine()) != null) {
				
				String [] result = line.split(","); //나누기
				
				System.out.println(result[2]); //주소 화면 보여 줌
				tel = result[2];
				text = text + line;
			}
			
			
			
			
			System.out.println("수정하고 싶은 내용을 입력하시오 :");
			String modify = scan.nextLine();
			
			text = text.replace(tel,modify);
			reader.close();
			
			BufferedWriter writer = new BufferedWriter(new FileWriter("C:\\SchoolManagement\\" +Login.schoolName + "\\" + Login.schoolName + "_Info.txt")); //E:\\\\SchoolManagement\\\\SchoolName\\\\월봉고등학교\\\\월봉고등학교_Info.txt
			
			writer.write(text);
			writer.close();
			
			System.out.println("수정이 완료되었습니다.");
			
		} catch (Exception e) {
			System.out.println("addressModify : " + e.toString());

		}
		
		
		
	}

	private static void addressModify() {
		
		
		Scanner scan = new Scanner(System.in);
		
		try {
			
			System.out.println("===========================================");
			System.out.println("               학교정보 첨삭           ");
			System.out.println("===========================================");
			
			String path = "C:\\SchoolManagement\\" +Login.schoolName + "\\" + Login.schoolName + "_Info.txt";  //E:\\SchoolManagement\\SchoolName\\월봉고등학교\\월봉고등학교_Info.txt
			String line ="";
			String text ="";
			String address = "";
			BufferedReader reader = new BufferedReader(new FileReader(path));
			
			
			while( (line = reader.readLine()) != null) {
				
				String [] result = line.split(","); //나누기
				
				System.out.println(result[1]); //주소 화면 보여 줌
				address = result[1];
				text = text + line;
			}
			
			
			
			
			System.out.print("수정하고 싶은 내용을 입력하시오 :");
			String modify = scan.nextLine();
			
			text = text.replace(address,modify);
			reader.close();
			
			BufferedWriter writer = new BufferedWriter(new FileWriter("C:\\SchoolManagement\\" +Login.schoolName + "\\" + Login.schoolName + "_Info.txt")); //"E:\\\\SchoolManagement\\\\SchoolName\\\\월봉고등학교\\\\월봉고등학교_Info.txt"
			
			writer.write(text);
			writer.close();
			
			System.out.println("수정이 완료되었습니다.");
			
		} catch (Exception e) {
			System.out.println("addressModify : " + e.toString());

		}
		
		
		
		
		
		// 파일을 읽어와서 보여준 다음 사용자가 입력한 값을 가지고 프로그램 내용을 수정해야 함 
	}

	private static void teacherShow() {
		
		
		Scanner scan = new Scanner(System.in);
		
try {
			

			String path = "C:\\SchoolManagement\\" +Login.schoolName + "\\" + Login.schoolName + "_Teacher.txt"; //"E:\\SchoolManagement\\SchoolName\\월봉고등학교\\월봉고등학교_Teacher.txt"
			String line ="";
			int count = 1;
			BufferedReader reader = new BufferedReader(new FileReader(path));
			
			
			 //////////////////////0 ////////1/////2/////////3///////4/////////// 깔끔하게 보여주기 위해 노가다 코드 사용 반복문 사용x
			//System.out.println("순위\t성명\t직위\t\t사무\t 과목\t\t\t 담임");
			System.out.println("순위\t성명\t\t직위\t\t\t\t1사무\t\t\t\t과목\t\t\t담임");
			
			
			while( (line = reader.readLine()) != null) {
			
				String [] result = line.split(",");
				
				
				
				//System.out.println(String.format("%03d\t%s\t\t%s\t%s\t%s\t\t%s",count, result[0],result[1],result[2],result[3],result[4]));
				System.out.print(String.format("%3d\t",count));			
				System.out.print(String.format("%5s\t",result[0])); //성명
				
				
				//줄맞추기 노가다 직위 ///// 합이 15?
				if(result[1].length() ==2) {
					System.out.print(String.format("%-13s\t\t",result[1]));
				}else if(result[1].length() ==3) {
					System.out.print(String.format("%-12s\t\t",result[1]));
				}else if(result[1].length() ==4) {
					System.out.print(String.format("%-11s\t\t",result[1]));
				}else if(result[1].length() ==5) {
					System.out.print(String.format("%-10s\t\t",result[1]));
				}else if(result[1].length() ==6) {
					System.out.print(String.format("%-9s\t\t",result[1]));
				}else if(result[1].length() ==7) {
					System.out.print(String.format("%-8s\t\t",result[1]));
				}else if(result[1].length() ==8) {
					if( spaceCheck(result[1]) ==true) {
						System.out.print(String.format("%-11s\t\t",result[1]));
					}else if(spaceCheck(result[1]) == false) {
						System.out.print(String.format("%-11s\t",result[1]));
					}
					
				}else if(result[1].length() ==9) {
					System.out.print(String.format("%-11s\t",result[1]));
				}else if(result[1].length() ==10) {
					System.out.print(String.format("%-11s\t",result[1]));
				 
				}else if(result[1].length() ==11) {
					System.out.print(String.format("%-11s\t",result[1]));
				 
				}
				
				else if(result[1].length() ==1) {  //0일때
					System.out.print(String.format("%-15s\t\t\t",result[1]));
				 
				}
				
				//사무/////////////
				if(result[2].length() ==2) {
				
					System.out.print(String.format("%-13s\t\t",result[2]));
				}else if(result[2].length() ==3) {
					System.out.print(String.format("%-12s\t\t",result[2]));
				}else if(result[2].length() ==4) {
					System.out.print(String.format("%-11s\t\t",result[2]));
				}else if(result[2].length() ==5) {
					System.out.print(String.format("%-10s\t\t",result[2]));
				}else if(result[2].length() ==6) {
					System.out.print(String.format("%-9s\t\t",result[2]));
				}else if(result[2].length() ==7) {
					System.out.print(String.format("%-8s\t\t",result[2]));
				}else if(result[2].length() ==8) {
					System.out.print(String.format("%-15s\t",result[2]));
				}else if(result[2].length() ==9) {
					System.out.print(String.format("%-11s\t",result[2]));
				}else if(result[2].length() ==10) {
					System.out.print(String.format("%-11s\t",result[2]));
				}else if(result[2].length() ==1) {  //1일때
					System.out.print(String.format("%-15s\t\t\t",result[2]));
				 
				}
				
				//과목//
				if(result[3].length() ==2) {
					System.out.print(String.format("%-13s\t",result[3]));
				}else if(result[3].length() ==3) {
					System.out.print(String.format("%-12s\t",result[3]));
				}else if(result[3].length() ==4) {
					System.out.print(String.format("%-11s\t",result[3]));
				}else if(result[3].length() ==5) {
					System.out.print(String.format("%-10s\t",result[3]));
				}else if(result[3].length() ==6) {
					System.out.print(String.format("%-9s\t",result[3]));
				}else if(result[3].length() ==7) {
					System.out.print(String.format("%-8s\t",result[3]));
				}else if(result[3].length() ==8) {
					System.out.print(String.format("%-8s\t",result[3]));
				}else if(result[3].length() ==9) {
					System.out.print(String.format("%-11s\t",result[3]));
				}else if(result[3].length() ==10) {
					System.out.print(String.format("%-11s\t",result[3]));
				}else if(result[3].length() ==1) {  //1일때
					System.out.print(String.format("%-15s\t\t",result[3]));
				 
				}
				
				
				//담임//
				if(result[4].length() ==2) {
					System.out.print(String.format("%-13s\t",result[4]));
				}else if(result[4].length() ==3) {
					System.out.print(String.format("%-12s\t",result[4]));
				}else if(result[4].length() ==4) {
					System.out.print(String.format("%-11s\t",result[4]));
				}else if(result[4].length() ==5) {
					System.out.print(String.format("%-10s\t",result[4]));
				}else if(result[4].length() ==6) {
					System.out.print(String.format("%-9s\t",result[4]));
				}else if(result[4].length() ==7) {
					System.out.print(String.format("%-8s\t",result[4]));
				}else if(result[4].length() ==8) {
					System.out.print(String.format("%-11s\t",result[4]));
				}else if(result[4].length() ==9) {
					System.out.print(String.format("%-11s\t",result[4]));
				}else if(result[4].length() ==10) {
					System.out.print(String.format("%-11s\t",result[4]));
				}else if(result[4].length() ==1) {  //1일때
					System.out.print(String.format("%-15s\t\t",result[4]));
				 
				}
				
				
				
				
				System.out.println();
				
				count++;
			} //while
			
			
			System.out.println("메뉴로 돌아가기:(b)");
			String back = scan.nextLine();
			boolean keyCheck =true;
			
			if(back.equals("b")) {
				Login.showMenu();
				
			}else {
				
				
					teacherShow();
					System.out.println("돌아가려면 b키를 입력해 주십시오.");
					
					
				
				
			}
			
			
			reader.close();
			
			
			
		} catch (Exception e) {
			System.out.println("teacher : " + e.toString());

		}
		
		
	}
	
	//보여주는 화면 정리하기
	
	// 공백이 있는지 체크 
	public static boolean spaceCheck(String spaceCheck) {
		
		for(int i =0; i< spaceCheck.length(); i++) {
			if(spaceCheck.charAt(i) == ' ')
				return true;
		}
		
		return false;
	}
	
	
	
} //class SchoolInfo
