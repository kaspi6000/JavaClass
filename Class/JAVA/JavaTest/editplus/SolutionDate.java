import java.io.*;
import java.util.*;

class SolutionDate {
	public static void main(String[] args) throws Exception {

		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

		//solution1
		
		System.out.print("�⵵ : ");

		String year = reader.readLine();

		int inputYear = Integer.parseInt(year);

		Calendar now = Calendar.getInstance();

		int nowYear = now.get(Calendar.YEAR);

		int result = nowYear - inputYear;

		System.out.printf("���� : %d��\n", result + 1);

		//solution2

		System.out.print("���� : ");
		
		String man = reader.readLine();

		System.out.print("���� : ");

		String woman = reader.readLine();

		System.out.print("�� : ");

		String meetYear = reader.readLine();

		int inputYear1 = Integer.parseInt(meetYear);

		System.out.print("�� : ");

		String meetMonth = reader.readLine();

		int inputMonth = Integer.parseInt(meetMonth);

		System.out.print("�� : ");

		String meetDay = reader.readLine();

		int inputDay = Integer.parseInt(meetDay);

		Calendar spacialDay = Calendar.getInstance();

		spacialDay.set(Calendar.YEAR, inputYear1);

		spacialDay.set(Calendar.MONTH, inputMonth - 1);

		spacialDay.set(Calendar.DATE, inputDay);

		System.out.printf("'%s'��(��) '%s'�� �����\n", man, woman);

		spacialDay.add(Calendar.DATE, 100);

		System.out.printf("100�� : %tF\n", spacialDay);

		spacialDay.add(Calendar.DATE, 100);

		System.out.printf("200�� : %tF\n", spacialDay);

		spacialDay.add(Calendar.DATE, 100);

		System.out.printf("300�� : %tF\n", spacialDay);

		spacialDay.add(Calendar.DATE, 200);

		System.out.printf("500�� : %tF\n", spacialDay);

		spacialDay.add(Calendar.DATE, 500);

		System.out.printf("1000�� : %tF\n", spacialDay);

		//solution3

		System.out.print("�� : ");

		String hour = reader.readLine();

		System.out.print("�� : ");

		String minute = reader.readLine();

		int test1 = Integer.parseInt(hour);
		int test2 = Integer.parseInt(minute);

		Calendar time = Calendar.getInstance();

		time.set(Calendar.HOUR, test1);
		time.set(Calendar.MINUTE, test2);

		time.add(Calendar.MINUTE, -10);

		System.out.printf("����� : %tR\n", time);

		time.add(Calendar.MINUTE, -8);

		System.out.printf("ġŲ : %tR\n", time);

		time.add(Calendar.MINUTE, -7);

		System.out.printf("���� : %tR\n", time);
	}
}
