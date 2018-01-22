class Ex19_Method {
	public static void main(String[] args) {

		//재귀 메소드, Recursive Method
		//	- 메소드가 실행 중에 자기 자신을 호출하는 형태의 메소드

		//m1();

		//팩토리얼 구하기
		// 4! = 4 x 3 x 2 x 1 = 24
		int n = 4;
		int result = factorial(n); //4!
		System.out.printf("%d! = %d\n", n, result);
	}

	public static int factorial(int n) {
		
		int temp = (n == 1) ? 1 : n * factorial(n - 1); //재귀 구조

		return temp;
	}

	//m1() : 재귀 메소드
	public static void m1() {
		
		System.out.println("m1() 실행");

		m1();//재귀 호출
	}
}
