/*
    ����ȯ �Լ�
    
    1. to_char() : ���� -> ����
    2. to_char() : ��¥ -> ����
    3. to_number() : ���� -> ����
    4. to_date() : ���� -> ��¥
    
    1. ���� -> ����
    - char to_char(�÷���, ���Ĺ��ڿ�)
    
    ���Ĺ��ڿ� ���� ���
    - �Ʒ��� ��� �̿ܿ��� ���Ĺ��ڿ��� ���Ե� �� ����.
    a. 9 : ���� 1�ڸ��� ���� 1���� �ٲٴ� ����(���ڶ� �ڸ��� �������� ä���) + �Ǿտ� ���� 1�� �߰�(��ȣ)
    b. 0 : ���� 1�ڸ��� ���� 1���� �ٲٴ� ����(���ڶ� �ڸ��� 0���� ä���) + �Ǿտ� ���� 1�� �߰�(��ȣ)
    c. $ : �޷� ǥ�ÿ�
    d. L : Locale(���� ��ȭ ǥ��)
    e. . : �Ҽ��� ǥ�ÿ�
    f. , : õ���� ǥ�ÿ�
*/
SELECT 100, '100' FROM dual;

SELECT to_char(100, '999') FROM dual; -- 100 -> '100'
SELECT to_char(100, '000') FROM dual; -- 100 -> '100'

SELECT to_char(10, '999') FROM dual; -- 10 -> '10'
SELECT to_char(10, '000') FROM dual; -- 10 -> '010'

SELECT to_char(1, '999') FROM dual; -- 1 -> '1'
SELECT to_char(1, '000') FROM dual; -- 1 -> '001'

SELECT '@' || to_char(-111, '999') || '@' FROM dual; -- 1 -> '1'
SELECT '@' || to_char(1, '000') || '@' FROM dual; -- 1 -> '001'

SELECT to_char(1000, '999') FROM dual;

-- 100��
SELECT to_char(100, '$999') FROM dual;
SELECT to_char(100, 'L999') FROM dual;
SELECT to_char(100, '999') || '��' FROM dual;

SELECT to_char(123.456, '999.999') FROM dual;
SELECT to_char(123.456, '999.99') FROM dual; -- �ݿø� + ���ڿ� ��ȯ
SELECT to_char(123.456, '999.9') FROM dual;

SELECT to_char(1000000, '9,999,999') FROM dual;
SELECT to_char(1000000, '999,9999') FROM dual;

/*
    2. ��¥ -> ����
    - varchar2 to_char(�÷���, '���Ĺ��ڿ�')
    
    ���� ���ڿ��� ���� ���
    - YYYY
    - YY
    - mon
    - mm
    - day
    - dy
    - ddd, dd, d
    - hh(hh12), hh24
    - mi
    - ss
    - am(pm)
*/
SELECT to_char(sysdate, 'YYYY-mm-dd hh:mi:ss[am]') FROM dual; -- ddd : 1��1�Ϻ��� ���� �귶����, d : �̹��� �������� ���� �귶���� = ����

-- �������� ���
-- date���� ���ڿ� �Լ��� ������� ����
-- date�� -> ���ڿ��� ����ȯ -> ���ڿ� �Լ� ���

-- 12���� �Ի��� ����?
SELECT name, ibsadate, substr(ibsadate, 1) FROM tblinsa;

SELECT name, ibsadate, to_char(ibsadate, 'mm')
    FROM tblinsa
        WHERE to_char(ibsadate, 'mm') = '12';
        
SELECT * 
    FROM tbltodo
        -- WHERE to_char(adddate, 'am') = '����';
        WHERE to_char(adddate, 'd') = '7'; -- ����� ����� ����
        
-- 97 ~ 99�� ���̿� �Ի��� ���
SELECT * FROM tblinsa 
    -- WHERE to_char(ibsadate, 'YY') = '97' or to_char(ibsadate, 'YY') = '98' or to_char(ibsadate, 'YY') = '99';
    WHERE to_char(ibsadate, 'YY') BETWEEN '97' AND '99';
    
-- ����
SELECT * FROM tblinsa
    -- ORDER BY ibsadate DESC;
    ORDER BY to_char(ibsadate, 'mm') ASC, to_char(ibsadate, 'YY') ASC, to_char(ibsadate, 'dd') ASC, num ASC;
    
/*
    3. ���� -> ����
    - number to_number(���ڿ�)
    - Integer.parseInt(���ڿ�)
*/
SELECT to_number('123') FROM dual;

/*
    4. ���� -> ��¥
    - date to_date(�÷���, '���Ĺ��ڿ�')
    - 2������ ����� ���� ���ڿ��� ����
*/
SELECT '2018-01-16', sysdate FROM dual;
SELECT * FROM tblinsa WHERE ibsadate < '2018-01-16'; -- '2018-01-16' : date

-- ���Ĺ��ڿ� ����� ��� -> ���� ������ ������ �״�� ǥ��
SELECT to_date('2018-01-16 ���� 12:23:34', 'YYYY-mm-dd pm hh:mi:ss') AS �ð�, sysdate FROM dual;
SELECT to_date('2018.01.16 ���� 12:23:34', 'YYYY-mm-dd pm hh:mi:ss') AS �ð�, sysdate FROM dual;
SELECT to_date('20180116 12:23:34', 'YYYY-mm-dd hh24:mi:ss') AS �ð�, sysdate FROM dual;