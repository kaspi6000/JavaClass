import java.io.*;

class Ex22_if {
	public static void main(String[] args) throws Exception {

		/*
			���
				- ���α׷� �ڵ��� ���� ������ �����ϴ� ����

			1. ���ǹ�
				a. if
				b. switch

			2. �ݺ���
				a. for
				b. while
				c. do while
				d. for

			3. �б⹮
				a. break
				b. continue
				[c. goto] x

			
			if ��
				- ������ ������ �� ����� ���� ������ �ڵ带 ����
				- ������ �ݵ�� boolean���� ������.
				- A ? B : C;

			�⺻ ���

			if(���ǽ�) {
			
				���� �ڵ�;
			}


			if(���ǽ�) {
			
				���� �ڵ�;
			}else {
				
				���� �ڵ�;
			}


			���� if��

			if(���ǽ�) {
			
				���� �ڵ�;
			}else if(���ǽ�) {
				
				���� �ڵ�;
			}else if(���ǽ�) {
				
				���� �ڵ�;
			}else {
				
				���� �ڵ�;
			}
		*/

		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

		//�䱸����] ���� 1�� �Է� �޾� �������?
		System.out.print("���� �Է� : ");

		int num = Integer.parseInt(reader.readLine());

		if(num > 0) {
			//true block, ��
			System.out.printf("�Է��� ���� %d�� ����Դϴ�.\n", num);
		}

		//���? ����?
		if(num > 0) {
			
			System.out.printf("�Է��� ���� %d�� ����Դϴ�.\n", num);
		}else {
			
			System.out.printf("�Է��� ���� %d�� �����Դϴ�.\n", num);
		}

		//
		if(num > 0) {
			
			System.out.printf("�Է��� ���� %d�� ����Դϴ�.\n", num);
		}else if(num < 0) {
			
			System.out.printf("�Է��� ���� %d�� �����Դϴ�.\n", num);
		}else if(num ==0) {
			System.out.println("0�Դϴ�.");
		}

		System.out.println("���α׷� ����");
	}
}
