/*
    WHERE��
    - SELECT �÷�����Ʈ FROM ���̺�� WHERE��
    - ����ڰ� �����ͺ��̽� �����͸� ������ �� �׻� ��� �����͸� �������� �ʴ´�.
    - ������ ������ �ؼ� �Ϻ� ���ڵ常 �������� �Ѵ�. -> ������
    - ��, ������ �Ǵ��ϴ� ������� ��� -> �񱳿����� & ��������
    
    1. SELECT - 3
    2. FROM - 1
    3. WHERE - 2
*/
SELECT * FROM tblname WHERE weight > 70;

SELECT * FROM tblname WHERE weight >= 70 and weight <= 90;

SELECT first, last, weight FROM tblname WHERE weight >= 70 and weight <= 90;

SELECT first, last FROM tblname WHERE weight >= 70 and weight <= 90;

-- ��ȣ
SELECT * FROM tblname WHERE last = '��';
SELECT * FROM tblname WHERE height = 184;
SELECT * FROM tblinsa WHERE ibsadate = '98/10/11';
SELECT * FROM tblinsa WHERE ibsadate = '1998-10-11'; --����

-- ����Ŭ�� ���ڿ� ����� ��¥������ �ڵ� ����ȯ�� �����ش�.
-- �ú��ʰ� ��������� ����ȯ �Ұ��� -> �Լ��۾�
SELECT * FROM tbltodo WHERE adddate = '2018-01-01 06:00:00';
SELECT * FROM tbltodo WHERE adddate = '2018-01-01'; -- 00:00:00

-- �񱳿���
SELECT * FROM tblname WHERE height >= 170;

SELECT * FROM tblname WHERE 1 = 1;
SELECT * FROM tblname WHERE 1 > 0;

SELECT * FROM tblname WHERE weight / height * height > 20;

SELECT name, length(name) FROM tblcountry WHERE length(name) >= 4;

-- �� ���꿡 ���Ǵ� �ڷ���
-- 1. ������
-- 2. ������ if("ȫ�浿" > "�ƹ���") -> if("ȫ�浿".compareTo("�ƹ���") > 0)

SELECT * FROM tblname WHERE weight > 70;
SELECT * FROM tblname WHERE first > '��';
SELECT * FROM employees WHERE first_name < 'D';
SELECT * FROM tblinsa WHERE ibsadate >= '2000-01-01';

/*
    between
    - WHERE������ ���(�������� ���)
    - ���� ���� ����
    - �÷��� between �ּҰ� and �ִ밪
    - ������ ���
    - �ּҰ�, �ִ밪 ��� ����(Inclusive)
*/
SELECT * FROM tblname WHERE weight >= 70 AND weight <= 90;

SELECT * FROM tblname WHERE weight BETWEEN 70 AND 90;

SELECT * FROM employees WHERE last_name BETWEEN 'D' AND 'F';

SELECT * FROM tblinsa WHERE ibsadate BETWEEN '1999-01-01' AND '2000-12-31';

-- BETWEEN�� ��� ���� > ��(��) �����ڸ� ����ϴ°� �ӵ��� �� ����

/*
    in
    - WHERE ������ ���(�������� ���)
    - ������ ���� ��(���ð� �߿��� �ϳ��� �����ϸ� true)
    - �÷��� in(������ ��)
*/

SELECT * FROM tblcountry WHERE continent = 'AS' or continent = 'EU';

SELECT * FROM tblcountry WHERE continent IN ('AS', 'EU');

SELECT * FROM tblinsa WHERE buseo = '��ȹ��' or buseo = '������' or buseo = '�ѹ���';

SELECT * FROM tblinsa WHERE buseo IN ('��ȹ��', '������', '�ѹ���') and jikwi IN ('����', '����') and city IN ('����', '��õ') and basicpay BETWEEN 2500000 and 3000000;

/*
    like
    - WHERE ������ ���(�������� ���)
    - ���� ����(Ư���� ������ ������ ���ڿ� �˻�)
    - �÷��� like '���� ���ڿ�'
    
    ���� ���ڿ� ���� ���
    1. _ : ������ ���� 1��
    2. % : ������ ���� 0�� ~ ���Ѵ�
*/

SELECT name FROM tblinsa WHERE name LIKE '��__';

SELECT * FROM tblinsa WHERE ssn LIKE '______-1______';

SELECT * FROM tblinsa WHERE tel LIKE '019%';

SELECT name FROM tblinsa WHERE name LIKE '��%';

SELECT * FROM employees WHERE first_name LIKE 'N%';

SELECT * FROM employees WHERE first_name LIKE 'N%e';

SELECT * FROM employees WHERE first_name LIKE '%an%';

/*
    null����
    - WHERE ������ ���
    - null �ǿ����ڷ� ��� �Ұ� -> ���ǿ��� ��� �Ұ�
    - �÷��� is null (�÷��� == null)
*/
-- �α����� �̱����� ����?
SELECT * FROM tblcountry WHERE population = NULL; -- if (pop == null)

SELECT * FROM tblcountry WHERE population IS NULL;

-- tblinsa ����ó �̱��� ����?
SELECT * FROM tblinsa WHERE tel IS NULL;

-- �α����� ����� ����
SELECT * FROM tblcountry WHERE population IS not NULL;

SELECT * FROM tblinsa WHERE tel IS not NULL;

SELECT * FROM tblinsa WHERE not tel IS NULL;

SELECT * FROM tblinsa WHERE NOT city IN ('����', '��õ', '�λ�');

