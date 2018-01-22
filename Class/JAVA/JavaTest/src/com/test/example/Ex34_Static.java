package com.test.example;

public class Ex34_Static {
	
	//프로그램 시작 -> 클래스 정의 읽기 -> 정적 멤버 구현(로딩) -> main() 실행
	
	public static void main(String[] args) {
		
		//static 키워드
		//	- 정적 키워드
		//	- 클래스 멤버에 붙이는 키워드
		//1. 멤버 변수
		//2. 멤버 메소드
		
		Student s1 = new Student();
		s1.setName("홍길동");
		s1.setAge(15);
//		s1.setSchool("역삼 중학교");
		
		Student s2 = new Student();
		s2.setName("아무개");
		s2.setAge(14);
//		s2.setSchool("역삼 중학교");
		
		Student s3 = new Student();
		s3.setName("하하하");
		s3.setAge(14);
//		s3.setSchool("역삼 중학교");
		
		Student.setSchool("역삼 중학교");
		
		StaticTest s = new StaticTest();
		s.m1();
		s.m2();
	}
}

//메소드 -> 변수 접근

//1. 객체 메소드에서
//	a. 객체 변수를 접근 o
//	b. 정적 변수를 접근 o

//2. 정적 메소드에서
//	a. 객체 변수를 접근x
//	b. 정적 변수를 접근o
class StaticTest {
	
	private int a = 10;			//객체변수(객체마다)
	private static int b = 20;	//정적변수(딱 1개)
	
	public void m1() {
		
		System.out.println(a); //1.a
		System.out.println(b); //1.b
		
		System.out.println(this.a); //1.a
		System.out.println(StaticTest.b); //1.b
	}
	
	//정적 메소드
	public static void m2() {
		
//		System.out.println(a); //2.a
		System.out.println(b); //2.b
		
//		System.out.println(this.a); //2.a
		System.out.println(StaticTest.b); //2.b
	}
}

//학생 클래스
//	- "역삼 중학교"
class Student {
	
	//객체변수
	//	- 객체마다 각각 직접 소유하고 있는 저장 공간
	private String name;
	private int age;
//	private String school;
	
	//정적변수
	private static String school;
	
	
	public static String getSchool() {
		return school;
	}
	public static void setSchool(String school) {
		Student.school = school;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
//	public String getSchool() {
//		return school;
//	}
//	public void setSchool(String school) {
//		this.school = school;
//	}
	
	
}