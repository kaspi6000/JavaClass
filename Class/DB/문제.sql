/*
    <<tblcountry>>
    1. ������� �������� �������ÿ�.
    
    2. �Ʒ��� ���� �������ÿ�.
    - ��Ī{Alias)
    - �÷� ����
    [������]   [����]    [�α���]   [����]    [���]
    ���ѹα�    ����      4405      10        AS
    ..
    
    <<tblname>>
    3. �Ʒ��� ���� �������ÿ�.
    [�̸�]    [Ű]     [������]   [����]
    ���缮     178cm   64kg       �޶ѱ�
    ..
    
    <<tblcountry>>
    4. �Ʒ��� ���� �������ÿ�.
    [��������]
    ������ : ���ѹα�, ������ : ����, �α��� : 4405��
    ..
    
    <<employees>>
    5. ������, �̸���, ����ó, �޿��� �������ÿ�.
    [�̸�]        [�̸���]           [����ó]           [�޿�]
    Steven King   SKING@gmail.com   515.123.4567       $24000
    ..
    
    <<tblname>>
    6. �Ʒ��� ���� �������ÿ�.
    [�̸�]    [���]
    ���缮     ���缮�� ������ '�޶ѱ�'�Դϴ�.
    ..
    
    7. �Ʒ��� ���� �������ÿ�.
    [�̸�]    [����]    [��ձ޿�]
    ȫ�浿     3100����  250����
*/

SELECT '������ "�޶ѱ�"�Դϴ�.' FROM dual;

-- 1.
SELECT name, capital FROM tblcountry;

-- 2.
SELECT name as "������", capital as "����", population as "�α���", area as "����", continent as "���" FROM tblcountry;

-- 3.
SELECT last || first as "�̸�", height as "Ű", weight as "������", nick FROM tblname;

-- 4.
SELECT '������:' || name || ',' || '������:' || capital || ',' || '�α���:' || population as "��������" FROM tblcountry;

-- 5.
SELECT first_name || ' ' || last_name as "�̸�", email || '@gmail.com' as "�̸���", phone_number as "����ó", '$' || salary as "�޿�" FROM employees;

-- 6.
SELECT last || first as "�̸�", last || first || '�� ������ ' || '"' || nick || '"' || '�Դϴ�.' as "���" FROM tblname;

-- 7.
SELECT name as "�̸�", m1+m2+m3+m4+m5+m6+m7+m8+m9+m10+m11+m12 || '����' as "����", m1+m2+m3+m4+m5+m6+m7+m8+m9+m10+m11+m12/12 as "��ձ޿�" FROM tblsalary;

/*
    WHERE�� + ������
    
    <<tblcountry>>
    1. ����(area)�� 100������ ������ �̸��� ������ �������ÿ�.
    
    2. �ƽþ�(AS)�� ����(EU) ����� ���� ������ �������ÿ�.
    
    <<employees>>
    3. ����(job_id)�� ���α׷���(it_prog)�� ������ �̸�(Ǯ����)�� ����ó �������ÿ�.
    
    4. last_name�� 'Grant'�� ������ Ǯ����, ����ó, ��볯¥�� �������ÿ�.
    
    5. Ư�� �Ŵ���(120)�� �����ϴ� ������ �̸�, �޿�, ����ó�� �������ÿ�.
    
    6. Ư�� �μ�(60, 80, 100)�� ���� �������� �̸�, ����ó, �̸���, �μ�ID�� �������ÿ�.
    
    <<tblinsa>>
    7. ��ȹ�� ������ �������ÿ�.
    
    8. ���￡ �ִ� ������ �� ������ ������ ����� �̸�, ����, ��ȭ��ȣ �������ÿ�.
    
    9. �⺻�޿� + ���� ���ļ� 150���� �̻��� ���� �� ���￡ �ִ� ������ �������ÿ�.
    
    10. ������ 15���� ������ ���� �� ������ ��� or �븮�� ������ �������ÿ�.
    
    11. ������ ������ �⺻ ������ 2õ���� �̻� + ���� + ����(����)�� �������ÿ�.
    
    12. 1990��뿡 �Ի��� ���� �� ���� or ������ �������� ����� �������ÿ�.
    
    13. 2000�� ~ 2002�� ���̿� �Ի��� ȫ���� ������ �������ÿ�.
    
    <<tblname>>
    14. ���� �� Ű�� 170 �̸��� ����� �������ÿ�.
    
    15. �ھ� ���� ���� ���ڸ� �������ÿ�.
    
    <<tblsalary>>
    16. ��� �޿��� 250������ �Ѵ� ����� �������ÿ�.
    
    17. ��ݱ�(1~6��)���� �Ϲݱ�(7~12��)�� ������ ���� ����� �������ÿ�.
*/

