//import java.io.BufferedReader;	//클래스를 import
//import java.io.InputStreamReader;
import java.io.*;					//패키지를 import

//java.lang : 기본 패키지(import 하지 않아도 사용 가능)

class Ex12_bufferedReader {
	public static void main(String[] args) throws Exception {
	
		//System.in.read(); //바이트 단위 입력
		//BufferedReader	//문자 단위 입력
		
		//System.out.print("문자 입력 : ");

		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

		//int n = reader.read();
		//System.out.println((char)n);

		//String str = reader.readLine();
		//System.out.println(str);
		//readLine 개행전 문자까지 읽음

		//str = reader.readLine();
		//System.out.println(str);


		//입력받을 수 있는 데이터의 형태

		//1. 문자
		//System.in.read();

		//reader.read(); -> 문자 코드 반환
		//reader.readLine(); -> 문자열 반환

		//요구사항] 숫자 1개 입력 + 100 을 하시오.
		//String num = reader.readLine(); // 5 -> '5'
		//System.out.println(num);
		//System.out.println(num + 100);

		//int code = reader.read();
		//System.out.println(code - 48 + 100);

		//요구사항] 숫자 2자리 입력 + 100 을 하시오.
		/*int num;
		int code = reader.read();
		System.out.println(code - 48);

		num = (code - 48) * 10;

		code = reader.read();
		System.out.println(code - 48);

		num = num + (code - 48);

		System.out.println(num + 100);*/

		/*String str = reader.readLine();
		System.out.println(str + 100); // "25" -> 25
		System.out.println(Integer.parseInt(str) + 100);*/

		//문자열 -> int

		//자료형 -> Wrapper Class(Utill Class)
		//byte -> Byte
		//short -> Short
		//int -> Integer
		//long -> Long
		//float -> Float
		//double -> Double
		//boolean -> Boolean


		System.out.println(Integer.parseInt("100"));//100
		System.out.println(Byte.parseByte("100"));
		System.out.println(Double.parseDouble("3.14"));
		System.out.println(Boolean.parseBoolean("true"));

		
		//int의 최대값?
		System.out.println(Integer.MAX_VALUE);
		System.out.println(Integer.MIN_VALUE);


		//reader.readLine()사용 시
		//	- 숫자 입력 -> "문자열" -> Utill Class ParseXXX() 사용 -> 숫자
		//	- 문자열 입력 -> "문자열"
		//	- 문자 입력 -> "문자열" -> '문자'
		String str = reader.readLine();
		//System.out.println((char)str);  //"a" -> 'a'
		System.out.println((int)str.charAt(0));


	}
}
