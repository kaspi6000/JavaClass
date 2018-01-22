package com.test.collection;

import java.util.HashMap;

public class Ex69_HashMap {

	public static void main(String[] args) {
		
		//해시맵을 언제 사용할까?
		
		//사용자 입력
		String name = "홍길동";
		String age = "20";
		String address = "서울시";
		String tel = "010-9999-1111";
		String email = "hing@gmail.com";
		
		//위의 정보를 가지고 업무 처리 -> 메소드 추출
		
		//m1
		process(name, age, address, tel, email);
		
		//데이터 집합 생성
		//	: 5개의 데이터 -> 한덩어리
		//	-> 배열, 클래스, ArrayList, HashMap
		
		Data data = new Data();
		
		data.name = name;
		data.age = age;
		data.address = address;
		data.tel = tel;
		data.email = email;
		
		process(data);
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("name", "name");
		map.put("age", "age");
		map.put("address", "address");
		map.put("tel", "tel");
		map.put("email", "email");
		
		process(map);
		
		Data data2 = new Data();
		data2.name = "아무개";
		
		HashMap<String, String> map2 = new HashMap<String, String>();
		map2.put("nick", "아무개");
		
		//다량 데이터를 전달할 때
		//1. 동일한 자료형 + 동일한 성격
		//	a. 배열
		//		- 고정 길이
		//	b. ArrayList
		//		- 가변 길이
		//2. 자료 집합
		//	a. 클래스
		//		- 다시 사용해야 하는 집합이면
		//	b. HashMap
		//		- 1회용 틀이 필요할 때
	}
	
	public static void process(HashMap<String, String> map) {
		System.out.println("가공 처리");
	}
	
	public static void process(Data data) {
		System.out.println("가공 처리");
	}
	
	public static void process(String name, String age, String address, String tel, String email) {
		
		System.out.println("가공 처리");
		
	}
}

class Data {
	
	public String name;
	public String age;
	public String address;
	public String tel;
	public String email;
}