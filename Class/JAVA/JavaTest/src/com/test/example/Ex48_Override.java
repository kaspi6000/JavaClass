package com.test.example;

import java.util.Calendar;

public class Ex48_Override {

	public static void main(String[] args) {
		
		OverrideTime t1 = new OverrideTime(2, 30, 50);
		
		Calendar c = Calendar.getInstance();
		c.set(2017,  11, 15, 2, 30, 50);
		
		int n = 10;
		
		System.out.println(n);
		
		System.out.println(c);	//데이터 출력
		System.out.println(c.toString());
		
		//com.test.example.OverrideTime@232204a1
		System.out.println(t1);
		System.out.println(t1.toString());
	}
}

class OverrideTime {
	
	private int hour;
	private int min;
	private int sec;
	
	public OverrideTime() {
		
		this(0, 0, 0);
	}
	
	public OverrideTime(int hour, int min, int sec) {
		
		this.hour = hour;
		this.min = min;
		this.sec = sec;
	}
	
	@Override
	public String toString() {
		
		//자신의 데이터를 문자열로 만들어서 돌려주기 -> 덤프(dump)
		return String.format("%d:%d:%d", this.hour, this.min, this.sec);
	}
}