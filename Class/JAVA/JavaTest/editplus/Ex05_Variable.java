
//Block
class Ex05_Variable {	//K&R style(브라이언 커니핸 & 데니스 리치)
	public static void main(String[] args) {
		
		byte a;
		//byte a;
		//int a;
		//a = 10;

		//국어, 영어, 수학
		int kor,
			eng,
			math;
		
		int weight,	//몸무게
			height;	//키

		//각자료형 변수 생성 + 데이터

		//정수형
		//1. byte

		//정수형 상수, 정수형 리터럴
		byte b1 = 10; //b1(변수), 10(데이터, 상수, Literal)
		//b1 = 128; Overflow, Error
		//b1 = -129; Underflow, Error

		//2. short
		short s1;
		s1 = 10;
		//s1 = 32768;

		//3. int
		int n1 = 10;
		//n1 = 2200000000;

		//4. long
		long l1 = 10;
		l1 = 10000000000000000L;
		//l1 = 10000000000000000;


		//대입 연산자
		//	- 변수 = 값;
		//	- LValue(변수) = RValue(변수, 상수);
		//	- 반드시 LValue와 RValue의 자료형이 일치

		
		//실수형
		float f1 = 3.14F;
		f1 = 1234567890123456789.1234567890123456789F;
		System.out.println(f1);

		double d1 = 2.58;
		d1 = 1234567890123456789.1234567890123456789;
		System.out.println(d1);


		//논리형
		boolean flag = true;
		flag = false;
		System.out.println(flag);

		
		//문자형
		char c1 = 'A';
		System.out.println(c1);

		c1 = '가';
		System.out.println(c1);

		//c1 = 'ABC';
		//System.out.println(c1);

		c1 = '1';
		System.out.println(c1);



		//기본형x
		//참조형o

		//char == 문자 1개
		//String == 문자 여러개

		//홍길동

		String name = "홍길동";


		//
		int num = 10;
		int Num = 20;
		int nuM = 30;
		int nUm = 40;

		//자바
		//변수명
		//1. 단어를 소문자로 기재
		int NUM = 10;
		//int num = 10;

		//학생 번호
		//Student Number
		int studentnumber;
		int studentNumber;  // 캐멀 표기법
		int student_number; // 스네이크 표기법



		//10진법, 2진법, 8진법
		int n2 = 10;
		System.out.println(n2);

		int n3 = 010;
		System.out.println(n3);

		int n4 = 0x10; // 16진수
		System.out.println(n4);


	}
}
