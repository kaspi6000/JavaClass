package com.test.question;

public class MyStack {

	//1. 멤버 변수
		private String[] list;	//데이터 저장
		private int index; 		//입출력 요소의 위치
		private int capacity;	//배열 초기 크기
		
		//2. 생성자
		public MyStack() {
			
			index = 0;
			
			capacity = 4;
			
			list = new String[capacity];
		}
		
		public MyStack(int capacity) {
			
			index = 0;
			
			list = new String[capacity];
		}
		
		//3. toString() 재정의 -> 배열 데이터 덤프
		@Override
		public String toString() {
			
			String result = "[";
			
			for (int i = 0; i < index; i++)
				result += list[i] + " ";
		  
			return result + "]";
		}
		
		//4. 주업무
		public void push(String s) {
			
			System.out.println("length : " + list.length);
			if (list.length == index) newArray();
			 
			list[index] = s;
			
			System.out.println(list[index]);
			System.out.println("index : " + index);
			
			index++;
		}
		
		public void newArray() {
			
			String[] newList = new String[list.length * 2];
			
			for (int i = 0; i < list.length; i++) {
				
				newList[i] = list[i];
			}
			list = newList;
		}
		
		public String pop() {
			
			System.out.println(list[index - 1]);
			return list[index--];
		}
		public void size() {
			
			System.out.println(index);
		}
		public void peak() {
			
			System.out.println(list[index - 1]);
		}
		public void trimToSize() {
			
			String[] newList = new String[index];
			for (int i=0; i<index; i++){
				newList[i] = list[i];
			}
			list = newList;
		}
}


	//	a. push
	//	b. pop
	//	c. size
	//	d. peak
	//	e. trimToSize