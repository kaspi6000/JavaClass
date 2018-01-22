package com.test.example;

public class Ex61_Inheritance {

	public static void main(String[] args) {
		
		//private, public, this, super + 상속
		
		TestParent p1 = new TestParent();
		System.out.println(p1.a);
		p1.print();
		
		TestChild c1 = new TestChild(); //c1의 멤버 x 5개
		System.out.println(c1.a);
		//System.out.println(c1.b);
		System.out.println(c1.c);
		//System.out.println(c1.d);
		
		//오버라이딩된 자식의 print()가 아니고 부모의 print()를 호출
		c1.print();
	}
}

class TestParent {
	
	public int a = 10;
	private int b = 20;
	
	public void print() {
		System.out.println(this.a);
		System.out.println(this.b);
	}
}

class TestChild extends TestParent {
	
	public int c = 30;
	private int d = 40;
	
	public void print() {
		System.out.println(this.a);	//public
		//System.out.println(this.b);	//private
		System.out.println(this.c);	//public
		System.out.println(this.d);	//private
	}
	
	public void print2() {
		
		//나 자신
		this.print();
		
		//내 부모
		super.print();
	}
	
	@Override
	public String toString() {
	
		return super.toString();
	}
}