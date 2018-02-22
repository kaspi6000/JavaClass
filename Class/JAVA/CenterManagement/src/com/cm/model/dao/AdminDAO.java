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
import com.cm.model.SubjectDTO;
import com.cm.model.SubjectInfoDTO;

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
	
	public CourseListDTO test(String seq) {
		
		try {
			
			CallableStatement stat = conn.prepareCall(ds.get("course.test"));
			
			stat.setString(1, seq);
			
			ResultSet rs = stat.executeQuery();
			
			if (rs.next()) {
				
				CourseListDTO dto = new CourseListDTO();
				
				dto.setSeq(seq);
				dto.setName(rs.getString("name"));
				dto.setStartDate(rs.getString("start_date"));
				dto.setEndDate(rs.getString("end_date"));
				dto.setPopulation(rs.getString("population"));
				dto.setRseq(rs.getString("rseq"));

				return dto;
			}
		} catch (Exception e) {
			System.out.println("AdminDAO.test : " + e.toString());
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

	public int courseMod(CourseDTO dto, String seq) {
		
		try {
			
			CallableStatement stat = conn.prepareCall(ds.get("course.mod"));
			
			stat.setString(1, dto.getName());
			stat.setString(2, dto.getStartDate());
			stat.setString(3, dto.getEndDate());
			stat.setInt(4, dto.getPopulation());
			stat.setString(5, dto.getClassroom());
			stat.setString(6, seq);
			
			return stat.executeUpdate();
		} catch (Exception e) {
			System.out.println("AdminDAO.mod" + e.toString());
		}
		return 0;
	}

	public int courseDelete(String seq) {
		
		try {
			
			CallableStatement stat = conn.prepareCall(ds.get("course.del"));
			
			stat.setString(1, seq);
			
			return stat.executeUpdate();
		} catch (Exception e) {
			System.out.println("AdminDAO.del" + e.toString());
		}
		
		return 0;
	}

	public ArrayList<CourseListDTO> completeCourseList() {
		
		try {
			
			CallableStatement stat = conn.prepareCall(ds.get("course.completeList"));
			
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
			System.out.println("AdminDAO.completeList : " + e.toString());
		}
		return null;
	}

	public int courseComplete(String seq) {
		
		try {
			
			CallableStatement stat = conn.prepareCall(ds.get("course.completion"));
			
			stat.setString(1, seq);
			
			return stat.executeUpdate();
		} catch (Exception e) {
			System.out.println("AdminDAO.complete : " + e.toString());
		}
		return 0;
	}

	public ArrayList<SubjectInfoDTO> subjectInfoView() {
		
		try {
			
			CallableStatement stat = conn.prepareCall(ds.get("subject.info"));
			
			ResultSet rs = stat.executeQuery();
			
			ArrayList<SubjectInfoDTO> list = new ArrayList<SubjectInfoDTO>();
			
			while (rs.next()) {
				
				SubjectInfoDTO dto = new SubjectInfoDTO();
				
				dto.setCourseName(rs.getString("courseName"));
				dto.setCourseDate(rs.getString("courseDate"));
				dto.setRoomName(rs.getString("roomName"));
				dto.setRoomLimit(rs.getString("roomLimit"));
				dto.setSubjectName(rs.getString("subjectName"));
				dto.setSubjectDate(rs.getString("subjectDate"));
				dto.setBookName(rs.getString("bookName"));
				dto.setTeacherName(rs.getString("teacherName"));
				
				list.add(dto);
			}
			
			return list;
		} catch (Exception e) {
			System.out.println("AdminDAO.subjectInfo : " + e.toString());
		}
		return null;
	}

	public ArrayList<SubjectDTO> subjectList() {
		
		try {
			
			CallableStatement stat = conn.prepareCall(ds.get("subject.list"));
			
			ResultSet rs = stat.executeQuery();
			
			ArrayList<SubjectDTO> list = new ArrayList<SubjectDTO>();
			
			while (rs.next()) {
				
				SubjectDTO dto = new SubjectDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setStartDate(rs.getString("start_date"));
				dto.setEndDate(rs.getString("end_date"));
				dto.setWritten(rs.getInt("written"));
				dto.setPerformance(rs.getInt("performance"));
				
				list.add(dto);
			}
			
			return list;
		} catch (Exception e) {
			System.out.println("AdminDAO.subjectList : " + e.toString());
		}
		return null;
	}

	public int subjectMod(SubjectDTO dto, String seq) {
		
		try {
			
			CallableStatement stat = conn.prepareCall(ds.get("subject.mod"));
			
			stat.setString(1, dto.getName());
			stat.setString(2, dto.getStartDate());
			stat.setString(3, dto.getEndDate());
			stat.setInt(4, dto.getWritten());
			stat.setInt(5, dto.getPerformance());
			stat.setString(6, seq);
			
			return stat.executeUpdate();
		} catch (Exception e) {
			System.out.println("AdminDAO.subjectMod : " + e.toString());
		}
		return 0;
	}

	public SubjectDTO subjectT(String seq) {
		
		try {
			
			CallableStatement stat = conn.prepareCall(ds.get("subject.t"));
			
			stat.setString(1, seq);
			
			ResultSet rs = stat.executeQuery();
			
			if (rs.next()) {
				
				SubjectDTO dto = new SubjectDTO();
				
				dto.setSeq(seq);
				dto.setName(rs.getString("name"));
				dto.setStartDate(rs.getString("start_date"));
				dto.setEndDate(rs.getString("end_date"));
				dto.setWritten(rs.getInt("written"));
				dto.setPerformance(rs.getInt("performance"));

				return dto;
			}
		} catch (Exception e) {
			System.out.println("AdminDAO.subjectT : " + e.toString());
		}
		return null;
	}
}
