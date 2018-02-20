package com.cm.model.dao;

import java.sql.Connection;

import com.cm.db.DBUtil;
import com.cm.db.DataSource;

public class AuthDAO {
	
	private Connection conn;
	private DataSource ds;
	
	public AuthDAO() {
		try {
			
			ds = new DataSource();
			conn = DBUtil.open();
			
		} catch (Exception e) {
			System.out.println("AuthDAO : " + e.toString());
		}
	}

	//로그인 시, 현재 로그인한 회원의 이름을 받아와서 반환해준다
	public String getName() {
		// TODO Auto-generated method stub
		return null;
	}
	

	//Auth클래스에서 로그인 시, 회원 번호를 반환해준다.
	public int getMseq() {
		// TODO Auto-generated method stub
		return 0;
	}
	

	//Auth클래스에서 로그인 시, 권한 번호를 반환해준다.
	public int getAuth() {
		// TODO Auto-generated method stub
		return 0;
	}


}



































