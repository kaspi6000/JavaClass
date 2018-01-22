/*
    SELECT ��
    1. ���̺�κ��� ���ϴ� �����͸� �������� ��ɾ� : Ŭ���̾�Ʈ -> (SELECT ��û) -> ���� -> (ǥ ���·� ��ȯ, ResultSet, ResultTable)
    
    2. ���̺��� �ƴѰ����κ��� �����͸� �������� ��ɾ�
    
    ***SQL�� �Ϲ������� 1��(2��) �̻��� ��(��)�� ���յǾ� ������ �����.
    
    SELECT ����
    
    SELECT �÷�����Ʈ FROM ���̺��;
    
    SELECT �÷�����Ʈ FROM ���̺��;
    SELECT �÷�����Ʈ FROM ���̺�� WHERE��;
    SELECT �÷�����Ʈ FROM ���̺�� WHERE�� ORDER BY��;
    SELECT �÷�����Ʈ FROM ���̺�� WHERE�� GROUP BY�� ORDER BY��;
    SELECT �÷�����Ʈ FROM ���̺�� WHERE�� GROUP BY�� HAVING�� ORDER BY��;
    SELECT �÷�����Ʈ FROM ���̺�� [WHERE��] [GROUP BY��] [HAVING��] [ORDER BY��];
    
    SELECT �÷�����Ʈ : ������ �÷��� �����Ѵ�.
    FROM ���̺�� : ������ ���̺��� �����Ѵ�.
*/

DESC tbltype;

SELECT txt1
FROM tbltype;

SELECT * FROM tabs;

SELECT * FROM tbltodo;

SELECT * FROM TBLNAME;

DESC tblname;

-- tblname �κ��� �̸�(first)�� �������ÿ�.
SELECT first FROM tblname;
SELECT gender FROM tblname;
SELECT tel FROM tblname; -- ORA-00904: "TEL": invalid identifier

-- �� + �̸�
SELECT first, last FROM tblname;
SELECT last, first FROM tblname;
SELECT last, first, nick FROM tblname;
SELECT * FROM tblname;

-- �÷�����Ʈ���� ������ �÷��� 1�� �̻� �� �� �ִ�.
SELECT nick FROM tblname;
SELECT nick, nick FROM tblname;
SELECT nick, length(nick) FROM tblname;
SELECT nick, nick, nick FROM tblname;

SELECT * FROM tblcountry;
SELECT * FROM tbldiary;
SELECT * FROM tblhousekeeping;
SELECT * FROM tblinsa;
SELECT * FROM tblmen;
SELECT * FROM tblwomen;
SELECT * FROM tbltodo;

/*
    ����Ŭ ��� ǥ��
    1. ������
        a. ������
            ex) 10
        b. �Ǽ���
            ex) 3.14
            
    2. ����(���ڿ�)��
        ex) '��', 'ȫ�浿'
        
    3. ��¥�� ���
        ex) '2018-01-12' : ������ ��� -> (����ȯ) -> ��¥�� : ���ƿ� ���� �޶���(��¥ or ����)
        ex) '100'
        ex) '2018�� 01�� 12��' -- X(���� ǥ�� ����)
        ex) '2018-01-12', '2018/01/12'
*/

-- �÷����� ����
-- SELECT�� ����� �÷������� �����ϰ� ��ȯ���� �� �ְ�, Ȥ�� �����̳� �Լ��� �Ű������� ����� �� �ִ�.
SELECT name, basicpay, basicpay * 1.1 FROM tblinsa;

SELECT last, first, weight, weight + 3 FROM tblname;

SELECT name, length(name) FROM tblcountry;

-- BMI
SELECT last, first, weight / height * height FROM tblname;

-- ���ڿ� ���ϱ�
SELECT last, first, last + first FROM tblname;
SELECT last, first, last || first FROM tblname;

SELECT last, last FROM tblname;

-- ������� �÷����� �ٲٱ�
-- : ��Ī(Alias) �����ϱ�
-- : �̸� �ٲٱ�(������ �ٲ�� ���� �ƴ�)
-- : �÷��� as ����

SELECT last, first, last || first AS name FROM tblname;
SELECT last AS ��, first AS �̸�, last || first AS ��ü�̸� FROM tblname;

SELECT last AS ��, first AS �̸�, last || first AS "��ü �̸�" FROM tblname;
SELECT ��, �̸�, "��ü �̸�" FROM �������̺�;

SELECT weight AS "from" FROM tblname;


-- ��ü ǥ���
SELECT * FROM tblname;
SELECT * FROM hr.tblname;

SELECT first, last FROM hr.tblname;
SELECT tblname.first, tblname.last FROM hr.tblname;
SELECT hr.tblname.first, hr.tblname.last FROM hr.tblname;

SELECT tblname.first, tblname.last FROM tblname;
SELECT n.first, n.last FROM tblname n; -- ���̺� ��Ī
SELECT first, last FROM tblname n;

SELECT *, weight + 100 FROM tblname;
SELECT tblname.*, weight + 100 FROM tblname;
SELECT n.*, weight + 100 FROM tblname n;

/*
    SQL ��(��)�� ���� ����(�켱 ����)
    1. SELECT �� - 2
    2. FROM �� - 1
*/

    -- �ý��� ���̺�
    -- 1. tabs : �ش� ������ �����ϰ� �ִ� ���̺� ���
    -- 2. dual : ���� ���̺�, ���̺� ��ü�� �ǹ̰� ����
    
    -- sysdate : Calendar.getInstance();

SELECT sysdate FROM dual; --X

SELECT sysdate FROM tblname;

SELECT 100 * 2 From dual;

/*
    ������
    
    1. ��� ������
        - +, -, *, /
        - ������ �����ڰ� ���� -> �Լ��� ����(mod())
        
    2. �� ������
        - >, >=, <, <=
        - =(==), <>(!=)
        
    3. �� ������
        - and(&&), or(||), not(!)
        
    4. ���ڿ� ������
        - ||(concat)
        
    5. SQL ������
        - Java : Instanceof, typeof..
        - in, between, like, is, any, all ��..
*/

SELECT 10 > 5 FROM dual;
SELECT '����' FROM dual WHERE 10 < 5;

-- NULL
-- : �ڹ��� null�� ������ ǥ��
-- : SQL NULL�� ������ ����� �� �� ����.(�ǿ����� �ڰ�X)

SELECT 10 + NULL FROM dual;
SELECT NULL * 300 FROM dual;
SELECT 100 / NULL FROM dual;
SELECT 10 - NULL FROM dual;

