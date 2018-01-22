package com.test.question;

public class Pen {

	private String color;
	private int ink;
	private int thick;
	
	private static int total;
	private static int lineCount;
	private static int circleCount;
	private static int rectangleCount;
	
	public static void report() {
		
		System.out.println("총 잉크 사용량 : " + Pen.total);
		System.out.println("Line : " + lineCount);
		System.out.println("Circle : " + circleCount);
		System.out.println("Rectangle : " + rectangleCount);
	}
	
	public Pen() {
		this.color = "검정";
		this.ink = 100;
	}
	
	public Pen(String color) {
		
		this.color = color;
		this.ink = 100;
	}

	public Pen(int ink) {
		
		this.color = "검정";
		this.ink = ink;
	}

	public Pen(String color, int ink) {
		
		this.color = color;
		this.ink = ink;
	}

	public void drawLine() {

		//ink -2ml
		if (this.ink >= 2) {
			System.out.printf("%s색으로 선을 그렸습니다\n", color);
			this.ink = this.ink - 2;
			Pen.total += 2;
			lineCount++;
		}else {
			System.out.println("잉크가 모자랍니다\n");
		}
	}
	
	public void drawLine(int thick) {
	
		//ink -2ml
		if (this.ink >= 2 * thick) {
			System.out.printf("%s색으로 선을 그렸습니다\n", color);
			this.ink = ink - thick * 2;
			Pen.total += 2 * thick;
			lineCount++;
		}else {
			System.out.println("잉크가 모자랍니다\n");
		}
	}
	
	public void drawCircle() {
		
		//ink -3ml
		if (this.ink >= 3) {
			System.out.printf("%s색으로 원을 그렸습니다\n", color);
			this.ink = this.ink - 3;
			Pen.total += 3;
			circleCount++;
		}else {
			System.out.println("잉크가 모자랍니다\n");
		}
	}
	
	public void drawCircle(int thick) {
		
		if (this.ink >= 3 * thick) {
			System.out.printf("%s색으로 원을 그렸습니다\n", color);
			this.ink = ink - thick * 3;
			Pen.total += 3 * thick;
			circleCount++;
		}else {
			System.out.println("잉크가 모자랍니다\n");
		}
	}
	
	public void drawRectangle() {
		
		//ink -4ml
		if (this.ink >= 4) {
			System.out.printf("%s색으로 사각형을 그렸습니다\n", color);
			this.ink = this.ink - 4;
			Pen.total += 4;
			rectangleCount++;
		}else {
			System.out.println("잉크가 모자랍니다\n");
		}
	}
	
	public void drawRectangle(int thick) {
		
			//ink -4ml
			if (this.ink >= 4 * thick) {
				System.out.printf("%s색으로 사각형을 그렸습니다\n", color);
				this.ink = ink - thick * 4;
				Pen.total += 4 * thick;
				rectangleCount++;
			}else {
				System.out.println("잉크가 모자랍니다\n");
			}
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public int getInk() {
		return ink;
	}

	public void setInk(int ink) {
		this.ink = ink;
	}

	public int getThick() {
		return thick;
	}

	public void setThick(int thick) {
		this.thick = thick;
	}
}
