/*
    group by ��
    - ���ڵ���� Ư�� �÷����� ���缭 �׷��� ������ �۾�
    - �׷��� �� ������?
        1. �׷��� ������ �����Ϸ���?
        2. ���� �׷��� ������ ���̺�� ����� ���ؼ� ? X
        3. ������ �׷캰�� �����Լ��� �����ϱ� ���� O
    - group by Ű
        : �׷��� �����µ� ������ �Ǵ� �÷�(1�� or �̻�)
    - group by ��� �� �÷�����Ʈ�� �� �� �ִ� ���
        a. ���� �Լ�
        b. group by Ű(group by ��� �÷�)
        c. �� �ܿ��� ������ �÷� ��� �Ұ���
        
    group by ����
    - select �÷�����Ʈ
        from ���̺�
            [where ����]
                [group by �׷�]
                    [order by ����]
*/

-- �μ��� ��� �޿�?
SELECT round(avg(basicpay)) FROM tblinsa; -- 155���� -- ��ü ������ ��� ����

SELECT DISTINCT buseo FROM tblinsa;

SELECT round(avg(basicpay)) FROM tblinsa WHERE buseo = '�ѹ���'; -- 171
SELECT round(avg(basicpay)) FROM tblinsa WHERE buseo = '���ߺ�'; -- 138
SELECT round(avg(basicpay)) FROM tblinsa WHERE buseo = '������'; -- 160
SELECT round(avg(basicpay)) FROM tblinsa WHERE buseo = '��ȹ��'; -- 185
SELECT round(avg(basicpay)) FROM tblinsa WHERE buseo = '�λ��'; -- 153
SELECT round(avg(basicpay)) FROM tblinsa WHERE buseo = '�����'; -- 141
SELECT round(avg(basicpay)) FROM tblinsa WHERE buseo = 'ȫ����'; -- 145

SELECT buseo, round(avg(basicpay)) FROM tblinsa GROUP BY buseo;

SELECT buseo, count(*) FROM tblinsa GROUP BY buseo;

SELECT * FROM tblcountry GROUP BY name; --group by Ű���� PK�� ��� ����.

SELECT continent, count(*) FROM tblcountry GROUP BY continent;

SELECT * FROM tabs;

SELECT substr(ssn, 8, 1), count(*) FROM tblinsa GROUP BY substr(ssn, 8, 1);

SELECT to_char(ibsadate, 'mm'), count(*) FROM tblinsa GROUP BY to_char(ibsadate, 'mm') ORDER BY to_char(ibsadate, 'mm') ASC;

SELECT substr(name, 1, 1), count(*) FROM tblinsa GROUP BY substr(name, 1, 1) ORDER BY count(*) DESC, substr(name, 1, 1) ASC;

SELECT floor(basicpay / 1000000) * 100 || '������', count(*) FROM tblinsa GROUP BY floor(basicpay / 1000000) ORDER BY floor(basicpay / 1000000);

-- 1. SELECT - 4
-- 2. FROM - 1
-- 3. WHERE - 2
-- 4. GROUP BY - 3
-- 5. ORDER BY - 5

-- ���� ?
-- ���� X : tblinsa���� buseo���� ��� �޿��� ����������.
-- ���� O : tblinsa���� �� ������ ������ 2�鸸�� �̻��� ������� ������� buseo�� �׷��� ������ ��� �޿��� �������ÿ�.
SELECT buseo, avg(basicpay)
    FROM tblinsa
        WHERE basicpay >= 2000000
            GROUP BY buseo;
            
-- ���� X : �������� �׷� ���� �� �� ������ ������ �� ���� ������ ���� ����� ����?
-- ���� O : �븮�� ����鿡 ���ؼ� �������� �׷� ���� �� ���� ������ ���� ���?
SELECT city, max(basicpay), count(*)
    FROM tblinsa
        WHERE jikwi IN('�븮', '���')
            GROUP BY city;
            
/*
    having��(��)
    - GROUP BY ���� �Բ� ���
    - ������(WHERE���� ��������)
    - having�� �� �� �ִ� ����� GROUP BY ���� ����
    - having ��� : �����Լ� or GROUP BY Ű
*/

-- �μ��� ��� ����?
SELECT buseo, round(avg(basicpay)) FROM tblinsa
    GROUP BY buseo;
        
SELECT buseo, round(avg(basicpay)) FROM tblinsa
    WHERE basicpay >= 2000000
        GROUP BY buseo;
        
SELECT buseo, round(avg(basicpay)) FROM tblinsa
    GROUP BY buseo
        HAVING avg(basicpay) >= 1500000;
        
-- 1. SELECT - 5
-- 2. FROM - 1
-- 3. WHERE - 2
-- 4. GROUP BY - 3
-- 5. HAVING - 4
-- 6. ORDER BY - 6

SELECT buseo, jikwi, count(*) FROM tblinsa
    GROUP BY buseo, jikwi
        ORDER BY buseo ASC, jikwi ASC;