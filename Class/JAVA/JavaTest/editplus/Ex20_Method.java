class Ex20_Method {
	public static void main(String[] args) {

		//.
		//	- 멤버 접근 연산자
		//	- 부모.자식

		//메소드를 호출하는 방법
		//	1. 메소드명();
		//	2. 클래스명.메소드명();
		//	3. 패키지명.클래스명.메소드명(); //정석

		m1();
		Ex20_Method.m1();
	}

	public static void m1() {
		
		System.out.println("m1");
	}
}
