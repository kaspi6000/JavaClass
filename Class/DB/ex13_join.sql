/*
    -- ���� ���� + ������ ����ϴ� ������Ʈ ����
    -- ���� ���̺�, ������Ʈ ���̺�
*/
CREATE TABLE tblstaff(
    seq NUMBER PRIMARY KEY, -- ������ȣ(PK)
    name VARCHAR2(30) NOT NULL, -- ������
    salary NUMBER NOT NULL, -- �޿�
    address VARCHAR2(1000) NOT NULL, -- �ּ�
    projname VARCHAR2(100) NULL -- ��� ������Ʈ��
);

INSERT INTO tblstaff(seq, name, salary, address, projname) VALUES(1, 'ȫ�浿', 250, '�����', 'ȫ�� ����');
INSERT INTO tblstaff(seq, name, salary, address, projname) VALUES(2, '�ƹ���', 230, '�λ��', 'TV ����');
INSERT INTO tblstaff(seq, name, salary, address, projname) VALUES(3, '������', 210, '�����', '���� �м�');

SELECT * FROM tblstaff;

-- 1���� ������ �������� ������Ʈ�� ����� �� �ִ�.
INSERT INTO tblstaff(seq, name, salary, address, projname) VALUES(1, 'ȫ�浿', 250, '�����', 'ȫ�� ����');

DROP TABLE tblstaff;

-- �θ� ���̺� + �ڽ� ���̺� -> ���� ���� -> ���� ���� �߰�
-- �ܷ�Ű, Foreign Key
-- : ���� ������ ���̺��� ���� �� ������ �ϴ� �÷��� ���� �׻� ��ȿ�ϰ� ���������ִ� ����
DROP TABLE tblstaff;
DROP TABLE tblproject;
CREATE TABLE tblstaff(
    seq NUMBER PRIMARY KEY, -- ������ȣ(PK)
    name VARCHAR2(30) NOT NULL, -- ������
    salary NUMBER NOT NULL, -- �޿�
    address VARCHAR2(1000) NOT NULL -- �ּ�
    -- project NUMBER NOT NULL --��� ������Ʈ
);

CREATE TABLE tblproject(
    seq NUMBER PRIMARY KEY, --������Ʈ��ȣ(PK)
    name VARCHAR2(200) NOT NULL, --������Ʈ��
    staff NUMBER REFERENCES tblstaff(seq) NOT NULL -- ��� ���� ��ȣ
);

INSERT INTO tblstaff(seq, name, salary, address) VALUES(1, 'ȫ�浿', 200, '�����');
INSERT INTO tblstaff(seq, name, salary, address) VALUES(2, '�ƹ���', 250, '��õ��');
INSERT INTO tblstaff(seq, name, salary, address) VALUES(3, '������', 180, '�λ��');

INSERT INTO tblproject(seq, name, staff) VALUES(1, 'ȫ�� ����', 1);
INSERT INTO tblproject(seq, name, staff) VALUES(2, 'TV ����', 2);
INSERT INTO tblproject(seq, name, staff) VALUES(3, '���� �м�', 2);
INSERT INTO tblproject(seq, name, staff) VALUES(4, '�븮�� �о�', 1);
INSERT INTO tblproject(seq, name, staff) VALUES(5, '���� ����', 3);

-- tblstaff(�⺻ ���̺�, �θ� ���̺�) + tblproject(���� ���̺�, �ڽ� ���̺�) : �� ���̺��� ����(relationship)�� �ΰ� �ִ�.

-- ���踦 �ΰ� �ִ� 2���� ���̺��� �����͸� �����ϸ� ����� �ϵ�
-- 1. �θ� ���̺��� ����
-- 2. �ڽ� ���̺��� ����

-- 1. ���� ��� �Ի� -> �ű� ������Ʈ ����(���)

-- 1.a ���� ��� �߰�
INSERT INTO tblstaff(seq, name, salary, address) VALUES(4, 'ȣȣȣ', 150, '�����');

