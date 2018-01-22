/*
    DML
    - ������ ���۾�(SELECT, INSERT, UPDATE, DELETE)
    - SELECT : DQL(Data Query Language)
    
    DDL
    - ������ ���Ǿ�
    - DB Object(���̺�, ��, ���ν���, �ε���, Ʈ���� ��..) ����/�����ϴ� ��ɾ�
    - CREATE : �����
    - DROP : ����
    - ALTER : ����(�κ�)
    
    ���̺� �����ϱ�
    
    CREATE TABLE ���̺��
    (
        �÷� ����,
        �÷� ����,
        �÷� ����,
        �÷� ����,
        �÷��� �ڷ���(����) �������
    );
*/

CREATE TABLE tbltest
(
    num number(3),
    txt varchar2(10),
    regdate date
);

SELECT * FROM tbltest;

INSERT INTO tbltest(num, txt, regdate) VALUES(100, 'test', '19910222');
INSERT INTO tbltest(num, txt, regdate) VALUES(100, 'test', sysdate);

/*
    �������, Constraint
    - �÷����� ���� ����(��Ģ) -> ���� ���ϸ� �����͸� �� �ִ´�. -> ������ ��ȿ�� ����
    - �����ͺ��̽� ���Ἲ ����(Integrity Contstraint Rule - ���Ἲ ���� ����)
    
    1. NOT NULL
    - �ݵ�� �÷����� ����(�ʼ� �Է°�)
    - �÷� �����θ� ���� ����
*/

-- �޸� ���̺�
DROP TABLE tblmemo;

CREATE TABLE tblmemo
(
    seq NUMBER NOT NULL, -- �Ϸù�ȣ + �ʼ��Է�
    name VARCHAR2(20) NULL, -- �۾���
    memo VARCHAR2(1000) NOT NULL, -- �޸𳻿�
    regdate DATE NULL -- �ۼ��ð�
);

INSERT INTO tblmemo(seq, name, memo, regdate) VALUES(1, 'ȫ�浿', '�޸��Դϴ�', sysdate);

INSERT INTO tblmemo(seq, name, memo, regdate) VALUES(2, 'ȫ�浿', '�޸��Դϴ�', NULL);

INSERT INTO tblmemo(seq, name, memo, regdate) VALUES(3, 'ȫ�浿', NULL, sysdate);

INSERT INTO tblmemo(seq, name, memo, regdate) VALUES(4, NULL, '�޸��Դϴ�', sysdate);

INSERT INTO tblmemo(seq, name, memo, regdate) VALUES(NULL, 'ȫ�浿', '�޸��Դϴ�', sysdate);

INSERT INTO tblmemo(seq, name, memo, regdate) VALUES(NULL, NULL, NULL, NULL);

SELECT * FROM tblmemo;

/*
    1. NOT NULL
    
    2. PRIMARY KEY(PK)
    - �⺻ Ű
    - Ű(key) : �÷�
    - ���̺��� ��� �÷����� ��ǥ(?)�ϴ� �÷� -> ��� ���� �����ϴ� �������� ���
    - ���̺����� ���� �����ϱ� ���� ���� �ĺ���(PK �÷��� ���� ���̺��� �����ؾ� �Ѵ�.)
    - 1���� ���̺��� �ݵ�� PK�� �����ؾ� �Ѵ�.
        a. ��� ���� �����ϱ� ���ؼ�..
        b. PK�� 1�� �̻� ���� ����(2�� �̻� PK -> �⺻Ű ���� -> ����Ű(Compsite Key))
    - PK�� �ڵ����� NOT NULL�� ����ȴ�.
    - PK�� �ڵ����� NOT Duplicate�� ����ȴ�. -> UNIQUE
    - NOT NULL + UNIQUE = PK
*/

SELECT * FROM tblcountry;

DROP TABLE tblmemo;

CREATE TABLE tblmemo
(
    seq NUMBER PRIMARY KEY, -- �ߺ�X, ����X, ���̺��� ������ �ĺ��� Į�� -> PK
    name VARCHAR2(20) NULL,
    memo VARCHAR2(1000) NOT NULL,
    regdate DATE NULL
);

INSERT INTO tblmemo(seq, name, memo, regdate) VALUES(1, 'ȫ�浿', '�޸��Դϴ�', sysdate);

INSERT INTO tblmemo(seq, name, memo, regdate) VALUES(2, 'ȫ�浿', '�޸��Դϴ�', sysdate);

INSERT INTO tblmemo(seq, name, memo, regdate) VALUES(1, 'ȫ�浿', '�޸��Դϴ�', sysdate); --x

INSERT INTO tblmemo(seq, name, memo, regdate) VALUES(NULL, 'ȫ�浿', '�޸��Դϴ�', sysdate); --x

-- Ư�� �� 1���� ������ ���� �ݵ�� PK�� �������� �Ǵ�.
SELECT * FROM tblmemo WHERE seq = 1; -- ���� ���ϴ� �޸� 1�� ����

/*
    3. UNIQUE
    - �ش� �÷����� ���̺����� ������ ���̾�� �Ѵ�.(�ߺ����� �־�� �ȵȴ�.)
    - NULL�� ���� �� �ִ�.
    - �ĺ��ڷ� ����ϸ� ���� �ȵȴ� (NULL�� �ֱ� ������)
*/

DROP TABLE tblmemo;

CREATE TABLE tblmemo
(
    seq NUMBER PRIMARY KEY, -- �ߺ�X, ����X, ���̺��� ������ �ĺ��� Į�� -> PK
    name VARCHAR2(20) UNIQUE,
    memo VARCHAR2(1000) NOT NULL,
    regdate DATE NULL
);

INSERT INTO tblmemo(seq, name, memo, regdate) VALUES(1, 'ȫ�浿', '�޸��Դϴ�', sysdate);

