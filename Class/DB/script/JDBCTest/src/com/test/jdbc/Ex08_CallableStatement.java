package com.test.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.Random;
import java.util.Scanner;

import oracle.jdbc.internal.OracleTypes;

public class Ex08_CallableStatement {

	private static Scanner scan;
	
	static {
		scan = new Scanner(System.in);
	}

	public static void main(String[] args) {
		
		//1. Statement : 정적 쿼리 실행
		//2. PreparedStatement : 동적 쿼리 실행
		//3. CallableStatement : 프로시저 호출 전용
		
		//SELECT * FROM tblinsa WHERE buseo = 입력값;
		
		//m1();
		//m2();
		//m3();
		//m4();
		//m5();
		m6();
	}
	
	private static void m6() {
		
		Random random = new Random();
		String[] names = {"홍길동", "아무개", "하하하", "테스트", "호호호"};
	    String[] items = {"키보드", "마우스", "모니터", "프린터"};
	    int qty = random.nextInt(10) + 1;
	    
	    String name = names[random.nextInt(5)];
	    String item = items[random.nextInt(4)];
	    
	    Connection conn = null;
	    CallableStatement stat = null;
	    
	    
	    	
		    try {
					
		    	conn = DBUtil.open();
		    	
		    	for (int i = 0; i < 100; i++) {
	    		String sql = "{ call proc_addbuy(?, ?, ?) }";
		    	
		    	stat = conn.prepareCall(sql);
	    		
	    		stat.setString(1, names[random.nextInt(5)]);
		    	stat.setString(2, items[random.nextInt(4)]);
		    	stat.setInt(3, random.nextInt(10) + 1);
		    	}
		    	stat.executeQuery();	
		    	
		    	stat.close();
		    	conn.close();
		    	
			} catch (Exception e) {
				System.out.println(e.toString());
			}
	    
	    System.out.println("추가 완료.");
	    
	    System.out.println("수량 입력 : ");
	    String pqty = scan.nextLine();
	    
	    try {
			
	    	conn = DBUtil.open();
    		
    		String sql = "{ call proc_listbuy(?, ?) }";
	    	
	    	stat = conn.prepareCall(sql);
	    	
	    	stat.setString(1, pqty);
	    	
	    	stat.registerOutParameter(2, OracleTypes.CURSOR);
	    	
	    	stat.executeQuery();
	    	
			ResultSet rs = (ResultSet)stat.getObject(2);
			
			System.out.println("[번호]\t[이름]\t[물품]\t[수량]\t[날짜]");
			while (rs.next()) {
				
				System.out.printf("%s\t%s\t%s\t%s\t%s\n"
						, rs.getString("seq")
						, rs.getString("name")
						, rs.getString("item")
						, rs.getString("qty")
						, rs.getString("regdate"));
			}
			
			stat.close();
			conn.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	private static void m5() {
		
		//5. 전화번호 일부 입력 -> 직원 명단을 출력(이름, 부서, 직위, 전화번호)
		//번호 입력 : 123
		//proc_m5(?, ?)
		
		Connection conn = null;
		CallableStatement stat = null;
		
		System.out.println("전화번호 검색 : ");
		String ptel = scan.nextLine();
		
		try {
			
			conn = DBUtil.open();
			
			String sql = "{ call proc_m5(?, ?) }";
			
			stat = conn.prepareCall(sql);
			
			stat.setString(1, ptel);
			
			stat.registerOutParameter(2, OracleTypes.CURSOR);
			
			stat.executeQuery();
			
			ResultSet rs = (ResultSet)stat.getObject(2);
			
			System.out.println("[이름]\t[부서]\t[직위]\t[번호]");
			while (rs.next()) {
				
				System.out.printf("%s\t%s\t%s\t%s\n"
						, rs.getString("name")
						, rs.getString("buseo")
						, rs.getString("jikwi")
						, rs.getString("tel"));
			}
			
			stat.close();
			conn.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	private static void m4() {
		
		//4. 커서 반환
		
		Connection conn = null;
		CallableStatement stat = null;
		
		try {
			
			conn = DBUtil.open();
			
			String sql = "{ call proc_m4(?, ?) }";
			stat = conn.prepareCall(sql);
			
			stat.setString(1, "부산");
			
			stat.registerOutParameter(2, OracleTypes.CURSOR);
			
			stat.executeQuery();
			
			ResultSet rs = (ResultSet)stat.getObject(2);
			
			while (rs.next()) {
				System.out.println(rs.getString("name") + " - " + rs.getString("buseo"));
			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	private static void m3() {
		
		//3. 반환값 O
		Connection conn = null;
		CallableStatement stat = null;
		
		try {
			
			conn = DBUtil.open();
			
			String sql = "{ call proc_m3(?, ?, ?, ?) }";
			stat = conn.prepareCall(sql);
			
			//stat.setString(1, "29");
			stat.setInt(1, 29);
			
			stat.registerOutParameter(2, OracleTypes.VARCHAR); //pname
			stat.registerOutParameter(3, OracleTypes.INTEGER); //page
			stat.registerOutParameter(4, OracleTypes.VARCHAR); //ptel
			
			stat.executeQuery();
			
			System.out.println(stat.getString(2));
			System.out.println(stat.getInt(3));
			System.out.println(stat.getString(4));
			
//			String sql = "{ call proc_m3(?, ?, ?) }";
//			stat = conn.prepareCall(sql);
//			
//			stat.registerOutParameter(1, OracleTypes.VARCHAR); //pname
//			stat.registerOutParameter(2, OracleTypes.INTEGER); //page
//			stat.registerOutParameter(3, OracleTypes.VARCHAR); //ptel
//			
//			stat.executeQuery();
//			
//			System.out.println(stat.getString(1));
//			System.out.println(stat.getInt(2));
//			System.out.println(stat.getString(3));
			
//			String sql = "{ call proc_m3(?) }";
//			stat = conn.prepareCall(sql);
//			
//			//out 매개변수 등록
//			stat.registerOutParameter(1, OracleTypes.INTEGER); //out 변수 생성
//			
//			stat.executeQuery(); //out 변수 채우기
//			
//			//?
//			int count = stat.getInt(1);
//			
//			System.out.println(count);
			
			stat.close();
			conn.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	private static void m2() {
		
		Connection conn = null;
		CallableStatement stat = null;
		
		try {
			
			conn = DBUtil.open();
			
			String sql = "{ call proc_m2 }";
			stat = conn.prepareCall(sql);
			
			stat.executeUpdate();
			
			stat.close();
			conn.close();
			
			System.out.println("tbladdress 초기화 완료.");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	private static void m1() {
		
		//1. 반환값이 없는 SQL(프로시저)
		Connection conn = null;
		CallableStatement stat = null;
		
		try {
			
			conn = DBUtil.open();
			
			String sql = "{ call proc_m1(?, ?, ?, ?) }";
			
			stat = conn.prepareCall(sql);
			
			stat.setString(1, "아무개");
			stat.setInt(2, 25);
			stat.setString(3, "010-5555-6666");
			stat.setString(4, "서울시 강남구 대치동");
			
			stat.executeUpdate();
			
			stat.close();
			conn.close();
			
			System.out.println("완료");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
}
