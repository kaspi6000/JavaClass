package com.test.example;

import com.test.access.Blue;

public class Ex65_Access {

	public static void main(String[] args) {
		
		//접근 지정자
		//1. private : 패키지x, 다른클래스x
		//2. public : 패키지o, 다른클래스o
		//3. default : 패키지 같으면 public, 클래스 무관, 패키지다르면 private
		//4. protected : default 적용 + 자식 클래스이면 public
		Red red = new Red();
		red.check();
		
		//1. 자기 자신(같은 패키지 + 같은 클래스)
		System.out.println(red.d); //public
		
		//2. 같은 패키지 + 다른 클래스
		System.out.println(red.b); //default
		System.out.println(red.c); //protected
		
		//3. 다른 패키지 + 다른 클래스
		Blue blue = new Blue();
		blue.check();
	}
}