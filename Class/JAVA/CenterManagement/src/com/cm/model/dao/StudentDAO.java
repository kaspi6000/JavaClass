package com.cm.model.dao;

import java.sql.Connection;

import com.cm.db.DBUtil;
import com.cm.db.DataSource;

public class StudentDAO {
	
	private Connection conn;
	private DataSource ds;
	
	public StudentDAO() {
		try {
			
			ds = new DataSource();
			conn = DBUtil.open();
			
		} catch (Exception e) {
			System.out.println("StudentDAO : " + e.toString());
		}
	}

	//StudentController에서 학생 출석을 체크해 달라고 요청
	public void attendCheck() {
		// TODO Auto-generated method stub
		
	}

}
