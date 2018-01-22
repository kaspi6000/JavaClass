package com.test.example;

import java.util.Random;

public class Ex60_Generic {

	public static void main(String[] args) {
		
		Paper<Integer> p1 = new Paper<Integer>();
		p1.n = 100;
		System.out.println(p1.n + 100);
		
		Paper<String> p2 = new Paper<String>();
		p2.n = "홍길동";
		System.out.println(p2.n.length());
		
		Paper<Boolean> p3 = new Paper<Boolean>();
		p3.n = true;
		System.out.println(p3.n);
		
		Bag<Double> b1 = new Bag<Double>();
		b1.test(3.14);
		
		Bag<Random> b2 = new Bag<Random>();
		b2.test(new Random());
		
		Desk<Integer, String> d1 = new Desk<Integer, String>();
		d1.a = 10;
		d1.b = "문자열";
		int result = d1.test("문자열");
	}
}

class Desk<T, U> {
	
	public T a;
	public U b;
	public T test(U u) {
		
		return a;
	}
}

class Coffe<T> {
	
	public T a;
	public T b;
	public T c;
	public T test(T t) {
		
		return t;
	}
	public T test(T t1, T t2) {
		
		return t1;
	}
}

//제네릭 클래스
//	- T : 타입 변수(데이터를 담는 용도x, 자료형 자체를 담는 용도o)
class Paper<T> {
	
	public T n; //타입 변수 사용 용도
	
	//나머지는 일반 클래스와 동일
	public int m;
	public void test() {}
}

class Bag<T> {
	
	public String name;
	
	public T test(T t) {
		
		return t;
	}
}