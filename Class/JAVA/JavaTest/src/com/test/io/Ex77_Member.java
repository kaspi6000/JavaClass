package com.test.io;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Scanner;

public class Ex77_Member {

	private static Scanner scan;; //모든 메소드에서 사용
	private static final String FILEPATH = "member.dat";
	private static ArrayList<Member> list;
	
	static {
		
		scan = new Scanner(System.in);
		list = new ArrayList<Member>(); //Ex70 예제
	}
	
	public static void main(String[] args) {
		
//		try {
//			
//			//드라이브명으로 시작 경로 : 절대 경로
//			//.으로 시작 경로 : 상대 경로(나를 중심으로 표현)
//			//	- . : 현재 프로그램이 실행 중인 디렉토리
//			BufferedWriter writer = new BufferedWriter(new FileWriter("member.dat", true));
//		} catch (Exception e) {
//			System.out.println("main : " + e.toString());
//		}
		
		//Ex76_Member의 단점
		//1. 파일 입출력이 너무 잦음. > 고비용
		//2. 스트림은 사용하기가 불편
		
		//회원 정보 관리 프로그램
		//	: 컬렉션 + 파일 입출력
		
		//추가, 목록, 삭제
		
		load();
		
		boolean loop = true;
		
		while (loop) {
			
			System.out.println("====================");
			System.out.println("회원 정보 관리");
			System.out.println("====================");
			System.out.println("1. 회원 추가");
			System.out.println("2. 회원 목록");
			System.out.println("3. 회원 삭제");
			System.out.println("4. 종료");
			System.out.print("선택 : ");
			
			String sel = scan.nextLine();
			
			if (sel.equals("1")) addMember();
			else if(sel.equals("2")) listMember();
			else if(sel.equals("3")) deleteMember();
			else loop = false; // 메뉴 탈출
		}
		
		System.out.println("프로그램 종료");
		
		save();
	}
	
	private static void save() {
		
		//메모리 -> member.dat 옮기기
		try {
			
			BufferedWriter writer = new BufferedWriter(new FileWriter(FILEPATH));
			
			//ArrayList -> Member 1개 -> member.dat -> 1줄
			for (Member member : list) {
				
				String line = String.format("%s,%s,%s,%s", member.getName(), member.getAge(), member.getAddress(), member.getTel());
				
				writer.write(line); //메모리 -> 텍스트파일 복사
				
				writer.newLine();
			}
		} catch (Exception e) {
			System.out.println("save : " + e.toString());
		}
	}

	private static void load() {
		
		//member.dat -> 메모리 옮기기
		try {
			
			BufferedReader reader = new BufferedReader(new FileReader(FILEPATH));
			
			String line = "";
			
			while ((line = reader.readLine()) != null) {
				
				//텍스트 1줄 = 1명 회원 = Member 객체 1개
				String[] temp = line.split(",");
				
				Member member = new Member();
				
				member.setName(temp[0]);
				member.setAge(temp[1]);
				member.setAddress(temp[2]);
				member.setTel(temp[3]);
				
				list.add(member);
			}
			
			reader.close();
			
		} catch (Exception e) {
			System.out.println("load : " + e.toString());
		}
	}

	private static void addMember() {
		
		System.out.println("[회원 추가]");
		
		String name = "";
		String age = "";
		String address = "";
		String tel = "";
		
		System.out.print("이름 : ");
		name = scan.nextLine();
		
		System.out.print("나이 : ");
		age = scan.nextLine();

		System.out.print("주소 : ");
		address = scan.nextLine();
		
		System.out.print("전화 : ");
		tel = scan.nextLine();
		
		//파일 쓰기 -> Member 객체를 ArrayList에 추가하기
		Member member = new Member();
		member.setName(name);
		member.setAge(age);
		member.setAddress(address);
		member.setTel(tel);
		
		list.add(member); //회원 목록에 새로운 회원 추가하기
	}

	private static void listMember() {
		
		System.out.println("[회원 목록]");
		
		for (Member member : list) {
			System.out.println("이름 : " + member.getName());
			System.out.println("나이 : " + member.getAge());
			System.out.println("주소 : " + member.getAddress());
			System.out.println("전화 : " + member.getTel());
			System.out.println();
		}
	}

	private static void deleteMember() {
		
		//파일 입출력 > 스트림은 수정 & 삭제 작업이 존재하지 않는다. > 새로 생성 + 데이터 추가 & 데이터 읽기
		//회원 삭제
		System.out.println("[회원 삭제]");
		
		System.out.print("이름 : ");
		String name = scan.nextLine();
		
		for (Member member : list) {
			
			if (member.getName().equals(name)) {
				
				list.remove(member);
			}
		}
	}
}
