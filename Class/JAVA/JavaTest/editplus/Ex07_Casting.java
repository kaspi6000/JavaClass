class Ex07_Casting {
	public static void main(String[] args) {
		
		//Type Casting, Casting, 자료형 변환, 형변환
		//	- A라는 자료형을 B라는 자료형으로 바꾸는 행동


		//1. 암시적인 형변환
		//	- 큰형 = 작은형;
		//	- 2칸 = 1칸;
		//	- 100% 안전

		byte b1 = 10;	//원본
		short s1;	//복사본
		
		//short(2) = byte(1)
		s1 = b1;

		System.out.println(s1);

		//2. 명시적인 형변환
		//	- 작은형 = 큰형;
		//	- 1칸 = 2칸;
		//	- 성공 혹은 실패

		short s2 = 300;
		byte b2;

		//byte(1) = short(2)
		//() == 형변환 연산자
		b2 = (byte)s2;
		
		System.out.println(b2); //복사본


		//은행 계좌
		long m1 = 22000000000L;

		int m2;

		m2 = (int)m1;

		System.out.println("잔액 : " + m2);


		//에러, error
		//	- 프로그램 구문이나 순서, 관계 등에 오류가 발생해서 잘못된 결과를 발생
		//	- 버그,이슈(Bug, issue), 예외(Exception)

		//1. 컴파일 에러
		//	- 컴파일 작업 중에 발생하는 에러
		//	- 초기 단계에서 발생
		//	- 문법 틀림
		//	- 발생 빈도 높음
		//	- 수정 난이도 낮음 -> 에러 메시지

		//2. 런타임 에러
		//	- Runtime : 프로그램 실행중
		//	- 예외 (Exception)
		//	- 컴파일은 성공 -> 실행중 발생
		//	- ex) 외부와의 입출력 작업 시 KaKao Realtime Chat Socket.io??
		//	- 발생 빈도 높음
		//	- 수정 난이도 높음
		//	- Error code Validation
		//	- TDD개발 Test Driven Development

		//int n = 10; //사용자 입력

		//System.out.println(100 /n);

		//3. 논리 오류
		//	- 컴파일o, 실행o, 유효x
		//	- 발생 빈도 다양
		//	- 수정 난이도 높음

		int n = 10;
		System.out.prrintln(n-1);
		


	}
}