SELECT * FROM tblinsa WHERE NOT name LIKE '��%';

-- completedate : ���� �Ϸ� �ð�
-- ���� ���� �Ϸ� ���Ѱ͵鸸 ��������
SELECT * FROM tbltodo WHERE completedate IS NULL;
SELECT * FROM tbltodo WHERE completedate IS NOT NULL;

-- ������ �뿩 ���̺�
-- �뿩��, �ݳ���
SELECT * FROM �뿩���̺� WHERE �ݳ��� IS NULL; -- ���� �뿩���� ���

/*
    distinct
    - �÷� ����Ʈ���� ���
    - distinct �÷���
    - �ߺ��� ����
    - NULL�� �������� �� ������ �ν��Ѵ�. -> NULL�� ������ ���ڵ�鵵 �ߺ��� ������ 1�� ��ȯ
    - ���� �÷��� ������� distinct ���
*/

SELECT DISTINCT continent FROM tblcountry;

-- ���� ����?
SELECT DISTINCT gender FROM tblname;

-- tblinsa ������ ��͵��� �ִ���?
SELECT DISTINCT jikwi FROM tblinsa;

SELECT DISTINCT last FROM tblname;
SELECT DISTINCT first FROM tblname;

SELECT DISTINCT population FROM tblcountry WHERE population IS NOT NULL;

SELECT * FROM tblmen;
SELECT * FROM tblwomen;

SELECT * FROM tblmen WHERE couple IS NULL; -- �ַ�
SELECT * FROM tblwomen WHERE couple IS NULL; -- �ַ�

-- distinct�� �����÷����� ������ �� �ִ�.
SELECT DISTINCT price FROM tblhousekeeping;
SELECT DISTINCT price, qty FROM tblhousekeeping;
-- SELECT DISTINCT price, DISTINCT qty FROM tblhousekeeping;

/*
    case
    - �÷� ����Ʈ�� ���
    - �������� ���
    - �ڹٿ����� if + case ���� ����
*/
SELECT last || first as name, case when gender = 'm' then '����' when gender = 'f' then '����' end as gender FROM tblname;

SELECT name,
    case
        when continent = 'AS' then '�ƽþ�'
        when continent = 'EU' then '����'
        else '��Ÿ'
    end
FROM tblcountry;

-- �̹��� �޿� -> ����(����)�� sudang x 2�� ����
SELECT name, basicpay, sudang,
    CASE
       WHEN jikwi = '����' THEN sudang * 2
       WHEN jikwi = '����' THEN sudang * 2
       WHEN jikwi = '�븮' THEN sudang
       ELSE sudang
    END AS sudang_1
, jikwi FROM tblinsa;

SELECT name, basicpay,
    CASE
        WHEN basicpay >= 2000000 THEN '��� ����'
        WHEN basicpay >= 1000000 THEN '�Ϲ� ����'
        ELSE '���� ����'
    END AS basicpay_1
FROM tblinsa;

SELECT name, weight, couple,
    CASE
        WHEN weight > 90 THEN '��ü��'
        WHEN weight > 60 THEN '����ü��'
        WHEN weight > 0 THEN '��ü��'
        ELSE '����'
    END AS ü�߻���,
    CASE
        WHEN couple IS NOT NULL THEN '����ģ�� ����'
        WHEN couple IS NULL THEN '�ַ�'
    END AS ���ֻ���
FROM tblmen;

SELECT title, completedate,
    CASE
        WHEN completedate IS NULL THEN '������'
        WHEN completedate IS NOT NULL THEN '�Ϸ�'
    END AS �ϼ�����
FROM tbltodo;

/*
    1. SELECT
    2. FROM
    3. WHERE
    4. ORDER BY
    
    ����, Sorting
    - ����� ���ڵ��� ������ ����(���� ���̺���� ����)
    - ���� ���̺��� ���ڵ� ������ DBMS�� �˾Ƽ� ��
    - ORDER BY �÷��� [ASC|DESC]
        - ORDER BY �÷��� ASC // Ascending, ��������
        - ORDER BY �÷��� DESC // Descending, ��������
        - ORDER BY �÷��� // ASC, ��������
    - ASC
        - 10 -> 20 -> 30
        - '��' -> '��' -> '��'
        - '2016' -> '2017' -> '2018'
*/
SELECT * FROM tblinsa 
    -- ORDER BY name ASC;
    -- ORDER BY ibsadate DESC;
    -- ORDER BY basicpay DESC;
    -- ORDER BY basicpay + sudang DESC;
    ORDER BY buseo ASC, jikwi ASC, basicpay DESC; -- ���� ����
    
-- �ֱ� �Ϸ��� ���Ϻ��� �������ÿ�.
SELECT * FROM tbltodo ORDER BY completedate DESC;

-- ���� ��� NULL�� ���ԵǾ� ������ �Ϲ������� ���� �����Ѵ�.(���� �񱳰� �Ұ����ϱ� ������)
-- ���� NULL�� ���ԵǴ� �����̶�� -> NULL�� ��ġ��? -> DBMS�� ���� �ٸ���.
SELECT * FROM tbltodo WHERE completedate IS NOT NULL ORDER BY completedate DESC;

/*
    1. SELECT - 3
    2. FROM - 1
    3. WHERE - 2
    4. ORDER BY - 4
*/
SELECT last || first AS name
FROM tblname
-- WHERE name = '���缮';
-- WHERE last || first = '���缮';
-- ORDER BY name DESC;
ORDER BY last || first DESC;