package com.test.homework;

import java.io.File;
import java.util.ArrayList;

public class FileEx06 {

	public static void main(String[] args) {
		
//		문제6.
//
//		요구사항] 모든 폴더의 파일을 대상으로 크기가 큰 순으로 정렬하시오.
//		리소스] 크기 정렬
//		결과] 모든 폴더 파일들을 한번에 출력하시오.
//				[파일명]			[크기]		[폴더]
//				aaa.exe			57KB		AAA
//				bbb.exe		56KB		CCC
//				ccc.dat			50KB		BBB
//				ddd.txt		45KB		AAA
//		힌트] 처음(각 폴더의 파일들만 따로 모아서 배열(ArrayList<File> list))
//				+ 버블정렬(자바)
		
		String path = "D:\\파일_디렉토리_문제\\크기 정렬";
		File dir = new File(path);
		ArrayList<File> files = new ArrayList<File>();
		
		getFiles(dir, files);
		
		for (int i=0; i<files.size()-1; i++) {
			
			for (int j=0; j<files.size()-i-1; j++) {
				
				if (files.get(j).length() < files.get(j+1).length()) {
					File temp = null;
					temp = files.get(j);
					files.set(j, files.get(j+1));
					files.set(j+1, temp);
				}
				
			}
			
		}
		
		
		System.out.println("[폴더]\t\t[크기]\t\t[이름]");
		for (File f : files) {
			System.out.printf("%s\t\t%10d\t\t%s\n"
											, f.getParent().substring(f.getParent().lastIndexOf("\\")+1)
											, f.length()
											, f.getName());
		}
		
		
	}

	private static void getFiles(File dir, ArrayList<File> files) {
		
		File[] list = dir.listFiles();
		
		for (File f : list) {
			if (f.isFile()) {
				files.add(f);
			}
		}
		
		for (File d : list) {
			if (d.isDirectory()) {
				getFiles(d, files);
			}
		}
		
	}
	
}
