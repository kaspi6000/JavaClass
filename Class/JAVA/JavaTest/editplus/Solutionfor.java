import java.io.*;

class Solutionfor {
	public static void main(String[] args) throws Exception {
		
		//solution1();
		//solution2();
		//solution3();
		//solution4();
		//solution5();
		//solution6();
		solution7();
	}

	public static void solution7() {
	
		for(int i = 1; i < 101; i++) {
			if(!((i / 10 % 10 == 3 || i / 10 % 10 == 6 || i / 10 % 10 == 9) ||
				(i % 10 == 3 || i % 10 == 6 || i % 10 == 9))) {
				System.out.println(i);
			}
			if((i / 10 % 10 == 3 || i / 10 % 10 == 6 || i / 10 % 10 == 9) &&
				(i % 10 == 3 || i % 10 == 6 || i % 10 == 9)) {
				System.out.println("Â¦Â¦");
			}else if(i % 10 == 3 || i % 10 == 6 || i % 10 == 9) {
				System.out.println("Â¦");
			}else if(i / 10 % 10 == 3 || i / 10 % 10 == 6 || i / 10 % 10 == 9) {
				System.out.println("Â¦");
			}
		}

		
	}

	public static void solution6() {
		
		//À±³â == 366
		//Æò³â == 365
		int allDay = 0;
		int day17 = 0;
		for(int i = 1; i < 2018; i++) {
			if(i % 4 == 0 && i % 100 != 0 || i % 400 == 0) {
				allDay += 366;
			}else {
				allDay += 365;
			}
		}
		System.out.printf("ÃÑ %,dÀÏ Áö³µ½À´Ï´Ù.\n", allDay - 25);
	}

	public static void solution5() throws Exception {

		int sum = 0;
		int maxNum = 0;
	
		for(int i = 1; ;i++) {
			sum += i;
			if(sum > 1000) {
				maxNum = i;
				break;
			}
		}

		System.out.printf("1 + 2 + 3 + 4 + 5 + ... + %d = %d\n", maxNum, sum);
	}

	public static void solution4() throws Exception {

		int sum = 0;
		int sum1 = 0;

		for(int i = 1; i < 11; i++) {
			sum += i;

			if(i > 0) {
				System.out.printf("%d ", i);
				if(i == 10)
					break;
					
				System.out.print("+ ");
			}
		}
		System.out.printf("= %d\n", sum);

		for(int i = 1; i < 11; i++) {
			if(i % 2 == 0) {
				sum1 -= i;
				System.out.printf("%d ", i);
				if(i == 10)
					break;
					
				System.out.print("+ ");
			}else if(i % 2 != 0) {
				sum1 += i;
				System.out.printf("%d - ", i);
			}
		}
		System.out.printf("= %d\n", sum1);
	}

	public static void solution3() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

		int num = 0;
		int sum = 0;
		int sum1 = 0;

		for(int i = 0; i < 10; i++) {
			System.out.print("¼ýÀÚ : ");
			num = Integer.parseInt(reader.readLine());
			if(num % 2 == 0) {
				sum += num;
			}else if(num % 2 != 0) {
				sum1 += num;
			}
		}
		System.out.printf("Â¦¼öÀÇ ÇÕ : %d\n", sum);
		System.out.printf("È¦¼öÀÇ ÇÕ : %d\n", sum1);
	}

	public static void solution2() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

		System.out.print("¼ýÀÚ : ");
		int num = Integer.parseInt(reader.readLine());

		int sum = 0;

		for(int i = 1; i < num + 1; i++) {
			sum += i;
		}

		System.out.printf("1 ~ %d = %,d", num, sum);
	}

	public static void solution1() throws Exception {
	
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

		System.out.print("ÀÌ¸§ : ");
		String name = reader.readLine();

		System.out.print("È½¼ö : ");
		int count = Integer.parseInt(reader.readLine());

		for(int i = 0; i < count; i++) {
			System.out.printf("%s´Ô ¾È³çÇÏ¼¼¿ä~\n", name);
		}
	}
}
