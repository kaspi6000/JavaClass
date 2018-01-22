package com.test.access;

import com.test.example.Red;

public class Yellow extends Red {

	public void check() {
			
		Red red = new Red();
		
		//default 접근 지정자는 같은 패키지에 있는 모든 클래스에게는 보여지고, 다른 패키지에 있는 모든 클래스에게는 감춰진다.
		
		//같은 패키지 : public 처럼
		//다른 패키지 : private 처럼
		
//		System.out.println(red.a);
//		System.out.println(red.b);
//		System.out.println(red.c);
		System.out.println(red.d);
		
		//protected
		//	- 패키지 같을 때 : public 처럼
		//	- 패키지 다를 때 : private 처럼
		//	- 패키지 상관없이 자식 클래스이면 : public 처럼
		System.out.println(this.c);
	}
}
