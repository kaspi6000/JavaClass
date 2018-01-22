package com.test.access;

import com.test.example.Red;

public class Blue {

	//Red 클래스와 다른 패키지에 있는 클래스
	public void check() {
		
		Red red = new Red();
		
		//default 접근 지정자는 같은 패키지에 있는 모든 클래스에게는 보여지고, 다른 패키지에 있는 모든 클래스에게는 감춰진다.
		
		//같은 패키지 : public 처럼
		//다른 패키지 : private 처럼
		
//		System.out.println(red.a);
//		System.out.println(red.b);
//		System.out.println(red.c);
		System.out.println(red.d);
	}
}