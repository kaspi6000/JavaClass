package com.test.question;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

public class Test {

	/*
	 	문제1.
	 	요구사항] 음악 파일이 100개 있다. 파일명 앞에 숫자를 붙이시오.
	 	리소스]	음악파일
	 	결과]		
	 	[001]7 go up-Yum-Yum (얌얌).mp3
	 	[002]10cm-봄이 좋냐__.mp3
	 	..
	 	[100]헤이즈-돌아오지마 (Feat. 용준형 Of 비스트).mp3
	 	
	 	문제2.
		요구사항] 이미지 파일이 확장자별로 있다. 확장자별로 몇개인지 카운트?
		리소스] 	확장자별 카운트
		결과]		*.gif : 10개
				*.jpg : 5개
				*.png : 3개
		추가]		mouse.bmp 추가
				-> 소스 수정없이 *.bmp : 1개
		힌트]		HashMap 사용
		
		문제3.
		요구사항] delete 폴더를 삭제하시오
		리소스]	폴더 삭제 > delete
		결과]		폴더를 삭제했습니다.
		힌트]		파일 개수 -> 재귀 메소드
		추가]		폴더 3개와 파일 6개를 삭제했습니다.
		
		문제4.
		요구사항] 사이즈가 0byte인 파일만 골라서 삭제하시오.
		리소스]	파일 제거
		결과]		총 34개의 파일을 삭제했습니다.
		
		문제5.
		요구사항] Music_1 과 Music_2 폴더를 서로 비교해서 양쪽 폴더에 모두 존재하는 파일만을 출력하시오.(중복 파일 골라내기)
		리소스]	동일 파일
		결과]
		7 go up-Yum-Yum (얌얌).mp3
		10cm-봄이 좋냐_.mp3
		..
		
		문제6.
		요구사항] 모든 폴더의 파일을 대상으로 크기가 큰 순으로 정렬하시오.
		리소스]	크기 정렬
		결과]		모든 폴더의 파일을 한번에 출력
		[파일명]		[크기]		[폴더]
		aaa.exe		57KB		AAA
		bbb.exe		50KB		BBB
		ccc.dat		41KB		AAA
		ddd.txt		20B			CCC
		힌트]	처음 시작(각 폴더의 모든 파일을 1개의 ArrayList<File>에 모아놓고 시작) + 정렬(버블 정렬)

	  	문제7.
	  	요구사항] 직원 폴더를 접근 -> 직원별 이름으로 폴더 생성 -> 년도별 폴더 생성 -> 각 파일들을 해당 폴더로 이동
	  	리소스]	직원
	  	결과]		분류가 완료되었습니다.
	 */
	
	public static void main(String[] args) {
		
		//solution1();
		//solution2();
		//solution3();
		//solution4();
		//solution5();
		solution7();
	}
	
	private static void solution7() {
		
//		문제7.
//	  	요구사항] 직원 폴더를 접근 -> 직원별 이름으로 폴더 생성 -> 년도별 폴더 생성 -> 각 파일들을 해당 폴더로 이동
//	  	리소스]	직원
//	  	결과]		분류가 완료되었습니다.
		String path = "D:\\파일_디렉토리_문제\\직원";
		
		File dir = new File(path);
		
		File[] files = dir.listFiles(); //파일 목록
		
		for (File file : files) {
			
			if (file.isFile()) {
				
				int index = file.getName().indexOf("_");
				
				String name = file.getName().substring(0, index);
				System.out.println(name);
				
				String year = file.getName().substring(index + 1, file.getName().replace("__", "_").lastIndexOf("_"));
				System.out.println(year);
				
				//이름으로 폴더 생성하기
				File nameDir = new File(path + "\\" + name);
				
				if (!nameDir.exists()) nameDir.mkdir();

				//이름 > 년도로 폴더 생성하기
				File yearDir = new File(path + "\\" + name + "\\" + year);
				
				if (!yearDir.exists()) yearDir.mkdir();
				
				//파일 이름 > 년도 폴더로 이동하기
				File move = new File(path + "\\" + name + "\\" + year + "\\" + file.getName());
				file.renameTo(move);
			}
		}
	}

	private static void solution5() {
		
//		문제5.
//		요구사항] Music_1 과 Music_2 폴더를 서로 비교해서 양쪽 폴더에 모두 존재하는 파일만을 출력하시오.(중복 파일 골라내기)
//		리소스]	동일 파일
//		결과]
//		7 go up-Yum-Yum (얌얌).mp3
//		10cm-봄이 좋냐_.mp3
//		..
		String path = "D:\\파일_디렉토리_문제\\동일 파일\\Music_1";
		
		String path1 = "D:\\파일_디렉토리_문제\\동일 파일\\Music_2";
	}

