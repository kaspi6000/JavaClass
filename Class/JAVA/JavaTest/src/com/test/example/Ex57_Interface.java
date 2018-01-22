package com.test.example;

public class Ex57_Interface {

	public static void main(String[] args) {
		
//		애기 baby = new 애기();
//		baby.행동();
	}
}

//회사 구성원
//1. 직원
//	a. 정직원
//	b. 계약직

//회사 모든 구성원 -> 행동(규칙)
interface 직원 {
	
	void 출근하다();
	void 퇴근하다();
}

interface 정직원 extends 직원 {
	
	void 영업하다();
	void 재고확인하다();
}

interface 계약직 extends 직원 {
	
	void 복사하다();
	void 파기하다();
}

class 부장 implements 정직원 {

	@Override
	public void 출근하다() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void 퇴근하다() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void 영업하다() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void 재고확인하다() {
		// TODO Auto-generated method stub
		
	}
}

class 사원 implements 정직원 {

	@Override
	public void 출근하다() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void 퇴근하다() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void 영업하다() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void 재고확인하다() {
		// TODO Auto-generated method stub
		
	}
}

class 기간제 implements 계약직 {

	@Override
	public void 출근하다() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void 퇴근하다() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void 복사하다() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void 파기하다() {
		// TODO Auto-generated method stub
		
	}	
}

class 알바생 implements 계약직 {

	@Override
	public void 출근하다() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void 퇴근하다() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void 복사하다() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void 파기하다() {
		// TODO Auto-generated method stub
		
	}
}

//자바는 다중 상속을 지원하지 않는다. 하지만 인터페이스에 한해서는 다중 상속을 지원한다.
//class 아빠 {
//	
//	public void 행동() {
//		
//		System.out.println("아빠행동");
//	}
//}
//
//class 엄마 {
//	
//	public void 행동() {
//		
//		System.out.println("엄마행동");
//	}
//}
//
//class 애기 extends 아빠, 엄마 {
//	
//	
//}

//인터페이스 -> Role(역할)

interface 아빠 {
	
	void 가족을돌본다();
	void 돈을벌어온다();
	void 애기와놀아준다();
}

interface 카페주인 {
	
	void 재고관리();
	void 인력관리();
	void 매출관리();
}

class 홍길동 implements 아빠, 카페주인 {

	@Override
	public void 가족을돌본다() {
		
		
	}

	@Override
	public void 돈을벌어온다() {

		
	}

	@Override
	public void 애기와놀아준다() {

		
	}

	@Override
	public void 재고관리() {
		
		
	}

	@Override
	public void 인력관리() {
		
		
	}

	@Override
	public void 매출관리() {
		
		
	}
	
}