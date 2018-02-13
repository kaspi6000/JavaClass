package com.test.mvc.model;

import java.util.Arrays;
import java.util.List;

public class Ex06 {

	public static void main(String[] args) {
		
		m1();
	}

	private static void m1() {
		
		//nums.stream().filter(num -> num % 2 == 0).forEach(num -> System.out.printf("%3d", num));
		System.out.println();
		
		List<String> names = Arrays.asList("홍길동", "이순신", "홍바보", "홍순신", "테스트", "아무개");
		
		//홍길동 이순신 홍바보 홍순신 테스트 아무개
		names.stream().forEach(name -> System.out.printf("%5s", name));
		System.out.println();
		
		//홍씨
		names.stream().filter(name -> name.startsWith("홍")).forEach(name -> System.out.printf("%4s", name));
		System.out.println();
		
		names.stream().filter(Ex06::checkName).forEach(Ex06::printName);
		System.out.println();
	}
	
	//메소드 매개변수
	// - String... args
	// - 가변인자 리스트
	// - 인자의 갯수가 가변적인 경우 사용
	// - printf("형식문자열", 100, true, "홍길동")
	// - printf("형식문자열", 100)
	// - printf("형식문자열", 100, true)
	public static void printName(String...args) {
		
		System.out.printf("%4s", args[0]);
	}
	
	public static boolean checkName(String name) {
		
		if(name.startsWith("홍")) {
			return true;
		} else {
			return false;
		}
	}
}

class Tablet {
	
	//서브 타입(Tablet 소속)
	public enum Color {Black, WHITE, RED, BLUE};
	
	private String name;
	private int size;
	private Color color;
	
	//생성자 + Getter/Setter + toString()
	public Tablet(String name, int size, Color color) {
		
		this.name = name;
		this.size = size;
		this.color = color;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public int getSize() {
		return size;
	}
	
	public void setSize(int size) {
		this.size = size;
	}
	
	public Color getColor() {
		return color;
	}
	
	public void setColor(Color color) {
		this.color = color;
	}

	@Override
	public String toString() {
		return "Tablet [name=" + name + ", size=" + size + ", color=" + color + "]";
	}
}