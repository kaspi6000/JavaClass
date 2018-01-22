package com.test.example;

public class Ex44_Abstract {

	public static void main(String[] args) {
		
		//추상 클래스, Abstract Class
		//	- 클래스의 한 종류 > 상속 관계를 맺는게 가능 > 반드시 상속 관계를 맺고 사용
		//	- 상속 관계없이 추상 클래스를 단독으로 사용하지 않는다.
		//	- 상속받는 객체의 행동(사용법)을 표준화(강제로 제한)
		//	- 클래스를 사용해서 객체 생성 + 사용하는 개발자를 위한 기술
		
		//추상 메소드, Abstract Method
		//	- 추상 클래스에 소속되어 객체 표준화 하는데 사용됨
		
		//홍길동
		LG100 lg = new LG100();
//		lg.on();
//		lg.off();
		lg.powerOn();
		lg.powerOff();
		
		DELL200 dell = new DELL200();
//		dell.up();
//		dell.down();
		dell.powerOn();
		dell.powerOff();
	}
}

//추상 클래스 선언하기
abstract class Monitor {
	
	//추상 클래스 멤버
	//1. 일반 구현 멤버
	//	a. 멤버 변수
	//	b. 멤버 메소드
	//2. 추상 멤버
	//	a. 추상 메소드
	
	public String model;
	public int price;
	
	public void info() {
		
		System.out.println(model + " : " + price);
	}
	
	//추상 메소드 선언하기 -> 자식 클래스로 만드는 객체들의 사용법을 통일
	
	//모든 모니터 전원 켜기
	public abstract void powerOn();
	
	public abstract void powerOff();
}

class DELL200 extends Monitor {
	
	//전원 켜기
//	public void up() {
//		
//		System.out.println("전원 켜기");
//	}
	
	//전원 끄기
//	public void down() {
//		
//		System.out.println("전원 끄기");
//	}

	public void powerOn() {
		
		System.out.println("전원 켜기");
	}

	public void powerOff() {
	
		System.out.println("전원 끄기");
	}
}

class LG100 extends Monitor {
		
	//전원 켜기
//	public void on() {
//		
//		System.out.println("전원 켜기");
//	}
	
	//전원 끄기
//	public void off() {
//		
//		System.out.println("전원 끄기");
//	}

	public void powerOn() {
		
		System.out.println("전원 켜기");
	}
	
	public void powerOff() {
		
		System.out.println("전원 끄기");
	}
}