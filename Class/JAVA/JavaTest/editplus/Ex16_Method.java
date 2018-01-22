import java.io.*;

class Ex16_Method {
	public static void main(String[] args) throws Exception {

		/*
			메소드 선언
			접근지정자 정적키워드 반환형 메소드명(인자리스트) {
				구현부
			}
		*/

		//인자 리스트

		//요구사항] "홍길동님 안녕하세요" 출력
		//System.out.println("홍길동님 안녕하세요.");
		hello();

		//public static void hi(String name)
		hi("홍길동", 20);

		//추가사항] "아무개님 안녕하세요." 출력
		//System.out.println("아무개님 안녕하세요.");
		String test = "ㅎㅇ";
		int age = 20;
		hi(test, age);
		hi("홍길동", age);

		//추가사항] 우리 강의실의 모든 사람 대상
		//추가사항] 한독 건물
		//추가사항] 지구인
		//parameter와 argument의 개수랑 타입이 맞아야함;;

		//hi();
		//hi(100);
		hi("hahaha", 100);

		int num1 = 10,
			num2 = 20;

		add(num1, num2);
		add(10, 20);
		add(5, 2);
		add(22, 33);

		check("홍길동", 25);
		check("아무개", 12);
		check("하하하", 80);

		int n = num();
		System.out.println(n);

		bye();

		int m = 5;
		int result = getSquare(m);
		System.out.println(result);
		System.out.println(getSquare(m));

	}

	public static void hello() {
		System.out.println("홍길동님 안녕하세요.");
	}

	public static void hi(String name, int age) {
		//String name = "홍길동";
		System.out.println(name + "님 안녕하세요." + age);
	}

	public static void add(int a, int b) {
		
		System.out.printf("%d + %d = %d\n", a, b, a + b);
	}

	public static void check(String name, int age) {

		String result = (age >= 20 && age < 60) ? "통과" : "탈락";
		System.out.printf("고객 '%s'님은 '%s'입니다.\n", name, result);
	}

	public static int num() {
		
		//리턴문, 반환문
		return 10;
	}

	//이름을 입력하면 인사하기

	public static void bye() throws Exception {

		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

		System.out.print("이름 입력 : ");

		String name = reader.readLine();

		System.out.printf("%s님 안녕하세요.\n", name);
	}

	//숫자 1개 전달 -> 제곱값을 반환
	//	2 -> 4
	//	8 -> 64

	//메소드 헤더
	//	-> 메소드 시그너쳐(Signature)
	//	-> 메소드 서명
	public static int getSquare(int n) {
		
		int result = 0;

		result = n * n;

		System.out.println("작업이 완료되었습니다.");

		return result;

		//System.out.println("작업이 완료되었습니다.");
	}
}
