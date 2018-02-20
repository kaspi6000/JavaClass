package com.cm.model;

public class CourseListInfoDTO {

	private String subjectName;
	private String subjectDate;
	private String roomName;
	private String coursePopulation;
	
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public String getSubjectDate() {
		return subjectDate;
	}
	public void setSubjectDate(String subjectDate) {
		this.subjectDate = subjectDate;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getCoursePopulation() {
		return coursePopulation;
	}
	public void setCoursePopulation(String coursePopulation) {
		this.coursePopulation = coursePopulation;
	}
}
