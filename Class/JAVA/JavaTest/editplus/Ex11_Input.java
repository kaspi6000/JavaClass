class Ex11_Input {
	public static void main(String[] args) throws Exception {

		//�ܼ� �Է� -> Ű���带 ���� �Է�(����)�� �ڹ� ���α׷����� ����ϱ�
		//1. System.in.read();
		//2. BufferedReader Ŭ����
		//3. Scanner Ŭ����

		//�䱸����] ����ڷκ��� ���� 1���� �Է¹޾Ƽ� �״�� ����Ͻÿ�.
		
		//block
		//�Է� ��� ����

		/*

		System.out.print("���� �Է� : "); //Lable

		int n = System.in.read();

		//System.out.println(n);
		System.out.printf("�Է��Ͻ� ���ڴ� '%c'�Դϴ�.\n", (char)n);
		*/

		System.out.print("���� �Է� : ");
		int n = System.in.read();
		System.out.println(n);

		n = System.in.read();
		System.out.println(n);

		n = System.in.read();
		System.out.println(n);


	}
}
