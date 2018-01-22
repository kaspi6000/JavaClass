package com.test.example;
import javax.lang.model.element.VariableElement;

public class SolutionArray {
	
	public static void main(String[] args) {
		//solution1();
		//solution2();
		//solution3();
		//solution4();
		//solution5();
		//solution6();
		solution7();
	}
	
	public static void solution7() {
		
//		요구사항]	아래와 같이 출력하시오.
//
//		1	2	3	4	10
//		5	6	7	8	26
//		9	10	11	12	42
//		13	14	15	16	58
//		28	32	36	40	136
		
		int[][] nums = new int[5][5];
		
		int n = 1;
		
		int sum1 = 0;
		int sum2 = 0;
		
		for (int i = 0; i < nums.length - 1; i++) {
			for (int j = 0; j < nums[0].length - 1; j++) {
				nums[i][j] = n;
				n++;
				sum1 += nums[0][j];
				sum2 += nums[1][j];
				
			}
		}
		System.out.println(sum1/4);
		System.out.println(sum2/3);
		
		for (int i = 0; i < nums.length; i++) {
			for (int j = 0; j < nums.length; j++) {
				System.out.printf("%4d", nums[i][j]);
			}
			System.out.println();
		}
	}
	
	public static void solution6() {
		
//		요구사항]	아래와 같이 출력하시오.
//
//		1	2	4	7	11
//		3	5	8	12	16
//		6	9	13	17	20
//		10	14	18	21	23
//		15	19	22	24	25
		
		int[][] nums = new int[5][5];
		
		int n = 1;
		
		for (int i = 0; i < 9; i++) {
			for (int j = 0; j < nums.length; j++) {
				
				int tmp = i - j;
				
				if (tmp >= 0 && tmp < 5) {	
					nums[j][tmp] = n;
					n++;
				}
			}
		}
		
		for (int i = 0; i < nums.length; i++) {
			for (int j = 0; j < nums.length; j++) {
				System.out.printf("%4d", nums[i][j]);
			}
			System.out.println();
		}
	}
	
	public static void solution5() {
		
//		요구사항]	아래와 같이 출력하시오.
//
//		0	0	1	0	0
//		0	2	3	4	0
//		5	6	7	8	9
//		0	10	11	12	0
//		0	0	13	0	0
		
		//i = 0, j = 2
		//i = 1, j = 1, 2, 3
		//i = 2, j = 0, 1, 2, 3, 4
		//i = 3, j = 1, 2, 3
		//i = 4, j = 2
		int[][] nums = new int[5][5];
		
		int n = 1;
		
		for (int i = 0; i < nums.length; i++) {
			if (i % 2 != 0) {
				for (int j = 1; j < nums.length - 1; j++) {
					nums[i][j] = n;
					n++;
				}
			}else if(i == 0 || i == 4) {
				for (int j = nums.length/2; j <= nums.length/2; j++) {
					nums[i][j] = n;
					n++;
				}
			}else {
				for (int j = 0; j < nums.length; j++) {
					nums[i][j] = n;
					n++;
				}
			}
		}
		
		for (int i = 0; i < nums.length; i++) {
			for (int j = 0; j < nums.length; j++) {
				System.out.printf("%4d", nums[i][j]);
			}
			System.out.println();
		}
	}
	
	public static void solution4() {
		
//		요구사항]	아래와 같이 출력하시오.
//
//		1	2	3	4	5
//		6	7	8	9	0
//		10	11	12	0	0
//		13	14	0	0	0
//		15	0	0	0	0
		
		int[][] nums = new int[5][5];
		
		int n = 1;
		
		for (int i = 0; i < nums.length; i++) {
			for (int j = 0; j < nums.length - i; j++) {
				nums[i][j] = n;
				n++;
			}
		}
		
		for (int i = 0; i < nums.length; i++) {
			for (int j = 0; j < nums.length; j++) {
				System.out.printf("%4d", nums[i][j]);
			}
			System.out.println();
		}
	}
	
	public static void solution3() {
		
//		요구사항]	아래와 같이 출력하시오.
//
//		1	6	11	16	21
//		2	7	12	17	22
//		3	8	13	18	23
//		4	9	14	19	24
//		5	10	15	20	25
		int[][] nums = new int[5][5];
		
		int n = 1;
		
		for (int i = 0; i < nums.length; i++) {
	
			for (int j = 0; j < nums.length; j++) {
				nums[j][i] = n;
				n++;
			}
		}
		
		for (int i = 0; i < nums.length; i++) {
			for (int j = 0; j < nums.length; j++) {
				System.out.printf("%4d", nums[i][j]);
			}
			System.out.println();
		}
	}
	
	public static void solution2() {
		
//		요구사항]	아래와 같이 출력하시오.
//
//		25	24	23	22	21
//		20	19	18	17	16
//		15	14	13	12	11
//		10	9	8	7	6
//		5	4	3	2	1
		
		int[][] nums = new int[5][5];
		
		int n = 1;
		
		for (int i = nums.length - 1; i >= 0; i--) {
			for (int j = nums[0].length - 1; j >= 0 ; j--) {
				nums[i][j] = n;
				n++;
			}
		}
		
		for (int i = 0; i < nums.length; i++) {
			for (int j = 0; j < nums.length; j++) {
				System.out.printf("%4d", nums[i][j]);
			}
			System.out.println();
		}
	}
	
	public static void solution1() {
		
//		요구사항]	아래와 같이 출력하시오.
//
//			1	2	3	4	5
//			10	9	8	7	6
//			11	12	13	14	15
//			20	19	18	17	16
//			21	22	23	24	25
		
		int[][] nums = new int[5][5];
		
		int n = 1;
		
		for (int i = 0; i < 5; i++) {
			
			if (i % 2 == 0) {
				for (int j = 0; j < 5; j++) {
					nums[i][j] = n;
					n++;
				}
			}else {
				for (int j = 4; j >= 0; j--) {
					nums[i][j] = n;
					n++;
				}
			}
		}
		for (int i = 0; i < nums.length; i++) {
			for (int j = 0; j < nums.length; j++) {
				System.out.printf("%4d", nums[i][j]);
			}
			System.out.println();
		}
	}
}
