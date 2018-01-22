package com.schoolmanagement.board;

import java.util.Scanner;

public class BoardUi {
	
	private Board boardMgr;
	private Scanner scan;
	
	BoardUi() {
	
		boardMgr = new Board();
	}
	
	private void list(){
		
		System.out.println("===================================");
		System.out.println("===============게 시 판===============");
		System.out.println("===================================");
	  
		if (boardMgr.list().size() == 0){
			
			System.out.println("내용 없음");
		}else {
			
			for (BoardData e : boardMgr.list()) {
				
				System.out.println(e.getNum() + ". " + e.getTitle());
			}
		}
	}
	 
	private void write(){
		
		BoardData rec = new BoardData();
		
		scan = null;
	  
		System.out.println("제목: ");
		
		scan = new Scanner(System.in);
		
		rec.setTitle(scan.nextLine());
	  
		System.out.println("내용: ");
		
		scan = new Scanner(System.in);
		
		rec.setContent(scan.nextLine());
	  
		boardMgr.write(rec);
	}
	 
	private void read(){
	    	
		Scanner scan = new Scanner(System.in);
	    	
		int num = scan.nextInt();
	        
		System.out.println("===================================");
		System.out.println("===============글 목 록===============");
		System.out.println("===================================");
	  
		System.out.println(boardMgr.read(num-1).getNum() +". " + boardMgr.read(num-1).getTitle());
		System.out.println(boardMgr.read(num-1).getContent());
	}
	 
	private void prompt(){
	    	
		while (true){
	        	
			Scanner scan = new Scanner(System.in);
	            
			String cmd = scan.next();
	            
			if (cmd.equals("l") || cmd.equals("L")){			
				list();
			} else if(cmd.equals("w") || cmd.equals("W")) {
				write();
			} else if(cmd.equals("r") || cmd.equals("R")){
				read();    
			} else {
				System.exit(0);
			}
		}
	}
	 
	public static void main(String[] args) {
	     
		BoardUi my = new BoardUi();
		my.list();
		my.prompt();
	}
	
//	private static final String PATH = "D:\\SchoolManagement\\월봉고등학교\\월봉고등학교_Board";
//	
//	public static void main(String[] args) {
//		
//		System.out.println("========================================================================");
//		System.out.println("\t\t\t\t게시판");
//		System.out.println("========================================================================");
//		System.out.println();
//	}
}
