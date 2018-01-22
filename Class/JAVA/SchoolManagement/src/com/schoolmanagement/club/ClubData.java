package com.schoolmanagement.club;

public class ClubData {
	
	private String clubName;
	private String clubExp;
	private String limit;
	private String people;
	
	public String getClubName() {
		return clubName;
	}
	public void setClubName(String clubName) {
		this.clubName = clubName;
	}
	public String getClubExp() {
		return clubExp;
	}
	public void setClubExp(String clubExp) {
		this.clubExp = clubExp;
	}
	public String getLimit() {
		return limit;
	}
	public void setLimit(String limit) {
		this.limit = limit;
	}
	public String getPeople() {
		return people;
	}
	public void setPeople(String people) {
		this.people = people;
	}
	
	@Override
	public String toString() {
		
		String show = String.format("이름 : %s, 내용 : %s, 정원 : %s, 인원 : %s\n"
															, this.clubName
															, this.clubExp
															, this.limit
															, this.people);
		return show;
	}
}































