/*
    INSERT ��
    - INSERT INTO ���̺��(�÷�����Ʈ) VALUES(������Ʈ);
*/
DROP TABLE tblmemo;
CREATE TABLE tblmemo(
    seq NUMBER PRIMARY KEY, --�޸��ȣ(PK)
    name VARCHAR2(30) NOT NULL, --�۾���
    memo VARCHAR2(1000) NOT NULL, --�޸�
    regdate DATE DEFAULT sysdate NOT NULL, --��¥
    etc VARCHAR2(500) DEFAULT '������' NULL, --���
    page NUMBER NULL --��������
);

SELECT memoseq.currval FROM dual;

-- INSERT ���� ����

-- 1. ǥ�� : ���� ���̺��� ���� �÷� ������� �÷�����Ʈ�� ������Ʈ�� ǥ��
INSERT INTO tblmemo(seq, name, memo, regdate, etc, page) VALUES(memoseq.nextval, 'ȫ�浿', '�޸�', sysdate, '���', 1);

-- 2. �÷�(��)�� ���� �ٲٱ�
-- �÷�����Ʈ�� ������Ʈ�� ������ �ݵ�� ���� ���̺��� ���ǿ� ��ġ�� �ʿ䰡 ����.
INSERT INTO tblmemo(name, memo, regdate, etc, page, seq) VALUES('ȫ�浿', '�޸�', sysdate, '���', 1, memoseq.nextval);

-- 3. NULL ������ ���� �÷��� �Է��ϱ�
-- Ư�� �÷��� NULL�� �����ϰ� �ʹ�.

-- 3.a ��� �÷��� ���� �����ϸ� �ȴ�.
INSERT INTO tblmemo(seq, name, memo, regdate) VALUES(memoseq.nextval, 'ȫ�浿', '�޸�', sysdate); -- etc > ���� > default�� �Է�

-- 3.b ��������� NULL�� ���� -> NULL ����� ����Ѵ�.
INSERT INTO tblmemo(seq, name, memo, regdate, etc, page) VALUES(memoseq.nextval, 'ȫ�浿', '�޸�', sysdate, NULL, NULL);

-- 4. default �� �Է�

-- 4.a default�� ���ǵǾ� �־ ���� ���� �Է��ϴ� ��� > default�� �ƴ� ����ڰ� ���� �Է��� ���� ����
INSERT INTO tblmemo(seq, name, memo, regdate, etc, page) VALUES(memoseq.nextval, 'ȫ�浿', '�޸�', sysdate, '���', 1);

-- 4.b default �÷��� ���� > default ���� ����
INSERT INTO tblmemo(seq, name, memo, page) VALUES(memoseq.nextval, 'ȫ�浿', '�޸�', 1);

-- 4.c default + null ���� null ����� �Է��ϸ� default ���� ����
INSERT INTO tblmemo(seq, name, memo, regdate, etc, page) VALUES(memoseq.nextval, 'ȫ�浿', '�޸�', sysdate, NULL, 1);

-- 4.d ��������� default�� ����
INSERT INTO tblmemo(seq, name, memo, regdate, etc, page) VALUES(memoseq.nextval, 'ȫ�浿', '�޸�', DEFAULT, DEFAULT, 1);

SELECT * FROM tblmemo;

-- 5. �÷� ����Ʈ ����
INSERT INTO tblmemo VALUES(memoseq.nextval, 'ȫ�浿', '�޸�', sysdate, '���', 1);

-- 5.a �ݵ�� ���̺��� ������� ����� �÷�������� ������Ʈ�� ����� �Ѵ�.
INSERT INTO tblmemo VALUES('ȫ�浿', '�޸�', sysdate, '���', 1, memoseq.nextval);

-- 5.b default ó���� ���� �� ������ �Ұ����ϴ�.
INSERT INTO tblmemo VALUES(memoseq.nextval, 'ȫ�浿', '�޸�', 1);

-- 5.c default ����ϰ� ������ ������ �Ұ��������� default ����� �����ϴ�.
INSERT INTO tblmemo VALUES(memoseq.nextval, 'ȫ�浿', '�޸�', DEFAULT, DEFAULT, 1);

---------------------------------------------------�Ϲ����� INSERT

SELECT * FROM tblmemo;

CREATE TABLE tblmemobackup(
    seq NUMBER PRIMARY KEY, --�޸��ȣ(PK)
    name VARCHAR2(30) NOT NULL, --�۾���
    memo VARCHAR2(1000) NOT NULL, --�޸�
    regdate DATE DEFAULT sysdate NOT NULL, --��¥
    etc VARCHAR2(500) DEFAULT '������' NULL, --���
    page NUMBER NULL --��������
);

-- tblmemo -> ���� -> tblmemobackup
INSERT INTO tblmemobackup SELECT * FROM tblmemo; --���� ����

SELECT * FROM tblmemobackup;

-- tblmemo���� page�� 1�� �׸�鸸 ������ ������ ���̺� ����
CREATE TABLE tblmemoonepage AS SELECT * FROM tblmemo WHERE page = 1;

SELECT * FROM tblmemoonepage;

--
SELECT * FROM tblinsa;

-- ������ ���̺�
CREATE TABLE ������ AS SELECT * FROM tblinsa WHERE buseo = '������';

SELECT * FROM ������;

/*
    1. ���� ���̺� A -> (������ ����) -> ���� ���̺� B
    - insert + select
    - ������ O, ������ �׽�Ʈ�� O
    
    2. ���� ���̺� A -> (���̺� ���� + ������ ����) -> ���� ���̺� B
    - create + select
    - ������ X, ������ �׽�Ʈ�� O
    - ���̺��� ������ �� �����ʹ� ���簡 �Ǵµ�.. ��������� ���簡 �ȵȴ�.
*/