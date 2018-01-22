class Ex08_Casting {
	public static void main(String[] args) {

		//Çüº¯È¯
		//1. ¾Ï½ÃÀûÀÎ Çüº¯È¯
		//2. ¸í½ÃÀûÀÎ Çüº¯È¯

		//Á¤¼ö -> Á¤¼ö
		
		byte b1 = 10; //¿øº» 1byte
		long l1; //º¹»çº» 8byte

		//¾Ï½ÃÀûÀÎ Çüº¯È¯(¿øº» ¼Õ½ÇX)
		l1 = b1;
		//l1 = (long)b1;

		System.out.println(l1); //º¹»çº» È®ÀÎ
		

		//½Ç¼öÇü
		float f1 = 3.14F; //¿øº»
		double d1; //º¹»çº»

		//¾Ï½ÃÀûÀÎ Çüº¯È¯
		d1 = f1;

		//Å° ¸ÅÅ©·Î
		System.out.println(d1);

		double d2 = 1.23456789012345; //¿øº»
		float f2; //º¹»çº»

		System.out.println(d2);

		f2 = (float)d2;

		System.out.println(f2);

		//½Ç¼ö <-> Á¤¼ö
		double d3 = 3.99;
		int n3;
		
		//
		n3 = (int)d3; //¹«Á¶°Ç ¹ö¸²(floor, trunc)

		System.out.println(n3);
		System.out.println(Math.round(d3));


		float f4 = 3.14F;
		long l4;
		
		//Å«Çü(8) = ÀÛÀºÇü(4)
		//¼öÀÇ ¹üÀ§(O), ¹ÙÀÌÆ® Å©±â(X)
		l4 = (long)f4;

		System.out.println(l4);

		//±âº»ÇüÀÇ ¹üÀ§ ºñ±³
		//byte(1) < short(2) < int(4) < long(8) < float(4) < double(8)
		//			char(2)
		//boolean(1)

		//** ±âº»Çü°ú ÂüÁ¶Çü³¢¸®´Â º¯È¯ÀÌ ºÒ°¡´É(¸Ş¸ğ¸® ±¸Á¶ ¶§¹®)

		//booleanÀº Çüº¯È¯ÀÇ ´ë»óÀÌ µÉ ¼ö ¾ø´Ù.
		//(int)true;

		
		//¹®ÀÚÇü
		//	- 'A' -> 65(¹®ÀÚ ÄÚµå°ª)
		char c5 = 'A'; //2byte
		short s5; //2byte

		//¼ıÀÚ = ¹®ÀÚ
		s5 = (short)c5;

		System.out.println(s5);

		System.out.println((char)66);


		char c6 = '°¡'; //2byte
		int n6; //4byte

		n6 = c6;

		System.out.println(n6);
		

		int n7 = 5;
		char c7 = '5';

		System.out.println(n7);
		System.out.println((int)c7);

		System.out.println((int)'A');
		System.out.println((int)'Z');
		System.out.println((int)'a');
		System.out.println((int)'z');
		System.out.println((int)'0');
		System.out.println((int)'9');

		System.out.println((int)'°¡');
		System.out.println((int)'ÆR');

		//Validation injection query (a-z A-Z 0-9) Å¬¶óÀÌ¾ğÆ®´Ü¿¡¼­ ÇÒ ¼ö ÀÖ´Â ¿¹¿ÜÃ³¸®
		//Æ¯¼ö¹®ÀÚ Çã¿ë½Ã °ø°İÀÚ°¡ À¯Àú °èÁ¤ È¹µæ
		
		
	}
}
