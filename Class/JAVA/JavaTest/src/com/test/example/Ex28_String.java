package com.test.example;

public class Ex28_String {
	
	public static void main(String[] args) {
		
		//m1();
		//m2();
		m3();
	}
	
	public static void m3() {
		
		//m2()의 행동을 어쩔 수 없이 해야 하는 경우(극단적으로 빈번하게)
		//String 클래스 -> StringBuilder 클래스
		
		int n1 = 10;
		String s1 = "홍길동";
		
		//모든 참조형 -> 생성
		String s2 = new String("홍길동");
		
		StringBuilder s3 = new StringBuilder("홍길동");
		
		System.out.println(s1);
		System.out.println(s3);
		
		System.out.println(s1.length());
		System.out.println(s3.length());
		
		s1 = s1 + "님";
		s3.append("님");
		
		System.out.println(s1);
		System.out.println(s3);
		
		//String vs StringBuilder 속도 차이
		
		//String 
		System.out.println("String 테스트");
		
		//시작 시간
		long start = System.currentTimeMillis();
		
		//작업
		String txt = "홍길동";
		for (int i = 0; i < 100000; i++) {
			txt += '.';
		}
		
		//끝시간
		long end = System.currentTimeMillis();
		
		System.out.printf("총 소요시간 : %,dms\n문자열 길이 : %,d자\n", end - start, txt.length());
		
		//StringBuilder 
		System.out.println("StringBuilder 테스트");
		
		//시작 시간
		start = System.currentTimeMillis();
		
		//작업
		StringBuilder txt2 = new StringBuilder("홍길동");
		for (int i = 0; i < 100000; i++) {
			txt2.append('.');
		}
		
		//끝시간
		end = System.currentTimeMillis();
		
		System.out.printf("총 소요시간 : %,dms\n문자열 길이 : %,d자\n", end - start, txt2.length());
	}
	
	public static void m2() {
		
		//자바에서 문자열을 대상으로 되도록 피해야 하는 행동
		
		//1. 크기가 큰 문자열을 수정하는 행동
		//2. 문자열 수정하는 작업 빈번하게 하는 행동
	}
	
	public static void m1() {
		
		//자바의 문자열
		//	- 문자열은 참조형이다.
		//	- 문자열은 불변이다.
		
		//원시형(기본형) vs 참조형
		
		//원시형, 기본형, 값형(Value Type)
		//	- byte, short, int, long
		//	- float, double
		//	- char
		//	- boolean
		//	- 값형은 공간안에 데이터를 가진다.
		//	- 값형은 데이터가 변해도 공간의 크기는 변하지 않는다.
		
		
		//사용자 정의형, 참조형(Reference Type)
		//	- String
		//	- Array
		//	- 모든 Class
		//	- 참조형은 공간에 주소값을 가진다.
		//	- 참조형은 데이터가 변하면 공간의 크기도 변한다.
		
		int a = 10;
		int c = 20000;
		
		String b = "홍길동";
		String d = "안녕하세요. 반갑습니다.";
		
		String s1 = "홍길동";
		String s2 = "홍길동";
		String s3 = "홍";
		s3 += "길동";
		
		System.out.println(s1 == s2);
		System.out.println(s1 == s3);
		
		System.out.println(s1.equals(s2));
		System.out.println(s1.equals(s3));
		
		//자바 문자열 불변
		String s4 = "하나";
		s4 = "둘";
		s4 = s4 + "셋";
		
		//값형은 null로 초기화할 수 없다.
		int m1 = 0;
		
		//참조형은 null로 초기화를 할 수 있다.
		String m2 = null;
		
		//초기화하지 않은 지역변수는 사용이 불가능하다.
		System.out.println(m1);
		System.out.println(m2);
	}
}