-- 1. ����(area)�� 100������ ������ �̸��� ������ �������ÿ�.
SELECT name, area FROM tblcountry WHERE area <= 100;

-- 2. �ƽþ�(AS)�� ����(EU) ����� ���� ������ �������ÿ�.
SELECT name FROM tblcountry WHERE continent = 'AS' or continent = 'EU';

--3. ����(job_id)�� ���α׷���(it_prog)�� ������ �̸�(Ǯ����)�� ����ó �������ÿ�.
SELECT first_name || last_name, phone_number FROM employees WHERE job_id = 'IT_PROG';

--4. last_name�� 'Grant'�� ������ Ǯ����, ����ó, ��볯¥�� �������ÿ�.
SELECT first_name || last_name, phone_number, hire_date FROM employees WHERE last_name = 'Grant';

--5. Ư�� �Ŵ���(120)�� �����ϴ� ������ �̸�, �޿�, ����ó�� �������ÿ�.
SELECT first_name || last_name, salary, phone_number FROM employees WHERE manager_id = 120;

--6. Ư�� �μ�(60, 80, 100)�� ���� �������� �̸�, ����ó, �̸���, �μ�ID�� �������ÿ�.
SELECT first_name || last_name, phone_number, email, department_id FROM employees WHERE department_id = 60 or department_id = 80 or department_id = 100;

--7. ��ȹ�� ������ �������ÿ�.
SELECT * FROM tblinsa WHERE buseo = '��ȹ��';

--8. ���￡ �ִ� ������ �� ������ ������ ����� �̸�, ����, ��ȭ��ȣ �������ÿ�.
SELECT name, jikwi, tel FROM tblinsa WHERE city = '����' and jikwi = '����';

--9. �⺻�޿� + ���� ���ļ� 150���� �̻��� ���� �� ���￡ �ִ� ������ �������ÿ�.
SELECT * FROM tblinsa WHERE basicpay + sudang >= 150 and city = '����';

--10. ������ 15���� ������ ���� �� ������ ��� or �븮�� ������ �������ÿ�.
SELECT * FROM tblinsa WHERE sudang <= 150000 and jikwi = '���' or jikwi = '�븮';

--11. ������ ������ �⺻ ������ 2õ���� �̻� + ���� + ����(����)�� �������ÿ�.
SELECT * FROM tblinsa WHERE basicpay * 12 >= 20000000 and city = '����' and jikwi = '����' or jikwi = '����';

--12. 1990��뿡 �Ի��� ���� �� ���� or ������ �������� ����� �������ÿ�.
SELECT * FROM tblinsa WHERE ibsadate >= '1990-01-01' and ibsadate < '2000-01-01' and not(jikwi = '����' or jikwi = '����');

--13. 2000�� ~ 2002�� ���̿� �Ի��� ȫ���� ������ �������ÿ�.
SELECT * FROM tblinsa WHERE ibsadate >= '2000-01-01' and ibsadate < '2003-01-01';

--14. ���� �� Ű�� 170 �̸��� ����� �������ÿ�.
SELECT * FROM tblname WHERE gender = 'm' and height < 170;

--15. �ھ� ���� ���� ���ڸ� �������ÿ�.
SELECT * FROM tblname WHERE gender = 'f' and last = '��';

--16. ��� �޿��� 250������ �Ѵ� ����� �������ÿ�.
SELECT * FROM tblsalary WHERE (m1+m2+m3+m4+m5+m6+m7+m8+m9+m10+m11+m12) / 12 >= 250;

--17. ��ݱ�(1~6��)���� �Ϲݱ�(7~12��)�� ������ ���� ����� �������ÿ�.
SELECT * FROM tblsalary WHERE m1+m2+m3+m4+m5+m6 < m7+m8+m9+m10+m11+m12;

