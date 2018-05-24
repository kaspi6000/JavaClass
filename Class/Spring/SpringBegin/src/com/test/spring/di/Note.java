package com.test.spring.di;

public class Note {

	// 의존 주입 구현
	// a. 의존 객체 참조 멤버 변수 선언하기
	private Pen pen;
	
	// b. 주입 용도의 메소드 선언(생성자 or Setter)
	public Note() {}
	public Note(Pen pen) {
		
		this.pen = pen;
	}
	
	public void setPen(Pen pen) {
		
		this.pen = pen;
	}
	
	public void run() {
		
		// 날짜 + 작성자 + 메모
		// 의존 객체 사용 -> Pen -> 의존 객체의 생성을 누구에게 맡기느냐?
		// 1. 필요한 시점에서 직접 생성해서 사용 : 기존방식
		// 2. 외부로부터 건내받아 사용 : DI
		
		pen.write("2018-05-24");
		pen.write("홍길동");
		pen.write("테스트입니다.");
	}
}
