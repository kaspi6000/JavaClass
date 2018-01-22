package com.test.question;

public class NewCollectionTest {

	public static void main(String[] args) {
		
		NewArrayList list = new NewArrayList();
		
		list.add("하나");
		list.add("둘");
		
		System.out.println(list.get(0));
		System.out.println(list.get(1));
		
//		System.out.println(list.get(2));
//		System.out.println(list.get(7));
		
		System.out.println(list.size());
		list.set(0, "one");
		System.out.println(list.get(0));
		
//		list.set(2, "three");
		
		//[o] [o] [] []
		//[o] [o] [] []
		list.remove(0);
	}
}