/*
    ������(WHERE) - BETWEEN, IN, LIKE, DISTINCT
    <<tblcountry>>
    1. �������� 'O��'�� ���� �������ÿ�.
        a. ������ 2���� -> _
        b. ������ ���ڼ� ������� -> %
    
    <<employees>>
    2. ����ó�� 515�� �����ϴ� �������� �������ÿ�.
    
    3. ���� ID�� 'SA'�� �����ϴ� �������� �������ÿ�.
    
    4. first_name�� 'de'�� �� �������� �������ÿ�.(��ҹ��� ������� - ���ڿ� �Լ�x)
    
    <<tblinsa>>
    5. ���� ������ �������ÿ�.
    
    6. ���� ������ �������ÿ�.
    
    7. ������ �¾ �������� �������ÿ�.(7~8����)
    
    8. ����, ��õ�� ��� �达�鸸 �������ÿ�.
    
    9. ������, �ѹ���, ���ߺ� ���� �� �����(���, �븮) �� 010 ����ڸ� �������ÿ�.
    
    10. ����, ��õ, ��⿡ ��� �Ի����� 1998 ~ 2000�� ������ �������� �������ÿ�.
    
    <<employees>>
    11. �μ��� ���� ������ �ȵ� �������� �������ÿ�.
    
    -- distinct
    12. ������ � ������ �ִ���?(��, NULL�� ����)
    
    13. ������� 2002 ~ 2004�� ������ �������� ��� �μ��� �ٹ��ϴ���?
    
    14. �޿��� 5000�� �̻��� �������� ��� �Ŵ����� ��������?
    
    <<tblinsa>>
    15. ���� ���� + 80���� -> ����?
    
    16. ���� 20���� �Ѵ� �������� ��� �����?
    
    17. ����ó�� ���� ���� ������ ��� �μ��� �ҼӵǾ� �ִ���?
    
    <<tbldiary>>
    18. 2018�� 1�� 20�� ���Ŀ� ������ �����?
    19. '����Ŭ','�ڹ�','�ڵ�' �̶�� Ű���尡 �� ������ ������ �����?
    
    <<tblhousekeeping>>
    20. ���� �� ����(price * qty)�� 50000 ~ 100000�� �̳� ���?
    
    <<tbltodo>>
    21. 2018�� 1�� 5�� ~ 2018�� 1�� 10�� �̳��� ����� �� �� ���� �ϷḦ ���� �ϵ�?
    22. '~�ϱ�' ��� ������ ���� �� �� �� �Ϸ��� �ϵ���?
    
    <<tblinsa>>
    23. ���� �������� ����?
    24. ȫ���� �������� ��°�?
    
    <<tblmen>>
    25. ����ģ���� �����鼭 �����Ը� �� �� ���� ���?
    26. ����ģ���� '��'���̸鼭 �ڽ��� '��'���� ���?
*/

-- 1. �������� 'O��'�� ���� �������ÿ�.
        -- a. ������ 2���� -> _
        -- b. ������ ���ڼ� ������� -> %
SELECT * FROM tblcountry WHERE name LIKE '_��';
SELECT * FROM tblcountry WHERE name LIKE '%��';

-- 2. ����ó�� 515�� �����ϴ� �������� �������ÿ�.
SELECT * FROM employees WHERE phone_number LIKE '515%';

-- 3. ���� ID�� 'SA'�� �����ϴ� �������� �������ÿ�.
SELECT * FROM employees WHERE job_id LIKE 'SA%';

-- 4. first_name�� 'de'�� �� �������� �������ÿ�.(��ҹ��� ������� - ���ڿ� �Լ�x)
SELECT * FROM employees WHERE first_name LIKE '%de%' or first_name LIKE '%DE%';

-- 5. ���� ������ �������ÿ�.
SELECT * FROM tblinsa WHERE ssn LIKE '%-1%';

-- 5. ���� ������ �������ÿ�.
SELECT * FROM tblinsa WHERE ssn LIKE '%-2%';

-- 7. ������ �¾ �������� �������ÿ�.(7~8����)
-- SELECT * FROM tblinsa WHERE ssn BETWEEN '__07%' and '__08%';

-- 8. ����, ��õ�� ��� �达�鸸 �������ÿ�.
SELECT * FROM tblinsa WHERE city IN ('����', '��õ') and name LIKE '��%';

-- 9. ������, �ѹ���, ���ߺ� ���� �� �����(���, �븮) �� 010 ����ڸ� �������ÿ�.
SELECT * FROM tblinsa WHERE buseo IN ('������', '�ѹ���', '���ߺ�') and jikwi IN ('���', '�븮') and tel LIKE '010%';

