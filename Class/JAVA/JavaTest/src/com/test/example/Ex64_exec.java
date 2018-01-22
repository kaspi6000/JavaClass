package com.test.example;

import java.io.IOException;
import java.util.Scanner;

public class Ex64_exec {

	public static void main(String[] args) throws IOException {
		
		//프로젝트에 활용
		
		//자바는 외부와 관계된 행동에는 반드시 예외 처리를 요구한다
		//	- DB 입출력
		//	- Network 입출력
		//	- 콘솔 입력
		//	- 파일 입출력
		
		//자바 프로그램에서 외부 프로그램 호출하기
		//	- 콘솔, 웹 등..
		
		//메모장 실행
		
		try {
			
			Scanner scan = new Scanner(System.in);
			System.out.println("1. 메모장");
			System.out.println("2. 그림판");
			System.out.println("3. 워드패드");
			System.out.println("4. 윈도우 탐색기");
			System.out.println("5. 익스플로러");
			System.out.println("6. 계산기");
			System.out.print("실행할 프로그램 선택 : ");
			
			String input = scan.nextLine();
			
			if (input.equals("1")) {
				Process notepad = new ProcessBuilder("notepad.exe", "D:\\테스트.txt").start();
			}else if (input.equals("2")) {
				Process notepad = new ProcessBuilder("mspaint.exe").start();
			}else if (input.equals("3")) {
				Process notepad = new ProcessBuilder("wordpad.exe").start();
			}else if (input.equals("4")) {
				Process notepad = new ProcessBuilder("explorer.exe", "D:\\Class\\JAVA").start();
			}else if (input.equals("5")) {
				Process notepad = new ProcessBuilder("C:\\Program Files (x86)\\Google\\Chrome\\Application\\chrome.exe", "https://youtu.be/0wlXaHmmOVc").start();
			}else if (input.equals("6")) {
				Process notepad = new ProcessBuilder("calc.exe").start();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
