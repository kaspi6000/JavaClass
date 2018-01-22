package com.test.example;

public class Ex54_Interface {

	public static void main(String[] args) {
		
		//사무실 > 과장님 -> 홍길동에게 업무를 시키는중
		//길동이의 업무를 편하게 구현 + 과장님이 길동이를 대하는 행동은 변함없이
		Member hong = new Member();
		
		hong.work();
	}
}

//직원
//	- 업무 : 텍스트 파일을 열어서 내용을 읽어와서 업무 진행
//	- 변경 : 엑셀 파일 교체
//	- 변경 : 다시 텍스트 파일로 교체
class Member {
	
	//업무
	public void work() {
		
		//M1. 직접 하기
		//텍스트 파일로부터 데이터 읽기
		//String data = "파일에서 읽어온 데이터";
		//String data = "엑셀에서 읽어온 데이터";
		//String data = "파일에서 읽어온 데이터";
		
		//M2. 다른 사람에게 업무 일부를 맡기기 > 위임(Delegate)
//		FileData file = new FileData();//전문가 고용
//		String data = file.getData();
//		ExcelData excel = new ExcelData();
//		String data = excel.getData();
		
		//M3. 홍길동의 입장에서 생각 -> 피고용인에 대한 행동 -> 추상화
//		FileData file = new FileData();
//		String data = file.getData();
//		ExcelData excel = new ExcelData();
//		String data = excel.getData();
		
//		FileData file = new FileData();
//		String data = file.getData();//약속된 업무
//		data = file.getText();//동일한 업무 (약속된 업무x)
//		file.check();//독자적인 기능
		
//		ExcelData excel = new ExcelData();
//		String data = excel.getData();//약속된 업무
//		data = excel.getExcel();
//		excel.backup();
		
		//규칙(인터페이스)를 만들어 놓고 규칙이 소용없게 된 이유
		//	-> 참조 변수를 해당 타입으로 만들었기 때문
		//FileData file = new FileData();
		IData file = new FileData();
		String data = file.getData();//약속
//		file.getText();
//		file.check();
		
		file = new ExcelData();
		data = file.getData();
		
		//**인터페이스를 상속한 객체를 사용할 때는 반드시 참조 변수를 인터페이스로 만들어서 사용한다.
		
		//데이터 업무 적용(가공/조작)
		data = "결과 : " + data;
		
		System.out.println(data);
	}
}

//파일 or 엑셀 읽기 전문가
interface IData {
	
	String getData();
}

//파일 읽기 전문가
class FileData implements IData {
	
	public String getText() {
		
		String data = "파일에서 읽은 데이터";
		return data;
	}

	@Override
	public String getData() {
		
		String data = "파일에서 읽은 데이터";
		return data;
	}
	
	public void check() {
		
		System.out.println("데이터 유효성 체크");
	}
}

//엑셀 읽기 전문가
class ExcelData implements IData {
	
	public String getExcel() {
		
		String data = "엑셀에서 읽은 데이터";
		return data;
	}

	@Override
	public String getData() {
		
		String data = "엑셀에서 읽은 데이터";
		return data;
	}
	
	public void backup() {
		
		System.out.println("데이터 백업");
	}
}