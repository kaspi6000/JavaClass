package com.test.jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class Ex06_Memo {

	private static Scanner scan;
	private static Connection conn;
	private static Statement stat;
	
	static {
		
		scan = new Scanner(System.in);
		conn = DBUtil.open();
		try {
			stat = conn.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		
		//메모장
		boolean loop = true;
		
		
		while (loop) {	
			
			System.out.println("==========================");
			System.out.println("	메모장");
			System.out.println("==========================");
			System.out.println("1. 메모 쓰기");
			System.out.println("2. 메모 읽기");
			System.out.println("3. 메모 삭제");
			System.out.println("4. 메모 검색");
			System.out.println("5. 종료");
			System.out.print("선택 : ");
			
			int input = scan.nextInt();
			scan.skip("\r\n");
			
			
			try {
				
				if(input == 1) addMemo();
				else if(input == 2) listMemo();
				else if(input == 3) delMemo();
				else if(input == 4) searchMemo();
				else loop = false;
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		System.out.println("메모장을 종료합니다.");
		
		try {
			stat.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private static void addMemo() throws SQLException {
		
		System.out.println("[메모 추가]");
		
		System.out.println("작성자 : ");
		String name = scan.nextLine();
		
		name = name.replace("'", "''");
		
		System.out.println("메모 내용 : ");
		String memo = scan.nextLine();
		
		memo = memo.replace("'", "''");
		
		System.out.println("우선순위(1.높음, 2.중간, 3.낮음) : ");
		String priority = scan.nextLine();
		
		String sql = String.format("INSERT INTO tblmemo VALUES(memoseq.nextval, '%s', '%s', DEFAULT, %s)", name, memo, priority);
		
		int result = stat.executeUpdate(sql);
		
		if (result == 1) {
			System.out.println("추가 완료");
		}else {
			System.out.println("추가 실패");
		}
		
		//System.out.println(sql);
		
		scan.nextLine();
	}

	private static void listMemo() throws SQLException {
		
		System.out.println("[메모 읽기]");
		
		String sql = "SELECT seq, name, to_char(regdate, 'hh24:mi:ss') AS regdate, CASE WHEN priority = 1 THEN '높음' WHEN priority = 2 THEN '중간' WHEN priority = 3 THEN '낮음' END AS priority, memo FROM tblmemo ORDER BY seq DESC";
		
		ResultSet rs = stat.executeQuery(sql);
		
		System.out.println("[번호]\t[작성자]\t[작성시간]\t[우선순위]\t[메모]");
		
		while (rs.next()) {
			
			System.out.printf("%s\t%s\t%s\t%s\t\t%s\n"
					, rs.getString("seq")
					, rs.getString("name")
					, rs.getString("regdate")
					, rs.getString("priority")
					, rs.getString("memo"));
		}
		rs.close();
		
		scan.nextLine();
	}

	private static void delMemo() throws SQLException {
		
		System.out.println("[메모 삭제]");
		
		System.out.print("삭제할 메모 번호 : ");
		String seq = scan.nextLine();
		
		String sql = "DELETE FROM tblmemo WHERE seq = " + seq;
		
		int result = stat.executeUpdate(sql);
		
		if (result == 1) {
			System.out.println("삭제 완료.");
		}else {
			System.out.println("해당 번호는 존재하지 않습니다.");	
		}
		
		scan.nextLine();
	}

	private static void searchMemo() throws SQLException {
		
		System.out.println("[메모 검색]");
		
		System.out.print("검색어 : ");
		String word = scan.nextLine();
		
		String sql = "SELECT seq, name, to_char(regdate, 'hh24:mi:ss') AS regdate, CASE WHEN priority = 1 THEN '높음' WHEN priority = 2 THEN '중간' WHEN priority = 3 THEN '낮음' END AS priority, memo FROM tblmemo WHERE upper(memo) LIKE '%' || upper('" + word + "') || '%' ORDER BY seq DESC";
		
		String sql1 = String.format("SELECT seq, name, to_char(regdate, 'hh24:mi:ss') AS regdate, CASE WHEN priority = 1 THEN '높음' WHEN priority = 2 THEN '중간' WHEN priority = 3 THEN '낮음' END AS priority, memo FROM tblmemo WHERE upper(memo) LIKE '%%' || upper(%s) || '%%' ORDER BY seq DESC", word);
		
		ResultSet rs = stat.executeQuery(sql);
		
		System.out.println("[번호]\t[작성자]\t[작성시간]\t[우선순위]\t[메모]");
		
		while (rs.next()) {
			
			System.out.printf("%s\t%s\t%s\t%s\t\t%s\n"
					, rs.getString("seq")
					, rs.getString("name")
					, rs.getString("regdate")
					, rs.getString("priority")
					, rs.getString("memo"));
		}
		rs.close();
		
		scan.nextLine();
	}
}
