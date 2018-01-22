import java.io.*;

class Solution {
	public static void main(String[] args) throws Exception {

		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

		//solution9
		/*System.out.print("영문자 : ");
		int input11 = reader.read();
		//97-122 소문자, 65-90 대문자
		String result9 = input11 >= 97 ? "소문자" : "대문자";
		System.out.printf("'%s'는 %s입니다.\n", (char)input11, result9);*/

		//solution8
		System.out.print("2017년 11월중 한 날짜를 입력하여 주십시오 : ");
		//(day % 7) == 1금 2토 3일 4월 5화 6수 0목
		String input10 = reader.readLine();
		int test8 = Integer.parseInt(input10);
		int test9 = test8 % 7;
		switch (test9){
		case 0 : System.out.printf("%s일은 화요일입니다.\n", test8);
			break;
		case 1 : System.out.printf("%s일은 수요일입니다.\n", test8);
			break;
		case 2 : System.out.printf("%s일은 목요일입니다.\n", test8);
			break;
		case 3 : System.out.printf("%s일은 금요일입니다.\n", test8);
			break;
		case 4 : System.out.printf("%s일은 토요일입니다.\n", test8);
			break;
		case 5 : System.out.printf("%s일은 일요일입니다.\n", test8);
			break;
		case 6 : System.out.printf("%s일은 월요일입니다.\n", test8);
			break;
		};

		//solution7
		System.out.print("첫번째 숫자 : ");
		String input8 = reader.readLine();

		System.out.print("두번째 숫자 : ");
		String input9 = reader.readLine();

		int num8 = Integer.parseInt(input8);
		int num9 = Integer.parseInt(input9);

		int result7 = num8 > num9 ? num8 : num9;
		System.out.printf("가장 큰 수 : %s\n", result7);

		//solution6
		System.out.println("한달 수익을 입력하여 주십시오.");

		String input7 = reader.readLine();

		int revenue = Integer.parseInt(input7);

		double result6 = revenue - revenue * 0.033;
		//System.out.println(Math.round(result6));

		System.out.printf("세후(원) : %s원.\n", result6);

		//solution1
		System.out.print("나이 : ");

		String input = reader.readLine();

		int year = 2017 - Integer.parseInt(input);

		System.out.printf("%s살은 %s년도에 태어났습니다.\n", input, year);

		//solution2
		System.out.println("숫자 두개를 입력하시오.");

		String input1 = reader.readLine();
		String input2 = reader.readLine();
		
		int num1 = Integer.parseInt(input1);
		int num2 = Integer.parseInt(input2);
		int result = num1 + num2;

		System.out.printf("%s + %s = %s\n", num1, num2, result);

		//solution3
		System.out.println("사각형의 너비와 높이를 입력하시오.");

		String input3 = reader.readLine();
		String input4 = reader.readLine();

		int width = Integer.parseInt(input3);
		int height = Integer.parseInt(input4);

		int area = width * height;
		int round = (width + height) * 2;

		System.out.printf("넓이 : %scm2\n둘레 : %scm\n", area, round);

		//solution4
		System.out.println("페달수를 입력하여 주십시오.");

		String input5 = reader.readLine();

		int wheel = Integer.parseInt(input5);

		int result1 = wheel * 3;

		System.out.printf("총 %s m를 이동했습니다.\n", result1);

		//solution5
		System.out.println("영소문자 1개를 입력하여 주십시오.");

		int input6 = reader.read();

		int result2 = input6 - 32;

		System.out.printf("%s의 대문자는 %s 입니다.\n", (char)input6, (char)result2);


	}
}
