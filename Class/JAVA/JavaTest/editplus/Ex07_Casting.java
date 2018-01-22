class Ex07_Casting {
	public static void main(String[] args) {
		
		//Type Casting, Casting, �ڷ��� ��ȯ, ����ȯ
		//	- A��� �ڷ����� B��� �ڷ������� �ٲٴ� �ൿ


		//1. �Ͻ����� ����ȯ
		//	- ū�� = ������;
		//	- 2ĭ = 1ĭ;
		//	- 100% ����

		byte b1 = 10;	//����
		short s1;	//���纻
		
		//short(2) = byte(1)
		s1 = b1;

		System.out.println(s1);

		//2. ������� ����ȯ
		//	- ������ = ū��;
		//	- 1ĭ = 2ĭ;
		//	- ���� Ȥ�� ����

		short s2 = 300;
		byte b2;

		//byte(1) = short(2)
		//() == ����ȯ ������
		b2 = (byte)s2;
		
		System.out.println(b2); //���纻


		//���� ����
		long m1 = 22000000000L;

		int m2;

		m2 = (int)m1;

		System.out.println("�ܾ� : " + m2);


		//����, error
		//	- ���α׷� �����̳� ����, ���� � ������ �߻��ؼ� �߸��� ����� �߻�
		//	- ����,�̽�(Bug, issue), ����(Exception)

		//1. ������ ����
		//	- ������ �۾� �߿� �߻��ϴ� ����
		//	- �ʱ� �ܰ迡�� �߻�
		//	- ���� Ʋ��
		//	- �߻� �� ����
		//	- ���� ���̵� ���� -> ���� �޽���

		//2. ��Ÿ�� ����
		//	- Runtime : ���α׷� ������
		//	- ���� (Exception)
		//	- �������� ���� -> ������ �߻�
		//	- ex) �ܺο��� ����� �۾� �� KaKao Realtime Chat Socket.io??
		//	- �߻� �� ����
		//	- ���� ���̵� ����
		//	- Error code Validation
		//	- TDD���� Test Driven Development

		//int n = 10; //����� �Է�

		//System.out.println(100 /n);

		//3. �� ����
		//	- ������o, ����o, ��ȿx
		//	- �߻� �� �پ�
		//	- ���� ���̵� ����

		int n = 10;
		System.out.prrintln(n-1);
		


	}
}
