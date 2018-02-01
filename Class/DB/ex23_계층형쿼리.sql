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
            
            
-- ��� ��������, Correlated Sub Query
-- 1. �ٱ����� ���� ���� ������ ���ǿ��� ����ϴ� ��������
-- 2. ���� ������ �ܵ����� ���� �Ұ����� ����

-- ��� ���� ������ ���� �� �Ϻδ� group by �� ����� ������ ���̴� ��찡 �ִ�.

-- �� �μ��� �ְ� �޿�?
-- group by ���
SELECT buseo, max(basicpay) FROM tblinsa GROUP BY buseo;

-- ��� ���� ���� ���
SELECT name, jikwi, buseo, basicpay FROM tblinsa i1 WHERE basicpay = (SELECT max(basicpay) FROM tblinsa WHERE buseo = i1.buseo);

-- �� ������ �ִ� �޿��� �޴� �����?
-- ��� ���� ����
SELECT name, jikwi, basicpay FROM tblinsa i1 WHERE basicpay = (SELECT max(basicpay) FROM tblinsa WHERE jikwi = i1.jikwi);

-- Pairwise Sub Query
SELECT name, jikwi, basicpay FROM tblinsa WHERE (jikwi, basicpay) IN (SELECT jikwi, max(basicpay) FROM tblinsa GROUP BY jikwi);

-- ȫ�浿�� �� �μ��� ��� �޿��� �������ÿ�.
SELECT name, jikwi, buseo, basicpay, (SELECT round(avg(basicpay)) FROM tblinsa WHERE buseo = (SELECT buseo FROM tblinsa WHERE name = 'ȫ�浿')) FROM tblinsa WHERE name = 'ȫ�浿';

SELECT name, jikwi, buseo, basicpay, (SELECT round(avg(basicpay)) FROM tblinsa WHERE buseo = i1.buseo) FROM tblinsa i1 WHERE name = 'ȫ�浿';

-- �� �μ��� �ִ� �޿��� �޴� ��� 3�� �������ÿ�
SELECT name, buseo, basicpay FROM tblinsa i1 WHERE (SELECT count(*) FROM tblinsa WHERE basicpay > i1.basicpay AND buseo = i1.buseo) < 3 ORDER BY buseo ASC, basicpay DESC;