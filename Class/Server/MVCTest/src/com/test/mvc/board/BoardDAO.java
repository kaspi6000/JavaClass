package com.test.mvc.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.mvc.address.DBUtil;

public class BoardDAO {

	private Connection conn;
	private PreparedStatement stat;
	
	public BoardDAO() {
		
		try {
			
			conn = DBUtil.open();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// AddOk 서블릿이 dto를 줄테니 글써달라고 요청
	public int add(BoardDTO dto) {
		
		try {
			
			String sql = "INSERT INTO tblBoard (seq, subject, content, id, regdate, readcount, tag) VALUES(board_seq.nextval, ?, ?, ?, DEFAULT, DEFAULT, ?)";
			
			stat = conn.prepareStatement(sql);
			
			stat.setString(1, dto.getSubject());
			stat.setString(2, dto.getContent());
			stat.setString(3, dto.getId());
			stat.setString(4, dto.getTag());
			
			return stat.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	// List 서블릿이 목록달라고 위임
	public ArrayList<BoardDTO> list(HashMap<String, String> map) {
		
		try {
			
			String where = "";
			
			if(map.get("isSearch").equals("true")) {
				
				where = String.format("WHERE %s LIKE '%%%s%%'", map.get("column"), map.get("word"));
			}
			
			// My-SQL : limit
			// Oracle : rownum
			// MS-SQL : top
			// String sql = "SELECT * FROM (SELECT seq, subject, id, (SELECT name FROM tblMember WHERE id = b.id) as name, regdate, readcount, round((sysdate - regdate) * 24 * 60) as gap, content FROM tblBoard b) " + where + " ORDER BY seq DESC";
			String sql = String.format("SELECT * FROM (SELECT a.*, rownum as rnum FROM (SELECT seq, subject, id, (SELECT name FROM tblMember WHERE id = b.id) as name, regdate, readcount, round((sysdate - regdate) * 24 * 60) as gap, content FROM tblBoard b %s ORDER BY seq DESC) a) WHERE rnum >= %s and rnum <= %s ORDER BY seq DESC", where, map.get("start"), map.get("end"));
			
			stat = conn.prepareStatement(sql);
			
			ResultSet rs = stat.executeQuery();
			
			// rs -> list
			ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
			
			while (rs.next()) {
				
				// 레코드 1개 -> DTO 1개
				BoardDTO dto = new BoardDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setGap(rs.getInt("gap"));
				
				list.add(dto);
			}
			
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// View 서블릿이 글번호를 줄테니 레코드(DTO)를 주세요.
	public BoardDTO get(String seq) {
		
		try {
			
			String sql = "SELECT b.*, (SELECT name FROM tblMember WHERE id = b.id) AS name FROM tblBoard b WHERE seq = ?";
			
			stat = conn.prepareStatement(sql);
			
			stat.setString(1, seq);
			
			ResultSet rs = stat.executeQuery();
			
			// rs -> dto
			BoardDTO dto = new BoardDTO();
			
			if(rs.next()) {
				
				// 레코드 1건 -> dto 1개
				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setTag(rs.getString("tag"));
			}
			
			return dto;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	// View 서블릿이 글번호를 줄테니 조회수 +1 요청
	public void updateReadCount(String seq) {
		
		try {
			
			String sql = "UPDATE tblBoard SET readcount = readcount + 1 WHERE seq = ?";
			
			stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			
			stat.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int edit(BoardDTO dto) {
		
		try {
			
			String sql = "UPDATE tblBoard SET subject = ?, content = ?, tag = ?" + " WHERE seq = ?";
			
			stat = conn.prepareStatement(sql);
			
			stat.setString(1, dto.getSubject());
			stat.setString(2, dto.getContent());
			stat.setString(3, dto.getTag());
			stat.setString(4, dto.getSeq());
			
			return stat.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return 0;
	}

	public int del(String seq) {
		
		try {
		
			String sql = "DELETE FROM tblBoard WHERE seq = " + seq;
			
			stat = conn.prepareStatement(sql);
			
			return stat.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	// List 서블릿이 게시물의 총 갯수를 반환해달라고 요청
	public int getTotalCount(HashMap<String, String> map) {
		
		try {
			
			String where = "";
			
			if(map.get("isSearch").equals("true")) {
				
				where = String.format("WHERE %s LIKE '%%%s%%'", map.get("column"), map.get("word"));
			}
			
			String sql = "SELECT count(*) AS cnt FROM tblBoard " + where;
			stat = conn.prepareStatement(sql);
			ResultSet rs = stat.executeQuery();
			
			if(rs.next()) {
				
				return rs.getInt("cnt");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
}
