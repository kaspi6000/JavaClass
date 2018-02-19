package com.cm.model;


public class SubjectDTO {

	private String name;
	private String startDate;
	private String endDate;
	private int written;
	private int perfomance;
	private CourseDTO course;
	private TextBookDTO textbook;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getWritten() {
		return written;
	}
	public void setWritten(int written) {
		this.written = written;
	}
	public int getPerfomance() {
		return perfomance;
	}
	public void setPerfomance(int perfomance) {
		this.perfomance = perfomance;
	}
	public CourseDTO getCourse() {
		return course;
	}
	public void setCourse(CourseDTO course) {
		this.course = course;
	}
	public TextBookDTO getTextbook() {
		return textbook;
	}
	public void setTextbook(TextBookDTO textbook) {
		this.textbook = textbook;
	}
	
}
