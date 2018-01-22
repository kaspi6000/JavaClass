package com.test.example;

public class Ex37_Constuctor {
	
	public static void main(String[] args) {
		
		Time t1 = new Time();
		t1.checkTime();
		
		Time t2 = new Time(2, 30, 50);
		t2.checkTime();
		
		Time t3 = new Time(2, 120, 30);
		t3.checkTime();
		
		Time t4 = new Time(10000);
		t4.checkTime();
	}
}
