import java.util.*;

class Ex23_if {
	public static void main(String[] args) {

		//m1();
		//m2();
		//System.out.println(m3());
		//m4();
		//System.out.println(m5());
		m6();
	}

	public static void m6() {
	
		//�䱸����] ���� 1�� �Է� -> ���ҹ���?
		String input = "e";

		char c = input.charAt(0); //"e" -> 'e'

		int code = (int)c; //101
		
		//if(code >= 97 && code <= 122) {
		//if(code >= (int)'a' && code <= (int)'z') {
		if(c >= 'a' && c <= 'z') {
			System.out.println("�ҹ���o");
		}else {
			System.out.println("�ҹ���x");
		}

		c = '��';

		if(c >= 'A' && c <= 'Z' || c >= 'a' && c <= 'z' || c >= '0' && c <= '9') {
			System.out.println("������ + ���� o");
		}else {
			System.out.println("������ + ���� x");
		}
	}

	public static String m5() {
		
		//��ø�� if��, Nested if Statements
		/*
			if() {
				if() {
					if() {
					
					}
				}
			}else if() {
				if() {
					
				}
			}else {
				if() {
					
				}
			}
		*/

		//���� ���� �Է� -> �հ�, ���հ�?
		//���� : 60���̻�
		int kor = 90;
		String result = "";

		if(kor >= 60) {
			//System.out.println("�հ�");
			result = "�հ�";
		}else {
			//System.out.println("���հ�");
			result = "���հ�";
		}

		kor = 85;

		//��ȿ�� �˻�
		if(kor >= 0 && kor <= 100) {

			//�����Ͻ� �ڵ�, �����ڵ�
			if(kor >= 60) {
				//System.out.println("�հ�");
				result = "�հ�";
			}else {
				//System.out.println("���հ�");
				result = "���հ�";
			}

		}else {
			//���� ó�� �ڵ�
			result = "���� �ٽ� �Է�";
		}

		
		return result;
	}

	public static void m4() {
		
		System.out.println("�ϳ�");

		Calendar c = Calendar.getInstance();

		if(c.get(Calendar.SECOND) % 2 == 0) {
			return; //�� return�� -> �޼ҵ� ����
		}

		System.out.println("��");

		System.out.println("��");
	}

	public static String m3() {
		
		//return��
		int num = 10;

		if(num > 0) {
			return "���";
		}else {
			return "����";
		}

		//return "����";
	}

	public static void m2() {
	
		if(true) {
			System.out.println("��");
		}else {
			System.out.println("����");
		}

		boolean flag = true;

		if(flag) {
			System.out.println("��");
		}else {
			System.out.println("����");
		}

		//C -> Java
		//C��� : boolean�� ����.
		//	- ���� : 0(false), ������(true)
		//	- �Ǽ� : 0.0(false), ������(true)
		//	- ���� : '\0'(false), ������(true)
		//	- ���ڿ� : ""(false), ������(true)
		if(true) {
			System.out.println("��");
		}else {
			System.out.println("����");
		}
	}

	public static void m1() {
		
		//�䱸����] ���� 1�� �Է¹޾� ¦��? Ȧ��?
		int num = 5;

		String result = "";

		if(num % 2 == 0) {
			//¦��
			//System.out.printf("%d�� ¦�� �Դϴ�.\n", num);
			result = "¦��";
		}else {
			//Ȧ��
			//System.out.printf("%d�� Ȧ�� �Դϴ�.\n", num);
			result = "Ȧ��";
		}

		System.out.printf("�Է��� ���� %d�� %s�Դϴ�.\n", num, result);
	}
}
