package com.schoolmanagement.achievement;

public class Student {

	private String name;			//학생이름
	private String grade;			//학년
	private String classNum;		//반
	private String semester;		//학기
	private String club;			//동아리
	private int korAchiev;			//국어 점수
	private int engAchiev;			//영어 점수
	private int mathAchiev;			//수학 점수
	private int scienceAchiev;		//과학 점수
	private int average;			//평균 점수
	
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
		return String.format ("%6s\t%6s\t%6s\t%6s\t%6d\t%6d\t%6d\t%6d\t%6d\n"
				,this.name
				,this.grade
				,this.classNum
				,this.semester
				,this.korAchiev
				,this.engAchiev
				,this.mathAchiev
				,this.scienceAchiev
				,this.average);
	}
	
}
	

