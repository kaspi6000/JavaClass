class Ex17_Method {
	public static void main(String[] args) {
	
		//�޼ҵ�
		//	- �ൿ�� ����(1���� ������ ������ �ִ� �ڵ��� ����)
		//	- ���α׷��� ��ü �帧 : main()�޼ҵ� -> �޼ҵ� -> �޼ҵ�
		//	- �޼ҵ� ȣ�� -> �ش� �޼ҵ� ���Ǻη� ��� �̵� -> �ش� �޼ҵ� ����
		//	  -> �޼ҵ� ȣ���ߴ� ������ ���ư��� : �帧 �ľ�
		//	- �޼ҵ� ���� ��� : �޼ҵ��, ���ڸ���Ʈ, ��ȯ��

		String str = "��";
		
		int result = m1(str);

		System.out.printf("'%s'�� ���� '%d'�Դϴ�.\n", str, result);

		//���ڿ� ���ϱ� ������ -> ������ ���� ����
		System.out.println(10 + 20 + 30);	//60
		System.out.println(10 + 20 + "30");	//3030
		System.out.println(10 + "20" + 30);	//102030
		System.out.println("10" + 20 + 30);	//102030

		int a = 10;
		int b = 20;

		//10 + 20 = 30
		System.out.println(a + " + " + b + " = " + a + b);
		System.out.println(a + " + " + b + " = " + (a + b));

		//����
		//1. ���� ����, Local Variable
		//	- Ư�� ���������� ����� ����
		//	- ���� : �޼ҵ�, ��� ��
		//2. ��� ����, Member Variable
		//	- Ŭ���� ����, Class Variable

		//���� ������ ���� �ֱ�(Life Cycle)
		//	- ������ ���� �¾��, ���� �״���?
		//					(�޸� �Ҵ�)	(�޸� �Ҹ�)
		//	- ���� ������ ����� �� �¾��, ���� ������ ���Ե� ������ ��� ��� �� �Ҹ�ȴ�.

		m2();
		
		int num = 10;

		m3();

		System.out.println(num);

		m4(num);

		System.out.println(num);
	}

	public static void m4(int num){
		
		System.out.println(num);
		num = 20;
	}

	public static void m3() {
	
		int num = 20;
	}

	//���ȭ
	public static int m1(String str) { //�Ű�����
		
		int n = str.equals("�ϳ�") ? 1 : str.equals("��") ? 2 : str.equals("��") ? 3 :0;

		return n; //��ȯ��
	}

	public static void m2() {
		
		int n = 10;
		System.out.println(n);
	}
}
