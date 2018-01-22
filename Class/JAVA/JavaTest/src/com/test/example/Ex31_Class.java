package com.test.example;

public class Ex31_Class {
	
	public static void main(String[] args) {
		
		Pen p1 = new Pen();
		
		p1.color = "black";
		p1.ink = 100;
		p1.thickness = 5;
		
		Pen p2 = new Pen();
		
		p2.color = "red";
		p2.ink = 100;
		p2.thickness = 5;
		
		p1.draw();
		p2.draw();
		
		p1.check();
		p2.check();
		
		//배열
		int[] nums = new int[3];
		
		Pen[] pens = new Pen[3];
		
		pens[0] = new Pen();
		pens[1] = new Pen();
		pens[2] = new Pen();
		
		//NullPointerException
		//눌참조
		pens[0].color = "black";
		pens[0].thickness = 10;
		pens[0].draw();
	}
}

//pen class
class Pen{
	
	//color
	public String color;
	
	//ink
	public int ink;
	
	//pen thickness
	public int thickness;
	
	//행동(되도록이면 객체 자신의 특성을 가지고 행동)
	public void draw() {
		System.out.printf("%s색으로 두께 %d짜리 원을 그립니다.\n", color, thickness);
	}
	
	public void check() {
		System.out.printf("잉크가 %dml 남았습니다.\n", ink);
	}
}

class BlackPen{
	public String color = "black"; //상수(고칠수없는 변수)
}