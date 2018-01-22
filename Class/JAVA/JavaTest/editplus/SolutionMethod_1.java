import java.io.*;

class SolutionMethod_1 {
	public static void main(String[] args) throws Exception {

		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

		/*System.out.print("이름 : ");

		String name = reader.readLine();

		getName(name); //solution1

		System.out.print("숫자 : ");

		int num = reader.read();

		getNumber(num); //solution2*/

		/*System.out.print("국어 : ");
		String kor = reader.readLine();

		System.out.print("영어 : ");
		String eng = reader.readLine();

		System.out.print("수학 : ");
		String math = reader.readLine();

		int testKor = Integer.parseInt(kor);
		int testEng = Integer.parseInt(eng);
		int testMath = Integer.parseInt(math);

		test(testKor, testEng, testMath); //solution3*/

		/*System.out.print("역의 개수 : ");
		String station = reader.readLine();

		System.out.print("환승 횟수 : ");
		String transfer = reader.readLine();

		System.out.print("one, two, three : ");
		String data = reader.readLine();

		int stationNumber = Integer.parseInt(station);
		int transferNumber = Integer.parseInt(transfer);

		getTime(stationNumber, transferNumber, data); //solution4*/

		System.out.print("맑은 날 : ");
		String sunny = reader.readLine();

		System.out.print("흐린 날 : ");
		String cloudy = reader.readLine();

		int sunnyNumber = Integer.parseInt(sunny);
		int cloudyNumber = Integer.parseInt(cloudy);

		getApple(sunnyNumber, cloudyNumber);
	}

	public static void getApple(int sunny, int cloudy) {

		int num = 0;

		//sunny * 5 + cloudy *2 <= 110 ? num++ : num
		
		int result5 = sunny * 5 + cloudy * 2;
		int test = result5 >= 110 ? 1 : 2;

		System.out.printf("사과가 총 %s개 열렸습니다.\n", test);
	}

	/*public static void getTime(int station, int transfer, String data) {

		//평상3분 출근4분 퇴근5분

		String data1 = "평상";
		String data2 = "출근";
		String data3 = "퇴근";

		int result4 = data == "" ? 1 : (station * 2 + transfer * 3 + 3);
	
		System.out.printf("총 소요 시간은 %s분입니다.\n", result4);
	}*/

	/*public static void getName(String name) {
		System.out.printf("고객 : %s님\n", name);
	}

	public static void getNumber(int num) {
		String result = num != 0 && num % 2 == 0 ? "짝수" : "홀수";
		System.out.printf("입력하신 숫자 %s는(은) '%s'입니다.", (char)num, result);
	}*/

	/*public static void test(int kor, int eng, int math) {

		int score = (kor + eng + math) / 3;

		String result3 = !(kor < 40) && !(eng < 40) && !(math < 40) && score >= 60 ? "합격" : "불합격";

		System.out.printf("%s입니다.\n", result3);
		
	}*/
}
