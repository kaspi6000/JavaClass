package com.test.jdbc;

import java.sql.Connection;
import java.sql.Statement;
import java.util.Scanner;

public class Ex04_Statement {

	public static void main(String[] args) {
		
		//고정값 -> 입력값
		
		Connection conn = null;
		Statement stat = null;
		Scanner scan = new Scanner(System.in);
		
		try {
			
			conn = DBUtil.open();
			stat = conn.createStatement();
			
//			System.out.print("이름 : ");
//			String name = scan.nextLine();
//			
//			System.out.print("나이 : ");
//			String age = scan.nextLine();
//			
//			System.out.print("전화 : ");
//			String tel = scan.nextLine();
//			
//			System.out.print("주소 : ");
//			String address = scan.nextLine();
			
			//자바의 자료형 <-> 오라클의 자료형
			// - 언어나 환경이 다르면 자료형은 아무 의미가 없다.
			// - 호환성 0%
			
			//SQL 작성
			//String sql = String.format("INSERT INTO tbladdress(seq, name, age, tel, address, regdate) VALUES(address_seq.nextval, '%s', %s, '%s', '%s', DEFAULT)", name, age, tel, address);
			
			//String sql = "DELETE FROM tbladdress WHERE seq = 23";
			//String sql = "UPDATE tbladdress SET age = 23 WHERE seq = 7";
			//String sql = "CREATE TABLE tblhong(seq NUMBER PRIMARY KEY, data VARCHAR2(100) NOT NULL)";
			String sql = "DROP TABLE tblhong";
			
			int result = stat.executeUpdate(sql); //SELECT를 제외한 모든 쿼리 실행하는 법
			
			if (result == 1) {
				System.out.println("성공");
			}else {
				System.out.println("실패");
			}
			
			stat.close();
			conn.close();
		} catch (Exception e) {
			
			System.out.println(e.toString());
		}
	}
}
