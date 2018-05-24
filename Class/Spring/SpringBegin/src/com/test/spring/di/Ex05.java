package com.test.spring.di;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex05 {

	public static void main(String[] args) {
		
		// m1();
		// m2();
		m3();
	}

	private static void m3() {
		
		// 학생 객체가 필요한 상황
		
		// 1. 직접 생성
		Ex05_Student s1 = new Ex05_Student("홍길동", 25);
		
		System.out.println(s1.getName());
		System.out.println(s1.getAge());
		
		// 2. 스프링을 통해서 생성
		// - 사전 작업 : XML 파일에 <bean>이 선언
		ApplicationContext context = new ClassPathXmlApplicationContext("config02.xml");
		
		Ex05_Student s2 = (Ex05_Student)context.getBean("student");
		
		s2.setName(s1.getName());
		s2.setAge(s1.getAge());
		
		System.out.println(s2.getName());
		System.out.println(s2.getAge());
		
		Ex05_Student s3 = (Ex05_Student) context.getBean("student2");
		
		System.out.println(s3.getName());
		System.out.println(s3.getAge());
		
		Ex05_Student hoho = (Ex05_Student) context.getBean("cat");
		
		System.out.println(hoho.getName());
		System.out.println(hoho.getAge());
	}

	private static void m2() {
		
		// Ex05 -> (의존) -> Ex05_Data
		// 현재 : 직접 생성 or DI 구현
		// 수정 : DI 구현 -> 스프링 프레임워크를 사용해서 구현
		
		// Ex05_Data 객체가 필요함.
		// - 직접 생성 X -> 스프링을 통해서 제공 O
		
		// 스프링 설정 파일 읽어오기
		ApplicationContext context = new ClassPathXmlApplicationContext("config01.xml");
		
		// 객체 생성하기
		// Ex05_Data data = new Ex05_Data();
		Ex05_Data data = (Ex05_Data) context.getBean("data");
		System.out.println(data.getData());
	}

	private static void m1() {
		
		// Ex05 -> (의존) -> Ex05_Data
		Ex05_Data data = new Ex05_Data();
		
		int num = data.getData();
		
		System.out.println("값 : " + num);
	}
}
