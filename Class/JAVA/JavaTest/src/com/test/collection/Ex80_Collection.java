package com.test.collection;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Comparator;
import java.util.List;
import java.util.Random;
import java.util.Vector;

public class Ex80_Collection {

	public static void main(String[] args) {
		
		//m1();
		//m2();
		//m3();
		//m4();
		//m5();
		//m6();
		//m7();
		//m8();
		m9();
	}

	private static void m9() {
		
		ArrayList<Employee> list = new ArrayList<Employee>();
		
		list.add(new Employee("김대리", 30, 350, 100, Position.대리, 2010, 5, 20));
		list.add(new Employee("홍길동", 42, 520, 170, Position.부장, 2003, 1, 12));
		list.add(new Employee("이사원", 25, 200, 50, Position.사원, 2016, 7, 01));
		list.add(new Employee("박사원", 24, 220, 60, Position.사원, 2016, 2, 17));
		list.add(new Employee("정과장", 38, 440, 130, Position.과장, 2005, 11, 29));
		
		System.out.println(list);
		
		//정렬
		list.sort(new Comparator<Employee>() {

			@Override
			public int compare(Employee o1, Employee o2) {
				
//				return o1.getName().compareTo(o2.getName());
				return o1.getName().length() - o2.getName().length();
			}
		});
		
		System.out.println(list);
		
		System.out.println("==========나이순===========");
		System.out.println(list);
		
		list.sort(new Comparator<Employee>() {

			@Override
			public int compare(Employee o1, Employee o2) {
				
				return o1.getAge() - o2.getAge();
			}			
		});
		
		System.out.println(list);
		
		System.out.println("==========급여순===========");
		list.sort(new Comparator<Employee>() {

			@Override
			public int compare(Employee o1, Employee o2) {
				
				return (o2.getSalary() + o2.getBonus()) - (o1.getSalary() + o1.getBonus());
			}
		});
		System.out.println(list);
		
		System.out.println("=========직급별===========");
		System.out.println(Position.부장.ordinal());
		System.out.println(Position.과장.ordinal());
		System.out.println(Position.대리.ordinal());
		System.out.println(Position.사원.ordinal());
		
		list.sort(new Comparator<Employee>() {

			@Override
			public int compare(Employee o1, Employee o2) {
				
				return o1.getPosition().ordinal() - o2.getPosition().ordinal();
			}
		});
		System.out.println(list);
		
		System.out.println("=========입사일===========");
		
		list.sort(new Comparator<Employee>() {

			@Override
			public int compare(Employee o1, Employee o2) {
				
				//o1.getDate(). - o2.getDate();
				
				//return (int)(o1.getDate().getTime().getTime() - o2.getDate().getTime().getTime());
				
				if (o1.getDate().getTime().getTime() > o2.getDate().getTime().getTime()) {
					return 1;
				}else if (o1.getDate().getTime().getTime() > o2.getDate().getTime().getTime()) {
					return -1;
				}else {
					return 0;
				}
			}
		});
		System.out.println(list);
	}

	private static void m8() {
		
		//순수배열 -> 컬렉션
		Random rnd = new Random();
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		for (int i = 0; i < 10; i++) {
			
			list.add(rnd.nextInt(30) + 1); //1 ~ 30
		}
		
		System.out.println(list);
		
		//직접 정렬 -> 오름 차순
//		for (int i = 0; i < list.size() - 1; i++) {
//			for (int j = 0; j < list.size() - 1 - i; j++) {
//				
//				//[] : indexer(인덱서)
//				if (list.get(j) > list.get(j + 1)) {
//					
//					Integer temp = list.get(j);
//					
//					//list.get(j) = list.get(j+1);
//					list.set(j, list.get(j+1));
//					list.set(j+1, temp);
//				}
//			}
//		}
		//System.out.println(list);
		
		//이미 제공되는 기능으로 정렬
		//1. 순수 배열 : Arrays.sort()
		//2. 컬렉션 : 정렬 기능
		
		//오름 차순
		//Collections.sort(list);
		//System.out.println(list);
		
		//내림차순
		//Collections.reverse(list);
		//System.out.println(list);
		
		//오름 차순 정렬 -> 제공되는 기술(반 조립 제품)
		//	- Comparator, Comparable
		list.sort(new Comparator<Integer>() {

			@Override
			public int compare(Integer o1, Integer o2) {
				
				//return o1 - o2;
				return o2 - o1;
			}
		});
		
		System.out.println(list);
		
		list.sort(new MyComparator());
		
		System.out.println(list);
	}

