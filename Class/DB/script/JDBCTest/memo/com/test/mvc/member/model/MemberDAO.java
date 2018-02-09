package com.test.mvc.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.test.mvc.model.DBUtil;
import com.test.mvc.model.DataSource;

public class MemberDAO {

	private Connection conn;
	private DataSource ds;
	
	public MemberDAO() {
		
		try {
			
			ds = new DataSource();
			conn = DBUtil.open();
			
		} catch (Exception e) {
			System.out.println("MemberDAO Constructor : " + e.toString());
		}
	}

	//MemberClass가 입력받은 회원 정보를 줄테니(dto) 그 정보를 DB에 INSERT 해주라
	public int add(MemberDTO dto) {
		
		try {
			
			PreparedStatement stat = conn.prepareStatement(ds.get("member.add"));
			
			stat.setString(1, dto.getName());
			stat.setString(2, dto.getAge());
			stat.setString(3, dto.getTel());
			stat.setString(4, dto.getEmail());
			stat.setString(5, dto.getPw());
			
			return stat.executeUpdate();
		} catch (Exception e) {
			System.out.println("MemberDAO.add : " + e.toString());
		}
		
		return 0;
	}

	//Auth가 이메일과 비밀번호를 줄테니 인증 처리를 해주라
	public int auth(MemberDTO dto) {
		
		try {
			
			PreparedStatement stat = conn.prepareStatement(ds.get("auth.login"));
			
			stat.setString(1, dto.getEmail());
			stat.setString(2, dto.getPw());
			
			ResultSet rs = stat.executeQuery();
			
			if(rs.next()) {
				
				return rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("MemberDAO.auth : " + e.toString());
		}
		return 0;
	}

	public String getMseq(MemberDTO dto) {
		
		try {
			PreparedStatement stat = conn.prepareStatement(ds.get("member.getMseq"));
			
			stat.setString(1, dto.getEmail());
			
			ResultSet rs = stat.executeQuery();
			
			if (rs.next()) {
				return rs.getString("seq");
			}
		} catch (Exception e) {
			System.out.println("MemberDAO.getMseq : " + e.toString());
		}
		
		return null;
	}

	//MemberClass가 회원 번호를 줄테니 삭제(업데이트)
	public int del(String mseq) {
		
		try {
			
			PreparedStatement stat = conn.prepareStatement(ds.get("member.del"));
			
			stat.setString(1, mseq);
			
			return stat.executeUpdate();
		} catch (Exception e) {
			System.out.println("MemberDAO.del : " + e.toString());
		}
		return 0;
	}
}
