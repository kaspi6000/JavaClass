package com.test.spring.di;

public class Ex06_DAO implements IData {

	private IData data; // 1.
	
	public Ex06_DAO() {
		
		
	}
	
	// 생성자를 통한 의존 객체 주입
	public Ex06_DAO(IData data) { // 2.
		
		this.data = data;
	}
	
	// setter를 통한 의존 객체 주입
	public void setData(IData data) {
		
		this.data = data;
	}
	
	public int getCount() {
		
		// DAO 데이터 처리 중심 객체
		// -> 더 세부적인 데이터 처리는 다른 객체에게 위임
		// 1. Ex03_DB : 현장 담당.
		// 2. Ex03_File : 현장 담당.
		
		// Ex03_DB data = new Ex03_DB();
		// Ex03_File data = new Ex03_File();
		
		// IData data = new Ex04_DB();
		// IData data = new Ex04_File();
		
		return data.getCount();
	}

}