	private static void m7() {
		
		//객체 비교
		Item[] items = new Item[5];
		
		items[0] = new Item(3, "빨강");
		items[1] = new Item(5, "파랑");
		items[2] = new Item(7, "노랑");
		items[3] = new Item(2, "검정");
		items[4] = new Item(1, "하양");
		
		//정렬
		//System.out.println(items[0] > items[1]);
		System.out.println(items[0].getNum() > items[1].getNum());
		System.out.println(items[0].getName().compareTo(items[1].getName()));
		
		//Item cannot be cast to java.lang.Comparable
		//Arrays.sort(items);
		
		for (int i = 0; i < items.length - 1; i++) {
			
			for (int j = 0; j < items.length - 1 - i; j++) {
				
				//사용자 기준 선정
				//if (items[j].getNum() > items[j+1].getNum()) {
				if (items[j].getName().compareTo(items[j+1].getName()) > 0) {
					
					Item temp = items[j];
					items[j] = items[j+1];
					items[j+1] = temp;
				}
			}
		}
		
		System.out.println(Arrays.toString(items));
		
		Student[] list = new Student[] {
				new Student("홍길동", 20, 10, 30),
				new Student("아무개", 40, 20, 50),
				new Student("하하하", 36, 15, 42),
				new Student("테스트", 42, 56, 34),
				new Student("강경일", 86, 87, 78)
		};
		
		System.out.println(Arrays.toString(list));
		
		for (int i = 0; i < list.length - 1; i++) {
			
			for (int j = 0; j < list.length - 1 - i; j++) {
				
				//총점 순서대로 정렬
				if (list[j].getTotal() < list[j+1].getTotal()) {
					
					Student temp = list[j];
					list[j] = list[j+1];
					list[j+1] = temp;
				}
			}
		}
		
		System.out.println(Arrays.toString(list));
	}

	private static void m6() {
		
		String[] list = {"abc", "Abd", "abE", "ABF", "ABG"};
		
//		Arrays.sort(list);
//		System.out.println(Arrays.toString(list));
		
		String s1 = "abc";
		String s2 = "Abc";
		
		//System.out.println(s1 > s2);
		System.out.println(s1.compareTo(s2));
		System.out.println(s1.compareToIgnoreCase(s2));
		
		//문자열 배열 정렬을 직접 구현
		for (int i = 0; i < list.length - 1; i++) {
			
			for (int j = 0; j < list.length - 1 - i; j++) {
				
				//비교 -> 내림차순
				//if (list[j].compareTo(list[j + 1]) < 0) {
				if (list[j].compareToIgnoreCase(list[j + 1]) < 0) {
					String temp = list[j];
					list[j] = list[j + 1];
					list[j + 1] = temp;
				}
			}
		}
		
		System.out.println(Arrays.toString(list));
	}

