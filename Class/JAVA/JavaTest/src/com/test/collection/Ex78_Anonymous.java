package com.test.collection;

public class Ex78_Anonymous {

	public static void main(String[] args) {
		
		//Anonymous Class, 익명 클래스
		//	- 익명(이름이 없다.)
		//	- 재사용이 불가능하다. -> 1회용 클래스
		//	- 인터페이스를 사용해서 만든다.
		
		//m1. Red가 필요해서 생성
		Red r1 = new Red();
		r1.print();
		r1.fill();
		r1.draw();
		
		//m2. Color 자격을 가지는 객체가 필요해서 생성
		Color r2 = new Red();
		r2.print();
		r2.fill();
		//r2.draw();
		
		//m3.
		Color r3 = new Color() {

			@Override
			public void print() {
			
				
			}

			@Override
			public void fill() {
			
				
			}
		};
		
		r3.print();
		r3.fill();
	}
}

interface Color {
	
	void print();
	void fill();
}

class Red implements Color {

	@Override
	public void print() {
	
		
	}

	@Override
	public void fill() {
	
		
	}
	
	public void draw() {
		
		
	}
}