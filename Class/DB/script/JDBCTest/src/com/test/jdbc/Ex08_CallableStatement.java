package com.test.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;

import oracle.jdbc.internal.OracleTypes;

public class Ex08_CallableStatement {

	public static void main(String[] args) {
		
		//1. Statement : 정적 쿼리 실행
		//2. PreparedStatement : 동적 쿼리 실행
		//3. CallableStatement : 프로시저 호출 전용
		
		//SELECT * FROM tblinsa WHERE buseo = 입력값;
		
		//m1();
		//m2();
		m3();
	}
	
	private static void m4() {
		
		Connection conn = null;
		CallableStatement stat = null;
		
		try {
			
			conn = DBUtil.open();
			
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
