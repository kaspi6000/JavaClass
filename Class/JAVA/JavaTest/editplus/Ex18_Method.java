class Ex18_Method {
	public static void main(String[] args) {

		//메소드 오버로딩, Method OverLoading
		//	- 같은 이름의 메소드를 여러개 만드는 기술
		//	- 인자의 개수와 타입이 다르면 동일한 이름의 메소드를 여러개 선언할 수 있다.

		//메소드 오버로딩 구현 조건 o
		//	- 인자 개수
		//	- 인자 타입

		//메소드 오버로딩 구현 조건 x
		//	- 인자 이름
		//	- 반환값 타입

		//오버로딩의 유무 판단?
		//	- 호출할 때의 상황을 생각
		
		//	test(); //2
		//	test(10); //4
		//	test("홍길동"); //6
		//	test(10, 20); //7
		//	int num = test();
		//	test();

		//	test(10); //4
		//	byte b = 10;
		//	test(b); //9

		//소스를 작성중.......
		//	1. main()
		//	2. public static void test() {}
		//	3. public static void test() {} //x(2)
		//	4. public static void test(int n) {} //o
		//	5. public static void test(int m) {} //x(4)
		//	6. public static void test(String s) {} //o
		//	7. public static void test(int n, int m) {} //o
		//	8. public static int test() {} //x(2)
		//	9. public static void test(byte n) {} //o


		//요구사항] 두 개의 데이터를 인자로 전달 -> 더해서 출력하는 메소드
		//	- int + int
		//	- double + double
		//	- String + String
		add(10, 20);
		add(5, 7);
		add(33, 99);

		add(3.1, 2.5);

		add("홍길동", "아무개");
		
	}

	//자바는 메소드를 구분할 때 메소드명을 사용한다.(x)
	//자바는 메소드를 구분할 때 메소드명과 인자리스트를 사용한다.(o)

	//add()
	//	- 메소드의 이름으로 add라는 단어가 가장 최적인 상황
	public static void add(int a, int b) {
		
		System.out.printf("%d + %d = %d\n", a, b, a + b);
	}

	public static void add(double a, double b) {
		
		System.out.printf("%.1f + %.1f = %.1f\n", a, b, a + b);
	}

	public static void add(String a, String b) {
		
		System.out.printf("%s + %s = %s\n", a, b, a + b);
	}
}
