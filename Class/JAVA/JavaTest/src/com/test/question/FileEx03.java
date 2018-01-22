package com.test.homework;

import java.io.File;

public class FileEx03 {
	
	private static int fileCount = 0;
	private static int dirCount = 0;

	public static void main(String[] args) {
		
//		문제3.
//
//		요구사항] delete 폴더를 삭제하시오.
//		리소스] 폴더 삭제 > delete
//		결과] 폴더를 삭제했습니다. - A
//		힌트] 파일 개수 예제(재귀 메소드)
//		추가] 폴더 3개와 파일 6개를 삭제했습니다. - B
		
		String path = "D:\\파일_디렉토리_문제\\폴더 삭제\\delete";
		File dir = new File(path);
		
		deleteAll(dir);
		
		System.out.printf("폴더 %d개와 파일 %d개를 삭제했습니다.\n"
										, fileCount
										, dirCount);
		
	}

	private static void deleteAll(File dir) {

		File[] list = dir.listFiles();
		
		for (File f : list) {
			if (f.isFile()) {
				f.delete();
				fileCount++;
			}
		}
		
		for (File d : list) {
			if (d.isDirectory()) {
				deleteAll(d);
				dirCount++;
			}
		}
		
		dir.delete();
		
	}
	
}







