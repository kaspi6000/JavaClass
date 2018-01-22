package com.schoolmanagement.board;

import java.awt.TextField;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Scanner;

public class BoardTest {

	private static Scanner scan;
	private static final String PATH = "D:\\SchoolManagement\\쌍용고등학교\\쌍용고등학교_Board";
	private static ArrayList<BoardData> list;
	private static ArrayList<String> boardList;
	private static BufferedReader reader = null;
	
	static {
		
		scan = new Scanner(System.in);
		list = new ArrayList<BoardData>();
		boardList = new ArrayList<String>();
	}

	public static void list() {
		
		File dir = new File(PATH);
		
		File[] files = dir.listFiles();
		
		for (File file : files) {
			
			if (file.isFile()) {
				
				boardList.add(file.getName());
			}
		}
		
		for (int i = 0; i < boardList.size(); i++) {
			
			BoardData data = new BoardData();
			
			String[] temp = boardList.get(i).split("_");
			
			data.setNum(temp[0]);
			data.setTitle(temp[1].replace(".txt", ""));
			
			System.out.println(data);
		}
		
//		try {
//			
//			String path = PATH + "\\" + boardList.get(0);
//			
//			reader = new BufferedReader(new FileReader(path));
//			
//			String line = "";
//			
//			while ((line = reader.readLine()) != null) {
//				
//				System.out.println(line);
//			}
//			
//		} catch (Exception e) {
//			System.out.println("list : " + e.toString());
//		}
	}
	
	public static void main(String[] args) {
	
		System.out.println("========================================================================");
		System.out.println("\t\t\t\t게시판");
		System.out.println("========================================================================");
		System.out.println();
		list();
		System.out.print("확인하고 싶은 글번호(n 다음페이지, p 전페이지, a 글쓰기)를 입력하시오.");
	}
}
