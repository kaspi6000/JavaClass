class Solutionfor_2 {
	public static void main(String[] args) {

		//solution8();
		//solution9();
		//solution10();
		solution12();
	}
	public static void solution12() {

		int test = 0;
	
		for(int i = 0; i < 5; i++) {
			for(int j = 0; j < 10; j++) {
				test = 97;
				System.out.print(j < i ? " " : (char)test);
			}
			System.out.println();
		}
	}

	public static void solution10() {
	
		for(int i = 0; i < 5; i++) {
			for(int j = 0; j < i+1; j++) {
				System.out.print(j < i ? " " : "*");
			}
			System.out.println();
		}
	}

	public static void solution9() {

		for(int i = 0; i < 5; i++) {
			for(int j = 0; j < (9 - i); j++) {
				System.out.print(j < i ? " " : "*");
			}
			System.out.println();
		}
	}

	public static void solution8() {
	
		for(int i = 0; i < 5; i++) {
			for(int j = 0; j < 5; j++) {
				System.out.print(j < (4-i) ? " " : "*");
			}
			System.out.println();
		}
	}
}
