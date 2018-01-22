package com.test.example;

import java.util.Random;

public class MyRandom extends Random{

	//2.
	public int getNumber() {
		
		Random rnd = new Random();
		
		return rnd.nextInt(10) + 1;
	}
	
	//3.
	public String getColor() {
		
		Random rnd = new Random();
		
		String[] colors = {"red", "yellow", "blue", "white", "black"};
		
		return colors[rnd.nextInt(colors.length)]; 
	}
}
