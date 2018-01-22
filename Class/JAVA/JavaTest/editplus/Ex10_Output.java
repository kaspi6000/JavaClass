class Ex10_Output {
	public static void main(String[] args) {

		//printf()
		//1. %숫자d
		//	- 출력할 내용의 최소 너비
		//	- 양수/음수
		//	- 모든 형식 문자에 적용

		System.out.printf("[%d]\n", 100);
		System.out.printf("[%10d]\n", 100);
		System.out.printf("[%-10d]\n", 100);

		System.out.printf("[%10d]\n", 123456789012L);


		//2. %.숫자f
		//	- 실수형에만 적용 가능
		//	- 소수 이하 자릿수 지정

		System.out.printf("%f\n", 3.1234);
		System.out.printf("%.1f\n", 3.1234);
		System.out.printf("%.1f\n", 3.1934);



		//3. %,d
		//	- 숫자형만 가능(%d, %f)
		//	- 자릿수 표기
		System.out.printf("%d\n", 12345678);
		System.out.printf("%,d\n", 12345678);

		//한번에
		System.out.printf("%,15.2f\n", 12987.6543);



		System.out.println();
		System.out.println();


		//주소록
		String name1 = "홍길동";
		String address1 = "서울시 강남구 역삼동";
		String email1 = "hong@gmail.com";
		int salary1 = 20000;

		String name2 = "테스트";
		String address2 = "서울시 중구";
		String email2 = "test@gmail.com";
		int salary2 = 500;

		System.out.println("=====================================");
		System.out.println("		주소록");
		System.out.println("=====================================");
		System.out.println("[이름]\t[급여]\t[주소]\t\t\t[이메일]");
		System.out.printf("%s\t%,6d\t%-14s\t%s\n", name1, salary1, address1, email1);
		System.out.printf("%s\t%,6d\t%-14s\t%s\n", name2, salary2, address2, email2);

		//출력 시 주의사항
		//1. 숫자는 단위 기재
		//2. 정렬
		//	a. 문자(열)
		//		1. 좌측
		//			- 가변 길이
		//		2. 가운데
		//			- 고정 길이
		//	b. 숫자
		//		1. 좌측
		//		2. 가운데
		//			- 고유번호
		//		3. 우측
		//			- 수치(비교)
	}
}
