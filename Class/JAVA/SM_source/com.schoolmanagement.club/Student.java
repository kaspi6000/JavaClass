package com.schoolmanagement.club;

public class Student {

	private String name;
	private String grade;
	private String semester;
	private String classNum;
	private String club;
	private int korAchiev;
	private int engAchiev;
	private int mathAchiev;
	private int scienceAchiev;
	private int average;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getClassNum() {
		return classNum;
	}	
	public void setClassNum(String classNum) {
		this.classNum = classNum;
	}
	public String getClub() {
		return club;
	}
	public void setClub(String club) {
		this.club = club;
	}
	public String getSemester() {
		return semester;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}
	public int getKorAchiev() {
		return korAchiev;	
	}
	public void setKorAchiev(String korAchiev) {
		this.korAchiev = Integer.parseInt(korAchiev);
	}
	public int getEngAchiev() {
		return engAchiev;
	}
	public void setEngAchiev(String engAchiev) {
		this.engAchiev = Integer.parseInt(engAchiev);
	}
	public int getMathAchiev() {
		return mathAchiev;
	}
	public void setMathAchiev(String mathAchiev) {
		this.mathAchiev = Integer.parseInt(mathAchiev);
	}
	public int getScienceAchiev() {
		return scienceAchiev;
	}
	public void setScienceAchiev(String scienceAchiev) {
		this.scienceAchiev = Integer.parseInt(scienceAchiev);
	}
	public int getAverage() {
		return average;
	}
	public void setAverage(String average) {
		this.average = (this.korAchiev + this.engAchiev + this.mathAchiev + this.scienceAchiev) /4;
	}
	
	@Override
	public String toString() {
		return String.format ("이름 : %s, 학년 : %s, 학급 : %s, 학기 : %s, 동아리 : %s, 국어 : %d, 영어 : %d, 수학 : %d, 과학 : %d, 평균 : %d\n"
				,this.name
				,this.grade
				,this.classNum
				,this.semester
				,this.club
				,this.korAchiev
				,this.engAchiev
				,this.mathAchiev
				,this.scienceAchiev
				,this.average);
	}

}
	