-- 10. ����, ��õ, ��⿡ ��� �Ի����� 1998 ~ 2000�� ������ �������� �������ÿ�.
SELECT * FROM tblinsa WHERE city IN ('����', '��õ', '���') and ibsadate BETWEEN '1998-01-01' and '2000-12-31';

-- 11. �μ��� ���� ������ �ȵ� �������� �������ÿ�.
SELECT * FROM employees WHERE department_id IS NULL;

-- 12. ������ � ������ �ִ���?(��, NULL�� ����)
SELECT DISTINCT job_id FROM employees WHERE job_id IS NOT NULL;

-- 13. ������� 2002 ~ 2004�� ������ �������� ��� �μ��� �ٹ��ϴ���?
SELECT * FROM employees WHERE hire_date BETWEEN '2002-01-01' and '2004-12-31';

-- 14. �޿��� 5000�� �̻��� �������� ��� �Ŵ����� ��������?
SELECT DISTINCT manager_id FROM employees WHERE manager_id IS NOT NULL and salary >= 5000;

-- 15. ���� ���� + 80���� -> ����?
SELECT DISTINCT jikwi FROM tblinsa WHERE ssn LIKE '%-1%' and ssn BETWEEN '80' and '90';

-- 16. ���� 20���� �Ѵ� �������� ��� �����?
SELECT DISTINCT city FROM tblinsa WHERE sudang > 200000;

-- 17. ����ó�� ���� ���� ������ ��� �μ��� �ҼӵǾ� �ִ���?
SELECT DISTINCT buseo FROM tblinsa WHERE tel IS NULL;

-- <<tbldiary>>
-- 18. 2018�� 1�� 20�� ���Ŀ� ������ �����?
SELECT weather FROM tbldiary WHERE regdate >= '2018-01-20';

-- 19. '����Ŭ','�ڹ�','�ڵ�' �̶�� Ű���尡 �� ������ ������ �����?
SELECT weather FROM tbldiary WHERE subject LIKE '%����Ŭ%' or subject LIKE '%�ڹ�%' or subject LIKE '%�ڵ�%';
    
-- <<tblhousekeeping>>
-- 20. ���� �� ����(price * qty)�� 50000 ~ 100000�� �̳� ���?
SELECT * FROM tblhousekeeping WHERE price * qty BETWEEN 50000 AND 100000;
    
-- <<tbltodo>>
-- 21. 2018�� 1�� 5�� ~ 2018�� 1�� 10�� �̳��� ����� �� �� ���� �ϷḦ ���� �ϵ�?
SELECT title FROM tbltodo WHERE adddate BETWEEN '2018-01-05' AND '2018-01-10' and completedate IS NULL;

-- 22. '~�ϱ�' ��� ������ ���� �� �� �� �Ϸ��� �ϵ���?
SELECT title FROM tbltodo WHERE title LIKE '%�ϱ�' and completedate IS NOT NULL;
    
-- <<tblinsa>>
-- 23. ���� �������� ����?
SELECT DISTINCT jikwi FROM tblinsa WHERE ssn LIKE '%-2%';

-- 24. ȫ���� �������� ��°�?
SELECT DISTINCT city FROM tblinsa WHERE buseo = 'ȫ����';
    
-- <<tblmen>>
-- 25. ����ģ���� �����鼭 �����Ը� �� �� ���� ���?
SELECT * FROM tblmen WHERE couple IS NOT NULL and weight IS NULL;

