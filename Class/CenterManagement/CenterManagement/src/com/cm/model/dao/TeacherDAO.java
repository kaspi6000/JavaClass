package com.cm.model.dao;

import java.sql.Connection;

import com.cm.db.DBUtil;
import com.cm.db.DataSource;

public class TeacherDAO {
	
	private Connection conn;
	private DataSource ds;
	
	public TeacherDAO() {
		try {
			
			ds = new DataSource();
			conn = DBUtil.open();
			
		} catch (Exception e) {
			System.out.println("TeacherDAO : " + e.toString());
		}
	}

}
