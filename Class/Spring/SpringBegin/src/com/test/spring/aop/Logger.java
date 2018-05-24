package com.test.spring.aop;

import java.util.Calendar;

import org.aspectj.lang.ProceedingJoinPoint;

// 보조 업무 객체
// - 주업무 코드와 보조업무 코드를 분리시키는 것이 목적
public class Logger {

	// 보조 업무 구현 <- 보조 업무를 어떤 형태로 주업무에 적용할지? -> Advice
	// Around Advice 구현하기
	public void around(ProceedingJoinPoint joinPoint) throws Throwable {
		
		// 보조업무 추가
		long start = System.currentTimeMillis();
		System.out.println("[log] 시간 기록 시작합니다.");
		
		// 주업무 실행해야할 장소(시점)
		try {
			
			// 주업무 실행? Memo.add() 메소드 호출
			// 현재 실행 중인 주업무 객체 참조 > joinPoint -> 프록시 객체 = Memo 객체
			// joinPoint == memo 객체
			// joinPoint.proceed() == memo.add()
			joinPoint.proceed();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 보조업무 추가
		long end = System.currentTimeMillis();
		System.out.println("[log] 시간 기록 종료합니다.");
		System.out.printf("[log] 주업무 실행 소요 시간 : %s\n", end - start + "ms");
	}
	
	// Before Advice 구현하기
	public void before() {
		
		// 보조 업무
		System.out.printf("[log] %tT\n", Calendar.getInstance());
	}
	
	// After Advice 구현하기
	private int count = 0; //누적변수
	public void after() {
		
		// 주 업무가 몇회 실행되었는지 로그
		count++;
		System.out.printf("[log] 주업무 실행 횟수 : %d회\n", count);
	}
}
