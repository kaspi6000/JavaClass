package com.test.mvc.memo.model;

import java.sql.Connection;
import java.sql.Statement;

import com.test.mvc.model.DBUtil;
import com.test.mvc.model.DataSource;

//Data Access Object
// : 데이터베이스 업무 담당자
// : JDBC관련 코드들은 이곳에서만 코딩(절대로 다른 클래스에서 Connection, Statement, ResultSet이 발견되면 안된다.)
// : <-> DAO 이외의 나머지 객체는 DB업무를 하면 안된다(**) 
public class MemoDAO {

	private Connection conn;
	private Statement stat;
	private DataSource ds;
	
	public MemoDAO() {
		
		try {
			
			ds = new DataSource();
			conn = DBUtil.open();
			stat = conn.createStatement();
			
		} catch (Exception e) {
			System.out.println("MemoDAO Constructor : " + e.toString());
		}
	}
}
