import java.io.*;

class Ex24_switch {
	public static void main(String[] args) throws Exception  {

		/*
			switch(���ǰ�) {
				case �� : �����ڵ�;
					break;
				[case �� : �����ڵ�;
					break;]
				[default : �����ڵ�;
					break;]
			}
		*/

		//�䱸����] ���� �Է�(1~3) �޾� �ѱ۷� ���
		int num = 1;

		//switch ���� ���ǰ��� ������ �����ϴ�. + String ����
		switch(num) {
			case 1 : System.out.println("�ϳ�");
				//break;//���� ������� Ż��
			case 2 : System.out.println("��");
				break;
			case 3 : System.out.println("��");
				break;
			default : System.out.println("1~3�� ���ڸ� �Է��Ͻÿ�."); //if���� else �� ����
				break;
		}

		//���Ǳ� -> ���� ���� -> ���� ���
		System.out.println("============================");
		System.out.println("	���Ǳ�");
		System.out.println("============================");
		System.out.println("1. �ݶ�");
		System.out.println("2. ���̴�");
		System.out.println("3. ��ī��");
		System.out.println("============================");
		System.out.print("���� ����(��ȣ) : ");

		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

		String input = reader.readLine();

		switch(input) {
			case "1" :
			case "2" : System.out.println("600���Դϴ�.");
				break;
			case "3" : System.out.println("500���Դϴ�.");
				break;
		}

		//���� ��ǰ or ���θ�

		//ī�޶� ����
		//1. �ɼ� : ī�޶� + �޸� + �ﰢ��
		//2. �ɼ� : ī�޶� + �޸�
		//3. �ɼ� : ī�޶�

		System.out.println("ī�޶� ���θ�");
		System.out.print("�ɼ� ���� : ");

		input = reader.readLine();

		switch(input) {
			case "1" :  //System.out.println("ī�޶�");
						//System.out.println("�޸�");
						System.out.println("�ﰢ��");
				//break;
			case "2" :  //System.out.println("ī�޶�");
						System.out.println("�޸�");
				//break;
			case "3" :  System.out.println("ī�޶�");
				break;
		}
	}
}