INSERT INTO tblmemo(seq, name, memo, regdate) VALUES(2, '�ƹ���', '�޸��Դϴ�', sysdate);

INSERT INTO tblmemo(seq, name, memo, regdate) VALUES(3, 'ȫ�浿', '�޸��Դϴ�', sysdate);

INSERT INTO tblmemo(seq, name, memo, regdate) VALUES(4, NULL, '�޸��Դϴ�', sysdate);

INSERT INTO tblmemo(seq, name, memo, regdate) VALUES(5, NULL, '�޸��Դϴ�', sysdate);

SELECT * FROM tblmemo;

/*
    4. check
    - ������, ���� �� ���� ����
    - WHERE���� ����
*/

DROP TABLE tblmemo;

CREATE TABLE tblmemo
(
    seq NUMBER PRIMARY KEY, -- �ߺ�X, ����X, ���̺��� ������ �ĺ��� Į�� -> PK
    name VARCHAR2(20) UNIQUE,
    memo VARCHAR2(1000) NOT NULL,
    -- regdate DATE NULL,
    -- color VARCHAR2(20) NOT NULL, -- red, yellow, blue
    -- page NUMBER(1) NOT NULL -- 1 ~ 9
    color VARCHAR2(20) CHECK(color IN('red', 'yellow', 'blue')) NOT NULL,
    page NUMBER(1) CHECK(page BETWEEN 1 and 9) NOT NULL,
    -- ��¥ �Ⱓ ����
    -- regdate DATE CHECK(regdate BETWEEN '2018-01-15' AND '2018-01-31') NOT NULL
    -- regdate DATE CHECK(regdate BETWEEN to_date('2018-01-15', 'YYYY-mm-dd') AND to_date('2018-01-31', 'YYYY-mm-dd'))
    --�������� ����
    -- regdate DATE CHECK(to_char(regdate, 'hh24') BETWEEN 0 AND 12)
    -- ��,�Ͽ��Ͽ��� ����
    regdate DATE CHECK(to_char(regdate, 'd') IN (1, 7) AND to_char(regdate, 'hh24') BETWEEN 0 AND 11) NOT NULL
);

INSERT INTO tblmemo(seq, name, memo, regdate, color, page) VALUES(1, 'ȫ�浿', '�޸��Դϴ�', sysdate, 'blue', 1);

INSERT INTO tblmemo(seq, name, memo, regdate, color, page) VALUES(2, '�ƹ���', '�޸��Դϴ�', sysdate, 'white', 1);

INSERT INTO tblmemo(seq, name, memo, regdate, color, page) VALUES(2, '�ƹ���', '�޸��Դϴ�', sysdate, 'blue', -1);

INSERT INTO tblmemo(seq, name, memo, regdate, color, page) VALUES(2, 'ȫ�浿', '�޸��Դϴ�', '2018-01-17 13:11:11', 'blue', 1);

INSERT INTO tblmemo(seq, name, memo, regdate, color, page) VALUES(2, 'ȫ�浿', '�޸��Դϴ�', to_date('2018-01-20 11:11:11', 'YYYY-mm-dd hh:mi:ss'), 'blue', 1);

SELECT * FROM tblmemo;

/*
    5. default
    - �÷� �⺻��
    - �ش� �÷��� ���� ���� ������ NULL�� �Է����� ����, �ڵ����� �̸� �غ�� ���� �־��
*/

DROP TABLE tblmemo;

CREATE TABLE tblmemo
(
    seq NUMBER PRIMARY KEY, -- �ߺ�X, ����X, ���̺��� ������ �ĺ��� Į�� -> PK
    name VARCHAR2(20) DEFAULT '�͸�' NULL,
    memo VARCHAR2(1000) NOT NULL,
    regdate DATE DEFAULT sysdate NULL
);

INSERT INTO tblmemo(seq, name, memo, regdate) VALUES(1, 'ȫ�浿', '�޸��Դϴ�', sysdate);

INSERT INTO tblmemo(seq, name, memo, regdate) VALUES(2, NULL, '�޸��Դϴ�', sysdate);

INSERT INTO tblmemo(seq, memo) VALUES(3, '�޸��Դϴ�');

SELECT * FROM tblmemo;

/*
    ���� ������ ����� ���
    
    1. �÷� ���ؿ��� ����� ���
        - �÷��� ���� ���� �Ŵ� ���(1:1)
        - �÷��� �ڷ��� ��������
        - �÷��� �ڷ��� constraint ����� ��������
        
    2. ���̺� ���ؿ��� ����� ���
*/
DROP TABLE tblmemo;

CREATE TABLE tblmemo(
    -- seq NUMBER PRIMARY KEY
    -- seq NUMBER CONSTRAINT aaa PRIMARY KEY,
    seq NUMBER CONSTRAINT tblmemo_seq_pk PRIMARY KEY,
    memo VARCHAR2(1000) CONSTRAINT tblmemo_memo_ck CHECK(length(memo) >= 20) NOT NULL
);

CREATE TABLE tblmemo(
    seq NUMBER,
    memo VARCHAR2(1000) NOT NULL,
    color VARCHAR2(20),
    page number(1),
    
    CONSTRAINT tblmemo_seq_pk PRIMARY KEY(seq),
    CONSTRAINT tblmemo_color_ck CHECK(color IN('white', 'black')),
    CONSTRAINT tblmemo_page_ck CHECK(page BETWEEN 1 AND 9)
);

INSERT INTO tblmemo(seq, memo) VALUES(1, '�޸��Դϴ�.');

INSERT INTO tblmemo(seq, memo, color, page) VALUES(2, '�޸��Դϴ�.', 'white', 1);

SELECT * FROM tblmemo;