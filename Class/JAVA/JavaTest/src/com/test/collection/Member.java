package com.test.collection;

//회원 1명 분량의 데이터 집합
public class Member {

	//1. 멤버 변수 선언
	private String name;
	private String age; //숫자형 데이터 -> 산술 연산
	private String address;
	private String tel;
	
	//2. 생성자
	public Member(String name, String age, String address, String tel) {
		
		this.name = name;
		this.age = age;
		this.address = address;
		this.tel = tel;
	}
	
	//3. setter, getter
	public String getName() {
		return name;
	}

	public String getAge() {
		return age;
	}

	public String getAddress() {
		return address;
	}
	
	public String getTel() {
		return tel;
	}
	
	//4. 개발자용 -> dump 용
	@Override
	public String toString() {
	
		return String.format("%s,%s,%s,%s", this.name, this.age, this.address, this.tel);
	}
}
