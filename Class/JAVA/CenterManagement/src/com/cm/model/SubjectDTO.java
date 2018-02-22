package com.cm.model;


public class SubjectDTO {

	private String seq;
	private String name;
	private String startDate;
	private String endDate;
	private int written;
	private int performance;
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
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
	public int getPerformance() {
		return performance;
	}
	public void setPerformance(int perfomance) {
		this.performance = perfomance;
	}
	
}
