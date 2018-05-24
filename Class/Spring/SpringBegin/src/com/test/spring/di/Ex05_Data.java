package com.test.spring.di;

import java.util.Random;

public class Ex05_Data {

	public int getData() {
		
		Random rnd = new Random();
		
		return rnd.nextInt(100);
	}
}
