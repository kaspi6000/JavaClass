/*
    SQL�� ��ҹ��ڸ� �������� �ʴ´�.
    
    1. SQL Ű���� : �빮��
    2. ��ü �ĺ��� : �ҹ���(Ǯ)
        a. memberpoint
        b. memberPoint
        c. member_point
        d. MEMBER_POINT
        
        
    SQL �ڷ���
    - DBMS�� ���� ���̰� ����
    
    1. ������
        a. NUMBER
            - ���� + �Ǽ�
            - (��ȿ�ڸ�) 38�ڸ� ������ ���ڸ� ǥ�� -> �ڹ� double -> 20byte
            - number(precision, scale)
                1. precision : �Ҽ� ���ϸ� ������ ��ü �ڸ���(1~38)
                2. scale : �Ҽ��� ���� �ڸ���
            ex)
                number : 38�ڸ����� ǥ���� ������ ��� ����(����, �Ǽ�)
                number(3) : �ִ� 3�ڸ����� ǥ���� ������ ����(-999 ~ 999)
                number(4,2) : �ִ� 4�ڸ����� + �Ҽ����� 2�ڸ� ����(-99.99 ~ 99.99)
                number(10,3) : -9999999.999 ~ 9999999.999
        b. ������ Ÿ��
            - INTEGER, DOUBLE, DECIMAL, REAL ��.. : �ٸ� �ý��� or ���� ��������� ȣȯ�� ������..
    
    2. ������
        - �ڹ� : ����(char) + ���ڿ�(String)
        - ����Ŭ�� ���ڿ� ���ڿ��� ������ ����. ��� �� ���������� ����Ѵ�
        
        - ����Ŭ �⺻ ���ڵ� : ~8(EUC-KR) -> 9i ~ 12c(UTF-8)
        
        a. CHAR / NCHAR
            - ���� �ڸ���
            - CHAR(N) : N�ڸ� ���ڿ�(���� - ����Ʈ)
            ex) CHAR(3) : 3����Ʈ���� ���ڸ� ����(abc ->, ȫ�浿 ->)
        
        b. VARCHAR / NVARCHAR -> VARCHAR2 / NVARCHAR2
            - ���� �ڸ���
            - VARCHAR2(N) : N�ڸ� ���ڿ�(���� - ����Ʈ)
            - �ִ� ũ�� : 4000����Ʈ
            - �ּ� ũ�� : 1����Ʈ
            
        c. N�� ����
            - ���ڼ��� ����
            1. N�� ������ : ����Ŭ�� �⺻ ���ڵ� ���(UTF-8)
                ex) CHAR(3) : UTF-8 3����Ʈ
            2. N�� ������ : ����Ŭ�� �⺻ ���ڵ��� ������� ������ UTF-16�� ���
                ex) NCHAR(3) : 3���ڱ���
    
    3. ��¥ �ð���
        a. DATE
            - ���� �� �ڷ����� ���
            - �ڹ� Calendar ����
            - ��¥ + �ð� ����
            - �ð� ������
            - 7byte
            - B.C 4712�� 1�� 1�� ~ A.D 9999�� 12�� 31��
            - �ּҴ��� : �ʱ���
        
        b. TIMESTAMP
            - DATE�� ������
            - 10����� 1�ʱ���(������)
        
        c. INTERVAL
            - �ð� ������
            - ƽ��
            
    4. ��뷮 �ڷ���
        a. lob(��), Large Object
            - ������(�ӵ� ����)
            - �ε��� ��� X
            1. BLOB
                - ��뷮 ���̳ʸ� ������
                - ū �̹���, ������ ��..
                - �ִ� ũ�� : 4GB\
            2. CLOB
                - ��뷮 ���� ������
                - �ִ� ũ�� : 4GB
*/
SELECT * FROM tabs;

select * from tabs;

-- ���̺� �����ϱ�
DROP TABLE tbltype;

CREATE TABLE tbltype
(
    -- �÷� �����ϱ�
    -- �÷��� �ڷ���(����) �������
    --age NUMBER,
    --height NUMBER(3),
    --weight NUMBER(4, 1)
    --name char(3)
    --name nchar(3)
    --txt varchar2(30)
    
    txt1 char(30),
    txt2 varchar2(30)
);

desc tbltype;

-- ������ �߰��ϱ�
INSERT INTO tbltype(age) VALUES (20);
INSERT INTO tbltype(age) VALUES (20000000000000000);
INSERT INTO tbltype(age) VALUES (12345678901234567890123456789012345678);
INSERT INTO tbltype(age) VALUES (123456789012345678901234567890123456789);
INSERT INTO tbltype(age) VALUES (12345678901234567890123456789012345678901234567890);

INSERT INTO tbltype(age, height) VALUES (20, 180);
INSERT INTO tbltype(age, height) VALUES (20, 999);
INSERT INTO tbltype(age, height) VALUES (20, 1000);
INSERT INTO tbltype(age, height) VALUES (20, -999);
INSERT INTO tbltype(age, height) VALUES (20, -1000);

INSERT INTO tbltype(age, height, weight) VALUES (20, 170, 65.5);
INSERT INTO tbltype(age, height, weight) VALUES (20, 170, 999.9);
INSERT INTO tbltype(age, height, weight) VALUES (20, 170, 9999.9);
INSERT INTO tbltype(age, height, weight) VALUES (20, 170, 999.99);
INSERT INTO tbltype(age, height, weight) VALUES (20, 170, 99.99);
INSERT INTO tbltype(age, height, weight) VALUES (20, 170, 12.34);

INSERT INTO tbltype(age, height, weight) VALUES (20, 175.14, 12.34);

-- ������ ��������
SELECT * FROM tbltype; -- 20 NULL NULL

-- name CHAR(3) : UTF-8 -> 3����Ʈ
INSERT INTO tbltype(name) VALUES ('abc'); -- O
INSERT INTO tbltype(name) VALUES ('ȫ�浿'); -- X
INSERT INTO tbltype(name) VALUES ('ȫ'); -- O

-- txt VARCHAR2(30) -> 30����Ʈ
INSERT INTO tbltype(txt) VALUES ('abcdeabcdeabcdeabcdeabcdeabcde'); -- O
INSERT INTO tbltype(txt) VALUES ('abcdeabcdeabcdeabcdeabcdeabcdea'); -- X
INSERT INTO tbltype(txt) VALUES ('���̻�����ĥ�ȱ���'); -- O
INSERT INTO tbltype(txt) VALUES ('���̻�����ĥ�ȱ�����'); -- X

INSERT INTO tbltype(txt) VALUES ('���̻�����ĥ�ȱ� ab'); -- O
INSERT INTO tbltype(txt) VALUES ('���̻�����ĥ�ȱ� abc'); -- O

SELECT*FROM tbltype;
INSERT INTO tbltype(txt1, txt2) VALUES('ȫ�浿', 'ȫ�浿');

SELECT*FROM tbltype WHERE txt1 = txt2;
SELECT*FROM tbltype WHERE trim(txt1) = trim(txt2);