-- 26. ����ģ���� '��'���̸鼭 �ڽ��� '��'���� ���?
SELECT * FROM tblmen WHERE couple LIKE '��%' and name LIKE '��%';
/*
    count()
    
    <<tblcountry>>
    1. �ƽþƿ� ������ ���� ������ ���?
    
    2. �α��� 5000 ~ 20000 ���̿� ���ϴ� ������ ���?
    
    <<employees>>
    3. IT_PRO �߿��� �޿��� 5000�� �Ѵ� ���� ���?
    
    <<tblinsa>>
    4. ����ó�� 010�� �ƴ� ����� ���?(����ó �ִ� ����� �߿���)
    
    5. ���� ��� ���� ���?
    
    6. ���� ���� ���?
    
    <<tblmen>>
    7. �ַΰ� ���?
    
    <<tblhousekeeping>>
    8. ���� �Ѿ��� 10������ �Ѵ� ���Ÿ� �� ��ȸ?
    
    sum()
    1. EU�� AF�� ���� ������ �� �α���?
    
    2. �Ŵ���(108)�� �����ϴ� ������ �޿� ��?
    
    3. ����(ST_CLERK, SH_CLERK)�� ������ ���� �޿� ��?
    
    4. ����� �λ꿡 �ִ� �������� �޿� ��(�޿� + ����)
    
    5. ����, ������� �� �޿� ��?
    
    avg()
    1. �ƽþƿ� ���� ������ ��� �α���?
    
    2. �̸�(first_name)�� 'AN'�� ���Ե� �������� �޿� ���?(��ҹ��� ���� ����)
    
    3. ���α�(����,����)�� ��� �޿�?
    
    4. �����(�븮,���)�� ��� �޿�?
    
    max(), min()
    1. ������ ���� ���� ������ ����?
    
    2. �޿�(�޿� + ����)�� ���� ���� �޴� ����� �޿���?
    
    3. tblhousekeeping ���� ũ�� ���� �ݾ�?(price * qty)
*/
-- count()
-- 1. �ƽþƿ� ������ ���� ������ ���?
SELECT count(*) FROM tblcountry WHERE continent IN ('AS', 'EU');

-- 2. �α��� 5000 ~ 20000 ���̿� ���ϴ� ������ ���?
SELECT count(*) FROM tblcountry WHERE population BETWEEN 5000 and 20000;

-- 3. IT_PRO �߿��� �޿��� 5000�� �Ѵ� ���� ���?
SELECT count(*) FROM employees WHERE job_id = 'IT_PROG' and salary > 5000;

-- 4. ����ó�� 010�� �ƴ� ����� ���?(����ó �ִ� ����� �߿���)
SELECT count(*) FROM tblinsa WHERE tel NOT LIKE '010%';

-- 5. ���� ��� ���� ���?
SELECT count(*) FROM tblinsa WHERE NOT city = '����';
    
-- 6. ���� ���� ���?
SELECT count(*) FROM tblinsa WHERE ssn LIKE '%-2%';

-- 7. �ַΰ� ���?
SELECT count(*) FROM tblmen WHERE couple IS NULL;

--  8. ���� �Ѿ��� 10������ �Ѵ� ���Ÿ� �� ��ȸ?
SELECT count(price * qty) FROM tblhousekeeping WHERE price * qty > 30000;

 -- sum()
 --1. EU�� AF�� ���� ������ �� �α���?
SELECT sum(population) FROM tblcountry WHERE continent IN ('EU', 'AF');
    
-- 2. �Ŵ���(108)�� �����ϴ� ������ �޿� ��?
SELECT sum(salary) FROM employees WHERE manager_id = 108;
    
-- 3. ����(ST_CLERK, SH_CLERK)�� ������ ���� �޿� ��?
SELECT sum(salary) FROM employees WHERE job_id IN('ST_CLERK', 'SB_CLERK');
    
-- 4. ����� �λ꿡 �ִ� �������� �޿� ��(�޿� + ����)
SELECT sum(basicpay + sudang) FROM tblinsa WHERE city IN ('����', '�λ�');
    
-- 5. ����, ������� �� �޿� ��?
SELECT sum(basicpay + sudang) FROM tblinsa WHERE jikwi IN('����', '����');

-- avg()
-- 1. �ƽþƿ� ���� ������ ��� �α���?
SELECT avg(population) FROM tblcountry WHERE continent = 'AS';
    
-- 2. �̸�(first_name)�� 'AN'�� ���Ե� �������� �޿� ���?(��ҹ��� ���� ����)
SELECT avg(salary) FROM employees WHERE first_name LIKE '%an%' or first_name LIKE '%AN%';
    
-- 3. ���α�(����,����)�� ��� �޿�?
SELECT avg(basicpay) FROM tblinsa WHERE jikwi IN ('����', '����');
    
-- 4. �����(�븮,���)�� ��� �޿�?
SELECT avg(basicpay) FROM tblinsa WHERE jikwi IN ('���', '�븮');
    
-- max(), min()
-- 1. ������ ���� ���� ������ ����?
SELECT max(area) FROM tblcountry;
    
