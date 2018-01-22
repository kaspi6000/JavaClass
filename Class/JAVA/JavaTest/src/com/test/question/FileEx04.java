package com.test.homework;

import java.io.File;

public class FileEx04 {
	
	public static void main(String[] args) {
		
//		문제4.
//
//		요구사항] 사이즈가 0byte인 파일만 골라서 삭제하시오.
//		리소스] 파일 제거
//		결과] 총 56개의 파일을 삭제했습니다.
		
		String path = "D:\\파일_디렉토리_문제\\파일 제거";
		File dir = new File(path);
		int count = 0;
		
		File[] list = dir.listFiles();
		
		for (File f : list) {
			if (f.isFile()) {
				if (f.length() == 0) {
					f.delete();
					count++;
				}
			}
		}
		
		System.out.printf("총 %d개의 파일을 삭제했습니다.\n", count);
		
	}
	
}
