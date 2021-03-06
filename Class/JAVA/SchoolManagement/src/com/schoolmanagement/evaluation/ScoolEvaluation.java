package com.schoolmanagement.evaluation;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Properties;
import java.util.Scanner;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.schoolmanagement.auth.Login;

public class ScoolEvaluation {

	public static String schoolName = "";
	private static String teacherName = "";
	private static Scanner scan;
	private static ArrayList<Evaluation> list;
	private static ArrayList<Teacher> teacherList;
	private static ArrayList<Teacher> blackList;
	
	static {
		scan = new Scanner(System.in);
		list = new ArrayList<Evaluation>();
		teacherList = new ArrayList<Teacher>();
		blackList = new ArrayList<Teacher>();
	}
	
//	public static void main(String[] args) throws Exception {
//		
//		evaluation();	
//		
//	}

	public static void evaluation() {
		System.out.println("========================================================================");
		System.out.println("                                                       종목별 평가 하기/보기 선택");
		System.out.println("========================================================================");
	
//		boolean loop = true;
		
//		while(loop) {
			
			System.out.println("1.평가 하기");
			System.out.println("2.평가 보기");
			System.out.println("3. 나가기");
			System.out.print("메뉴입력 : ");
			
			String sel = scan.nextLine();
			
			if (sel.equals("1")) {
				doevaluation();
			} else if (sel.equals("2")) {
				seeevaluation();
			} else if (sel.equals("3")) {
				return;
			}
			
			sel = scan.nextLine();
			
			if (sel.equals("1")) {
				doevaluation();
			} else if (sel.equals("2")) {
				seeevaluation();
			} else if (sel.equals("3")) {
				return;
			}
			
//			else {
//				loop = false;
//			}
			
//		}
	}

	private static void seeevaluation() {
		
		System.out.println("========================================================================");
		System.out.println("                                                              종목별 평가 보기");
		System.out.println("========================================================================");
		
//		boolean loop = true;
		
//		while(loop) {
			System.out.println("1.학교 평가");
			System.out.println("2.교사 평가");
			System.out.println("3.급식 평가");
			System.out.println("메뉴입력 : ");
			
			String sel = scan.nextLine();
			
			if (sel.equals("1")) {
				showschoolevaluation();
			} else if (sel.equals("2")) {
				showteacherevaluation(); 	
			} else if (sel.equals("3")) {
				showmealevaluation();
			}
//			else if (sel.equals("4")) {
//				loop = false;
//			}
			
//			scan.close();
//		}
		
	}

