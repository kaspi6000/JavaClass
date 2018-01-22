import java.io.*;
import java.util.*;

class SolutionDate {
	public static void main(String[] args) throws Exception {

		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

		//solution1
		
		System.out.print("년도 : ");

		String year = reader.readLine();

		int inputYear = Integer.parseInt(year);

		Calendar now = Calendar.getInstance();

		int nowYear = now.get(Calendar.YEAR);

		int result = nowYear - inputYear;

		System.out.printf("나이 : %d세\n", result + 1);

		//solution2

		System.out.print("남자 : ");
		
		String man = reader.readLine();

		System.out.print("여자 : ");

		String woman = reader.readLine();

		System.out.print("년 : ");

		String meetYear = reader.readLine();

		int inputYear1 = Integer.parseInt(meetYear);

		System.out.print("월 : ");

		String meetMonth = reader.readLine();

		int inputMonth = Integer.parseInt(meetMonth);

		System.out.print("일 : ");

		String meetDay = reader.readLine();

		int inputDay = Integer.parseInt(meetDay);

		Calendar spacialDay = Calendar.getInstance();

		spacialDay.set(Calendar.YEAR, inputYear1);

		spacialDay.set(Calendar.MONTH, inputMonth - 1);

		spacialDay.set(Calendar.DATE, inputDay);

		System.out.printf("'%s'와(과) '%s'의 기념일\n", man, woman);

		spacialDay.add(Calendar.DATE, 100);

		System.out.printf("100일 : %tF\n", spacialDay);

		spacialDay.add(Calendar.DATE, 100);

		System.out.printf("200일 : %tF\n", spacialDay);

		spacialDay.add(Calendar.DATE, 100);

		System.out.printf("300일 : %tF\n", spacialDay);

		spacialDay.add(Calendar.DATE, 200);

		System.out.printf("500일 : %tF\n", spacialDay);

		spacialDay.add(Calendar.DATE, 500);

		System.out.printf("1000일 : %tF\n", spacialDay);

		//solution3

		System.out.print("시 : ");

		String hour = reader.readLine();

		System.out.print("분 : ");

		String minute = reader.readLine();

		int test1 = Integer.parseInt(hour);
		int test2 = Integer.parseInt(minute);

		Calendar time = Calendar.getInstance();

		time.set(Calendar.HOUR, test1);
		time.set(Calendar.MINUTE, test2);

		time.add(Calendar.MINUTE, -10);

		System.out.printf("자장면 : %tR\n", time);

		time.add(Calendar.MINUTE, -8);

		System.out.printf("치킨 : %tR\n", time);

		time.add(Calendar.MINUTE, -7);

		System.out.printf("피자 : %tR\n", time);
	}
}
