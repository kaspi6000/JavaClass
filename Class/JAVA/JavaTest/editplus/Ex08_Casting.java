class Ex08_Casting {
	public static void main(String[] args) {

		//����ȯ
		//1. �Ͻ����� ����ȯ
		//2. ������� ����ȯ

		//���� -> ����
		
		byte b1 = 10; //���� 1byte
		long l1; //���纻 8byte

		//�Ͻ����� ����ȯ(���� �ս�X)
		l1 = b1;
		//l1 = (long)b1;

		System.out.println(l1); //���纻 Ȯ��
		

		//�Ǽ���
		float f1 = 3.14F; //����
		double d1; //���纻

		//�Ͻ����� ����ȯ
		d1 = f1;

		//Ű ��ũ��
		System.out.println(d1);

		double d2 = 1.23456789012345; //����
		float f2; //���纻

		System.out.println(d2);

		f2 = (float)d2;

		System.out.println(f2);

		//�Ǽ� <-> ����
		double d3 = 3.99;
		int n3;
		
		//
		n3 = (int)d3; //������ ����(floor, trunc)

		System.out.println(n3);
		System.out.println(Math.round(d3));


		float f4 = 3.14F;
		long l4;
		
		//ū��(8) = ������(4)
		//���� ����(O), ����Ʈ ũ��(X)
		l4 = (long)f4;

		System.out.println(l4);

		//�⺻���� ���� ��
		//byte(1) < short(2) < int(4) < long(8) < float(4) < double(8)
		//			char(2)
		//boolean(1)

		//** �⺻���� ������������ ��ȯ�� �Ұ���(�޸� ���� ����)

		//boolean�� ����ȯ�� ����� �� �� ����.
		//(int)true;

		
		//������
		//	- 'A' -> 65(���� �ڵ尪)
		char c5 = 'A'; //2byte
		short s5; //2byte

		//���� = ����
		s5 = (short)c5;

		System.out.println(s5);

		System.out.println((char)66);


		char c6 = '��'; //2byte
		int n6; //4byte

		n6 = c6;

		System.out.println(n6);
		

		int n7 = 5;
		char c7 = '5';

		System.out.println(n7);
		System.out.println((int)c7);

		System.out.println((int)'A');
		System.out.println((int)'Z');
		System.out.println((int)'a');
		System.out.println((int)'z');
		System.out.println((int)'0');
		System.out.println((int)'9');

		System.out.println((int)'��');
		System.out.println((int)'�R');

		//Validation injection query (a-z A-Z 0-9) Ŭ���̾�Ʈ�ܿ��� �� �� �ִ� ����ó��
		//Ư������ ���� �����ڰ� ���� ���� ȹ��
		
		
	}
}