-- 2. �޿�(�޿� + ����)�� ���� ���� �޴� ����� �޿���?
SELECT min(basicpay + sudang) FROM tblinsa;
    
-- 3. tblhousekeeping ���� ũ�� ���� �ݾ�?(price * qty)
SELECT max(price * qty) FROM tblhousekeeping;

/*
    1. ������� ������ �������ÿ�.(1900��� �� -> ssn)
    [�̸�]    [����]
    ȫ�浿     1980
    �ƹ���     1985
    
    2. ���￡ ��� ������ �� 80���� �������?
    
    3. ���α�(����/����)���� � ��(��,��,��..)�� �ִ���?
    
    4. �������� �¾ �������� �����ؼ� �������ÿ�.(�������� -> ��, �̸�)
    
    5. �̸�(first_name + last_name) �� ���� �� ������� �������ÿ�.
    
    6. �̸�(first_name + last_name)�� ���� ������ �����?
    
    7. last_name�� 4���� ������� first_name�� �����?
*/
-- 1.
SELECT name AS �̸�, '19' || substr(ssn, 1, 2) AS ���� FROM tblinsa;

-- 2.
SELECT * FROM tblinsa WHERE city = '����' and substr(ssn, 1, 2) BETWEEN 80 AND 89 and substr(ssn, 8, 1) = '2';

-- 3. ���α�(����/����)���� � ��(��,��,��..)�� �ִ���?
SELECT DISTINCT subStr(name, 1, 1) AS �� FROM tblinsa WHERE jikwi IN ('����', '����');

-- 4. �������� �¾ �������� �����ؼ� �������ÿ�.(�������� -> ��, �̸�)
SELECT * FROM tblinsa ORDER BY substr(ssn, 3, 2) ASC, name ASC;

-- 5. �̸�(first_name + last_name) �� ���� �� ������� �������ÿ�.
SELECT * FROM employees ORDER BY length(first_name || last_name) DESC;

-- 6. �̸�(first_name + last_name)�� ���� ������ �����?
SELECT max(length(first_name || last_name)) AS ���ڼ� FROM employees;

-- 7. last_name�� 4���� ������� first_name�� �����?
SELECT length(first_name) AS ���ڼ� FROM employees WHERE length(last_name) = 4;

-- 1.
SELECT * FROM tblinsa;

-- 2.
SELECT * FROM tabs;

-- 4.
SELECT name, basicpay FROM tblinsa;

-- 5.
SELECT name, basicpay, sudang, basicpay + sudang FROM tblinsa;

-- 6.
SELECT name AS �̸�, city AS ��ŵ�, buseo AS �μ��� FROM tblinsa;

-- 7.
SELECT name, city, buseo, jikwi FROM tblinsa WHERE city = '����';

-- 8.
SELECT  name, city, basicpay, ssn FROM tblinsa WHERE city = '����' AND basicpay >= 1500000;

-- 9.
SELECT * FROM tblinsa WHERE city = '��õ' AND basicpay BETWEEN 1000000 AND 1999999;

-- 10.
SELECT name, city, buseo FROM tblinsa WHERE city = '����' AND buseo = '���ߺ�';

-- 11.
SELECT name, city, buseo FROM tblinsa WHERE city IN('����', '���');

-- 12.
SELECT * FROM tblinsa WHERE buseo IN('���ߺ�', '������');

-- 13.
SELECT name AS �̸�, basicpay AS �⺻�޿�, sudang AS ����, basicpay + sudang AS �޿� FROM tblinsa WHERE basicpay + sudang >= 2500000;

-- 14.
SELECT * FROM tblinsa WHERE substr(ssn, 8, 1) IN('1', '3');

-- 15.
SELECT * FROM tblinsa WHERE substr(ssn, 1, 2) BETWEEN 80 AND 89;

-- 16.
SELECT * FROM tblinsa WHERE city = '����' AND substr(ssn, 1, 2) BETWEEN 70 AND 79;

-- 17.
SELECT * FROM tblinsa WHERE city = '����' AND substr(ssn, 1, 2) BETWEEN 70 AND 79 AND substr(ssn, 8, 1) IN('1', '3');

-- 18.
SELECT * FROM tblinsa WHERE city = '����' AND substr(name, 1, 1) = '��';

-- 19.
SELECT name, city, ibsadate FROM tblinsa WHERE substr(ibsadate, 1, 2) < substr(sysdate, 1, 2);

