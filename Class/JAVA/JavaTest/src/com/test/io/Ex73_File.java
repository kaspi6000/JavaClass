package com.test.io;

import java.io.File;

public class Ex73_File {

	public static void main(String[] args) {
		
		//파일 & 디렉토리
		//1. 엑세스 & 조합 : 윈도우 탐색기 행동
		//2. 파일 데이터 입/출력 : 메모장
		
		//m1();
		//m2();
		//m3();
		//m4();
		//m5();
		
		//m7();
		//m8();
		//m9();
		m10(); //재귀
	}
	
	private static void m10() {
		
		//m9()와 동일한 업무
		//특정 폴더의 파일이 총 몇개?
		//파일 : 3,736 폴더 : 1,407
		
		String path = "C:\\eclipse";
		
		File dir = new File(path);
		
		int count = 0;	//누적 변수
		
		int dirCount = 0;
		
		dirCount = getDirCount(dir, count);
		
		count = getFileCount(dir, count);
		
		System.out.println("파일 갯수 : " + count);
		
		System.out.println("폴더 갯수 : " + dirCount);
	}

	private static int getDirCount(File dir, int dirCount) {
		
		if (dir.exists()) {
			
			File[] dirs = dir.listFiles();
			
			for (File folder : dirs) {
				
				if (folder.isDirectory()) {
					
				}
			}
		}
		
		return dirCount;
	}

	private static int getFileCount(File dir, int count) {
		
		if (dir.exists()) {
			
			File[] files = dir.listFiles();
			
			for (File file : files) {
				
				if (file.isFile()) {
					
					//이 부분이 업무에 맞게 수정 > 해당 폴더와 관련된 정보를 취득할 수 있다.
					count++;
				}
			}
			
			for (File subdir : files) {
				
				if (subdir.isDirectory()) {

					//부모와 동일한 업무 다시 반복
					count = getFileCount(subdir, count);
				}
			}
		}
		
		return count;
	}

	private static void m9() {
		
		//특정 폴더의 파일이 총 몇개?
		//폴더 : 1,407	파일 : 3,736
		String path = "C:\\eclipse";
		
		File dir = new File(path);
		
		int count = 0;	//누적 변수
		
		if (dir.exists()) {
			
			//자식들
			File[] files = dir.listFiles();
			
			//자식 갯수 세기
			for (File file : files) {
				
				if (file.isFile()) {
					
					count++;	//파일 갯수 + 1
				}
			}
			
			//자식 폴더를 대상으로 자신의 행동과 동일한 행동 실행
			for (File subdir : files) {
				
				if (subdir.isDirectory()) {
					
					//손자 목록
					File[] subfiles = subdir.listFiles();
					
					for (File subfile : subfiles) {
						
						if (subfile.isFile()) {
							
							count++;
						}
					}
					
					for (File subsubdir : subfiles) {
						
						if (subsubdir.isDirectory()) {
							
							//손자 폴더들
							
						}
					}
				}
			}
		}
		
		System.out.printf("총 파일 갯수 : %d개\n", count);
	}

	private static void m8() {
		
		//폴더의 내용 보기
		//	- 현재 폴더내에 들어있는 자식 폴더와 파일들을 가져오기
		
		String path = "C:\\eclipse";
		
		File dir = new File(path);
		
		if (dir.exists()) {
			
			//자식들 이름(폴더명 + 파일명)
//			String[] list = dir.list();
//			
//			for (String name : list) {
//				
//				System.out.println(name);
//				File file = new File(path + "\\" + name);
//				System.out.println(file.getName() + " : " + file.isFile());
//			}
			
			File[] files = dir.listFiles();
			
			for (File file : files) {
				
				if (file.isDirectory()) {
					System.out.println("[" + file.getName() + "]");
				}
			}
			
			for (File file : files) {
				
				if (file.isFile()) {
					System.out.println(file.getName());
				}
			}
		}
	}