	static int fileCount = 0;
	
	static int dirCount = 0;

	private static void solution3() {
		
//		문제3.
//		요구사항] delete 폴더를 삭제하시오
//		리소스]	폴더 삭제 > delete
//		결과]		폴더를 삭제했습니다.
//		힌트]		파일 개수 -> 재귀 메소드
//		추가]		폴더 3개와 파일 6개를 삭제했습니다.
		
		String path = "D:\\파일_디렉토리_문제\\폴더 삭제";
		
		File dir = new File(path);
		
		getFileCount(dir);
		
		System.out.printf("폴더 %d개와 파일 %d개를 삭제했습니다.", dirCount, fileCount);
	}
	
	private static void getFileCount(File dir) {
		
		if (dir.exists()) {
			
			File[] files = dir.listFiles();
			
			for (File file : files) {
				
				if (file.isFile()) {
					
					file.delete();
					//이 부분이 업무에 맞게 수정 > 해당 폴더와 관련된 정보를 취득할 수 있다.
					fileCount++;
				}
			}
			
			for (File subdir : files) {
				
				if (subdir.isDirectory()) {
					
					dirCount++;
					//부모와 동일한 업무 다시 반복
					getFileCount(subdir);
					subdir.delete();
				}
			}
		}
	}

	private static void solution4() {
		
//		문제4.
//		요구사항] 사이즈가 0byte인 파일만 골라서 삭제하시오.
//		리소스]	파일 제거
//		결과]		총 34개의 파일을 삭제했습니다.
		
		String path = "D:\\파일_디렉토리_문제\\파일 제거";
		
		File dir = new File(path);
		
		File[] files = dir.listFiles();
		
		for (File file : files) {
			
			if (file.isFile()) {
				
				if (file.length() == 0) {
					
					file.delete();
				}
			}
		}
		System.out.println("삭제 완료");
	}

	private static void solution2() {
		
//		문제2.
//		요구사항] 이미지 파일이 확장자별로 있다. 확장자별로 몇개인지 카운트?
//		리소스] 	확장자별 카운트
//		결과]		*.gif : 10개
//				*.jpg : 5개
//				*.png : 3개
//		추가]		mouse.bmp 추가
//				-> 소스 수정없이 *.bmp : 1개
//		힌트]		HashMap 사용
		
		String path = "D:\\파일_디렉토리_문제\\확장자별 카운트";
		
		File dir = new File(path);
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		File[] list = dir.listFiles();
		
		for (File file : list) {
			
			if (file.isFile()) {
				
				String name = file.getName();
				
				String extension = name.substring(name.lastIndexOf(".") + 1);
				
//				System.out.println(extension);
//				System.out.println(map.containsKey(extension));
				
				if(!map.containsKey(extension)) {
					
					map.put(extension, 1);
//					System.out.println(extension);
//					System.out.printf("%s : %d\n", extension, map.get(extension));
				}else {
					
					map.put(extension, map.get(extension) + 1);
//					System.out.println(extension);
//					System.out.printf("%s : %d\n", extension, map.get(extension));
				}
			}
		}
		
		Set<String> set = map.keySet();
		
		Iterator<String> iter = set.iterator();
		
		while (iter.hasNext()) {
			
			String key = iter.next();
			
			System.out.printf("%s : %d개\n", key, map.get(key));
		}
	}

	private static void solution1() {

//		문제1.
//	 	요구사항] 음악 파일이 100개 있다. 파일명 앞에 숫자를 붙이시오.
//	 	리소스]	음악파일
//	 	결과]		
//	 	[001]7 go up-Yum-Yum (얌얌).mp3
//	 	[002]10cm-봄이 좋냐__.mp3
//	 	..
//	 	[100]헤이즈-돌아오지마 (Feat. 용준형 Of 비스트).mp3
		
		String path = "D:\\파일_디렉토리_문제\\음악 파일\\Music";
		
		File dir = new File(path);
		
		int num = 1;
		
		File[] list = dir.listFiles();
		
		for (File file : list) {
			
			if (file.isFile()) {
				
				File rename = new File(String.format("%s\\[%s]%s", path, getNum(num), file.getName()));
				file.renameTo(rename);
				num++;	
			}
		}
		
		System.out.println("수정했습니다.");
		
	}

	private static String getNum(int num) {
		
		if (num < 10) return "00" + num;
		else if (num < 100) return "0" + num;
		else return "" + num;	
	}
}
