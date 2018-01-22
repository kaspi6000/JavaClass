package com.test.example;

public class Ex53_Interface {

	public static void main(String[] args) {
		
		//인터페이스, Interface
		//	- 클래스의 일종(자료형 - 상속 구성원, 변수 생성 가능)
		//	- 추상 클래스와 유사
		//	- 인터페이스는 멤버로 추상 메소드를 가진다.
		//	- 구현 멤버를 가질 수 없다. > 변수 생성x, 구현된 메소드x > 추상 메소드만 만들 수 있다.
		//	- 추상 메소드의 집합
		
		//추상 클래스 - 일반 멤버 = 인터페이스
		//일반 클래스 + 인터페이스 = 추상 클래스
		//추상 클래스 - 인터페이스 = 일반 클래스
		
//		IMouse m1 = new IMouse();
		IMouse m1;
		
		M8500G m2 = new M8500G();
		m2.click();
		m2.drag();
		m2.drop();
	}
}

//인터페이스
interface IMouse {
	
	//인터페이스 멤버
	public abstract void click();
	void drag();
	void drop();
	
//	public int price;
	
//	public void info() {
//	}
	
}

class M8500G implements IMouse {

	@Override
	public void click() {
		
		
	}

	@Override
	public void drag() {
		
		
	}

	@Override
	public void drop() {
		
		
	}
	
	
}