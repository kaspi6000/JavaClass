package com.test.example;

import java.util.Calendar;

public class Ex49_Final {

	public static void main(String[] args) {
		
		//final 키워드
		//	- 한번 만들면 수정 불가능
		//1. 변수에 적용
		//2. 메소드에 적용 : 상속
		//3. 클래스에 적용 : 상속
		
		//final 변수
		//	- 값을 수정할 수 없다.
		//	- 값을 초기화한 뒤 절대로 수정할 수 없는 공간 -> 상수
		int a = 10;
		final int b = 20;
		
		a = 40;
//		b = 30;
		
		System.out.println(a);
		System.out.println(b);
		
//		final double pi = 3.14;
		
		System.out.println(a);
		System.out.println(b);
		
		//상수명 명명법
		//	- 무조건 모두 대문자로
		final double PI = 3.14;
		
		System.out.println(Calendar.YEAR);
		
		System.out.println(MyCalendar.YEAR);
		
		final String NAME;
		
		NAME = "홍길동"; //초기화, 비권장
		
		System.out.println(NAME);
		
//		NAME = "아무개"; //치환
		
		
	}
}

class MyCalendar {
	
	static final public int YEAR = 1;
}

final class FinalParent {
	
	//멤버 구현
	public final void aaa() {
		
		System.out.println("Parent 기능");
	}
}

//class FinalChild extends FinalParent {
//	
//	@Override
//	public void aaa() {
//		
//		System.out.println("부모 기능 대신 자식이 구현");
//	}
//}

