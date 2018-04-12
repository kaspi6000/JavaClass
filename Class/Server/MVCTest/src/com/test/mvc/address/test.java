package com.test.mvc.address;

public class test {

	public static void main(String[] args) {
		
		
		
		System.out.println(solution("12:01:00", "130"));
	}
	
	public static String solution(String p, String n) {
		
		String time = "";
		
		String h = p.substring(0,2);
		System.out.println("h : " + h);
		String m = p.substring(3, 5);
		System.out.println("m : " + m);
		String s = p.substring(6);
		System.out.println("s : " + s);
		
		int t = Integer.parseInt(n);
		
		int tt = 0;
		int ttt = 0;
		int mm = 0;
		
		if(t > 59) {
			
			tt = (int) Math.floor(t/60);
			mm = Integer.parseInt(m) + tt;
			
			
			
			/*if(mm.length() == 1) {
				
			}*/
			
			System.out.println("tt : " + tt);
			System.out.println("mm : " + mm);
			
			if(tt > 59) {
				
				ttt = (int) Math.floor(tt/60);
			}
		}
		
		return Integer.toString(tt);
	}
}
