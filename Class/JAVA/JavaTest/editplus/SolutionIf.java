import java.io.*;
import java.util.*;

class SolutionIf {
	public static void main(String[] args) throws Exception {

		//solution1();
		//solution2();
		//solution3();
		//solution4();
		//solution5();
		solution6();
		//solution7();
	}

	public static void solution7() throws Exception {
	
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

		System.out.print("�Է� : ");

		int year = Integer.parseInt(reader.readLine());

		String msg = "";

		if(year % 4 == 0 && year % 100 != 0 || year % 400 == 0) {
			msg = "����";
		}else {
			msg = "���";
		}

		System.out.printf("%d���� '%s'�Դϴ�.\n", year, msg);
	}

	public static void solution6() throws Exception {
	
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

		System.out.println("<���� �ð�>");
		System.out.print("�� : ");
		int inHour = Integer.parseInt(reader.readLine());

		System.out.print("�� : ");
		int inMinute = Integer.parseInt(reader.readLine());

		System.out.println("<���� �ð�>");
		System.out.print("�� : ");
		int outHour = Integer.parseInt(reader.readLine());

		System.out.print("�� : ");
		int outMinute = Integer.parseInt(reader.readLine());

		Calendar in = Calendar.getInstance();

		in.set(Calendar.HOUR, inHour);
		in.set(Calendar.MINUTE, inMinute);

		Date inDate = in.getTime();
		long inTick = inDate.getTime();

		Calendar out = Calendar.getInstance();

		out.set(Calendar.HOUR, outHour);
		out.set(Calendar.MINUTE, outMinute);

		Date outDate = out.getTime();
		long outTick = outDate.getTime();

		long result = (outTick - inTick) / 1000 / 60 / 10;

		int price = 0;

		if(result <= 3) {
			System.out.printf("���� ����� ���� �Դϴ�.");
		}else {
			price = (int)result * 2000 - 6000;
		}
		System.out.printf("���� ����� %,d�� �Դϴ�.\n", price);
	}

	public static void solution5() throws Exception {
	
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

		System.out.print("���� : ");
		String word = reader.readLine();

		char c = word.charAt(0);

		int code = (int)c;

		int result = 0;

		if(code >= 97 && code <= 122) {
			result = code - 32;
		}else if(code >= 65 && code <= 90) {
			result = code + 32;
		}

		System.out.println((char)result);
	}

	public static void solution4() throws Exception {
	
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

		System.out.print("���� : ");
		String word = reader.readLine();

		String text = "";

		switch(word) {
			case "f" :
			case "F" : text = "Father";
				break;
			case "m" :
			case "M" : text = "Mother";
				break;
			case "s" :
			case "S" : text = "Sister";
				break;
			case "b" :
			case "B" : text = "Brother";
				break;
		}

		System.out.println(text);
	}

	public static void solution3() throws Exception {

		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

		System.out.print("����1 : ");
		int num1 = Integer.parseInt(reader.readLine());

		System.out.print("����2 : ");
		int num2 = Integer.parseInt(reader.readLine());

		System.out.print("������ : ");
		String input = reader.readLine();
		char operator = input.charAt(0);

		int result = 0;

		if(operator == '+') {
			result = num1 + num2;
		}else if(operator == '-'){
			result = num1 - num2;
		}else if(operator == '*'){
			result = num1 * num2;
		}else if(operator == '/'){
			result = num1 / num2;
		}

		System.out.printf("%d %s %d = %d\n", num1, operator, num2, result);
	}

	public static void solution2() throws Exception {
	
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

		System.out.print("���� : ");
		int score = Integer.parseInt(reader.readLine());

		String grades = "";

		if(score <= 100 && score >= 0) {

			if(score >= 90) {
				grades = "A";
			}else if(score >= 80) {
				grades = "B";
			}else if(score >= 70) {
				grades = "C";
			}else if(score >= 60) {
				grades = "D";
			}else {
				grades = "F";
			}
		
		}else {
			System.out.println("0 ~ 100 ������ ���ڸ� �Է��Ͻÿ�.");
		}

		System.out.printf("�Է��� ���� %d���� %s �Դϴ�.\n", score, grades);
	}

	public static void solution1() throws Exception {

		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

		System.out.print("ù��° ���� : ");
		int firstNumber = Integer.parseInt(reader.readLine());

		System.out.print("�ι�° ���� : ");
		int secondNumber = Integer.parseInt(reader.readLine());

		if(firstNumber > secondNumber) {
			System.out.printf("ū���� %d�̰�, �������� %d�Դϴ�.\n", firstNumber, secondNumber);
		}else if(secondNumber > firstNumber) {
			System.out.printf("ū���� %d�̰�, �������� %d�Դϴ�.\n", secondNumber, firstNumber);
		}
	}
}
