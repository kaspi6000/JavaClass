package com.test.question;

public class MyArrayList {

	//1. 멤버 변수
	private String[] list;	//데이터 저장
	private int index; 		//입출력 요소의 위치
	private int capacity;	//배열 초기 크기
	
	//2. 생성자
	public MyArrayList() {
		
		
	}
	
	public MyArrayList(int capacity) {
		
		
	}
	
	//3. toString() 재정의 -> 배열 데이터 덤프
	@Override
	public String toString() {
	
		return super.toString();
	}
	
	//4. 주업무
	public void add(String s) {}
	public String get(int index) {}
	public void set(int index, String s) {}
	public void add(index index, String s) {}
	public int size() {}
	public void trimToSize() {}
}
