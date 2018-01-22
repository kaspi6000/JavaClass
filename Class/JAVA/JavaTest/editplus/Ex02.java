/*
자바 콘솔 프로그램 작성
	1. 프로그램 소스 작성
		- JAVA 언어 사용
		- *.java 저장
		- 클래스명 파일명이 반드시 동일
		- 사용된 언어가 사람이 사용하는 언어

	2. 컴파일, Compile
		- 소스 파일 -> (번역) -> 기계어
		- 컴파일러, Compiler // 프로그램
		- javac.exe
		- javac.exe 소스파일
		- 결과물 : 번역된 결과 -> *.class 파일(클래스 파일, 실행 파일, 바이너리 파일)

	3. 실행, Run
		- 2차 컴파일, 인터프리터(nohup)
		- java.exe
		- 결과물 X -> 기계어
		- JIT 컴파일러(Just in Time)
		- 배포할때 nohup같이????production???? dev??????


식별자 규칙
	- 폴더, 파일, 클래스명, 메소드명, 변수명 등등...
	1. 영문자 + 숫자 + _
	2. 숫자로 시작 X
	3. 의미있게


소스 편집 -> 공백 사용 -> 자바 컴파일러는 연속된 공백 무시.
	1. space
	2. enter
	3. tab


코딩 컨벤션
	- CamelCase, TAB Key(4)
	- 대소문자 철저하게 구분. 문법 엄격 -> 컴파일 방식

*/

class Ex02 {
	public static void main(String[] args) {

		//콘솔에 문자열을 출력하는 명령어

		//문장 종결자(;)
		System.out.println("Hello");

		/*
			http://terms.co.kr

			~(tild)
			!, @, #, $, %, ^, &, *, -, +, \
			', "
			()
			{}
			[]
			<>
		*/

	}
}