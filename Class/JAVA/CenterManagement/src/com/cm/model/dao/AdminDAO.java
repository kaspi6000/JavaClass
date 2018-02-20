package com.cm.model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.cm.db.DBUtil;
import com.cm.db.DataSource;
import com.cm.model.CourseDTO;
import com.cm.model.CourseListDTO;
import com.cm.model.CourseListInfoDTO;

public class AdminDAO {
	
	private Connection conn;
	private DataSource ds;
	
	public AdminDAO() {
		try {
			
			ds = new DataSource();
			conn = DBUtil.open();
			
		} catch (Exception e) {
			System.out.println("AdminDAO : " + e.toString());
		}
	}
	
	public ArrayList<CourseListInfoDTO> courseListInfo(String seq) {
		
		try {
			
			CallableStatement stat = conn.prepareCall(ds.get("course.list.info"));
			
			stat.setString(1, seq);
			
			ResultSet rs = stat.executeQuery();
			
			ArrayList<CourseListInfoDTO> list = new ArrayList<CourseListInfoDTO>();
			
			while (rs.next()) {
				
				CourseListInfoDTO dto = new CourseListInfoDTO();
				
				dto.setSubjectName(rs.getString("subjectName"));
				dto.setSubjectDate(rs.getString("subjectDate"));
				dto.setRoomName(rs.getString("roomName"));
				dto.setCoursePopulation(rs.getString("coursePopulation"));
				
				list.add(dto);
			}
			
			return list;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return null;
	}
	
	public ArrayList<CourseListDTO> courseList() {
		
		try {
			
			CallableStatement stat = conn.prepareCall(ds.get("course.list"));
			
			ResultSet rs = stat.executeQuery();
			
			ArrayList<CourseListDTO> list = new ArrayList<CourseListDTO>();
			
			while (rs.next()) {
				
				CourseListDTO dto = new CourseListDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setStartDate(rs.getString("start_date"));
				dto.setEndDate(rs.getString("end_date"));
				dto.setPopulation(rs.getString("population"));
				dto.setRseq(rs.getString("rseq"));
				
				list.add(dto);
			}
			
			return list;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return null;
	}
	
	public int courseAdd(CourseDTO dto) {
		
		try {
			
			CallableStatement stat = conn.prepareCall(ds.get("course.add"));
			
			stat.setString(1, dto.getName());
			stat.setString(2, dto.getStartDate());
			stat.setString(3, dto.getEndDate());
			stat.setInt(4, dto.getPopulation());
			stat.setString(5, dto.getClassroom());
			
			return stat.executeUpdate();
		} catch (Exception e) {
			
			System.out.println("AdminDAO.add : " + e.toString());
		}
		
		return 0;
	}
}
