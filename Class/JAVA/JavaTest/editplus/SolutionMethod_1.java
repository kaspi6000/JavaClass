import java.io.*;

class SolutionMethod_1 {
	public static void main(String[] args) throws Exception {

		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

		/*System.out.print("�̸� : ");

		String name = reader.readLine();

		getName(name); //solution1

		System.out.print("���� : ");

		int num = reader.read();

		getNumber(num); //solution2*/

		/*System.out.print("���� : ");
		String kor = reader.readLine();

		System.out.print("���� : ");
		String eng = reader.readLine();

		System.out.print("���� : ");
		String math = reader.readLine();

		int testKor = Integer.parseInt(kor);
		int testEng = Integer.parseInt(eng);
		int testMath = Integer.parseInt(math);

		test(testKor, testEng, testMath); //solution3*/

		/*System.out.print("���� ���� : ");
		String station = reader.readLine();

		System.out.print("ȯ�� Ƚ�� : ");
		String transfer = reader.readLine();

		System.out.print("one, two, three : ");
		String data = reader.readLine();

		int stationNumber = Integer.parseInt(station);
		int transferNumber = Integer.parseInt(transfer);

		getTime(stationNumber, transferNumber, data); //solution4*/

		System.out.print("���� �� : ");
		String sunny = reader.readLine();

		System.out.print("�帰 �� : ");
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

		System.out.printf("����� �� %s�� ���Ƚ��ϴ�.\n", test);
	}

	/*public static void getTime(int station, int transfer, String data) {

		//���3�� ���4�� ���5��

		String data1 = "���";
		String data2 = "���";
		String data3 = "���";

		int result4 = data == "" ? 1 : (station * 2 + transfer * 3 + 3);
	
		System.out.printf("�� �ҿ� �ð��� %s���Դϴ�.\n", result4);
	}*/

	/*public static void getName(String name) {
		System.out.printf("�� : %s��\n", name);
	}

	public static void getNumber(int num) {
		String result = num != 0 && num % 2 == 0 ? "¦��" : "Ȧ��";
		System.out.printf("�Է��Ͻ� ���� %s��(��) '%s'�Դϴ�.", (char)num, result);
	}*/

	/*public static void test(int kor, int eng, int math) {

		int score = (kor + eng + math) / 3;

		String result3 = !(kor < 40) && !(eng < 40) && !(math < 40) && score >= 60 ? "�հ�" : "���հ�";

		System.out.printf("%s�Դϴ�.\n", result3);
		
	}*/
}
