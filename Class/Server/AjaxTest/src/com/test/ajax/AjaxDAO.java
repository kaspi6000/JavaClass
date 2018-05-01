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


	public ArrayList<DepartmentDTO> listDepartment() {
		
		try {
			
			String sql = "SELECT * FROM departments d WHERE (SELECT count(*) FROM employees WHERE department_id = d.department_id) > 0";
			
			stat = conn.prepareStatement(sql);
			
			ResultSet rs = stat.executeQuery();
			
			ArrayList<DepartmentDTO> list = new ArrayList<DepartmentDTO>();
			
			while (rs.next()) {
				
				DepartmentDTO dto = new DepartmentDTO();
				
				dto.setId(rs.getString("department_id"));
				dto.setName(rs.getString("department_name"));
				
				list.add(dto);
			}
			
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}


	public ArrayList<ChartDTO> listChart(String id) {
		
		try {
			
			String sql = "SELECT count(*), ceil(salary/1000) * 1000 FROM employees WHERE department_id = ? GROUP BY ceil(salary/1000)";
			
			stat = conn.prepareStatement(sql);
			
			stat.setString(1, id);
			
			ResultSet rs = stat.executeQuery();
			
			ArrayList<ChartDTO> list = new ArrayList<ChartDTO>();
			
			while (rs.next()) {
				
				ChartDTO dto = new ChartDTO();
				
				dto.setCnt(rs.getInt("1"));
				dto.setSalary(rs.getInt("2"));
				
				list.add(dto);
			}
			
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}


	public boolean check(String id) {
		
		try {
			
			String sql = "SELECT count(*) FROM tblPosition WHERE id = ?";
			
			stat = conn.prepareStatement(sql);
			
			stat.setString(1, id);
			
			ResultSet rs = stat.executeQuery();
			
			if(rs.next()) {
				
				boolean result = rs.getInt(1) == 1 ? true : false;
				
				conn.close();
				
				return result;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}


	public int updatePosition(CatDTO dto) {
		
		try {
			
			String sql = "UPDATE tblPosition SET x = ?, y = ? WHERE id = ?";
			
			stat = conn.prepareStatement(sql);
			
			stat.setString(1, dto.getLeft());
			stat.setString(2, dto.getTop());
			stat.setString(3, dto.getId());
			
			int result = stat.executeUpdate(); 
			
			conn.close();
				
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}


	public int insertPosition(CatDTO dto) {
		
		try {
			
			String sql = "INSERT INTO tblPosition VALUES (position_seq.nextval, ?, ?, ?)";
			
			stat = conn.prepareStatement(sql);
			
			stat.setString(1, dto.getId());
			stat.setString(2, dto.getLeft());
			stat.setString(3, dto.getTop());
			
			int result = stat.executeUpdate();
			
			conn.close();
			
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}


	public ArrayList<CatDTO> listCat() {
		
		try {
			
			String sql = "SELECT * FROM tblPosition";
			
			stat = conn.prepareStatement(sql);
			
			ResultSet rs = stat.executeQuery();
			
			ArrayList<CatDTO> list = new ArrayList<CatDTO>();
			
			while(rs.next()) {
				
				CatDTO dto = new CatDTO();
				
				dto.setId(rs.getString("id"));
				dto.setLeft(rs.getString("x"));
				dto.setTop(rs.getString("y"));
			}
			
			conn.close();
			
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}


	public ArrayList<String> query(String query) {
		
		try {
			
			String sql = "SELECT * FROM tblWord WHERE word like ? || '%'";
			
			stat = conn.prepareStatement(sql);
			
			stat.setString(1, query);
			
			ResultSet rs = stat.executeQuery();
			
			ArrayList<String> list = new ArrayList<String>();
			
			while(rs.next()) {
				
				list.add(rs.getString("word"));
			}
			
			conn.close();
			
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	
}