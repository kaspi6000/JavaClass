class Ex10_Output {
	public static void main(String[] args) {

		//printf()
		//1. %����d
		//	- ����� ������ �ּ� �ʺ�
		//	- ���/����
		//	- ��� ���� ���ڿ� ����

		System.out.printf("[%d]\n", 100);
		System.out.printf("[%10d]\n", 100);
		System.out.printf("[%-10d]\n", 100);

		System.out.printf("[%10d]\n", 123456789012L);


		//2. %.����f
		//	- �Ǽ������� ���� ����
		//	- �Ҽ� ���� �ڸ��� ����

		System.out.printf("%f\n", 3.1234);
		System.out.printf("%.1f\n", 3.1234);
		System.out.printf("%.1f\n", 3.1934);



		//3. %,d
		//	- �������� ����(%d, %f)
		//	- �ڸ��� ǥ��
		System.out.printf("%d\n", 12345678);
		System.out.printf("%,d\n", 12345678);

		//�ѹ���
		System.out.printf("%,15.2f\n", 12987.6543);



		System.out.println();
		System.out.println();


		//�ּҷ�
		String name1 = "ȫ�浿";
		String address1 = "����� ������ ���ﵿ";
		String email1 = "hong@gmail.com";
		int salary1 = 20000;

		String name2 = "�׽�Ʈ";
		String address2 = "����� �߱�";
		String email2 = "test@gmail.com";
		int salary2 = 500;

		System.out.println("=====================================");
		System.out.println("		�ּҷ�");
		System.out.println("=====================================");
		System.out.println("[�̸�]\t[�޿�]\t[�ּ�]\t\t\t[�̸���]");
		System.out.printf("%s\t%,6d\t%-14s\t%s\n", name1, salary1, address1, email1);
		System.out.printf("%s\t%,6d\t%-14s\t%s\n", name2, salary2, address2, email2);

		//��� �� ���ǻ���
		//1. ���ڴ� ���� ����
		//2. ����
		//	a. ����(��)
		//		1. ����
		//			- ���� ����
		//		2. ���
		//			- ���� ����
		//	b. ����
		//		1. ����
		//		2. ���
		//			- ������ȣ
		//		3. ����
		//			- ��ġ(��)
	}
}
