class Ex18_Method {
	public static void main(String[] args) {

		//�޼ҵ� �����ε�, Method OverLoading
		//	- ���� �̸��� �޼ҵ带 ������ ����� ���
		//	- ������ ������ Ÿ���� �ٸ��� ������ �̸��� �޼ҵ带 ������ ������ �� �ִ�.

		//�޼ҵ� �����ε� ���� ���� o
		//	- ���� ����
		//	- ���� Ÿ��

		//�޼ҵ� �����ε� ���� ���� x
		//	- ���� �̸�
		//	- ��ȯ�� Ÿ��

		//�����ε��� ���� �Ǵ�?
		//	- ȣ���� ���� ��Ȳ�� ����
		
		//	test(); //2
		//	test(10); //4
		//	test("ȫ�浿"); //6
		//	test(10, 20); //7
		//	int num = test();
		//	test();

		//	test(10); //4
		//	byte b = 10;
		//	test(b); //9

		//�ҽ��� �ۼ���.......
		//	1. main()
		//	2. public static void test() {}
		//	3. public static void test() {} //x(2)
		//	4. public static void test(int n) {} //o
		//	5. public static void test(int m) {} //x(4)
		//	6. public static void test(String s) {} //o
		//	7. public static void test(int n, int m) {} //o
		//	8. public static int test() {} //x(2)
		//	9. public static void test(byte n) {} //o


		//�䱸����] �� ���� �����͸� ���ڷ� ���� -> ���ؼ� ����ϴ� �޼ҵ�
		//	- int + int
		//	- double + double
		//	- String + String
		add(10, 20);
		add(5, 7);
		add(33, 99);

		add(3.1, 2.5);

		add("ȫ�浿", "�ƹ���");
		
	}

	//�ڹٴ� �޼ҵ带 ������ �� �޼ҵ���� ����Ѵ�.(x)
	//�ڹٴ� �޼ҵ带 ������ �� �޼ҵ��� ���ڸ���Ʈ�� ����Ѵ�.(o)

	//add()
	//	- �޼ҵ��� �̸����� add��� �ܾ ���� ������ ��Ȳ
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
