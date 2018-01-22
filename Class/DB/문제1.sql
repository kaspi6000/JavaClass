-- ����.sql
/*

<<tblcountry>>

1. ������� �������� �������ÿ�.

2. �Ʒ��� ���� �������ÿ�.
- ��Ī(Alias)
- �÷� ����
[������]       [����]        [�α���]       [����]        [���]
���ѹα�        ����          4405            10          AS
..

<<tblname>>
3. �Ʒ��� ���� �������ÿ�.
[�̸�]        [Ű]             [������]          [����]
���缮         178cm        64kg            �޶ѱ�
...

<<tblcountry>>
4. �Ʒ��� ���� �������ÿ�.
[��������]
������:���ѹα�, ������:����, �α���:4405��
..

<<employees>>
5. ������, �̸���, ����ó, �޿��� �������ÿ�.
[�̸�]              [�̸���]                       [����ó]                   [�޿�]
Steven King   SKING@gmail.com     515.123.4567         $24000
..


<<tblname>>
6. �Ʒ��� ���� �������ÿ�.
[�̸�]        [���]
���缮       ���缮�� ������ '�޶ѱ�'�Դϴ�.
..

<<tblslary>>
7. �Ʒ��� ���� �������ÿ�.
[�̸�]        [����]            [��ձ޿�]
ȫ�浿        3100����      250����
..

*/
SELECT * FROM employees;

SELECT '������  ''�޶ѱ�''�Դϴ�.' FROM dual;

SELECT * FROM TBLSALARY;







--1. ������� �������� �������ÿ�.
SELECT name, capital FROM tblcountry;



--2. �Ʒ��� ���� �������ÿ�.
--- ��Ī(Alias)
--- �÷� ����
--[������]       [����]        [�α���]       [����]        [���]
--���ѹα�        ����          4405            10          AS
--..
SELECT name as ������, capital as ����, population as �α���, area as ����, continent as ��� FROM tblcountry;



--3. �Ʒ��� ���� �������ÿ�.
--[�̸�]        [Ű]             [������]          [����]
--���缮         178cm        64kg            �޶ѱ�
--...
SELECT last || first as �̸�, height || 'cm' as Ű, weight || 'kg' as ������, nick FROM tblname;





--4. �Ʒ��� ���� �������ÿ�.
--[��������]
--������:���ѹα�, ������:����, �α���:4405��
--..
SELECT '������ : ' || name || ', ������ : ' || capital || ', �α��� : ' || population as �������� FROM  tblcountry;




--5. ������, �̸���, ����ó, �޿��� �������ÿ�.
--[�̸�]              [�̸���]                       [����ó]                   [�޿�]
--Steven King   SKING@gmail.com     515.123.4567         $24000
--..
SELECT first_name || ' ' || last_name as �̸�, email || '@gmail.com' as �̸���, phone_number as ����ó, '$' || salary as �޿� FROM employees;





