import java.util.*;

class Ex23_if {
	public static void main(String[] args) {

		//m1();
		//m2();
		//System.out.println(m3());
		//m4();
		//System.out.println(m5());
		m6();
	}

	public static void m6() {
	
		//요구사항] 문자 1개 입력 -> 영소문자?
		String input = "e";

		char c = input.charAt(0); //"e" -> 'e'

		int code = (int)c; //101
		
		//if(code >= 97 && code <= 122) {
		//if(code >= (int)'a' && code <= (int)'z') {
		if(c >= 'a' && c <= 'z') {
			System.out.println("소문자o");
		}else {
			System.out.println("소문자x");
		}

		c = '강';

		if(c >= 'A' && c <= 'Z' || c >= 'a' && c <= 'z' || c >= '0' && c <= '9') {
			System.out.println("영문자 + 숫자 o");
		}else {
			System.out.println("영문자 + 숫자 x");
		}
	}

	public static String m5() {
		
		//중첩된 if문, Nested if Statements
		/*
			if() {
				if() {
					if() {
					
					}
				}
			}else if() {
				if() {
					
				}
			}else {
				if() {
					
				}
			}
		*/

		//국어 점수 입력 -> 합격, 불합격?
		//조건 : 60점이상
		int kor = 90;
		String result = "";

		if(kor >= 60) {
			//System.out.println("합격");
			result = "합격";
		}else {
			//System.out.println("불합격");
			result = "불합격";
		}

		kor = 85;

		//유효성 검사
		if(kor >= 0 && kor <= 100) {

			//비지니스 코드, 업무코드
			if(kor >= 60) {
				//System.out.println("합격");
				result = "합격";
			}else {
				//System.out.println("불합격");
				result = "불합격";
			}

		}else {
			//예외 처리 코드
			result = "점수 다시 입력";
		}

		
		return result;
	}

	public static void m4() {
		
		System.out.println("하나");

		Calendar c = Calendar.getInstance();

		if(c.get(Calendar.SECOND) % 2 == 0) {
			return; //빈 return문 -> 메소드 종료
		}

		System.out.println("둘");

		System.out.println("셋");
	}

	public static String m3() {
		
		//return문
		int num = 10;

		if(num > 0) {
			return "통과";
		}else {
			return "실패";
		}

		//return "실패";
	}

	public static void m2() {
	
		if(true) {
			System.out.println("참");
		}else {
			System.out.println("거짓");
		}

		boolean flag = true;

		if(flag) {
			System.out.println("참");
		}else {
			System.out.println("거짓");
		}

		//C -> Java
		//C언어 : boolean이 없다.
		//	- 정수 : 0(false), 나머지(true)
		//	- 실수 : 0.0(false), 나머지(true)
		//	- 문자 : '\0'(false), 나머지(true)
		//	- 문자열 : ""(false), 나머지(true)
		if(true) {
			System.out.println("참");
		}else {
			System.out.println("거짓");
		}
	}

	public static void m1() {
		
		//요구사항] 숫자 1개 입력받아 짝수? 홀수?
		int num = 5;

		String result = "";

		if(num % 2 == 0) {
			//짝수
			//System.out.printf("%d는 짝수 입니다.\n", num);
			result = "짝수";
		}else {
			//홀수
			//System.out.printf("%d는 홀수 입니다.\n", num);
			result = "홀수";
		}

		System.out.printf("입력한 숫자 %d은 %s입니다.\n", num, result);
	}
}
