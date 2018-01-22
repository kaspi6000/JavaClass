package com.test.collection;

import java.util.Comparator;
import java.util.Iterator;
import java.util.TreeSet;

public class Ex86_Collection {

	public static void main(String[] args) {
		
		//TreeSet
		//	- Set : 중복값x, 순서x(-> 정렬x)
		//	- 자동 정렬(데이터를 관리할 때 항상 정렬된 상태로 관리)
		//	- 트리구조(이진 검색 트리 구조)
		//	- 정렬o + 검색, 범위 검색 용이(**)
		
		//m1();
		//m2();
		m3();
	}

	private static void m3() {
		
		//TreeSet<User> set = new TreeSet<User>();
		
		//1. Comparator 사용해서 해결
//		TreeSet<User> set = new TreeSet<User>(new Comparator<User>() {
//
//			@Override
//			public int compare(User o1, User o2) {
//				
//				return o1.getTotalPoint() - o2.getTotalPoint();
//			}
//		});
		
		//2. Comparable 사용해서 해결
		TreeSet<User> set = new TreeSet<User>();
		
		set.add(new User("가가가", 55, 99));
		set.add(new User("나나나", 23, 41));
		set.add(new User("다다다", 46, 13));
		set.add(new User("라라라", 21, 25));
		set.add(new User("마마마", 97, 31));
		set.add(new User("바바바", 14, 55));
		set.add(new User("사사사", 67, 21));
		set.add(new User("아아아", 78, 64));
		
		System.out.println(set);
		
		User u1 = new User("홍길동", 100, 100);
		User u2 = new User("아무개", 50, 50);
		
		System.out.println(u1.compareTo(u2) < 0);
		//System.out.println(u1 < u2);
	}

	private static void m2() {
		
		TreeSet<String> set = new TreeSet<String>();
		
		set.add("강아지");
		set.add("가위");
		set.add("나이순");
		set.add("가방");
		set.add("나비");
		set.add("나방");
		set.add("가죽");
		set.add("라식");
		set.add("가다랭이");
		set.add("강도");
		set.add("나이테");
		set.add("다리");
		set.add("갑순이");
		set.add("다이소");
		set.add("라면");
		set.add("라디오");
		
		System.out.println(set);
		
		System.out.println(set.subSet("나", "라"));
		System.out.println(set.headSet("다"));
		System.out.println(set.tailSet("다"));
		
		//Set -> Iterator
		Iterator<String> iter = set.iterator();
		
		while (iter.hasNext()) {
			
			System.out.println(iter.next());
		}
		System.out.println();
		
		iter = set.descendingIterator();
		
		while (iter.hasNext()) {
			
			System.out.println(iter.next());
		}
		System.out.println();
	}

	private static void m1() {
		
		TreeSet<Integer> set = new TreeSet<Integer>();
		
		for (int i = 0; i < 10; i++) {
			
			int num = (int)(Math.random() * 100) + 1; //1 ~ 100
			set.add(num);
		}
		System.out.println(set);
	}
}

//class User {
//	
//	private String name;
//	private int point;
//	private int bonus;
//	
//	public User(String name, int point, int bonus) {
//		
//		this.name = name;
//		this.point = point;
//		this.bonus = bonus;
//	}
//	
//	@Override
//	public String toString() {
//	
//		return String.format("%s(%d)", this.name, this.point + this.bonus);
//	}
//	
//	public int getTotalPoint() {
//		
//		return this.point + this.bonus;
//	}
//}

class User implements Comparable<User> {
	
	private String name;
	private int point;
	private int bonus;
	
	public User(String name, int point, int bonus) {
		
		this.name = name;
		this.point = point;
		this.bonus = bonus;
	}
	
	@Override
	public String toString() {
	
		return String.format("%s(%d)", this.name, this.point + this.bonus);
	}
	
	public int getTotalPoint() {
		
		return this.point + this.bonus;
	}

	@Override
	public int compareTo(User user) {
		
		return user.getTotalPoint() - this.getTotalPoint();
	}
}