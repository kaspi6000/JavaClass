package com.test.lambda;

import java.awt.List;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;

public class Ex03 {
	
	public static void main(String[] args) {
		
		//익명객체 사용 -> 람다식 사용
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		list.add(10); list.add(20); list.add(30); list.add(40); list.add(50);
		
		System.out.println(list);
		
//		Collections.sort(list);//단순한 + 값형(+String + 날짜)
//		list.sort(c);//사용자 정의형 + 복잡한(객체)
		
//		list.sort(new Comparator<Integer>() {
//
//			@Override
//			public int compare(Integer o1, Integer o2) {
//				
//				return o2 - o1;
//			}
//		});
		
		
		list.sort((o1, o2) -> o2 - o1); //람다식을 이용하면 이렇게 줄어들 수 있다.
		
		System.out.println(list);
		
		Comparator<Integer> c1 = new Comparator<Integer>() {
			@Override
			public int compare(Integer o1, Integer o2) {
				return o2 - o1;
			}
		};		
		
		Comparator<Integer> c2 = (o1, o2) -> o2 - o1;		
	}//main
	
}//Class Ex03


















