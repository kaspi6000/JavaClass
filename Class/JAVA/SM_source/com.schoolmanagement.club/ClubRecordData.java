package com.schoolmanagement.club;

public class ClubRecordData {
	
	private String ClubName;
	private String Date;
	private String ClubDailyRecord;
	private String clubTeacherName;
	
	
	public String getClubTeacherName() {
		return clubTeacherName;
	}
	public void setClubTeacherName(String clubTeacherName) {
		this.clubTeacherName = clubTeacherName;
	}
	public String getClubName() {
		return ClubName;
	}
	public void setClubName(String clubName) {
		ClubName = clubName;
	}
	public String getDate() {
		return Date;
	}
	public void setDate(String date) {
		Date = date;
	}
	public String getClubDailyRecord() {
		return ClubDailyRecord;
	}
	public void setClubDailyRecord(String clubDailyRecord) {
		ClubDailyRecord = clubDailyRecord;
	}
	
	@Override
	public String toString() {
		
		String temp = String.format("동아리 명 : %s, 일시 : %s, 일지 : %s\n"
										, this.getClubName()
										, this.getDate()
										, this.getClubDailyRecord());
		
		return temp;
	}
	
}//class ClubRecordData





















