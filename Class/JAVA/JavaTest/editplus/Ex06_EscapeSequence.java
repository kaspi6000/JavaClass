class Ex06_EscapeSequence {
	public static void main(String[] args) {

		//EscapeSequence, �̽������� ������
		//	- Ư�� ����
		//	- Escape Character
		//	- �ڷ����� char��
		//	- ����� ���� �����Ͱ� �ƴ϶� �̹� ��ӵ� �ൿ�� �ϱ� ���� Ư���� ����

		//1. \n
		//	- new line
		//	- ���� ����
		char c1 = '\n';

		String s1 = "�ȳ��ϼ���.\nȫ�浿��";
		System.out.println(s1);


		//2. \r
		//	- carriage return
		//	- Ŀ��(ĳ��)�� ��ġ�� ���� ������ ó��(ù��° �÷�)���� �̵�

		System.out.println("�ϳ���\r�³�");

		//���� = \r + \n
		System.out.println("�ϳ�\r\n��");
		System.out.println("�ϳ�\n��");


		//3. \b
		//	- backspace
		System.out.println("ȫ��\b��");
		System.out.println("ȫ�浿��\b\b\b\b����");


		//4. \t
		//	- tab
		System.out.println("ȫ\t�浿");


		String name = "ȫ�浿";
		String height = "180";
		String address = "����� ������ ���ﵿ";

		System.out.println("�̸� : \t" + name);
		System.out.println("Ű : \t" + height + "cm");
		System.out.println("���ּ� : \t" + address);

		System.out.println("���ڿ�" + 100);

		
		//5. \", \', \\

		//�䱸���� ȭ�鿡 <�ȳ��ϼ���. "ȫ�浿"�Դϴ�.> ����Ͻÿ�.
		System.out.println("�ȳ��ϼ���. \"ȫ�浿\"�Դϴ�.");

		//�䱸���� ���� ���� ������ ��θ� ���
		String path = "D:\\Class\\JAVA";
		System.out.println(path);

		// \f, \a



		//���� �����͸� ����� �� ������ ��
		//�ֹι�ȣ�� ���ڸ��� �����ؾ� �Ѵ�.
		//	- 901220
		int jumin1 = 901220;
		System.out.println("�ֹι�ȣ : " + jumin1);

		jumin1 = 011125;
		System.out.println("�ֹι�ȣ : " + jumin1);

		String jumin2 = "011125";
		System.out.println("�ֹι�ȣ : " + jumin2);

		//�ֹι�ȣ, ��ȭ��ȣ, ��ǰ��ȣ, �л���ȣ, �۹�ȣ ��.....
		//	- ���´� ���������� ���� ������ ���ڿ�
		//	- ���� ���� �����Ͱ� ��� ������ �ϴ°�
		/////////////////////////////////////////////////////////
		/////////////////////////////////////////////////////////
		/////////////////////////////////////////////////////////
		/////////////////////////////////////////////////////////


		//�ĺ��� ǥ��� -> ����

		//1. �밡���� ǥ���
		//	- �ڷ����� �ĺ��ڿ� �ִ� ���
		//	- �ڹ�) �������̽���(ITest)
		String name;
		String strName;

		int num;
		int inum;


		//2. �Ľ�Į ǥ���
		//	- �ĺ��ڰ� �Ѵܾ� Ȥ�� �Ѵܾ� �̻����� ���� -> ��� �ܾ ������� ���� + 
		//	��� ���� �ҹ��� + ���ܾ��� ù���� �빮��
		//	- �ڹ�) Ŭ������
		String StudentName;


		//3. ĳ�� ǥ���
		//	- �ĺ��ڰ� �Ѵܾ� Ȥ�� �Ѵܾ� �̻����� ���� -> ��� �ܾ ������� ���� +
		//	��� ���� �ҹ��� + �� �ܾ��� ù���� �빮�� + ���� ���ڸ��� �ҹ��ڷ�
		//	- �ڹ�) ������, �޼ҵ��
		String studentName;
		


	}
}
