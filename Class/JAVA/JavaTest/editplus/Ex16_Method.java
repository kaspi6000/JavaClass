import java.io.*;

class Ex16_Method {
	public static void main(String[] args) throws Exception {

		/*
			�޼ҵ� ����
			���������� ����Ű���� ��ȯ�� �޼ҵ��(���ڸ���Ʈ) {
				������
			}
		*/

		//���� ����Ʈ

		//�䱸����] "ȫ�浿�� �ȳ��ϼ���" ���
		//System.out.println("ȫ�浿�� �ȳ��ϼ���.");
		hello();

		//public static void hi(String name)
		hi("ȫ�浿", 20);

		//�߰�����] "�ƹ����� �ȳ��ϼ���." ���
		//System.out.println("�ƹ����� �ȳ��ϼ���.");
		String test = "����";
		int age = 20;
		hi(test, age);
		hi("ȫ�浿", age);

		//�߰�����] �츮 ���ǽ��� ��� ��� ���
		//�߰�����] �ѵ� �ǹ�
		//�߰�����] ������
		//parameter�� argument�� ������ Ÿ���� �¾ƾ���;;

		//hi();
		//hi(100);
		hi("hahaha", 100);

		int num1 = 10,
			num2 = 20;

		add(num1, num2);
		add(10, 20);
		add(5, 2);
		add(22, 33);

		check("ȫ�浿", 25);
		check("�ƹ���", 12);
		check("������", 80);

		int n = num();
		System.out.println(n);

		bye();

		int m = 5;
		int result = getSquare(m);
		System.out.println(result);
		System.out.println(getSquare(m));

	}

	public static void hello() {
		System.out.println("ȫ�浿�� �ȳ��ϼ���.");
	}

	public static void hi(String name, int age) {
		//String name = "ȫ�浿";
		System.out.println(name + "�� �ȳ��ϼ���." + age);
	}

	public static void add(int a, int b) {
		
		System.out.printf("%d + %d = %d\n", a, b, a + b);
	}

	public static void check(String name, int age) {

		String result = (age >= 20 && age < 60) ? "���" : "Ż��";
		System.out.printf("�� '%s'���� '%s'�Դϴ�.\n", name, result);
	}

	public static int num() {
		
		//���Ϲ�, ��ȯ��
		return 10;
	}

	//�̸��� �Է��ϸ� �λ��ϱ�

	public static void bye() throws Exception {

		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

		System.out.print("�̸� �Է� : ");

		String name = reader.readLine();

		System.out.printf("%s�� �ȳ��ϼ���.\n", name);
	}

	//���� 1�� ���� -> �������� ��ȯ
	//	2 -> 4
	//	8 -> 64

	//�޼ҵ� ���
	//	-> �޼ҵ� �ñ׳���(Signature)
	//	-> �޼ҵ� ����
	public static int getSquare(int n) {
		
		int result = 0;

		result = n * n;

		System.out.println("�۾��� �Ϸ�Ǿ����ϴ�.");

		return result;

		//System.out.println("�۾��� �Ϸ�Ǿ����ϴ�.");
	}
}
