import java.io.*;

class Solution {
	public static void main(String[] args) throws Exception {

		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

		//solution9
		/*System.out.print("������ : ");
		int input11 = reader.read();
		//97-122 �ҹ���, 65-90 �빮��
		String result9 = input11 >= 97 ? "�ҹ���" : "�빮��";
		System.out.printf("'%s'�� %s�Դϴ�.\n", (char)input11, result9);*/

		//solution8
		System.out.print("2017�� 11���� �� ��¥�� �Է��Ͽ� �ֽʽÿ� : ");
		//(day % 7) == 1�� 2�� 3�� 4�� 5ȭ 6�� 0��
		String input10 = reader.readLine();
		int test8 = Integer.parseInt(input10);
		int test9 = test8 % 7;
		switch (test9){
		case 0 : System.out.printf("%s���� ȭ�����Դϴ�.\n", test8);
			break;
		case 1 : System.out.printf("%s���� �������Դϴ�.\n", test8);
			break;
		case 2 : System.out.printf("%s���� ������Դϴ�.\n", test8);
			break;
		case 3 : System.out.printf("%s���� �ݿ����Դϴ�.\n", test8);
			break;
		case 4 : System.out.printf("%s���� ������Դϴ�.\n", test8);
			break;
		case 5 : System.out.printf("%s���� �Ͽ����Դϴ�.\n", test8);
			break;
		case 6 : System.out.printf("%s���� �������Դϴ�.\n", test8);
			break;
		};

		//solution7
		System.out.print("ù��° ���� : ");
		String input8 = reader.readLine();

		System.out.print("�ι�° ���� : ");
		String input9 = reader.readLine();

		int num8 = Integer.parseInt(input8);
		int num9 = Integer.parseInt(input9);

		int result7 = num8 > num9 ? num8 : num9;
		System.out.printf("���� ū �� : %s\n", result7);

		//solution6
		System.out.println("�Ѵ� ������ �Է��Ͽ� �ֽʽÿ�.");

		String input7 = reader.readLine();

		int revenue = Integer.parseInt(input7);

		double result6 = revenue - revenue * 0.033;
		//System.out.println(Math.round(result6));

		System.out.printf("����(��) : %s��.\n", result6);

		//solution1
		System.out.print("���� : ");

		String input = reader.readLine();

		int year = 2017 - Integer.parseInt(input);

		System.out.printf("%s���� %s�⵵�� �¾���ϴ�.\n", input, year);

		//solution2
		System.out.println("���� �ΰ��� �Է��Ͻÿ�.");

		String input1 = reader.readLine();
		String input2 = reader.readLine();
		
		int num1 = Integer.parseInt(input1);
		int num2 = Integer.parseInt(input2);
		int result = num1 + num2;

		System.out.printf("%s + %s = %s\n", num1, num2, result);

		//solution3
		System.out.println("�簢���� �ʺ�� ���̸� �Է��Ͻÿ�.");

		String input3 = reader.readLine();
		String input4 = reader.readLine();

		int width = Integer.parseInt(input3);
		int height = Integer.parseInt(input4);

		int area = width * height;
		int round = (width + height) * 2;

		System.out.printf("���� : %scm2\n�ѷ� : %scm\n", area, round);

		//solution4
		System.out.println("��޼��� �Է��Ͽ� �ֽʽÿ�.");

		String input5 = reader.readLine();

		int wheel = Integer.parseInt(input5);

		int result1 = wheel * 3;

		System.out.printf("�� %s m�� �̵��߽��ϴ�.\n", result1);

		//solution5
		System.out.println("���ҹ��� 1���� �Է��Ͽ� �ֽʽÿ�.");

		int input6 = reader.read();

		int result2 = input6 - 32;

		System.out.printf("%s�� �빮�ڴ� %s �Դϴ�.\n", (char)input6, (char)result2);


	}
}
