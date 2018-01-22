package com.test.example;

public class Ex46_Inheritance {

	public static void main(String[] args) {
		
		//클래스, 추상클래스 -> 상속패턴
	}
}

//상속
//[부모]		[자식]
//일반클래스	일반클래스	//자주
//추상클래스	일반클래스	//자주
//일반클래스	추상클래스	//논리x, 비권장
//추상클래스	추상클래스	일반클래스

//일반 클래스
class AA {
	
	public int a; //일반(구현) 멤버
//	public abstract void test();
}

class BB extends AA {
	
	public int b;
}

abstract class CC {
	
	public int c;
	public abstract void ccc();
}

class DD extends CC {
	
	public int d;
	
	public void ccc() {
		
	}
}

abstract class EE extends AA {
	
	
}

abstract class FF {
	
	public int f;
	public abstract void fff();
}

abstract class GG extends FF {
	
	//부모와 자식이 모두 추상 클래스일때..
	//1. 자식이 추상 메소드를 구현 안하고 손자에게 떠넘기는 경우
	//2. 자식이 구현하는 경우
	
	@Override
	public void fff() {
		
		//구현
	}
	
	public abstract void ggg();
}

class HH extends GG {
	
	@Override
	public void ggg() {
	
		
	}
}