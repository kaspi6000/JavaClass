package com.test.example;

public class Ex50_Casting {

	public static void main(String[] args) {
		
		//형변환, Type Casting
		//	- 값형 형변환
		//	- 참조형 형변환
		
		//참조형 형변환
		//	- 상속 관계를 가지는 클래스끼리 자료형을 바꾸는 작업
		//	- 편의성, 코드 유연성
		
		//1. 암시적 형변환 > 업캐스팅, Up Casting
		//	- 부모 클래스 = 자식 클래스
		
		//2. 명시적 형변환 > 다운캐스팅, Down Casting
		//	- 자식 클래스 = 부모 클래스
		
//		CastingParent p1 = new CastingParent();
//		p1.a = 10;
//		p1.b = 20;
//		
//		CastingParent p2 = null;
		
		CastingParent p1;
		CastingChild c1;
		
		c1 = new CastingChild(); //자식 객체
		
		//부모 클래스 = 자식 클래스
		//형변환 발생
		// -> 업캐스팅
		p1 = c1;
		//p1 = (CastingParent)c1;
		
		//복사본 확인
		//	- 값형 : 복사본이 원본과 동일한지 검사
		//	- 참조형 : 복사본 참조 변수가 사용이 원할한지 검사
		System.out.println(p1.a);
		System.out.println(p1.b);
		
		CastingParent p2;
		CastingChild c2;
		
		p2 = new CastingParent(); //원본
		
		//자식 클래스 = 부모 클래스
		//명시적 형변환, 다운캐스팅
		//	- 명시적 형변환 100% 불가능
//		c2 = (CastingChild)p2;
		
		//복사본 확인
//		System.out.println(c2.a);
//		System.out.println(c2.b);
//		System.out.println(c2.c);
//		System.out.println(c2.d);
		
		CastingParent p3;
		CastingChild c3;
		
		c3 = new CastingChild(); //원본
		
		//업캐스팅
		p3 = c3;
		
		CastingChild c4;
		
		//다운 캐스팅 -> 100% 불가능
		//자식 = 부모
		c4 = (CastingChild)p3;
		
		System.out.println(c4.a);
		System.out.println(c4.a);
		System.out.println(c4.a);
		System.out.println(c4.a);
	}
}

class CastingParent {
	
	public int a;
	public int b;
}

class CastingChild extends CastingParent {
	
	public int c;
	public int d;
	
	public String toString() {
		
		return String.format("%d %d", a, b);
	}
}