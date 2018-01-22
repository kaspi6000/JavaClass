package com.test.homework;

import java.io.File;

public class FileEx07 {

	public static void main(String[] args) {
		
//		문제7.
//
//		요구사항] 직원 폴더을 접근 -> 직원별 이름으로 폴더 생성 -> 년도별 폴더 생성			-> 각 파일들을 해당로 이동
//		리소스] 직원
//		결과] 분류가 완료되었습니다.
		
		String path = "D:\\파일_디렉토리_문제\\직원";
		File dir = new File(path);
		
		File[] list = dir.listFiles();
		
		for (File f : list) {
			if (f.isFile()) {
				
				String[] temp = f.getName().split("_");
				
				File nameDir = new File(path + "\\" + temp[0]);
				if (!nameDir.exists()) {
					nameDir.mkdir();
				}
				
				File yearDir = new File(path + "\\" + temp[0] + "\\" + temp[1]);
				if (!yearDir.exists()) {
					yearDir.mkdir();
				}
				
				File moveFile = new File(path + "\\" + temp[0] + "\\" + temp[1] + "\\" + f.getName());
				f.renameTo(moveFile);
				
			}
		}
		
		System.out.println("분류가 완료되었습니다.");
		
	}
	
}










