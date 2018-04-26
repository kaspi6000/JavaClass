package com.test.ajax;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class AjaxDAO {
	
	private Connection conn;
	private PreparedStatement stat;
	
	public AjaxDAO() {
		try {
			conn = DBUtil.open();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	public ResearchDTO getResearch(String seq) {
		
		try {
			
			String sql = "select * from tblResearch where seq = ?";
			
			stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			
			ResultSet rs = stat.executeQuery();
			ResearchDTO dto = new ResearchDTO();
			
			if (rs.next()) {
				dto.setSeq(rs.getString("seq"));
				dto.setQuestion(rs.getString("question"));
				dto.setAnswer1(rs.getString("answer1"));
				dto.setAnswer2(rs.getString("answer2"));
				dto.setAnswer3(rs.getString("answer3"));
				dto.setAnswer4(rs.getString("answer4"));
				dto.setCnt1(rs.getInt("cnt1"));
				dto.setCnt2(rs.getInt("cnt2"));
				dto.setCnt3(rs.getInt("cnt3"));
				dto.setCnt4(rs.getInt("cnt4"));
			}
			
			return dto;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}


	public int getIdCheck(String id) {
		
		try {
			
			String sql = "select count(*) from tblMember where id = ?";
			
			stat = conn.prepareStatement(sql);
			stat.setString(1, id);
			
			ResultSet rs = stat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt(1);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}


	public ArrayList<InsaDTO> list(String buseo) {
		
		try {
			
			String sql = "SELECT num, name, jikwi, tel FROM tblinsa WHERE buseo = ?";
			
			stat = conn.prepareStatement(sql);
			
			stat.setString(1, buseo);
			
			ResultSet rs = stat.executeQuery();
			
			ArrayList<InsaDTO> list = new ArrayList<InsaDTO>();
			
			while (rs.next()) {
				
				InsaDTO dto = new InsaDTO();
				
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setJikwi(rs.getString("jikwi"));
				dto.setTel(rs.getString("tel"));
				
				list.add(dto);
			}
			
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	
}