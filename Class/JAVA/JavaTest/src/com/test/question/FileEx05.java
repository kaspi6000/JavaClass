package com.test.homework;

import java.io.File;

public class FileEx05 {

	public static void main(String[] args) {
		
//		문제5.
//
//		요구사항] Music_1과 Music_2 폴더를 서로 비교해서 양쪽 폴더에 모두 존재하는 파일만을 출력하시오.(중복 파일 골라내기)
//		리소스] 동일 파일
//		결과] 중복 파일 리스트
//				7 go up-Yum-Yum (얌얌).mp3
//				10cm-봄이 좋냐__.mp3
//				..
		
		int count = 0;
		
		String path1 = "D:\\파일_디렉토리_문제\\동일 파일\\Music_1";
		File dir1 = new File(path1);
		
		String path2 = "D:\\파일_디렉토리_문제\\동일 파일\\Music_2";
		File dir2 = new File(path2);
		
		File[] list1 = dir1.listFiles();
		File[] list2 = dir2.listFiles();
		
		System.out.println("[중복 파일 리스트]");
		
		for (File f1 : list1) {
			for (File f2 : list2) {
				if (f1.getName().equals(f2.getName())) {
					System.out.println(f1.getName());
					count++;
					break;
				}
			}
		}
		
		System.out.printf("총 %d개의 파일이 중복됩니다.\n", count);
	}
	
}
