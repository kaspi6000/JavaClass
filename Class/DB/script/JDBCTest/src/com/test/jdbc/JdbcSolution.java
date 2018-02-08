package com.test.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;

public class JdbcSolution {

	public static void main(String[] args) {
		
		m1();
	}

	private static void m1() {
		
		Connection conn = null;
		CallableStatement stat = null;
		
		try {
			
			conn = DBUtil.open();
			
			String sql = "{ call proc_auth(?) }";
			
			stat = conn.prepareCall(sql);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
}
