package com.test.collection;

import java.util.ArrayList;

public class Ex72_Collection {

	public static void main(String[] args) {
		
		//모든 컬렉션은 길이가 가변이다.
		//모든 컬렉션은 배열이다. -> 내부에 배열을 가지고 있다.
		
		ArrayList<String> list = new ArrayList<String>(1025);
		
		//내부 배열 길이 : 0
		list.add("빨강"); //내부 배열 길이 : 4
		list.add("파랑");
		list.add("노랑");
		list.add("검정");
		
		list.add("주황"); //내부 배열 길이 : 4 -> 8
		
		//4 -> 8 -> 16 -> 32 -> 64 -> 128 -> 256 -> 512 -> 1024
		//1개면 길이 4
		//5개면 길이 8
		//9개면 길이 16
		for (int i = 0; i < 1025; i++) {
			list.add("색상");
		}
		
		list.add("추가"); //1025 -> 2050
		
		//1024 빈공간 발생
		list.trimToSize(); // -> 1026
		System.out.println(list);
		
		
	}
}
