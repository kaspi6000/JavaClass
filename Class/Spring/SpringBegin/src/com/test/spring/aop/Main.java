package com.test.spring.aop;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
		
		// 전체 흐름 제어(+ Memo 객체를 사용해서 주업무 실행)
		
		// Memo 객체 생성
		// Memo memo = new Memo();
		ApplicationContext context = new ClassPathXmlApplicationContext("memo.xml");
		
		IMemo memo = (IMemo) context.getBean("memo");
		
		// memo.test();
		
		// 1. 주 업무 실행 - 메모 쓰기
		memo.add("TESTESTSETSETSETSETSETESTSETSETSE");
		
		// 2. 주 업무 실행 - 메모 수정
		memo.edit("수정합니다.");
		memo.edit("수정", "홍길동");
		memo.editName("아무개");
		memo.checkName();
		
		// 3. 주 업무 실행 - 메모 읽기
		for(int i = 0; i < 5; i++) memo.read(5);
	}
}
