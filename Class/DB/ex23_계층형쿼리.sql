/*

ex23_����������.sql

������ ����, Hierarchial Query
- ����Ŭ������ ����
- �亯�� �Խ���, ī�װ� ó��, BOM(bill of matarial)(���� ����)��.. �θ�� �ڽ����� ������ Ʈ�� ������ ������ ó��

[��ǰ ����]
��ǻ��
    - ��ü
        - ���κ���
        - ��ī��
        - �޸�(RAM)
    - �����
        - ���ʸ�
    - ������
        - ��ũ īƮ����
        - A4 ����


*/

CREATE TABLE tblcomputer
(
    seq NUMBER PRIMARY KEY, --�ĺ���
    name VARCHAR2(100) NOT NULL, --��ǰ��
    qty NUMBER NOT NULL, --����
    pseq NUMBER REFERENCES tblcomputer(seq) NULL --�θ��ǰ
);

INSERT INTO tblcomputer VALUES (1,'��ǻ��',1,NULL); --��Ʈ��Ʈ
INSERT INTO tblcomputer VALUES (2,'��ü',1,1);
INSERT INTO tblcomputer VALUES (3,'���κ���',1,2);
INSERT INTO tblcomputer VALUES (4,'��ī��',1,3);
INSERT INTO tblcomputer VALUES (5,'RAM',1,3);
INSERT INTO tblcomputer VALUES (6,'�����',1,1);
INSERT INTO tblcomputer VALUES (7,'���ʸ�',1,6);
INSERT INTO tblcomputer VALUES (8,'������',1,1);
INSERT INTO tblcomputer VALUES (9,'��ũ īƮ����',1,8);
INSERT INTO tblcomputer VALUES (10,'A4 ����',1,8);
INSERT INTO tblcomputer VALUES (11,'�Ŀ����ö���',1,2);
INSERT INTO tblcomputer VALUES (12,'�׷��� ī��',1,3);

COMMIT;

SELECT * FROM tblcomputer;

--1. ���� ��� -> ������ ������ ����
--: �ڱ� ���� -> ���� ����
--: ���� ����? �ܺ� ����?
SELECT c1.name, c2.name as pname FROM tblcomputer c1
    LEFT OUTER JOIN tblcomputer c2
        ON c1.pseq = c2.seq; --�ڽ����̺� <-> �θ����̺�


--2. start with �� connect by ��
--: ������ �����͸� ������� ����
SELECT * FROM tblcomputer
    START WITH seq = 1
        CONNECT BY PRIOR seq = pseq;

--�ǻ� �÷�
SELECT lpad(' ',(level-1)*6)||name, pseq, level FROM tblcomputer c2
    START WITH seq = 1
        CONNECT BY PRIOR seq = pseq;

--���� ���� ����
--: �ٱ��� �����ʹ� ���� ������� �������� ���� ���� ����

--��� ���� ����
--: �ٱ����� ���� ����� ���� ������ ����ϴ� ���� ����
SELECT lpad(' ',(level-1)*6)||name,
    (SELECT name FROM tblcomputer WHERE seq = c2.pseq),
        level FROM tblcomputer c2
            START WITH seq = 1
                CONNECT BY PRIOR seq = pseq;

--�ǻ� �÷�
--prior : �θ� ���ڵ� ����
SELECT seq,lpad(' ',(level-1)*6)||name,
    prior name, prior seq,
    level FROM tblcomputer c2
    START WITH seq = 1
        CONNECT BY PRIOR seq = pseq;

--start with �� ����
--: ������ ��Ʈ ��带 �����ϴ� ����
SELECT lpad(' ',(level-1)*6)||name as name, prior name
    FROM tblcomputer
        --START WITH seq = 1 --�������� ����(���� �˰��ֱ� ������)
        --START WITH pseq IS NULL --�θ� ���� ��Ʈ(=��Ʈ ���)
        --START WITH seq = (SELECT seq FROM tblcomputer WHERE name = '��ǻ��')
        START WITH seq = 1
            CONNECT BY PRIOR seq = pseq;

--connect by ����
--�θ��÷� = �ڽ��÷� ����
--�ݵ�� prior �ǻ��÷��� ���� ���
SELECT lpad(' ',(level-1)*6)||name as name, prior name
    FROM tblcomputer
        START WITH seq = 1
            CONNECT BY PRIOR seq = pseq;