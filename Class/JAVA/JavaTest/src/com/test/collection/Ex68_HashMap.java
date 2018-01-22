package com.test.collection;

import java.util.HashMap;

public class Ex68_HashMap {

	public static void main(String[] args) {
		
		//ArrayList
		//	- 요소 접근 -> 첨자(index) 사용
		//	- 첨자 : 정수(0이상)
		//	- 스칼라 배열, Scalar Array
		
		//HashMap
		//	- 요소 접근 -> 키(key) 사용
		//	- 키 : 숫자, 문자, 문자열(**).. 등
		//	- 연관 배열, 사전 구조, Dictionary
		
		//HashMap map = new HashMap();
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		//요소 추가
		map.put("국어", 100);
		map.put("영어", 90);
		map.put("수학", 80);
		
		//요소 접근
		System.out.println(map.get("국어"));
		
		HashMap<Integer, String> map2 = new HashMap<Integer, String>();
		
		map2.put(1, "하나");
		map2.put(2, "둘");
		
		System.out.println(map2.get(1));
		
		HashMap<Boolean, String> map3 = new HashMap<Boolean, String>();
		
		map3.put(true, "천사");
		map3.put(false, "악마");
		
		System.out.println(map3.get(true));
		
		System.out.println();
		
		//HashMap은 순서가 존재하지 않는다.
		
		//1. 요소 추가
		map.put("과학", 100);
		map.put("윤리", 80);
		
		//2. 요소 갯수
		System.out.println(map.size());
		
		//3. 요소 접근
		System.out.println(map.get("국어"));
		System.out.println(map.get("도덕"));
		
		//4. 요소 수정
		//	- HashMap의 key는 유일해야 한다.
		map.put("과학", 90);
		System.out.println(map.get("과학"));
		
		//5. 요소 삭제
		map.remove("과학");
		System.out.println(map.size());
		System.out.println(map.get("과학"));
		
		//6. 요소 확인
		//	- ArrayList or 배열 -> contains
		System.out.println(map.containsKey("국어"));
		System.out.println(map.containsValue(100));
		
		//7. 초기화
		map.clear();
		System.out.println(map.size());
	}
}