	private static void m7() {
		
		//폴더 삭제하기
		//	- 반드시 빈폴더일 경우만 삭제가 된다.
		String path = "D:\\aaa";
		File dir = new File(path);
		
		if (dir.exists()) {
			System.out.println(dir.delete());
		}
	}

	private static void m5() {
		
		//폴더 생성하기
		String path = "D:\\aaa\\ddd";
		
		File dir = new File(path);
		
		if (!dir.exists()) {
			//없으면
			dir.mkdir();
			System.out.println("폴더 생성 완료");
		}else {
			//있으면
			System.out.println("같은 이름의 폴더가 이미 존재합니다.");
		}
		
		//회원 정보 -> 각 회원별 개인 파일을 저장할 폴더가 필요
//		String[] list = new String[];
	}
	
	private static void m4() {
		
		//파일 삭제하기
		String path = "D:\\aaa\\홍길동.txt";
		
		File file = new File(path);
		
		if (file.exists()) {
			boolean result = file.delete();
			System.out.println("삭제 완료 : " + result);
		}
	}

	private static void m3() {
		
		//파일 이동하기
		//파일.txt -> [2017.12.21]파일.txt
		String path = "D:\\aaa\\파일.txt";
		File file = new File(path);
		
		if (file.exists()) {
			
//			String dest = "D:\\aaa\\bbb\\파일.txt";
//			Calendar now = Calendar.getInstance();
//			
//			String dest = String.format("D:\\aaa\\bbb\\[%d.%d.%d]%s", now.get(Calendar.YEAR), now.get(Calendar.MONTH) + 1, now.get(Calendar.DATE), file.getName());
			
			String dest = "D:\\aaa\\홍길동.txt";
			
			File destFile = new File(dest);
			
			//이동하기
			file.renameTo(destFile);
			
			System.out.println("이동 완료");
		}
	}
	
	private static void m2() {
		
		//디렉토리 접근 > 폴더의 정보 얻어오기
		String path = "D:\\aaa";
		
		File dir = new File(path);
		
		if (dir.exists()) {
			
			System.out.println(dir.getName());			//파일명
			System.out.println(dir.isFile());			//파일인지?
			System.out.println(dir.isDirectory());		//디렉토리인지?
			System.out.println(dir.lastModified());		//마지막 수정날짜
			System.out.println(dir.canRead());			//읽기 권한
			System.out.println(dir.canWrite());			//쓰기 권한
			System.out.println(dir.isHidden());			//숨김?
			System.out.println(dir.length());			//파일 크기(바이트)
			System.out.println(dir.getPath());			//경로
			System.out.println(dir.getAbsolutePath());	//절대경로
			System.out.println(dir.canExecute());		//실행 가능?
		}else {
			System.out.println("폴더가 존재하지 않습니다.");
		}
	}

	private static void m1() {
		
		//파일 접근 > 파일의 정보 얻어오기
		
		//파일 참조 객체 생성 > 객체 조작 > 파일 조작
		
		String path = "D:\\파일.txt";
		
		File file = new File(path);
		
//		System.out.println(file.exists());
		
		if (file.exists()) {
			
			//파일 있음
			System.out.println(file.getName());			//파일명
			System.out.println(file.isFile());			//파일인지?
			System.out.println(file.isDirectory());		//디렉토리인지?
			System.out.println(file.lastModified());	//마지막 수정날짜
			System.out.println(file.canRead());			//읽기 권한
			System.out.println(file.canWrite());		//쓰기 권한
			System.out.println(file.isHidden());		//숨김?
			System.out.println(file.length());			//파일 크기(바이트)
			System.out.println(file.getPath());			//경로
			System.out.println(file.getAbsolutePath());	//절대경로
			System.out.println(file.canExecute());		//실행 가능?
		}else {
			
			//파일 없음
			System.out.println("파일이 없습니다.");
		}
	}
}
