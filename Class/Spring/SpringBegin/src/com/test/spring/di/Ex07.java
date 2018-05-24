package com.test.spring.di;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex07 {

	public static void main(String[] args) {
		
		// Note 객체 + Pen 객체 사용
		
		// 자바 버전
		Pen pen = new Pen();
		Note note = new Note(pen); // 의존 주입(DI) 발생
		note.run();
		
		// 스프링 버전
		// - 객체 생성 + 의존관계 명시 -> XML을 사용해서
		ApplicationContext context = new ClassPathXmlApplicationContext("note.xml");
		
		Note note2 = (Note) context.getBean("note");
		note2.run();
	}
}
