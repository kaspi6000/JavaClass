import java.util.Calendar;
import java.util.Date;

class Ex21_DateTime {
	public static void main(String[] args) {

		//날짜시간형
		//	- 참조형
		//	- Date 클래스
		//	- Calendar 클래스

		//8가지 기본형 + String + 날짜시간형
		
		//m1();
		//m2();
		//m3();
		//m4();
		//m5();
		//m6();
		m7();
	}

	public static void m7() {
	
		//1. 현재 시각 얻기 : Calendar.getInstance();
		//2. 특정 시각 얻기 : Calendar.getInstance(); -> set()사용
		//3. 특정 시간 얻기 : int 조작
		//4. 시각 - 시각 : tick값 사용
		//5. 시간 + 시간 : int 조작
		//6. 시간 - 시간 : int 조작
		//7. 시각 + 시간 : add() 사용
		//8. 시각 - 시간 : add() 사용

		//2시간 30분 필요
		//Calendar c = Calendar.getInstance();
		//c.set(Calendar.HOUR, 2);
		//c.set(Calendar.MINUTE, 30);

		int hour = 2;
		int min = 30;
	}

	public static void m6() {
	
		//시각 - 시각 = 시간
		//	: 특정 시점을 기준으로 해서 지난 시간을 누적 -> 단위를 통일 시킨 뒤 연산
		
		//태어난지 몇시간?
		//	: 현재 - 생일

		Calendar now = Calendar.getInstance();
		Calendar birthday = Calendar.getInstance();
		birthday.set(1995, 2, 25, 13, 30, 0);

		//tick 구하기
		//1. 현재 시각의 tick
		System.out.println(System.currentTimeMillis());

		//2.
		Date nowDate = now.getTime();
		long nowTick = nowDate.getTime();
		System.out.println(nowTick);

		Date birthdayDate = birthday.getTime();
		long birthdayTick = birthdayDate.getTime();
		System.out.println(birthdayTick);

		long span = nowTick - birthdayTick;

		System.out.println(span / 1000 / 60 / 60 / 24);

		//올해 크리스마스 며칠?
		// : 크리스마스 - 오늘
		Calendar christmas = Calendar.getInstance();
		christmas.set(2017, 11, 25, 0, 0, 0);

		//메소드 체이닝
		long christmasTick = christmas.getTime().getTime();

		span = christmasTick - nowTick; //ms
		
		System.out.println(span / 1000.0 / 60 / 60 / 24);
	}

	public static void m5() {
	
		//연산
		//	- void add(int, int)
		//	- 원본을 수정한다.

		//100일째?
		// = 오늘(시각) + 100일(시간)

		Calendar today = Calendar.getInstance();

		today.add(Calendar.DATE, 100);

		System.out.printf("100일째 : %tF\n", today);

		//경매 5시간 35분 뒤 마감
		today = Calendar.getInstance();
		today.add(Calendar.HOUR, 5);
		today.add(Calendar.MINUTE, 35);
		System.out.printf("%tF %tT\n", today, today);

		//100일 기념 커플 -> 만난날?
		today = Calendar.getInstance();
		today.add(Calendar.DATE, -100);
		System.out.printf("100일전 : %TF\n", today);
	}

	public static void m4() {
	
		//printf() 메소드
		//	-날짜/시간 지원

		Calendar c = Calendar.getInstance();

		System.out.printf("%tF\n", c); //2017-12-04
		System.out.printf("%tT\n", c); //14:48:49
		System.out.printf("%tR\n", c); //14:48
		System.out.printf("%tr\n", c); //02:50:25 오후
		System.out.printf("%tA\n", c); //월요일
	}

	public static void m3() {
		
		//m1(), m2() -> 현재 시각
		//m3() -> 특정 시각

		//내 생일 : 1995년 3월 25일 15시 30분 0초
		Calendar birth = Calendar.getInstance();
		
		//내 생일로 고치기
		// void set(int, int)
		// void set(int, int, int)
		// void set(int, int, int, int, int, int)

		//birth.set(Calendar.YEAR, 1995);
		//birth.set(Calendar.MONTH, 2);
		//birth.set(Calendar.DATE, 25);

		//birth.set(1995, 2, 25);

		//2017-12-1
		//birth.set(2017, 11, 1);
		//birth.set(Calendar.DATE, 1);

		birth.set(1995, 2, 25, 13, 30, 0);

		System.out.printf("%d-%d-%d\n", birth.get(Calendar.YEAR), birth.get(Calendar.MONTH) + 1, birth.get(Calendar.DATE));
	}

	public static void m2() {
	
		Calendar c = Calendar.getInstance();

		//int get(int)
		//System.out.println(c.get(1));
		//System.out.println(c.get(2));
		//System.out.println(c.get(3));
		//System.out.println(c.get(4));
		//System.out.println(c.get(5));

		int year = 1;
		int month = 2;

		System.out.println(c.get(year));
		System.out.println(c.get(month));

		//캘린더 상수
		System.out.println(Calendar.YEAR);
		System.out.println(Calendar.MONTH);

		System.out.println(c.get(Calendar.YEAR));
		System.out.println(c.get(Calendar.MONTH));

		System.out.println();
		System.out.println(c.get(Calendar.YEAR));	//년
		System.out.println(c.get(Calendar.MONTH));	//월(0~11)
		System.out.println(c.get(Calendar.DATE));	//일
		System.out.println(c.get(Calendar.HOUR));	//시(12h)
		System.out.println(c.get(Calendar.HOUR_OF_DAY));	//시(24h)
		System.out.println(c.get(Calendar.MINUTE));	//분
		System.out.println(c.get(Calendar.SECOND));	//초
		System.out.println(c.get(Calendar.MILLISECOND));	//밀리초
		System.out.println(c.get(Calendar.DAY_OF_WEEK));	//요일(1~7)
		System.out.println(c.get(Calendar.AM_PM));	//오전(0) 오후(1)

		//"오늘 날짜는 2017년 12월 4일 입니다."	- 출력
		System.out.printf("오늘 날짜는 %d년 %d월 %d일 입니다.\n", c.get(Calendar.YEAR), c.get(Calendar.MONTH) + 1, c.get(Calendar.DATE));
	}

	public static void m1() {
	
		//현재 시스템의 시각을 얻어오기
		Calendar c;
		c = Calendar.getInstance();

		System.out.println(c);
	}
	
}