--6. �Ʒ��� ���� �������ÿ�.
--[�̸�]        [���]
--���缮       ���缮�� ������ '�޶ѱ�'�Դϴ�.
--..
SELECT last || first as �̸�, last || first || '�� ������ ''' || nick || '''�Դϴ�.' as ��� FROM tblname;




--7. �Ʒ��� ���� �������ÿ�.
--[�̸�]        [����]            [��ձ޿�]
--ȫ�浿        3100����      250����
SELECT name as �̸�, (m1 + m2 + m3 + m4 + m5 + m6 + m7 + m8 + m9 + m10 + m11 + m12) || '����' as ����, ((m1 + m2 + m3 + m4 + m5 + m6 + m7 + m8 + m9 + m10 + m11 + m12) / 12) || '����' as ��ձ޿� FROM tblsalary;




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





--1. ����(area)�� 100������ ������ �̸��� ������ �������ÿ�.
SELECT name, area FROM tblcountry
    WHERE area <= 100;


--2. �ƽþ�(AS)�� ����(EU) ����� ���� ������ �������ÿ�.
SELECT * FROM tblcountry
    WHERE continent = 'AS' or continent = 'EU';


--3. ����(job_id)�� ���α׷���(it_prog)�� ������ �̸�(Ǯ����)�� ����ó �������ÿ�.
SELECT last_name || ' ' || first_name as name, phone_number FROM employees
    WHERE job_id = 'IT_PROG';


--4. last_name�� 'Grant'�� ������ Ǯ����, ����ó, ��볯¥�� �������ÿ�.
SELECT last_name || ' ' || first_name as name, phone_number, hire_date FROM employees
    WHERE last_name = 'Grant';



--5. Ư�� �Ŵ���(120)�� �����ϴ� ������ �̸�, �޿�, ����ó�� �������ÿ�.
SELECT last_name || ' ' || first_name as name, salary, phone_number FROM employees
    WHERE manager_id = 120;




--6. Ư�� �μ�(60, 80, 100)�� ���� �������� �̸�, ����ó, �̸���, �μ�ID�� �������ÿ�.
SELECT last_name || ' ' || first_name as name, phone_number, email, department_id FROM employees
    WHERE department_id = 60 or department_id = 80 or department_id = 100;



--7. ��ȹ�� ������ �������ÿ�.
SELECT * FROM tblinsa
        WHERE buseo = '��ȹ��';



--8. ���￡ �ִ� ������ �� ������ ������ ����� �̸�, ����, ��ȭ��ȣ �������ÿ�.
SELECT name, jikwi, tel FROM tblinsa
        WHERE jikwi = '����' and city = '����';




--9. �⺻�޿� + ���� ���ļ� 150���� �̻��� ���� �� ���￡ �ִ� ������ �������ÿ�.
SELECT * FROM tblinsa
        WHERE (basicpay + sudang) >= 1500000 and city = '����';



--10. ������ 15���� ������ ���� �� ������ ��� or �븮�� ������ �������ÿ�.
SELECT * FROM tblinsa
        WHERE sudang <= 150000 and (jikwi = '���' or jikwi = '�븮');




--11. ������ ������ �⺻ ������ 2õ���� �̻� + ���� + ����(����)�� �������ÿ�.
SELECT * FROM tblinsa
        WHERE (basicpay * 12) >= 20000000 and city = '����' and (jikwi = '����' or jikwi = '����');



--12. 1990��뿡 �Ի��� ���� �� ���� or ������ �������� ����� �������ÿ�.
SELECT * FROM tblinsa
        WHERE ibsadate >= '1990-01-01' and ibsadate < '2000-01-01' and (jikwi <> '����' and jikwi <> '����');



--13. 2000�� ~ 2002�� ���̿� �Ի��� ȫ���� ������ �������ÿ�.
SELECT * FROM tblinsa
        WHERE ibsadate >= '2000-01-01' and ibsadate < '2003-01-01' and buseo = 'ȫ����';



--14. ���� �� Ű�� 170 �̸��� ����� �������ÿ�.
SELECT * FROM tblname
        WHERE gender = 'm' and height < 170;



--15. �ھ� ���� ���� ���ڸ� �������ÿ�.
SELECT * FROM tblname
        WHERE last = '��' and gender = 'f';


--16. ��� �޿��� 250������ �Ѵ� ����� �������ÿ�.
SELECT * FROM tblsalary
        WHERE ((m1 + m2 + m3 + m4 + m5 + m6 + m7 + m8 + m9 + m10 + m11 + m12) / 12) >= 250;




--17. ��ݱ�(1~6��)���� �Ϲݱ�(7~12��)�� ������ ���� ����� �������ÿ�.
SELECT * FROM tblsalary
        WHERE (m1 + m2 + m3 + m4 + m5 + m6) < (m7 + m8 + m9 + m10 + m11 + m12);



/*

������(where) - between, in, like, distinct

<<tblcountry>>
1. �������� 'O��'�� ���� �������ÿ�.
    a. ������ 2���� -> _
    b. ������ ���ڼ� ������� -> %

<<employees>>
2. ����ó�� 515�� �����ϴ� �������� �������ÿ�.

3. ���� ID�� 'SA'�� �����ϴ� �������� �������ÿ�.

4. first_name��  'de'�� �� �������� �������ÿ�.(��ҹ��� ������� - ���ڿ� �Լ�X)

<<tblinsa>>
5. ���� ������ �������ÿ�.

6. ���� ������ �������ÿ�.

7. ������ �¾ �������� �������ÿ�.(7~8����)

8. ����, ��õ�� ��� �达�鸸 �������ÿ�.

9. ������,�ѹ���,���ߺ� ���� �� �����(���,�븮) �� 010 ����ڸ� �������ÿ�.

10. ����, ��õ, ��⿡ ��� �Ի����� 1998~2000�� ������ �������� �������ÿ�.

<<employees>>
11. �μ��� ���� ������ �ȵ� �������� �������ÿ�.

-- distinct
12. ������ � ������ �ִ���? (��, NULL ����)

13. ������� 2002~2004�� ������ �������� ��� �μ��� �ٹ��ϴ���?

14. �޿��� 5000�� �̻��� �������� ��� �Ŵ����� ��������?

<<tblinsa>>
15. ���� ���� + 80���� -> ����?

16. ���� 20���� �Ѵ� �������� ��� �����?

17. ����ó�� ���� ���� ������ ��� �μ��� �ҼӵǾ� �ִ���?



<<tbldiary>>
18. 2018�� 1�� 20�� ���Ŀ� ������ �����?
19. '����Ŭ', '�ڹ�', '�ڵ�' �̶�� Ű���尡 �� ������ ������ �����?

<<tblhousekeeping>>
20. ���� �� ����(price * qty)�� 50000~100000�� �̳� ���?

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
4. ����� �λ꿡 �ִ� �������� �޿� ��(�޿� + ����)?
5. ����, ������� �� �޿���?

avg()
1. �ƽþƿ� ���� ������ ��� �α���?
2. �̸�(first_name)�� 'AN'�� ���Ե� �������� �޿� ���?(��ҹ��� ���о���)
3. ���α�(����,����)�� ��� �޿�?
4. �����(�븮,���)�� ��� �޿�?

max(), min()
1. ������ ���� ���� ������ ����?
2. �޿�(�޿�+����)�� ���� ���� �޴� ����� �޿���?
3. tblhousekeeping ���� ũ�� ���� �ݾ�? (price * qty)


*/




-- 1. �������� 'O��'�� ���� �������ÿ�.
--     a. ������ 2���� -> _
--     b. ������ ���ڼ� ������� -> %

SELECT * FROM tblcountry
      WHERE name like '_��';

SELECT * FROM tblcountry
      WHERE name like '%��';


-- 2. ����ó�� 515�� �����ϴ� �������� �������ÿ�.
SELECT * FROM employees
      WHERE phone_number like '515%';


-- 3. ���� ID�� 'SA'�� �����ϴ� �������� �������ÿ�.
SELECT * FROM employees
      WHERE job_id like 'SA%';


-- 4. first_name��  'de'�� �� �������� �������ÿ�.(��ҹ��� ������� - ���ڿ� �Լ�X)
SELECT * FROM employees
      WHERE first_name like '%de%'
            or first_name like '%DE%'
            or first_name like '%De%'
            or first_name like '%dE%';




-- 5. ���� ������ �������ÿ�.
SELECT * FROM tblinsa
      WHERE ssn like '%-1%';

-- 6. ���� ������ �������ÿ�.
SELECT * FROM tblinsa
      WHERE ssn like '%-2%';

-- 7. ������ �¾ �������� �������ÿ�.(7~8����)
SELECT * FROM tblinsa
      WHERE ssn like '__07%' or ssn like '__08%';

-- 8. ����, ��õ�� ��� �达�鸸 �������ÿ�.
SELECT * FROM tblinsa
      WHERE city in ('����', '��õ') and name like '��%';

-- 9. ������,�ѹ���,���ߺ� ���� �� �����(���,�븮) �� 010 ����ڸ� �������ÿ�.
SELECT * FROM tblinsa
      WHERE buseo in ('������', '�ѹ���', '���ߺ�') and jikwi in ('���', '�븮') and tel like ('010%');

-- 10. ����, ��õ, ��⿡ ��� �Ի����� 1998~2000�� ������ �������� �������ÿ�.
SELECT * FROM tblinsa
      WHERE city in ('����', '��õ', '���')
            and ibsadate BETWEEN '1998-01-01' AND '2001-01-01';


--11. �μ��� ���� ������ �ȵ� �������� �������ÿ�.
SELECT * FROM employees
      WHERE department_id IS  NULL ;


-- 12. ������ � ������ �ִ���? (��, NULL ����)
SELECT distinct job_id from employees;

-- 13. ������� 2002~2004�� ������ �������� ��� �μ��� �ٹ��ϴ���?
SELECT DISTINCT  department_id FROM employees
      WHERE hire_date BETWEEN '2002-01-01' AND  '2005-01-01';

SELECT DISTINCT  buseo FROM tblinsa
      WHERE ibsadate BETWEEN '2002-01-01' AND  '2005-01-01';

-- 14. �޿��� 5000�� �̻��� �������� ��� �Ŵ����� ��������?
SELECT DISTINCT manager_id FROM employees
      WHERE salary >= 5000;


-- 15. ���� ���� + 80���� -> ����?
SELECT DISTINCT jikwi FROM tblinsa
      WHERE ssn like '8%-1%' ;


-- 16. ���� 20���� �Ѵ� �������� ��� �����?
SELECT DISTINCT city FROM tblinsa
      WHERE sudang >= 200000;



-- 17. ����ó�� ���� ���� ������ ��� �μ��� �ҼӵǾ� �ִ���?
SELECT DISTINCT buseo FROM tblinsa
      WHERE tel IS NULL ;





-- 18. 2018�� 1�� 20�� ���Ŀ� ������ �����?
SELECT DISTINCT weather FROM tbldiary
      WHERE regdate >= '2018-01-20';


-- 19. '����Ŭ', '�ڹ�', '�ڵ�' �̶�� Ű���尡 �� ������ ������ �����?
SELECT DISTINCT weather FROM tbldiary
      WHERE subject like '%����Ŭ%' or subject like '%�ڹ�%' or subject like '%�ڵ�%';


--20. ���� �� ����(price * qty)�� 50000~100000�� �̳� ���?
SELECT * FROM tblhousekeeping
      WHERE price * qty BETWEEN 50000 AND 100000;


-- 21. 2018�� 1�� 5�� ~ 2018�� 1�� 10�� �̳��� ����� �� �� ���� �ϷḦ ���� �ϵ�?
SELECT * FROM tbltodo
      WHERE adddate BETWEEN '2018-01-05' AND '2018-01-11'
            AND completedate IS NULL ;


-- 22. '~�ϱ�' ��� ������ ���� �� �� �� �Ϸ��� �ϵ���?
SELECT * FROM tbltodo
      WHERE title like '%�ϱ�' AND completedate IS NOT NULL ;


-- 23. ���� �������� ����?
SELECT DISTINCT jikwi FROM tblinsa
      WHERE ssn like '%-2%';

-- 24. ȫ���� �������� ��°�?
SELECT DISTINCT city FROM tblinsa
      WHERE buseo = 'ȫ����';



-- 25. ����ģ���� �����鼭 �����Ը� �� �� ���� ���?
SELECT * FROM tblmen
      WHERE couple IS NOT NULL AND weight IS NULL ;


-- 26. ����ģ���� '��'���̸鼭 �ڽ��� '��'���� ���?
SELECT * FROM tblmen
      WHERE couple like '��%' and name like '��%';





-- 1. �ƽþƿ� ������ ���� ������ ���?
SELECT count(*) FROM tblcountry
      WHERE continent in ('AS', 'EU');

-- 2. �α��� 5000 ~ 20000 ���̿� ���ϴ� ������ ���?
SELECT count(*) FROM tblcountry
      WHERE population BETWEEN 5000 AND 20000;


--3. IT_PRO �߿��� �޿��� 5000�� �Ѵ� ���� ���?
SELECT count(*) FROM employees
      WHERE job_id = 'IT_PROG' AND salary >= 5000;



-- 4. ����ó�� 010�� �ƴ� ����� ���?(����ó �ִ� ����� �߿���)
SELECT count(*) FROM tblinsa
      WHERE NOT tel like '010%'  AND tel IS NOT NULL ;

-- 5. ���� ��� ���� ���?
SELECT count(*) FROM tblinsa
      WHERE city <> '����';


-- 6. ���� ���� ���?
SELECT count(*) FROM tblinsa
      WHERE ssn like '%-2%';


--7. �ַΰ� ���?
SELECT count(*) FROM tblmen
      WHERE couple IS NULL ;


--8. ���� �Ѿ��� 3������ �Ѵ� ���Ÿ� �� ��ȸ?
SELECT * FROM tblhousekeeping
      WHERE (price * qty) >= 30000;



-- 1. EU�� AF�� ���� ������ �� �α���?
SELECT sum(population) FROM tblcountry
      WHERE continent in ('EU', 'AF');

-- 2. �Ŵ���(108)�� �����ϴ� ������ �޿� ��?
SELECT sum(salary) FROM employees
      WHERE manager_id = 108;

-- 3. ����(ST_CLERK, SH_CLERK)�� ������ ���� �޿� ��?
SELECT sum(salary) FROM employees
      WHERE job_id in ('ST_CLERK', 'SH_CLERK');

-- 4. ����� �λ꿡 �ִ� �������� �޿� ��(�޿� + ����)?
SELECT sum(basicpay + sudang) FROM tblinsa
      WHERE city in ('����', '�λ�');

-- 5. ����, ������� �� �޿���?
SELECT sum(basicpay) FROM tblinsa
      WHERE jikwi in ('����', '����');



-- 1. �ƽþƿ� ���� ������ ��� �α���?
SELECT avg(population) FROM tblcountry
      WHERE continent = 'AS';

-- 2. �̸�(first_name)�� 'AN'�� ���Ե� �������� �޿� ���?(��ҹ��� ���о���)
SELECT avg(salary) FROM employees
      WHERE first_name like '%AN%'
            OR first_name like '%an%'
            OR first_name like '%An%'
            OR first_name like '%aN%';

-- 3. ���α�(����,����)�� ��� �޿�?
SELECT avg(basicpay) FROM tblinsa
      WHERE jikwi in ('����', '����');

-- 4. �����(�븮,���)�� ��� �޿�?
SELECT avg(basicpay) FROM tblinsa
      WHERE jikwi in ('�븮', '���');


-- 1. ������ ���� ���� ������ ����?
SELECT max(area) FROM tblcountry;

-- 2. �޿�(�޿�+����)�� ���� ���� �޴� ����� �޿���?
SELECT min(basicpay + sudang) FROM tblinsa;

-- 3. tblhousekeeping ���� ũ�� ���� �ݾ�? (price * qty)
SELECT max(price * qty) FROM tblhousekeeping;





