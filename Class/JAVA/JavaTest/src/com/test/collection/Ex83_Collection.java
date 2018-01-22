package com.test.collection;

import java.util.Stack;

public class Ex83_Collection {
	
	private static Stack<String> back; //이전 방문 기록
	private static Stack<String> forward; //다음 방문 기록
	
	static {
		back = new Stack<String>();
		forward = new Stack<String>();
	}

	public static void main(String[] args) {
		
		goUrl("구글");
		goUrl("네이버");
		goUrl("다음");
		
		history();
		
		goBack();//뒤로가기 1번 클릭
		history();
		
		goBack();//뒤로가기 1번 클릭
		history();
		
		goFoward();//앞으로가기 1번 클릭
		history();
		
		m1();
	}
	
	private static void m1() {
		
		int a = 10;
		
		m2();
		
		int f = 60;
		m5();
	}

	private static void m5() {
		
		int e = 50;
	}

	private static void m2() {
		
		int b = 20;
		
		m3();
		m4();
	}

	private static void m4() {
		
		int d = 40;
	}

	private static void m3() {
		
		int c = 30;
	}

	//주소 입력하면 사이트 방문하기
	private static void goUrl(String url) {
		
		System.out.println(url + " 접속함");
		back.push(url);
	}
	
	//방문 기록 확인하기
	private static void history() {
		
		System.out.println("-------------------");
		System.out.println("back : " + back.toString());
		System.out.println("now : " + back.peek());
		System.out.println("forward : " + forward.toString());
		System.out.println("-------------------");
	}
	
	//뒤로 가기
	private static void goBack() {
		
		//뒤로가기 스택 -> (이동) -> 앞으로가기 스택
		if (!back.isEmpty()) {
			forward.push(back.pop()); //옮기기
		}
	}
	
	//앞으로 가기
	private static void goFoward() {
		
		//앞으로가기 스택 -> (이동) -> 뒤로가기 스택
		if (!forward.isEmpty()) {
			back.push(forward.pop());
		}
	}
}
