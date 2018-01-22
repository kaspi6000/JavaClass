/*
    ��������, Sub Query
    - SQL �ȿ� �� �ٸ� SQL�� ��� �ִ� ����
    - SELECT ���� �������� ���·� ���ȴ�.
    - ���������� �� �� �ִ� ��ġ
        a. WHERE�� : ���������� ������� ���ǰ����� ���
        b. �÷�����Ʈ : ���������� ������� �� �ϳ��� �÷� �����ͷ� ���
        c. FROM �� : ���������� ������� �ϳ��� ���̺�� ��� -- ��(View)
        d. ORDER BY��
        e. GROUP BY��
*/

SELECT * FROM tblhousekeeping ORDER BY price DESC;

-- �ܰ��� ���� ���� ���Ǹ�?
SELECT max(price) FROM tblhousekeeping; -- 15000

SELECT item FROM tblhousekeeping WHERE price = max(price);

SELECT item FROM tblhousekeeping WHERE price = (SELECT max(price) FROM tblhousekeeping);

SELECT * FROM tbltodo;
-- ���� �ֱٿ� ����� ����?(adddate�� ���� ������ ��¥)

SELECT max(adddate) FROM tbltodo; -- 18/01/12 12:30:23

SELECT title FROM tbltodo WHERE adddate = to_date('2018-01-12 12:30:23', 'YYYY-mm-dd hh24:mi:ss');

SELECT title FROM tbltodo WHERE adddate = (SELECT max(adddate) FROM tbltodo);

-- ȸ�� ��� ����(155����)���� ���� �޴� ������ ���?
SELECT * FROM tblinsa;

SELECT avg(basicpay) FROM tblinsa;

SELECT * FROM tblinsa WHERE basicpay > (SELECT avg(basicpay) FROM tblinsa);

SELECT DISTINCT buseo FROM tblinsa WHERE basicpay > (SELECT avg(basicpay) FROM tblinsa WHERE buseo = '�ѹ���') AND buseo <> '�ѹ���';

SELECT * FROM tblinsa WHERE name = 'ȫ�浿';

SELECT * FROM tblinsa WHERE basicpay > (SELECT basicpay FROM tblinsa WHERE name = 'ȫ�浿');

SELECT * FROM tblinsa WHERE basicpay > (SELECT basicpay FROM tblinsa WHERE jikwi = '����');

SELECT * FROM tblinsa WHERE basicpay > (SELECT max(basicpay) FROM tblinsa WHERE jikwi = '����');

SELECT * FROM tblmen;
SELECT * FROM tblwomen;

-- ���� 170cm -> ����ģ�� -> Ű?
SELECT height FROM tblwomen WHERE name = (SELECT couple FROM tblmen WHERE height = 170 AND weight IS NULL);

-- hr
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM locations;

-- ���� Steven King�� �Ҽӵ� �μ��� ��� ������ �ִ��� �ּҸ� �˷��ּ���.
SELECT * FROM locations WHERE location_id = (SELECT location_id FROM departments WHERE department_id = (SELECT department_id FROM employees WHERE first_name || last_name = 'StevenKing'));

-- �÷�����Ʈ�� �������� ���

-- ��ȹ�� �������� �浿�̺��� �󸶸� �� �ް� �󸶸� �� �޴��� ������ �ñ�?
SELECT name, basicpay, (SELECT basicpay FROM tblinsa WHERE name = 'ȫ�浿') - basicpay AS ���� FROM tblinsa WHERE buseo = '��ȹ��';

-- �����Լ��� �÷�����Ʈ�� ��� -> ��������
SELECT name, basicpay, (SELECT max(basicpay) FROM tblinsa) FROM tblinsa;
SELECT name, basicpay, (SELECT max(basicpay) FROM tblinsa) - basicpay FROM tblinsa;

-- �ٱ��� ���̺��� �����͸� ���� ���̺��� �������� ��� -- ����

-- FROM�� -> ��������
SELECT * FROM (SELECT * FROM tblname WHERE gender = 'm'); -- �ӽ� ���� ���̺�

CREATE TABLE tbltempmen
AS
SELECT * FROM tblname WHERE gender = 'm';

SELECT * FROM tbltempmen;

SELECT * FROM (SELECT name, ssn, jikwi, city FROM tblinsa WHERE buseo = '��ȹ��');

SELECT name, ssn, jikwi, city FROM (SELECT name, ssn AS jumin, jikwi, city FROM tblinsa WHERE buseo = '��ȹ��');

-- ���������� ����� ���߰��� ��
-- 1. ���� ��
-- 2. ���� �÷�

-- ȫ�浿(����)�� �̼���(����)�� ���� �μ� �������� �������ÿ�.
SELECT name, buseo FROM tblinsa
    -- WHERE buseo = '��ȹ��' OR buseo = '���ߺ�';
    WHERE buseo IN('��ȹ��', '���ߺ�');

SELECT * FROM tblinsa WHERE name = 'ȫ�浿' OR name = '�̼���';

SELECT name, buseo FROM tblinsa WHERE buseo IN(SELECT buseo FROM tblinsa WHERE name = 'ȫ�浿' OR name = '�̼���');

SELECT buseo, jikwi FROM tblinsa
    WHERE name = '������';
    
-- �����հ� ���� �μ��� �Ҽ� + ���� ������ ������ �����?
SELECT * FROM tblinsa
    WHERE buseo = '�λ��' AND jikwi = '���';
    
SELECT * FROM tblinsa
    WHERE buseo = (SELECT buseo FROM tblinsa WHERE name = '������')
    AND jikwi = (SELECT jikwi FROM tblinsa WHERE name = '������');
    
SELECT * FROM tblinsa
    WHERE buseo = (SELECT buseo FROM tblinsa WHERE num = 1035)
    AND jikwi = (SELECT jikwi FROM tblinsa WHERE num = 1035);
    
SELECT * FROM tblinsa
    WHERE buseo = (SELECT buseo FROM tblinsa WHERE basicpay = (SELECT min(basicpay) FROM tblinsa))
    AND jikwi = (SELECT jikwi FROM tblinsa WHERE basicpay = (SELECT min(basicpay) FROM tblinsa));
    
SELECT * FROM tblinsa
    WHERE (buseo, jikwi) = (SELECT buseo, jikwi FROM tblinsa WHERE name = '������');
    
-- ������ �߿�
SELECT * FROM tblinsa
    WHERE (buseo, jikwi) = (SELECT buseo, jikwi AS position FROM tblinsa WHERE name = '������');
    
-- �����÷� + ������ -> �������� ���ǰ����� ���
SELECT * FROM tblinsa
    WHERE (buseo, jikwi) IN (SELECT buseo, jikwi FROM tblinsa WHERE name = '������');