package com.test.lambda;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Ex09 {
	
	private static String txt2 = "";

	public static void main(String[] args) {
		
		//m1();
		//m2();
		//m3();
		//m4();
		//m5();
		//m6();
		m7();
	}

	private static void m7() {
		
		//사용자 입력값 유효성 검사
		Scanner scan = new Scanner(System.in);
		
		//4자 ~ 12자이내 + 필수입력 + 영문자,숫자,_ 조합 + 숫자로 시작 불가능
		System.out.print("아이디 입력 : ");
		String input = scan.nextLine();
		
		String regex = "^[a-zA-Z_]\\w{3,11}$";
		
		if (Pattern.matches(regex, input)) {
			
			System.out.println("올바른 아이디입니다.");
		} else {
			System.out.println("4자 ~ 12자이내 + 필수입력 + 영문자,숫자,_ 조합 + 숫자로 시작 불가능");
		}
	}

	private static void m6() {
		
		//사용자 입력값 유효성 검사
		Scanner scan = new Scanner(System.in);
		
		//한글만 가능 + 2자 ~ 4자이내 + 필수 입력
		System.out.print("이름 입력 : ");
		String input = scan.nextLine();
		
		String regex = "^[가-힣]{2,4}$";
		
		if (Pattern.matches(regex, input)) {
			
			System.out.println("올바른 이름입니다.");
		} else {
			System.out.println("한글만 가능 + 2자 ~ 4자이내 + 필수 입력");
		}
	}

	private static void m5() {
		
		//사용자 입력값 유효성 검사
		Scanner scan = new Scanner(System.in);
		
		//숫자 사용 + 1 ~ 3자리 이내 + 필수 입력
		System.out.print("나이 입력 : ");
		String input = scan.nextLine();
		
		//^ : startsWith
		//$ : endsWith
		//String regex = "^[0-9]{1,3}$"; //권장
		String regex = "[0-9]{1,3}";
		
		if (Pattern.compile(regex).matcher(input).find()) {
			
			System.out.println("올바른 나이입니다.");
		} else {
			
			System.out.println("숫자 사용 + 1 ~ 3자리 이내 + 필수 입력");
		}
		
		if (Pattern.matches(regex, input)) {
			
			System.out.println("올바른 나이입니다.");
		} else {
			
			System.out.println("숫자 사용 + 1 ~ 3자리 이내 + 필수 입력");
		}
	}

	private static void m4() {
		
		String txt = "안녕하세요. 홍길동입니다. 나이는 20살입니다. 연락처는 010-6543-0987입니다. 혹시 전화를 안받으면 010-6532-8765로 연락주세요.";
		
		//$0 : 정규식으로 찾은 문자열
		//$1 : 첫번째 () 내용
		//$2 : 두번째 () 내용
		//$3 : 세번째 () 내용
		//$9 : 아홉번째 () 내용
		
		//String result = txt.replaceAll("[0-9]{3}-[0-9]{3,4}-[0-9]{4}", "***");
		//String result = txt.replaceAll("[0-9]{3}-[0-9]{3,4}-[0-9]{4}", "☏[$0]");
		String result = txt.replaceAll("([0-9]{3})-([0-9]{3,4})-([0-9]{4})", "☏[$0 : $1 : $2 : $3]");
		//String result = txt.replaceAll("([0-9]{3})-([0-9]{3,4})-[0-9]{4}", "☏[$1-$2-****]");
		System.out.println(result);
	}

	private static void m3() {
		
		//data.html 내에서 이메일을 찾아내시오.
		
		//http://regexlib.com
		//이메일 정규 표현식 : \w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}
		
		String path = "data.html";
		String txt = "";
		
		try {
			
			BufferedReader reader = new BufferedReader(new FileReader(path));
			//reader.lines;
			
			String line = "";
			while ((line = reader.readLine()) != null) {
				txt += line + "\r\n";
			}
			
			reader.close();
			
			Pattern p = Pattern.compile("\\w+@[a-zA-Z_]+?\\.[a-zA-Z]{2,3}");
			Matcher m = p.matcher(txt);
			
			while (m.find()) {
				
				//System.out.println(m.group());
				
				System.out.printf("INSERT INTO tbl_email VALUES('%s')\n", m.group());
			}
			
			//람다식에서는 지역변수를 final 선언한다.
//			Stream<String> stream = reader.lines();
//			stream.forEach(str -> txt2 += str);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	private static void m2() {
		
		String txt = "안녕하세요. 홍길동입니다. 나이는 20살입니다. 연락처는 010-6543-0987입니다. 혹시 전화를 안받으면 010-6532-8765로 연락주세요.";
		
		//전화번호가 있는지?
		Pattern p = Pattern.compile("[0-9]{3}-[0-9]{3,4}-[0-9]{4}");
		Matcher m = p.matcher(txt);
		
//		System.out.println(m.find());
//		System.out.println(m.find());
//		System.out.println(m.find());
		
		while (m.find()) {
			//System.out.println("찾음");
			System.out.println(m.group());
		}
	}

	private static void m1() {
		
		String txt = "안녕하세요. 홍길동입니다. 나이는 20살입니다. 연락처는 010-6543-0987입니다. 혹시 전화를 안받으면 010-6532-8765로 연락주세요.";
		
		//txt에 전화번호가 있는지?
		Pattern p = Pattern.compile("[0-9]{3}-[0-9]{3,4}-[0-9]{4}");
		
		Matcher m =  p.matcher(txt);
		
		if (m.find()) {
			System.out.println("전화번호 발견");
		} else {
			System.out.println("전화번호 없음");
		}
	}
}
