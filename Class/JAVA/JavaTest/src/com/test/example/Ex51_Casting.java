package com.test.example;

public class Ex51_Casting {

	public static void main(String[] args) {
		
		//1. 상속
		//2. 참조형 형변환 -> 업캐스팅과 다운캐스팅을 왜 하는지?
		//3. 배열
		//4. 제어문
		//5. 추상클래스
		
		//[상황]
		//1. 대리점 운영
		//2. 전자 제품 > 프린터 판매
		//3. LG200 x 5대, HP300 x 3대
		
		//[운영방침]
		//1. 한달 1번( 반복 ) -> 작동 테스트
		//	a. 출력 테스트
		
		//[변경상황]
		//1. 프린터 재고 증가 -> LG200(100대), HP300(50대)
		//2. 프린터 브랜드 증가 -> Dell400, BenQ500, Epson600..10종류
		//3. 점검일 -> print() 체크 + 고유 기능 체크
		
		//m1();
		//m2();
		m3();
	}

	private static void m1() {
		
		//재고
		LG200 lg1 = new LG200();
		LG200 lg2 = new LG200();
		LG200 lg3 = new LG200();
		LG200 lg4 = new LG200();
		LG200 lg5 = new LG200();
		
		HP300 hp1 = new HP300();
		HP300 hp2 = new HP300();
		HP300 hp3 = new HP300();
		
		//점검일
		lg1.print();
		lg2.print();
		lg3.print();
		lg4.print();
		lg5.print();
		
		lg1.call();
		
		hp1.print();
		hp2.print();
		hp3.print();
		
		hp1.selfCheck();
	}

	private static void m2() {
		
		LG200[] lgs = new LG200[5];
		//lgs[0] = new LG200();
		
		for (int i = 0; i < lgs.length; i++) {
			
			lgs[i] = new LG200();
		}
		
		HP300[] hps = new HP300[3];
		
		for (int i = 0; i < hps.length; i++) {
			
			hps[i] = new HP300();
		}
		
		//점검일
		for (int i = 0; i < lgs.length; i++) {
			
			lgs[i].print();
			lgs[i].call();
		}
		
		for (int i = 0; i < hps.length; i++) {
			
			hps[i].print();
			hps[i].selfCheck();
		}
		
//		for (int i = 0; i < lgs.length + hps.length; i++) {
//			if(i < lgs.length) {
//				lgs[i].print();
//				lgs[i].call();
//			}else {
//				hps[i].print();
//				hps[i].selfCheck();
//			}
//		}
	}

	private static void m3() {
		
		//업캐스팅을 사용한 배열
		// -> 업캐스팅을 왜(언제) 사용하는지?
		
//		LG200 lg = new LG200();;
//		Printer p;
//		
//		//업캐스팅(100%)
//		p = lg;
//		
//		HP300 hp = new HP300();
//		Printer p2;
//		
//		p2 = hp;
		
		Printer[] ps = new Printer[8];
		LG200[] lgs = new LG200[5];
		
		for (int i = 0; i < ps.length; i++) {
			if (i < lgs.length) {
				ps[i] = new LG200();
			}else {
				ps[i] = new HP300();
			}
		}
		
		//점검일
		for (int i = 0; i < ps.length; i++) {
			ps[i].print(); //추상화
			//ps[i].call();
			
			//현재 가져온 1번째 프린터가 LG? HP?
			//객체 instanceOf 타입(클래스명)
			//System.out.println(ps[i] instanceof LG200);
			
			if (ps[i] instanceof LG200) {
				//LG200
				//다운 캐스팅
				//	- 평소에는 부모타입(Printer)으로 부모배열에 넣어서 관리하다가 가끔씩 자신만의 기능이 필요하면 다운캐스팅을 해서 원래 자료형으로 다시 되돌려 사용한다.
				LG200 lg = (LG200)ps[i];
				lg.call();
			}else if (ps[i] instanceof HP300) {
				//HP300
				HP300 hp = (HP300)ps[i];
				hp.selfCheck();
			}
		}
	}
}

//프린터로서 갖춰야할 공통적인 부분을 구현하기 위해 부모 클래스 선언
//	- 일반 공통 구현부 + 행동 제어
abstract class Printer {
	
	//구현 멤버
	//	- 제품에 상관없이 모든 프린터가 공통으로 가져야할 변수 or 메소드
	
	public String model;
	public int price;
	public int ink;
	
	public void info() {
		System.out.printf("모델명 : %s\n잉크량 : %dml\n가격 : %,d원\n", model, ink, price);
	}
	
	//추상 멤버
	//	- 제품에 상관없이 모든 프린터가 공통으로 가져야할 메소드 사용법(구현 내용은 상관 안함)
	public abstract void print();
}

//진짜 제품을 만들기 위한 클래스 > 일반 클래스
class LG200 extends Printer {

	//LG200만이 가지는 구현 멤버
	public void call() {
		
		System.out.println("상담원과 연결중입니다.");
	}
	
	//모든 프린터가 가지는 공통 기능(구현부는 다름)
	@Override
	public void print() {
	
		//LG만의 독자 기술 사용 -> 출력
		System.out.println("LG200으로 잉크젯 출력을 합니다.");
	}
}

class HP300 extends Printer {

	//HP300만의 구현 멤버
	public void selfCheck() {
		
		System.out.println("자가진단 중입니다.");
	}
	
	@Override
	public void print() {
		
		//HP만의 독자 기술 사용 -> 출력
		System.out.println("HP300으로 레이저 출력을 합니다.");
	}
}