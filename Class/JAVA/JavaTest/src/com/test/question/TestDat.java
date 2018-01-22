package com.test.question;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

public class TestDat {
	
	public static void main(String[] args) {
		
		solution9();
	}

	private static void solution9() {
		
//		문제9.
//		리소스] 자바소스.java, 자바예약어.dat
//		요구사항]	소스에서 예약어가 총 몇회 사용되었는지?
//		결과]
//		if : 5회
//		continue : 2회
//		...
//		abstract : 0회
		String path = "D:\\파일_입출력_문제\\자바예약어.dat";
		String path1 = "D:\\파일_입출력_문제\\자바소스.java";
		BufferedReader reader = null;
		try {
			
			String line = "";
			
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			
			ArrayList<String> list = new ArrayList<String>();
			ArrayList<String> list1 = new ArrayList<String>();
			
			reader = new BufferedReader(new FileReader(path));
			
			while ((line = reader.readLine()) != null) {
			
				line = line.trim();
				String[] temp = line.split("\n");
				list.add(temp[0]);
			}
			reader.close();
			
			reader = new BufferedReader(new FileReader(path1));
			
			while ((line = reader.readLine()) != null) {
				
				line = line.trim();
				String[] temp = line.split(" ");
				
				for (int i = 0; i < temp.length; i++) {
					
					list1.add(temp[i]);
				}
			}
			
			for (int i = 0; i < list.size(); i++) {
				
				for (int j = 0; j < list1.size(); j++) {
					
					if (list1.get(j).contains(list.get(i))) {
						
						String extension = list.get(i);
						
						if (!map.containsKey(extension)) {
							
							map.put(extension, 1);
						}else {
							
							map.put(extension, map.get(extension) + 1);
						}
					}
				}
			}
			reader.close();
			
			Set<String> set = map.keySet();
			
			Iterator<String> iter = set.iterator();
			
			while (iter.hasNext()) {
				
				String key = iter.next();
				
				System.out.printf("%s : %d회\n", key, map.get(key));
			}
			
		} catch (Exception e) {
			System.out.println("load : " + e.toString());
		}
	}
}
