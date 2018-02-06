package com.test.lambda;

public class Ex02 {
	
	public static void main(String[] args) {
		
		TempClass t1 = new TempClass();
		t1.m1();
		t1.m2();
		t1.m3(20);
		
	}//main
	
	public void m2() {
		
		//메소드 구현 -> this 연산자
		//람다식 구현 -> this 연산자
		//람다식 내부의 모든 this는 자신이 포함된 익명 객체가 아닌 -> 람다식을 사용중인 객체를 가르킨다.(***)
		Temp t1 = () -> { System.out.println(this.toString());	}; //this?
		t1.m1();
		
		Temp t2 = new Temp() {
			
			@Override
			public void m1() {
				
				System.out.println(this);
				
			}
		};
	}

}//Class Ex02


interface Temp{
	void m1();
}

interface Temp1{
	void m1();
}


class TempClass implements Temp1{
	int a = 10;
	
	public void m1() {
		
		System.out.println(this);
		
	}//m1
	
	public void m2() {
		
		
		
	}//m2
	
	public void m3(int b) {
		int c = 30;
		
		Temp1 t1 = () -> {
			
			//람다식 내에서...
			//1. 람다식을 실행하는 객체의 멤버 변수는 자유롭게 제어 가능(a) -> Heap
			//2. 람다식을 실행하는 메소드의 지역(매개)변수는 읽기 전용(자동으로 final)(b, c) -> Stack
			
			//1. 람다식이 실행중인 객체의 멤버 변수
			System.out.println(this.a);
			this.a = 100;
			System.out.println(this.a);
			
			//2. 람다식이 실행중인 메소드(m3)의 매개 변수
			System.out.println(b);
			b = 200;
			System.out.println(b);
			
			//3. 람다식이 실행중인 메소드(m3)의 지역변수
			System.out.println(c);
			//c = 300;
		};		
		t1.m1();
	}//m3
	
}