-- 1.b �ű� ������Ʈ �߰�
INSERT INTO tblproject(seq, name, staff) VALUES(6, '���� ����', 4);

-- 1.c �ű� ������Ʈ �߰� - parent key not
INSERT INTO tblproject(seq, name, staff) VALUES(7, '�� ���', 5);

-- 2. ȫ�浿 ���

-- 2.a ȫ�浿 ����
DELETE FROM tblstaff WHERE name = 'ȫ�浿'; -- where seq = 1

-- 2.b ȫ�浿 ��� ����
-- 2.b.a ȫ�浿�� ��� ������Ʈ -> ����
UPDATE tblproject SET staff = 3 WHERE staff = 1;

-- 2.b.b ȫ�浿 ����
DELETE FROM tblstaff WHERE name = 'ȫ�浿';

SELECT * FROM tblstaff;
SELECT * FROM tblproject;
SELECT * FROM tblinsa;

-- �� - �Ǹ�
-- �� ���̺�
CREATE TABLE tblcustomer(
    seq NUMBER PRIMARY KEY, --����ȣ(PK)
    name VARCHAR2(30) NOT NULL, --����
    tel VARCHAR2(15) NOT NULL, --����ó
    address VARCHAR2(100) NOT NULL --�ּ�
);

-- �Ǹ� ���̺�
CREATE TABLE tblsales(
    seq NUMBER PRIMARY KEY, --�ǸŹ�ȣ(PK)
    item VARCHAR2(50) NOT NULL, --��ǰ��
    qty NUMBER NOT NULL, --����
    regdate DATE DEFAULT sysdate NOT NULL, --�Ǹų�¥
    customer NUMBER REFERENCES tblcustomer(seq) NOT NULL
);

-- �θ� & �ڽ� ���̺�
-- 1. ���� ����
--    : �θ� ���� -> �ڽ� ����
-- 2. ���� ����
--    : �ڽ� ���� -> �θ� ����

DROP TABLE tblcustomer;
DROP TABLE tblsales;

-- ���� �뿩��

-- ȸ�� ���̺�
CREATE TABLE tblmember(
    seq NUMBER PRIMARY KEY, -- ȸ����ȣ(PK)
    name VARCHAR2(20) NOT NULL, -- ȸ����
    grade NUMBER(1) CHECK(grade BETWEEN 1 AND 3) NOT NULL, -- ȸ�����(1,2,3)
    byear NUMBER(4) NOT NULL, -- ����
    tel VARCHAR2(15) NOT NULL, -- ����ó
    address VARCHAR2(300) NULL, -- �ּ�
    money NUMBER NOT NULL -- ��ġ��
);

DROP TABLE tblmember;
DROP TABLE tblgenre;
DROP TABLE tblvideo;
DROP TABLE tblrent;

-- �帣 ���̺�
CREATE TABLE tblgenre(
    seq NUMBER PRIMARY KEY,
    name VARCHAR2(30) NOT NULL,
    price NUMBER NOT NULL,
    period NUMBER NOT NULL
);

-- ���� ���̺�
CREATE TABLE tblvideo(
    seq NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    qty NUMBER NOT NULL,
    company VARCHAR2(50) NULL,
    director VARCHAR2(50) NULL,
    major VARCHAR2(50) NULL,
    genre NUMBER REFERENCES tblgenre(seq) NOT NULL
);

-- �뿩 ���̺�
CREATE TABLE tblrent(
    seq NUMBER PRIMARY KEY,
    member NUMBER REFERENCES tblmember(seq) NOT NULL,
    video NUMBER REFERENCES tblvideo(seq) NOT NULL,
    rentdate DATE DEFAULT sysdate NOT NULL,
    retdate DATE NULL
);

-- ������ ��ü
CREATE SEQUENCE memberseq;
CREATE SEQUENCE genreseq;
CREATE SEQUENCE videoseq;
CREATE SEQUENCE rentseq;

DROP SEQUENCE memberseq;
DROP SEQUENCE genreseq;
DROP SEQUENCE videoseq;
DROP SEQUENCE rentseq;

