class Ex11_Input {
	public static void main(String[] args) throws Exception {

		//콘솔 입력 -> 키보드를 통한 입력(내용)을 자바 프로그램에서 사용하기
		//1. System.in.read();
		//2. BufferedReader 클래스
		//3. Scanner 클래스

		//요구사항] 사용자로부터 문자 1개를 입력받아서 그대로 출력하시오.
		
		//block
		//입력 대기 상태

		/*

		System.out.print("문자 입력 : "); //Lable

		int n = System.in.read();

		//System.out.println(n);
		System.out.printf("입력하신 문자는 '%c'입니다.\n", (char)n);
		*/

		System.out.print("문자 입력 : ");
		int n = System.in.read();
		System.out.println(n);

		n = System.in.read();
		System.out.println(n);

		n = System.in.read();
		System.out.println(n);


	}
}
