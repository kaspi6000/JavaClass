
//Ŭ����
//	- �޼ҵ��� ����
class Ex15_Method {

	//�޼ҵ�

	//main �޼ҵ�
	//	- Ư���� �޼ҵ�
	//	- JVM�� ȣ���Ѵ� -> main();
	//	- ���α׷� ������(Start Point)
	//	- ���α׷� ��Ʋ�� main �޼ҵ�� �����ϴ�.

	public static void main(String[] args) {

		//�޼ҵ�, Method
		//	- �Լ�(Function), ���ν���(procedure), ��ƾ(Routine)
		//	- Ŭ���� ���ο��� ����� �Լ�

		//	- (��ü��) �ൿ, Behavior

		//�޼ҵ� ����(Ư¡)
		//1. �ݺ��Ǵ� �ڵ带 1���� ���� x ����
		//2. �ڵ��� ������ ��Ÿ���� -> �������� ������ (�ڵ���̰� ª����) -> �׷쿪��
		
		
		//�䱸����] "�ȳ��ϼ���" 5�� ���
		//��������] "�ݰ����ϴ�"
		System.out.println("�ȳ��ϼ���");
		System.out.println("�ȳ��ϼ���");
		System.out.println("�ȳ��ϼ���");
		System.out.println("�ȳ��ϼ���");
		System.out.println("�ȳ��ϼ���");

		//1. �޼ҵ� �����ϱ�
		//2. �޼ҵ� ȣ���ϱ�
		//	- �̸��� �θ���.
		hello();
		hello();
		hello();
		hello();
		hello();

		//�̰����� �� 1���� ���
		count();
		
	}

	//Ŭ���� ����
	//1. �޼ҵ� �����ϱ�
	//	- Ŭ���� ���ο����� ���𰡴�
	//	- �ٸ� �޼ҵ� ���ο��� ���� �Ұ���
	//	- �޼ҵ� ������ ����

	//public : ���� ������(������), Access Modifier
	//static : ���� Ű��
	//void : ��ȯ Ÿ��
	//hello : �޼ҵ��(�ĺ��� - ���� �޼ҵ� �� �� �޼ҵ带 ����)
	//() : ���� ����Ʈ, �Ű����� ���, Parameter
	//{} : �޼ҵ� ����, �޼ҵ� ������
	//�޼ҵ��() <- Arguments
	public static void hello() {
		System.out.println("Hi~~~~~");
	}

	public static void count() {
		System.out.println("��");
		System.out.println("��");
		System.out.println("��");
		System.out.println("��");
		System.out.println("��");
	}
}