SELECT * FROM tblmember;
SELECT * FROM tblgenre;
SELECT * FROM tblvideo;
SELECT * FROM tblrent;

/*
    ����, Join
    - 2�� �̻��� ���̺��� ������ 1���� ������� ����� �۾�
    - ���踦 �ΰ� �ִ� ���̺����� ���ؼ�
    
    ������ ����
    1. �ܼ� ����. Cross Join
    2. ���� ����, Inner Join
    3. �ܺ� ����, Quter Join
    4. ���� ����, Self Join
    
    1. �ܼ� ����
    
*/
SELECT * FROM tblcustomer;
SELECT * FROM tblsales;

-- ����� : 27��
SELECT * FROM tblcustomer, tblsales; -- ����
SELECT * FROM tblcustomer CROSS JOIN tblsales; -- ����

/*
    2. ���� ����
    : �ܼ� ���ο��� ��ȿ�� ���ڵ常 ���ϴ� ����
    : �θ� ���̺��� PK�� �ڽ� ���̺��� FK�� ������ ������ ���Ѵ�. -> ��ȿ�� ���ڵ�
    
    SELECT �÷�����Ʈ FROM ���̺�A
        INNER JOIN ���̺�B
            ON ���̺�A.�÷�(PK) = ���̺�B.�÷�(FK)
*/
-- rs.getString("cseq")
SELECT s.seq AS sseq, c.seq AS cseq, c.name, s.item -- 3
FROM tblcustomer c INNER JOIN tblsales s-- 1
        ON c.seq = s.customer; -- 2
        
-- �� ���ϴ� �ൿ(���� ����� * ���� �������� �ʴ´�)
SELECT * FROM tblcustomer c INNER JOIN tblsales s
    ON c.seq = s.customer;
    
SELECT * FROM (SELECT c.name, c.address, s.item, s.qty FROM tblcustomer c INNER JOIN tblsales s ON c.seq = s.customer);

-- ǥ�� SQL
SELECT * FROM tblcustomer c INNER JOIN tblsales s
    ON c.seq = s.customer;
    
-- ����Ŭ ����
SELECT * FROM tblcustomer c, tblsales s
    WHERE c.seq = s.customer;
    
-- ���� ��� �� �ϸ� �ȵǴ� �ൿ
SELECT * FROM tblrent;
SELECT * FROM tblhousekeeping;

SELECT * FROM tblrent r
    INNER JOIN tblhousekeeping h
        ON r.member = h.qty;
        
SELECT * FROM tblcustomer;
SELECT * FROM tblsales;

-- '��Ʈ'�� �簣 ȸ���� ����ó �� ����?
-- ������ ������� ���� ����� 2�� �̻��� ���̺��� ���;� �Ѵٸ� -> ���� ���

-- 1. ��������
SELECT name, tel, qty FROM tblcustomer
    WHERE seq = (SELECT customer FROM tblsales WHERE item = '��Ʈ');
    
SELECT name, tel, (SELECT qty FROM tblsales WHERE customer = c.seq AND item = '��Ʈ') FROM tblcustomer c WHERE seq = (SELECT customer FROM tblsales WHERE item = '��Ʈ');

-- 2. ����
SELECT c.tel, s.qty FROM tblcustomer c INNER JOIN tblsales s ON s.customer = c.SEQ WHERE s.item = '��Ʈ';

/*
    3. �ܺ� ����
        - ���� ���� + a
*/
SELECT * FROM tblcustomer; -- 3��
SELECT * FROM tblsales; -- 9��

-- �� 1�� �߰�
INSERT INTO tblcustomer VALUES(4, 'ȣȣȣ', '010-1234-1234', '�����');

-- ���� ����
-- ���θ����� 1ȸ �̻� �����̷��� �ִ� ���� ������ ���� �̷��� �������ÿ�.
SELECT * FROM tblcustomer c
    INNER JOIN tblsales s
        ON c.seq = s.customer; -- ����(c�� PK�� s�� FK)