	private static void m5() {
		
		//배열 정렬
		int[] nums = {5, 3, 2, 4, 1};
		
		System.out.println(Arrays.toString(nums));
		
		String[] list = {"홍길동", "아무개", "유재석", "박명수", "하하",
				"정준하", "정형돈", "강호동", "이수근", "테스트"
		};
		
		System.out.println(Arrays.toString(list));
		
		//값형 + String
		Arrays.sort(list);
		
		System.out.println(Arrays.toString(list));
		
		//정렬
		//1. 숫자 : 값의 비교 -> 가능
		//2. 문자 : 값의 비교 -> 가능
		//3. 논리 : 사용x
		//4. 날짜 : 과거 < 미래 -> 가능
		//5. 문자열 : 앞의 문자부터 값의 비교 -> 가능
		//6. 객체 : 조건을 선택 지정 후 -> 가능
		
		Calendar[] times = new Calendar[5];
		
		times[0] = Calendar.getInstance();
		times[1] = Calendar.getInstance();
		times[2] = Calendar.getInstance();
		times[3] = Calendar.getInstance();
		times[4] = Calendar.getInstance();
		
		times[0].add(Calendar.DATE, 1);
		times[1].add(Calendar.DATE, -1);
		times[2].add(Calendar.DATE, 2);
		times[3].add(Calendar.DATE, -2);
		
		System.out.println(Arrays.toString(times));
		
		for (Calendar c : times) {
			System.out.printf("%tF\n", c);
		}
		
		Arrays.sort(times);
		System.out.println();
		
		for (Calendar c : times) {
			System.out.printf("%tF\n", c);
		}
	}

	private static void m4() {
		
		//상황 -> 배열 -> 오름차순 정렬
		//원본	: {5, 4, 3, 3, 1}
		
		//Step 0 : {5, 4, 3, 2, 1}
		
		//Step 1 : {4, 5, 3, 2, 1}
		//Step 1 : {4, 3, 5, 2, 1}
		//Step 1 : {4, 3, 2, 5, 1}
		//Step 1 : {4, 3, 2, 1, 5} //가장 큰수가 맨 뒤로
		
		//Step 2 : {4, 3, 2, 1, 5}
		//Step 2 : {3, 4, 2, 1, 5}
		//Step 2 : {3, 2, 4, 1, 5}
		//Step 2 : {3, 2, 1, 4, 5} //두번째로 큰수가 그다음 뒤로
		
		//Step 2 : {3, 2, 1, 4, 5}
		//Step 2 : {2, 3, 1, 4, 5}
		//Step 2 : {2, 1, 3, 4, 5} //세번째로 큰수
		
		//Step 2 : {2, 1, 3, 4, 5}
		//Step 2 : {1, 2, 3, 4, 5}
	}

	private static void m3() {
		
		//정렬, Sort
		//	-> 스왑, Swap
		//1. 버블 정렬
		//2. 선택 정렬
		//3. 삽입 정렬
		//===========
		//4. 퀵 정렬
		//5. 힙 정렬
		//6. 병합(머지) 정렬
		//7. 기수 정렬
		
		int[] nums = new int[] {10, 50, 30};
		
		//for
		int temp = 0;
		
		if (nums[0] < nums[1]) {
			temp = nums[0];
			nums[0] = nums[1];
			nums[1] = temp;
		}
		
		System.out.println(Arrays.toString(nums));
	}

