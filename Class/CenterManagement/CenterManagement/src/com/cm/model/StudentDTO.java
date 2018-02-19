package com.cm.model;

public class StudentDTO {
	
	private String name;
	private String tel;
	private String ssn;
	private String registerDate;
	private LoginDTO login;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getSsn() {
		return ssn;
	}
	public void setSsn(String ssn) {
		this.ssn = ssn;
	}
	public String getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}
	public LoginDTO getLogin() {
		return login;
	}
	public void setLogin(LoginDTO login) {
		this.login = login;
	}
	
	

}