-- ���θ����� ��� ���� ������ ��� + �����̷��� �ִ� ȸ���� �����̷µ� ���� ���
-- ������ �׻� �θ� ���̺��� ����Ų��. �ڽ� ���̺��� ����Ű�� INNER JOIN�� ����������.
SELECT * FROM tblcustomer c
    LEFT OUTER JOIN tblsales s
        ON c.seq = s.customer;
        
SELECT * FROM tblstaff; --3��
SELECT * FROM tblproject; --6��

INSERT INTO tblstaff VALUES (4, 'ȫ�浿', 200, '�����');
INSERT INTO tblstaff VALUES (5, '�׽�Ʈ', 220, '�����');

-- ���� ȸ�� : ���� ��� + ������ �ִ� �����
-- �츮 ���� ��� �����Ͷ� + ������Ʈ�� ����ϰ� �ִ� ������ ���ؼ�
SELECT * FROM tblstaff s
    INNER JOIN tblproject p
        ON s.seq = p.staff;
        
-- ���� ȸ�� : ���� ��� + ������ �ִ� ���� ��δ�
-- �츮 ���� ��� �����Ͷ� + ������Ʈ ��� ������ �������
-- ǥ�� SQL
SELECT * FROM tblstaff s
    LEFT OUTER JOIN tblproject p
        ON s.seq = p.staff;
        
-- ����Ŭ
SELECT * FROM tblstaff s, tblproject p
    WHERE s.seq = p.staff(+);
    
/*
    4. ���� ����
*/

-- ���� ���� ���̺�
CREATE TABLE tblself(
    seq NUMBER PRIMARY KEY, --������ȣ(PK)
    nmae VARCHAR2(30) NOT NULL, --������
    department VARCHAR2(30) NULL, --�μ�
    super NUMBER REFERENCES tblself(seq) NULL --���ӻ��(FK)
);

INSERT INTO tblself VALUES(1, 'ȫ����', NULL, NULL);
INSERT INTO tblself VALUES(2, '������', '�ѹ���', 1);
INSERT INTO tblself VALUES(3, '������', '�ѹ���', 2);
INSERT INTO tblself VALUES(4, '�ٴ븮', '�ѹ���', 3);
INSERT INTO tblself VALUES(5, '����', '�ѹ���', 4);
INSERT INTO tblself VALUES(6, '������', '������', 1);
INSERT INTO tblself VALUES(7, '�ٰ���', '������', 6);

-- ������  ����?
SELECT * FROM tblvideo;

-- 2��
-- ������ ����� �뿩 ����, �Ⱓ?
SELECT * FROM tblgenre g
    INNER JOIN tblvideo v
        ON g.seq = v.genre;
        
-- 3��
-- ��� ������ �뿩����, �Ⱓ + �뿩����?
SELECT * FROM tblgenre g
    INNER JOIN tblvideo v
        ON g.seq = v.genre
            INNER JOIN tblrent r
                ON v.genre = r.video;
                
-- 4��
-- -- ��� ������ �뿩����, �Ⱓ + �뿩���� + �뿩 ȸ���� ����?
SELECT * FROM tblgenre g
    INNER JOIN tblvideo v
        ON g.seq = v.genre
            LEFT OUTER JOIN tblrent r
                ON v.seq = r.video
                    RIGHT OUTER JOIN tblmember m
                        ON m.seq = r.member;
                        
-- �뿩��� ��� + ȸ���� + �������� + ���� + �ݳ�����('�ݳ��Ϸ�' or '�̹ݳ�') - CASE��
SELECT
    m.name AS ȸ����,
    v.name AS ��������,
    to_char(r.rentdate, 'YYYY-mm-dd') AS �뿩��¥,
    CASE
        WHEN r.retdate IS NOT NULL THEN '�ݳ��Ϸ�'
        WHEN r.retdate IS NULL THEN '�̹ݳ�'
    END AS �ݳ�����
FROM tblrent r
    INNER JOIN tblmember m