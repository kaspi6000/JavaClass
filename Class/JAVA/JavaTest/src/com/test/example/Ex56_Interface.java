package com.test.example;

public class Ex56_Interface {

	public static void main(String[] args) {
		
		//지난 수업
		//일반클래스 < 일반클래스
		//추상클래스 < 일반클래스
		//일반클래스 < 추상클래스 //x
		//추상클래스 < 추상클래스
		
		//일반클래스 - 추상클래스 - 인터페이스 : 상속
		//1. 일반클래스 < 일반클래스	**
		//2. 추상클래스 < 일반클래스 //일반멤버 상속, 추상메소드 구현	**
		//3. 인터페이스 < 일반클래스 //추상메소드 구현	**
		
		//4. 일반클래스 < 추상클래스 //x
		//5. 일반클래스 < 인터페이스 //x
		
		//6. 추상클래스 < 추상클래스 < 일반클래스 //o
		//7. 인터페이스 < 인터페이스 < 일반클래스 //o	**
		
		//8. 추상클래스 < 인터페이스 < 일반클래스 //5, x
		//9. 인터페이스 < 추상클래스 < 일반클래스 //o
	}
}

class AAAAA {
	
	public int num;
	
	public void aaaaa() {
		
	}
}

//interface BBBBB extends AAAAA {
//	
//	void bbb();
//}