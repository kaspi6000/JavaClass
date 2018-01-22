package com.test.example;

public class Ex41_Inheritance {
	
	public static void main(String[] args) {
		
		//클래스 상속
		//	- 클래스와 클래스간의 발생
		//	- 클래스 재산? -> 변수 + 메소드
		//	- 왜?
		//	- 코드 재사용
		
		Child c = new Child();
		c.a = 10;
		c.b = 20;
		System.out.println(c.a);
		
		c.c = 30;
		c.d = 40;
		
		DDD d = new DDD();
	}
}

class Parent {
	
	public int a;
	public int b;
}

class Child extends Parent {
	
	public int c;
	public int d;
}

class AAA {
	
	public int a;
}

class BBB extends AAA {
	
	public int b;
}

class CCC extends BBB {
	
	public int c;
}

class EEE extends BBB {
	
	public int e;
}

class DDD extends CCC {
	
	public int d;
}