	private static void showmealevaluation() {
		
		System.out.println("========================================================================");
		System.out.println("                                                               급식 평가 보기");
		System.out.println("========================================================================");

		String path = "C:\\SchoolManagement\\" + schoolName + "\\" + schoolName + "_Evaluation\\meal.txt";
		
		int sum = 0;
		int count = 0;
		double avg = 0;
		
		try {
			
			BufferedReader reader = new BufferedReader(new FileReader(path));
			
			String line = "";
			
			while ((line = reader.readLine()) != null) {
				
				String[] splitedStr = line.split(",");
				
				sum += Integer.parseInt(splitedStr[1]) + Integer.parseInt(splitedStr[2]) + Integer.parseInt(splitedStr[3]) + Integer.parseInt(splitedStr[4])
							+ Integer.parseInt(splitedStr[5]); 
				
				count += 5;
				
			}
			
			avg = (double)(sum/count);
				
			System.out.printf("평점 : %.1f점\n", (double)(sum/count));
			
//			if(sum > 400 && sum <= 500) {
//				System.out.println("이 학교의 등급은 'a' 입니다.");
//			} else if(sum > 300 && sum <= 400) {
//				System.out.println("이 학교의 등급은 'b' 입니다.");
//			} else if(sum > 200 && sum <= 300) {
//				System.out.println("이 학교의 등급은 'c' 입니다.");
//			} else if(sum <= 200) {
//				System.out.println("이 학교의 등급은 'd' 입니다.");
//			}
			
			
			if(avg > 80 && avg <= 100) {
				System.out.println("이 교사의 등급은 'a' 입니다.");
			} else if(avg > 60 && avg <= 80) {
				System.out.println("이 교사의 등급은 'b' 입니다.");
			} else if(avg > 40 && avg <= 60) {
				System.out.println("이 교사의 등급은 'c' 입니다.");
			} else if(avg <= 40) {
				System.out.println("이 교사의 등급은 'd' 입니다.");
			}
			
			reader.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		boolean loop = true;
	
		//while
//		while(loop) {
			
			System.out.println("1.경고 메일 보내기");
			System.out.println("2.나가기");
			System.out.print("메뉴입력 : ");
			
			String sel2 = scan.nextLine();
			
			
			if (sel2.equals("1")) {
				warning();
			} else if (sel2.equals("2")) {
				Login.showMenu();
			} else {
				loop = false;
			}
			
			
//		}
	}

//	private static void exit() {
//		
//		int num = 0;
//		
//		if(num == 0) {
//			System.out.println("");
//			System.exit(0);
//		}
//		
//	}


	private static void fire(String teacherName) {
		
		String teacherPath = "C:\\SchoolManagement\\" + schoolName + "\\" + schoolName + "_Teacher.txt";
		String teacherEvalPath = "C:\\SchoolManagement\\" + schoolName + "\\" + schoolName + "_Evaluation\\teacher.txt";
		String blackListPath = "C:\\SchoolManagement\\blacklist.txt";
		
		try {
			
			BufferedWriter blackWriter = new BufferedWriter(new FileWriter(blackListPath, true));
			BufferedReader teacherEvalReader = new BufferedReader(new FileReader(teacherEvalPath));
			
			String line = "";
			
			while ((line = teacherEvalReader.readLine()) != null) {
				
				String[] temp = line.split(",");
				
				if(Integer.parseInt(temp[5]) <= 40) {
					
					Teacher data = new Teacher();
					
					data.setTeacherName(temp[0]);
					data.setPosition(temp[1]);
					data.setDepartment(temp[2]);
					data.setSubject(temp[3]);
					data.setClassTeacher(temp[4]);
					
					blackList.add(data);
				}
			}//while
			
			for(int i=0 ; i<blackList.size() ; i++) {
				for(int j=0 ; j<blackList.size() ; j++) {
					if(teacherList.get(j).getTeacherName().equals(blackList.get(i).getTeacherName())) {
						teacherList.remove(i);
						System.out.println(teacherList.get(i).getTeacherName() + "는 해고되었습니다.");
					}					
				}				
			}//for
			
			for(Teacher t : blackList) {
				
				String temp = String.format("%s,%s,%s,%s,%s"
											, t.getTeacherName()
											, t.getPosition()
											, t.getDepartment()
											, t.getSubject()
											, t.getClassTeacher());
				blackWriter.write(temp);
				
			}
			
			blackWriter.close();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

	
	private static void showteacherevaluation() {
		
		double avg = 0;
		double sum = 0.0;
		double count = 0;
		
		try {
			String path = "C:\\SchoolManagement\\" + schoolName + "\\" + schoolName + "_Teacher.txt";
			
			BufferedReader reader = new BufferedReader(new FileReader(path));
			System.out.println("========================================================================");
			System.out.println("                                                               교사 평가 보기");
			System.out.println("========================================================================");
			System.out.println("[관리자, 학생 학부모]");
			String line = "";
			
			System.out.print("교사 검색(이름) : ");
			String name = scan.nextLine();
				
			while ((line = reader.readLine()) != null) {

				String[] temp = line.split(",");
					
				if (name.equals(temp[0])) {
					System.out.printf("%s %s %s %s\n", temp[0], temp[3], temp[4], temp[2]);
					break;					
				}
				
			}
			
			String path1 = "C:\\SchoolManagement\\" + schoolName + "\\" + schoolName + "_Evaluation\\teacher.txt";
			
			BufferedReader reader1 = new BufferedReader(new FileReader(path1));
			String line1 = "";
//			String[] splitedStr = null;
			
			while ((line1 = reader1.readLine()) != null) {
				
//				splitedStr = null;
				String[] splitedStr = line1.split(",");
				if(name.equals(splitedStr[4])) {
					for (int i = 0; i < 4; i++) {
						
						splitedStr[i] = splitedStr[i].trim();
						sum += Integer.parseInt(splitedStr[i]);
						count++;
					
					}
				}
//				System.out.println("sum : " + sum);
//				System.out.println("count : " + count);
				
				avg = sum/count;
				
			}
			System.out.printf("평점 : %.1f점\n", avg);
			
			if(avg > 80 && avg <= 100) {
				System.out.println("이 교사의 등급은 'a' 입니다.");
			} else if(avg > 60 && avg <= 80) {
				System.out.println("이 교사의 등급은 'b' 입니다.");
			} else if(avg > 40 && avg <= 60) {
				System.out.println("이 교사의 등급은 'c' 입니다.");
			} else if(avg <= 40) {
				System.out.println("이 교사의 등급은 'd' 입니다.");
			}
			
			reader.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		boolean loop = true;
		
//		while(loop) {
			
			System.out.println("1.경고 메일 보내기");
			System.out.println("2.나가기");
			System.out.print("메뉴입력 : ");
			
			String sel2 = scan.nextLine();
			
			
			if (sel2.equals("1")) {
				warning();
			} else if (sel2.equals("2")) {
				Login.showMenu();
			} else {
				loop = false;
			}	
			
//		}
	}
	
	private static void showschoolevaluation() {
		
		
		System.out.println("========================================================================");
		System.out.println("                                                               학교 평가 보기");
		System.out.println("========================================================================");

		String path = "C:\\SchoolManagement\\" + schoolName + "\\" + schoolName + "_Evaluation\\school.txt";
		
		double avg = 0;
		double sum = 0;
		double count = 0;
		
		try {
			
			BufferedReader reader = new BufferedReader(new FileReader(path));
			
			String line = null;
			String[] splitedStr = null;
			
			while ((line = reader.readLine()) != null) {
				
				splitedStr = null;
				splitedStr = line.split(",");
				
				for (int i = 0; i < splitedStr.length; i++) {
					splitedStr[i] = splitedStr[i].trim();
					sum += Integer.parseInt(splitedStr[i]);
					count++;
				}				
			}
			
			avg = sum/count;
			
			System.out.printf("평점 : %.1f점\n", avg);
			
			if(avg > 80 && avg <= 100) {
				System.out.println("이 학교의 등급은 'a' 입니다.");
			} else if(avg > 60 && avg <= 80) {
				System.out.println("이 학교의 등급은 'b' 입니다.");
			} else if(avg > 40 && avg <= 60) {
				System.out.println("이 학교의 등급은 'c' 입니다.");
			} else if(avg <= 40) {
				System.out.println("이 학교의 등급은 'd' 입니다.");
			}
			
			reader.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		boolean loop = true;
	
		//while
//		while(loop) {
			
			System.out.println("1.경고 메일 보내기");
			System.out.println("2.나가기");
			System.out.print("메뉴입력 : ");
			
			String sel2 = scan.nextLine();
//			SendEmail test = new SendEmail();
			
			if (sel2.equals("1")) {
				warning();
			} else if (sel2.equals("2")) {
				Login.showMenu();
			} else {
				loop = false;
			}
			
			sel2 = scan.nextLine();
			
			
			
//		}
	}
	

	private static void warning() {
		
		System.out.print("메일 주소 입력 : ");		
		String to = scan.nextLine();

		String host     = "smtp.naver.com";
		final String user   = "doyeun0812";
		final String password  = "kl3912do9408";
		String port = "587";

		
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", port);
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			
			System.out.print("메일 제목 입력 : ");
			String title = scan.nextLine();
			message.setSubject("[경고]" + title, "UTF-8");

			System.out.print("메일 내용 입력 : ");
			String content = scan.nextLine();
			message.setText(content, "UTF-8");
	
			Transport.send(message);
			System.out.println("메일이 성공적으로 전송되었습니다.");
	
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		evaluation();
		
	}

	private static void doevaluation() {
		
		System.out.println("========================================================================");
		System.out.println("                                                               평가 세부목록");
		System.out.println("========================================================================");
		
		boolean loop = true;
		
//		while(loop) {
			
			System.out.println("1.학교 평가");
			System.out.println("2.교사 평가");
			System.out.println("3.급식 평가");
			System.out.print("메뉴입력 : ");
			
			String sel2 = scan.nextLine();
			
			
			if (sel2.equals("1")) {
				schoolevaluation();
			} else if (sel2.equals("2")) {
				teacherevaluation();
			} else if (sel2.equals("3")) {
				mealevaluaton();
			} 
			else {
				loop = false;
			}
			
			evaluation();
			
//		}
		
//		scan.close();
		
	}

//	private static void load() {
//		
//		String path = "C:\\SchoolManagement\\" + schoolName + "\\" + schoolName + "_Teacher.txt";
//		
//		try {
//			
//			BufferedReader reader = new BufferedReader(new FileReader(path));
//			
//			String line = "";
//			
//			while ((line = reader.readLine()) !=null) {
//				
//				String[] temp = line.split(",");
//				
//				Evaluation evaluation = new Evaluation();
//				
//				evaluation.setFacility(temp[0]);
//				evaluation.setLocation(temp[1]);
//				evaluation.setScholarship(temp[2]);
//				evaluation.setWalfare(temp[3]);
//				
//				list.add(evaluation);
//				
//			}
//			reader.close();
//			
//		} catch (Exception e) {
//			System.out.println("load : " + e.toString());
//		}
//		
//	}
//
//	private static void saveSchoolEvaluation() {
//		
//		String path = "C:\\SchoolManagement\\" + schoolName + "\\" + schoolName + "_Evaluation\\school.txt";
//		
//		try {
//			
//			BufferedWriter writer = new BufferedWriter(new FileWriter(path));
//			
//			for (Evaluation evaluation : list) {
//				
//				String line = String.format("%s,%s,%s,%s"
//											, evaluation.getFacility()
//											, evaluation.getLocation()
//											, evaluation.getScholarship()
//											, evaluation.getWalfare());
//				
//				writer.write(line);
//				writer.newLine();
//				
//			}
//			
//		} catch (Exception e) {
//			System.out.println("save : " + e.toString());
//		} 
//			
//
//		
//	}

	private static void mealevaluaton() {
	
		
		System.out.println("========================================================================");
		System.out.println("                                                               급식 평가 하기");
		System.out.println("========================================================================");
		System.out.println("[관리자, 학생 학부모]");
		System.out.println("월봉고등학교 급식 평가");
		System.out.println("평가등급 ( a = 100, b = 80, c = 60, d = 40)");
		System.out.println("(평가등급은 숫자로 입력하시오.)");
		
		String path = "C:\\SchoolManagement\\" + schoolName + "\\" + schoolName + "_Evaluation\\meal.txt";

//		String studentFilePath = "D:\\SchoolManagement\\" + schoolName + "\\"
//				+ schoolName + "_Student" + "\\" + schoolName + "_" + now.get(Calendar.YEAR) + ".txt";
		
		try {
			
			BufferedWriter writer = new BufferedWriter(new FileWriter(path, true));
			
			int amount, quality, clean, balance, taste;
			
			System.out.println("양 : ");
			amount = scan.nextInt();
			
			System.out.println("질 : ");
			quality = scan.nextInt();
			
			System.out.println("청결 : ");
			clean = scan.nextInt();
			
			System.out.println("영양소 균형 : ");
			balance = scan.nextInt();
			
			System.out.println("맛 : ");
			taste = scan.nextInt();
			
			String temp = String.format(" ,%s,%s,%s,%s,%s", amount, quality, clean, balance, taste);
			
			writer.write(temp);
			writer.newLine();
			
			writer.close();
			
			evaluation();
			
		} catch (Exception e) {
			System.out.println("mealevaluaton : " + e.toString());
		}		
		
		
		
//		scan.close();
	
	}

	private static void teacherevaluation() {
		
		String teacherPath = "C:\\SchoolManagement\\" + schoolName + "\\" + schoolName + "_Teacher.txt";
		
		try {
			
			BufferedReader reader = new BufferedReader(new FileReader(teacherPath));
			
			System.out.println("========================================================================");
			System.out.println("                                                               교사 평가 하기");
			System.out.println("========================================================================");
			System.out.println("[관리자, 학생 학부모]");
			String line = "";
			
			System.out.println("교사 검색(이름) : ");
			String name = scan.nextLine();
			
			while ((line = reader.readLine()) != null) {

				String[] temp = line.split(",");
				
				if (name.equals(temp[0])) {
					System.out.printf("%s %s %s %s\n", temp[0], temp[3], temp[4], temp[2]);
					break;					
				}

			} 
			
			reader.close();
		
		
		System.out.println("평가등급 ( a = 100, b = 80, c = 60, d = 40 )");
		System.out.println("(평가등급은 숫자로 입력하시오.)");
		
		String evaluationPath = "C:\\SchoolManagement\\" + schoolName + "\\" + schoolName + "_Evaluation\\teacher.txt";
		BufferedWriter valueWriter = new BufferedWriter(new FileWriter(evaluationPath, true));
		
		
		int readiness, interest, ability, leading;
		
		System.out.println("수업 준비도 : ");
		readiness = scan.nextInt();
		
		System.out.println("학생 관심도 : ");
		interest = scan.nextInt();
		
		System.out.println("수업 능력 : ");
		ability = scan.nextInt();
		
		System.out.println("생활 지도 : ");
		leading = scan.nextInt();
		
//		double avg = (((double)readiness + (double)interest + (double)ability + (double)leading)/(double)4);
		
		String temp = String.format("%d,%d,%d,%d,%s", readiness, interest, ability, leading, name);
		
		valueWriter.write(temp);
		valueWriter.newLine();
	
		valueWriter.close();
		
		} catch (Exception e) {
			System.out.println("teacherevaluation : " + e.toString());
		}
		
	}

	

	private static void schoolevaluation() {
		
		//Scanner scan = new Scanner(System.in);
		
		System.out.println("========================================================================");
		System.out.println("                                                               학교 평가 하기");
		System.out.println("========================================================================");
		System.out.println("[관리자, 학생 학부모]");
		System.out.println("월봉고등학교 평가");
		System.out.println("평가등급 ( a = 100, b = 80, c = 60, d = 40)");
		System.out.println("(평가등급은 숫자로 입력하시오.)");
		
		String path = "C:\\SchoolManagement\\" + schoolName + "\\" + schoolName + "_Evaluation\\school.txt";
		
		try {
			
			BufferedWriter writer = new BufferedWriter(new FileWriter(path, true));
			
			int facility, location, scholarship, walfare;
			
			System.out.println("시설 : ");
			facility = scan.nextInt();
			
			System.out.println("위치(대중교통) : ");
			location = scan.nextInt();
			
			System.out.println("장학금 제도 : ");
			scholarship = scan.nextInt();
			
			System.out.println("복지 제도 : ");
			walfare = scan.nextInt();
			
			String temp = String.format("%s,%s,%s,%s", facility, location, scholarship, walfare);
			
			writer.write(temp);
			
			writer.newLine();
			writer.close();
			//scan.close();
			evaluation();
			
		} catch (Exception e) {
			System.out.println("schoolevaluation : " + e.toString());
		}
		
//		load();
//		save();
	}	
	
	
}


