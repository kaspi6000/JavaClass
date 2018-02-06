package com.test.lambda;

import java.util.Iterator;

public class Ex01 {
	
	public static void main(String[] args) {
		
		/*
			람다식, lambda
			- 객체 지향 프로그래밍 코드 패턴 -> 함수 지향 프로그래밍 패턴
			- JDK 1.8부터 지원
			- 익명 객체 사용
			- 람다식은 익명 함수를 만들기 위해 사용. 자바는 익명 클래스를 사용해서 익명 메소드를 만든다.
			    람다식을 사용하면 익명 객체를 통해 익명 함수를 만들 수 있다. -> 인터페이스 사용
			    
			람다식을 사용한 함수 만들기
			- 함수적 스타일 문법 사용
			
			public void m1() {
				
				구현부;
			}
			
			(매개변수) -> { 구현부 ; }
			
			- 일반적인 람다식을 사용한 함수
			(int a) -> { syso(a); }
			
			- 호출부(구현부)쪽에서 매개변수의 타입을 유추
			(a) -> { syso(a); }
			
			- 매개 변수가 1개일 때 소괄호 생략 가능
			a -> { syso(a); }
			
			- 실행문 1줄일 때 중괄호 생략 가능
			a -> syso(a);
			
			- 매개변수가 없거나 2개 이상일 때는 소괄호 생략 불가능
			() -> { syso("안녕"); }
			(a, b) -> { syso(a + b); }
			
			- 실행문 2줄 이상일때 중괄호 생략 불가능
			(a, b) -> syso(a); syso(b); //X
			(a, b) -> { syso(a); syso(b);} //O
			(a, b) -> {
				syso(a);
				syso(b);
			}
			
			- 반환값
			(a) -> { return a * a; }
			a -> a * a;
			a -> m1(a);
		*/
		//() -> {System.out.println("Lambda");}
		
		//익명객체
		Test1 t1 = new Test1() {
			@Override
			public void m1() {
				
				System.out.println("안녕하세요");
			}
//			@Override
//			public void m2() {
//			
//				
//			}
		};
		
		t1.m1();
		
		//람다식
		//- 자바에서는 람다식을 사용한 메소드의 정의를(익명 객체를 사용해) 인터페이스에 저장한다.
		//- 람다식을 저장하는 인터페이스를 함수형(함수적) 인터페이스라고 부른다.
		Test1 t2 = () -> { System.out.println("반갑습니다"); };
		
		t2.m1();
		
		//인자값O, 반환값X 메소드 구현
		Test3 t3 = (int a) -> { System.out.println(a * a); };
		t3.m1(10);
		
		Test3 t4 = (a) -> { System.out.println(a * a); };
		t4.m1(20);
		
		Test3 t5 = a -> System.out.println(a * a);
		t5.m1(30);
		
		Test4 t6 = (count, name) -> {
			for (int i = 0; i < count; i++) {
				
				System.out.println(name);
			}
		};
		t6.m1(5, "홍길동");
	}
	
	public void m1() {
		System.out.println("Lambda");
	}
}

//1. 반환값X, 인자값X
@FunctionalInterface
interface Test1 {
	void m1(); //반환값X, 인자값X
	//void m2(); //람다식에서 사용하는 인터페이스는 반드시 추상메소드를 딱 1개만 가질 수 있다.
}

@FunctionalInterface
interface Test2 {
	//void m1();
	void m2();
}

//2. 인자값O, 반환값X 함수형 인터페이스
@FunctionalInterface
interface Test3 {
	void m1(int a); //람다식의 원형
}

@FunctionalInterface
interface Test4 {
	void m1(int a, String b);
}