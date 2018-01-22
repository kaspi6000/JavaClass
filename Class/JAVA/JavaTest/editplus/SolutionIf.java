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

		System.out.print("입력 : ");

		int year = Integer.parseInt(reader.readLine());

		String msg = "";

		if(year % 4 == 0 && year % 100 != 0 || year % 400 == 0) {
			msg = "윤년";
		}else {
			msg = "평년";
		}

		System.out.printf("%d년은 '%s'입니다.\n", year, msg);
	}

	public static void solution6() throws Exception {
	
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

		System.out.println("<들어온 시간>");
		System.out.print("시 : ");
		int inHour = Integer.parseInt(reader.readLine());

		System.out.print("분 : ");
		int inMinute = Integer.parseInt(reader.readLine());

		System.out.println("<나간 시간>");
		System.out.print("시 : ");
		int outHour = Integer.parseInt(reader.readLine());

		System.out.print("분 : ");
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
			System.out.printf("주차 요금은 무료 입니다.");
		}else {
			price = (int)result * 2000 - 6000;
		}
		System.out.printf("주차 요금은 %,d원 입니다.\n", price);
	}

	public static void solution5() throws Exception {
	
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

		System.out.print("문자 : ");
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

		System.out.print("문자 : ");
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

		System.out.print("숫자1 : ");
		int num1 = Integer.parseInt(reader.readLine());

		System.out.print("숫자2 : ");
		int num2 = Integer.parseInt(reader.readLine());

		System.out.print("연산자 : ");
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

		System.out.print("점수 : ");
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
			System.out.println("0 ~ 100 사이의 숫자를 입력하시오.");
		}

		System.out.printf("입력한 점수 %d점은 %s 입니다.\n", score, grades);
	}

	public static void solution1() throws Exception {

		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

		System.out.print("첫번째 숫자 : ");
		int firstNumber = Integer.parseInt(reader.readLine());

		System.out.print("두번째 숫자 : ");
		int secondNumber = Integer.parseInt(reader.readLine());

		if(firstNumber > secondNumber) {
			System.out.printf("큰수는 %d이고, 작은수는 %d입니다.\n", firstNumber, secondNumber);
		}else if(secondNumber > firstNumber) {
			System.out.printf("큰수는 %d이고, 작은수는 %d입니다.\n", secondNumber, firstNumber);
		}
	}
}