	private static void m2() {
		
		//순수 배열
		String[] list = new String[] {
				"홍길동", "아무개", "하하하", "호호호", "유재석", "박명수", "정형돈", "정준하", "강호동", "이수근"
		};
		
		//규모
		//1. 작은 코드 > 도움말
		//2. 큰 코드 > 구글
		//3. 대형 코드(소규모 프로젝트 단위) -> 구글, 코드프로젝트
		//4. 문제 > 구글, 스택오버플로우
		
		String[] copy = list.clone(); //깊은 복사
		String[] copy2 = list; //얕은 복사
		
		list[0] = "김길동";
		System.out.println(copy[0]);
		System.out.println(copy2[0]);
		
		//컬렉션 생성하기
		List<String> temp = Arrays.asList("아무개", "하하하", "호호호");
		System.out.println(temp.get(0));
		
		//순수배열 -> 컬렉션 변환하기
		List<String> temp2 = Arrays.asList(list);
		System.out.println(temp2.toString());
		
		//배열 부분 복사(깊은 복사) *****
		String[] temp3 = Arrays.copyOf(list, 3);
		System.out.println(Arrays.toString(temp3));
		
		//배열 부분 복사 *****
		String[] temp4 = Arrays.copyOfRange(list, 3, 6);
		System.out.println(Arrays.toString(temp4));
		
		//배열 비교
		Integer[] ns1 = new Integer[] {100, 200, 300};
		Integer[] ns2 = new Integer[] {100, 200, 300};
		System.out.println(ns1 == ns2); //참조 변수 비교 = 주소값 비교
		System.out.println(ns1.equals(ns2));
		
		System.out.println(Arrays.deepEquals(ns1, ns2));
		
		//배열 채우기
		String[] temp5 = new String[10]; //null
		//loop -> [i] = "미정";
		//Arrays.fill(temp5, "미정");
		Arrays.fill(temp5, 3, 7, "미정");
		System.out.println(Arrays.toString(temp5));
	}

	private static void m1() {
		
		//List 계열
		//1. ArrayList
		//2. Vector
		//	- 동일한 컬렉션
		//	- 쓰레드 작업 시 동기화 지원 유무
		
		int[] nums1 = new int[3];
		
		nums1[0] = 10;
		nums1[1] = 30;
		nums1[2] = 20;
		
		System.out.println(Arrays.toString(nums1));
		
		ArrayList<Integer> nums2 = new ArrayList<Integer>();
		
		nums2.add(100);
		nums2.add(300);
		nums2.add(200);
		
		System.out.println(nums2.toString());
		
		Vector<Integer> nums3 = new Vector<Integer>();
		
		nums3.add(1000);
		nums3.add(3000);
		nums3.add(2000);
		
		System.out.println(nums3.toString());
	}
}

class Item {
	
	private int num;
	private String name;
	
	public Item(int num, String name) {
		
		this.num = num;
		this.name = name;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	@Override
	public String toString() {
		return "Item [num=" + num + ", name=" + name + "]";
	}
}

class Student {
	
	private String name;
	private int kor;
	private int eng;
	private int math;
	
	public Student(String name, int kor, int eng, int math) {
		
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
	}
	
	@Override
	public String toString() {
	
		return String.format("%s(%d)", this.name, this.getTotal());
	}
	
	public int getTotal() {
		
		return this.kor + this.eng + this.math;
	}
}

//직원
class Employee {
	
	private String name;	//나이
	private int age;		//나이
	private int salary;		//급여
	private int bonus;		//보너스
	private Position position;//직급
	private Calendar date;	//입사일
	
	public Employee(String name, int age, int salary, int bonus, Position position, int year, int month, int date) {
		
		this.setName(name);
		this.setAge(age);
		this.setSalary(salary);
		this.setBonus(bonus);
		this.setPosition(position);
		
		Calendar c = Calendar.getInstance();
		c.set(year, month-1, date, 9, 0, 0);
		this.setDate(c);
	}
	
	@Override
	public String toString() {
	
		String temp = "";
		//temp = this.age + "";
		//temp = this.salary + this.bonus + "";
		//temp = this.position + "";
		temp = String.format("%tF", this.date);
		
		return String.format("%s(%s)", this.getName(), temp);
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public int getBonus() {
		return bonus;
	}

	public void setBonus(int bonus) {
		this.bonus = bonus;
	}

	public Position getPosition() {
		return position;
	}

	public void setPosition(Position position) {
		this.position = position;
	}

	public Calendar getDate() {
		return date;
	}

	public void setDate(Calendar date) {
		this.date = date;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}

enum Position {
	
	부장,
	과장,
	대리,
	사원
}

//list.sort()
class MyComparator implements Comparator<Integer> {
	
	@Override
	public int compare(Integer o1, Integer o2) {
	
		return o1 - o2;
	}
}