-- 20.
SELECT name, city, ibsadate FROM tblinsa WHERE substr(ibsadate, 1, 2) = 00 AND substr(ibsadate, 4, 2) = 10;

-- 21.
SELECT name, ('20' || substr(sysdate, 1, 2)) - ('19' || substr(ssn, 1, 2)) AS ���� FROM tblinsa;

-- 22.
SELECT * FROM tblinsa WHERE substr(('20' || substr(sysdate, 1, 2)) - ('19' || substr(ssn, 1, 2)), 1, 1) = '4';

-- 23.
SELECT * FROM tblinsa WHERE substr(ssn, 4, 1) = '5';

-- 24.
SELECT * FROM tblinsa WHERE to_char(to_date('19' || substr(ssn, 1, 6), 'YYYY-mm-dd'), 'mm') = '05';

-- 25.
SELECT * FROM tblinsa ORDER BY city DESC, basicpay DESC;

-- 26.
SELECT name, city, basicpay + sudang FROM tblinsa WHERE city = '����' ORDER BY basicpay + sudang DESC;

-- 27.
SELECT name, ssn, buseo, basicpay FROM tblinsa WHERE substr(ssn, 8, 1) = '2' ORDER BY buseo ASC, basicpay DESC;

-- 28.
SELECT * FROM tblinsa WHERE substr(ssn, 8, 1) = '1' ORDER BY substr(ssn, 1, 2) ASC;

-- 29.
SELECT * FROM tblinsa WHERE city = '����' ORDER BY to_char(ibsadate, 'yyyymmdd') DESC;

-- 30.
SELECT name, city, basicpay FROM tblinsa WHERE substr(name, 1, 1) <> '��';

-- 31.
SELECT name, city, replace(buseo, '��', '') AS buseo, tel FROM tblinsa WHERE city IN('����', '�λ�', '�뱸') AND (tel LIKE '%5%' OR tel LIKE '%7%');

-- 32.
SELECT
CASE
    WHEN tel IS NOT NULL THEN replace(tel, '-', '')
    WHEN tel IS NULL THEN '��ȭ��ȣ����'
END
FROM tblinsa;

-- 33.
SELECT round(((basicpay + sudang) / 1000000)) || '00������' AS �޿�, count(*) FROM tblinsa GROUP BY round(((basicpay + sudang) / 1000000));

-- 34.
SELECT substr(ssn, 1, 2), count(*) FROM tblinsa GROUP BY substr(ssn, 1, 2);

-- 35.
SELECT name, ssn FROM tblinsa ORDER BY substr(ssn, 3, 2) ASC, substr(ssn, 1, 2) DESC;

-- 36.
SELECT * FROM tblinsa ORDER BY to_char(ibsadate, 'mm') ASC, to_char(ibsadate, 'YYYY') DESC;

-- 37.
SELECT count(*),
        count(decode(substr(ssn, 8, 1), '1', 1)) AS ����,
        count(decode(substr(ssn, 8, 1), '2', 1)) AS ����
FROM tblinsa;

-- 38.
SELECT count(decode(buseo, '���ߺ�', 1)) AS ���ߺ�, count(decode(buseo, '������', 1)) AS ������, count(decode(buseo, '�ѹ���', 1)) AS �ѹ��� FROM tblinsa;

-- 39.
SELECT count(*) FROM tblinsa WHERE city = '����' AND substr(ssn, 8, 1) = '1';

-- 40.
SELECT count(decode(substr(ssn, 8, 1), '1', 1)) AS ����, count(decode(substr(ssn, 8, 1), '2', 1)) AS ���� FROM tblinsa WHERE buseo = '������';

-- 41.
SELECT count(decode(buseo, '���ߺ�', 1)) AS ���ߺ�, count(decode(buseo, '������', 1)) AS ������, count(decode(buseo, '�ѹ���', 1)) AS �ѹ��� FROM tblinsa WHERE city = '����';

-- 42.
SELECT sum(basicpay), sum(decode(substr(ssn, 8, 1), '1', 1)) FROM tblinsa WHERE city = '����';

-- 43.
SELECT (decode(substr(ssn, 8, 1), '1', 1)), basicpay FROM tblinsa;

-- 44.
SELECT decode(substr(ssn, 8, 1), '1', 1), basicpay FROM tblinsa WHERE buseo = '���ߺ�';