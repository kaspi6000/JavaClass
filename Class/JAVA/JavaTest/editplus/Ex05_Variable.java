
//Block
class Ex05_Variable {	//K&R style(����̾� Ŀ���� & ���Ͻ� ��ġ)
	public static void main(String[] args) {
		
		byte a;
		//byte a;
		//int a;
		//a = 10;

		//����, ����, ����
		int kor,
			eng,
			math;
		
		int weight,	//������
			height;	//Ű

		//���ڷ��� ���� ���� + ������

		//������
		//1. byte

		//������ ���, ������ ���ͷ�
		byte b1 = 10; //b1(����), 10(������, ���, Literal)
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


		//���� ������
		//	- ���� = ��;
		//	- LValue(����) = RValue(����, ���);
		//	- �ݵ�� LValue�� RValue�� �ڷ����� ��ġ

		
		//�Ǽ���
		float f1 = 3.14F;
		f1 = 1234567890123456789.1234567890123456789F;
		System.out.println(f1);

		double d1 = 2.58;
		d1 = 1234567890123456789.1234567890123456789;
		System.out.println(d1);


		//����
		boolean flag = true;
		flag = false;
		System.out.println(flag);

		
		//������
		char c1 = 'A';
		System.out.println(c1);

		c1 = '��';
		System.out.println(c1);

		//c1 = 'ABC';
		//System.out.println(c1);

		c1 = '1';
		System.out.println(c1);



		//�⺻��x
		//������o

		//char == ���� 1��
		//String == ���� ������

		//ȫ�浿

		String name = "ȫ�浿";


		//
		int num = 10;
		int Num = 20;
		int nuM = 30;
		int nUm = 40;

		//�ڹ�
		//������
		//1. �ܾ �ҹ��ڷ� ����
		int NUM = 10;
		//int num = 10;

		//�л� ��ȣ
		//Student Number
		int studentnumber;
		int studentNumber;  // ĳ�� ǥ���
		int student_number; // ������ũ ǥ���



		//10����, 2����, 8����
		int n2 = 10;
		System.out.println(n2);

		int n3 = 010;
		System.out.println(n3);

		int n4 = 0x10; // 16����
		System.out.println(n4);


	}
}
