package com.test.example;

public class Ex62_Wrapper {

	public static void main(String[] args) {
		
		//값형에 대응하는 참조형 클래스가 제공된다.
		//	-> Wrapper Class, Utility Class
		
		//int -> Integer
		//double -> Double
		//boolean -> Boolean
		
		int n1 = 10;					//값형
		Integer n2 = new Integer(20);	//참조형
		
		System.out.println(n1 + 10);
		System.out.println(n2 + 10);
		
		//추가 기능
		int n3 = Integer.parseInt("100");
		
		System.out.println(Integer.MAX_VALUE);
		System.out.println(Integer.MIN_VALUE);
		
		//sort할때 사용
		System.out.println(Integer.compare(10, 20));	//-1
		System.out.println(Integer.compare(20, 10));	//1
		System.out.println(Integer.compare(10, 10));	//0
		
		System.out.println(Integer.SIZE);
		System.out.println(Long.SIZE);
		
		System.out.println(Integer.max(10, 5));
		System.out.println(Integer.min(10, 5));
		
		System.out.println(Integer.toBinaryString(10));
		System.out.println(Integer.toHexString(20));
		System.out.println(Integer.toOctalString(10));
	}
}
