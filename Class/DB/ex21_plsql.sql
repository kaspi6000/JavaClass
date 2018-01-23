/*
    PL/SQL
    - Procedural Language Extensions to SQL
    - ǥ�� SQL : �� ������ ���(������ ����, ���������� �ʴ�.)
    - ǥ�� SQL + ������ ��� �߰� -> ����Ŭ �߰� SQL -> PL/SQL
    - �߰��� �κ� -> �ڹ��� ���α׷��� ��� �߰�(����, ���, �޼ҵ� ��..)
    - ����Ŭ ���� SQL
    
    - ǥ�� SQL <-> PL/SQL : �ڷ��� ȣȯ�� �ȴ�.
    - ǥ�� SQL : ���� ������ �ʼ� X
    - PL/SQL : ���� ������ �ʼ� O
    
    SQL ó�� ���� & ����
    1. ǥ�� SQL
     : Ŭ���̾�Ʈ ���� �ۼ�(SELECT ��) -> ����(Ctrl + Enter) -> ��Ʈ��ũ�� ���� SQL�� DBMS �������� ���� -> ���� �м�(�Ľ�) -> ������ -> ���� ����(CPU) -> ��� ó��
     : ������ ������ ���� SQL�� �ٽ� ���� -> ���� ���� ó������ ������ �ٽ� �ݺ�(**)
    
    2. PL/SQL
     : Ŭ���̾�Ʈ ���� �ۼ�(SELECT ��) -> ����(Ctrl + Enter) -> ��Ʈ��ũ�� ���� SQL�� DBMS �������� ���� -> ���� �м�(�Ľ�) -> ������ -> ���� ����(CPU) -> ��� ó��
        2.a ó�� ���� : ���� ���� ó�� ~ ������ ����(ǥ�� SQL�� ������ ���)
        2.b ���� �ݺ� ���� : ���� �м�(�Ľ�) ~ ������ �κ��� ����
         : (����) ���ν��� -> Stored Procedure : �ڹ��� �޼ҵ�(�Լ�)
         
    ���ν���, Procedure
    - �޼ҵ�, �Լ�, �����ƾ ��..Ư�� ������ ������ ���� ������� ������ ��ɾ��� ����
    1. �͸� ���ν��� -> �̸����� -> ��ȣ���� �������� ���� �ʴ� ���ν���
    2. �͸� ���ν��� -> �̸����� -> ��ȣ���� �������� �ϴ� ���ν���
*/
set serveroutput on;

BEGIN
    dbms_output.put_line('Hello'); --syso
END;

/*
    PL/SQL
    - ���α׷��� ����� ���� + ǥ�� SQL
    - �ַ� ���ν��� ���·� ��� -> �� ���·� ���
    
    PL/SQL �� ����
    1. 4�� Ű����� ����
    - DECLARE
    - BEGIN
    - EXCEPTION
    - END;
    
    2. DECLARE
    - �����, declare section
    - ���α׷����� ���Ǵ� ����, ��ü ���� �����ϴ� ����
    - ���� ����
    
    3. BEGIN
    - �����, ������, executable section
    - BEGIN ~ END
    - ���α׷����� ���� ���� ������ �����ϴ� ����
    - ����, ����, ǥ�� SQL ������ ����
    - ���� �Ұ���
    
    4. EXCEPTION
    - ���� ó����, exception section
    - catch �� ����
    - ���� ó�� �ڵ带 �����ϴ� ����
    - ���� ����
    
    5. END;
    - ���� ����
    - ���� �Ұ���
    
    6. PL/SQL �� = ����� + ����� + ����ó����
    
    �ڹ�
    {
        {
        
        }
    }
    ����Ŭ
    BEGIN
        BEGIN
        
        END;
    END;
    
    DECLARE
        ����, �ڿ� �����ϱ�
    BEGIN
        ������
    EXCEPTION
        ����ó����
    END;
    
    �ڷ��� & ����
    
    �ڷ���
    - ����Ŭ�� ����(���� ����)
    
    ���� �����ϱ�
    - ������ �ڷ��� [NOT NULL] [DEFAULT ��]
    - ������ ���� : ������ ����� ���ڰ��� �����ϴ� �뵵
    
    ������
    - ǥ�� SQL�� ����
    
    ǥ�� SQL ���� ������
    - �뵵 : �÷��� ����
    - �÷��� = ��
    
    PL/SQL ������
    - �뵵 : ������ ����
    - ���� := ��
*/
DECLARE
    num NUMBER;
    name VARCHAR2(30);
    today DATE;
BEGIN
    num := 10; -- ������ ���(���ͷ�)
    dbms_output.put_line(num);
    
    name := 'ȫ�浿'; -- ���ڿ� ���(���ͷ�)
    dbms_output.put_line(name);
    
    today := sysdate;
    dbms_output.put_line(today);
    dbms_output.put_line(to_char(today, 'YYYY-mm-dd'));
END;

DECLARE
    num NUMBER DEFAULT 100; --NULL ���
    age NUMBER NOT NULL DEFAULT 200;
BEGIN

    -- default ����� ������ NULL ���·� ���� ����ϸ� �ڵ����� default���� ���Եȴ�.
    
    -- num
    dbms_output.put_line(num);
    
    -- age
    dbms_output.put_line(age);
END;

/*
    ���̺��� ��ȸ�� �����͸� ������ ��ƾ��ϴ� ���
    - ������ ����� ���ϰ��̿��� �Ѵ�.(���� �÷� or ���� ���ڵ� ��� �Ұ���)
     a. ������� 1���� ���ڵ�� 1���� �÷����� ����(PK ������)
     b. ���� �Լ��� �����
*/
DECLARE
    vbuseo VARCHAR2(15);
BEGIN
    -- �ϳ��� �÷����� �ϳ��� ������ ����
    SELECT buseo INTO vbuseo FROM tblinsa WHERE name = 'ȫ�浿';
    dbms_output.put_line('ȫ�浿�� �μ��� ' || vbuseo || '�Դϴ�');
END;

DECLARE
    vsalary NUMBER; -- ��� �޿�(basicpay + sudang)
BEGIN

    -- ���� := ��;
    -- �÷��� into ����
    SELECT round(avg(basicpay + sudang)) INTO vsalary FROM tblinsa;
    dbms_output.put_line(vsalary);
END;

/*
    SELECT INTO ��
    1. 1���� ������� 1���� ������ ����(1:1)
    2. N���� ������� N���� ������ ����(N:N) �� ������� ������ ������ ������ ��ġ
*/

DECLARE
    vname VARCHAR2(20);
    vbuseo VARCHAR2(15);
    vjikwi VARCHAR2(15);
    vbasicpay NUMBER;
BEGIN
    SELECT name, buseo, jikwi, basicpay INTO vname, vbuseo, vjikwi, vbasicpay FROM tblinsa WHERE num = 1001;
    dbms_output.put_line(vname || '�� ''' || vbuseo || '''�� �ٹ��ϴ� ''' || vjikwi || '''�Դϴ�.');
END;

/*
    ������ ����
    - ����(�÷�)�� �ڷ����� ���� �ȴ�.
    - ���� �������� ����
    - ���̺�� �並 ������� �Ѵ�.
    
    1. %type
    - ����ϴ� ���̺� Ư�� �÷��� �ڷ����� ���̸� �����ؼ� �̰��� �����ϰڽ��ϴ�.
    - ����Ǵ� ����
        a. �ڷ���
        b. ����
        c. NOT NULL ����
*/
DECLARE
    vname tblinsa.name%type; -- vname VARCHAR2(20)
BEGIN
    SELECT name INTO vname FROM tblinsa WHERE basicpay = (SELECT max(basicpay) FROM tblinsa);
    dbms_output.put_line(vname);
END;

DECLARE
    vfirst tblname.first%type;
BEGIN

    SELECT first INTO vfirst FROM tblname WHERE nick = '�޶ѱ�';
    dbms_output.put_line(vfirst);
    
    SELECT first INTO vfirst FROM tblname WHERE nick = '�̽ʳ�';
    dbms_output.put_line(vfirst);
    
    SELECT first INTO vfirst FROM tblname WHERE nick = '���߾�';
    dbms_output.put_line(vfirst);
    
    vfirst := '���';
    dbms_output.put_line(vfirst);
END;

DECLARE
    vbasicpay tblinsa.basicpay%type;
    vname tblinsa.name%type;
BEGIN

    SELECT max(basicpay) INTO vbasicpay FROM tblinsa; --2650000
    
    SELECT name INTO vname FROM tblinsa WHERE basicpay = vbasicpay;
    
    dbms_output.put_line(vname);
END;

DECLARE
    vcouple tblmen.couple%type;
BEGIN

    -- ȫ�浿�� ����ģ�� �ٶ� -> ������
    -- SELECT * FROM tblmen; -- ȫ�浿 - �嵵��
    
    -- 1.
    SELECT couple INTO vcouple FROM tblmen WHERE name = 'ȫ�浿';
    
    -- 2.
    UPDATE tblmen SET couple = vcouple WHERE name = '������';
    
    -- 3.
    UPDATE tblmen SET couple = NULL WHERE name = 'ȫ�浿';
    
    -- 4.
    -- SELECT * FROM tblwomen;
    UPDATE tblwomen SET couple = '������' WHERE name = vcouple;
END;

SELECT * FROM tblmen;
SELECT * FROM tblwomen;

-- tblinsa ���� �� �Ϻο��� ������ ���ʽ� ���� ����
CREATE TABLE tblbonus(
    seq NUMBER PRIMARY KEY,
    name VARCHAR2(15) NOT NULL, -- ����Ű(�ٸ� ���̺� PK ����)
    -- num NUMBER REFERENCES tblinsa(num), -- ����
    bonus NUMBER NOT NULL
);

DECLARE
    vname tblinsa.name%type;
    vsudang tblinsa.sudang%type;
BEGIN

    SELECT name, sudang * 3 INTO vname, vsudang FROM tblinsa WHERE city = '����' AND jikwi = '����' AND months_between(sysdate, ibsadate) / 12 >= 20;
    
    -- dbms_output.put_line(vname);
    -- dbms_output.put_line(vsudang);
    
    INSERT INTO tblbonus VALUES(1, vname, vsudang);
END;

SELECT * FROM tblbonus;

/*
    2. %rowtype
    - ���̺��� ���ڵ� ������ �����Ѵ�.(%type : �÷� ����)
    - %type �� ����
*/
DECLARE
    --vrow tblinsa.�÷���%type;
    vrow tblinsa%rowtype; -- ���ڵ��� Ÿ�� ��ü�� ����(�÷� 10�� ����)
BEGIN

--    SELECT num, name, ssn, ibsadate, city, tel, buseo, jikwi, basicpay, sudang
--        INTO vnum, vname, vssn, vibsadate, vcity, vtel, vbuseo, vjikwi, vbasicpay, vsudang
--            FROM tblinsa WHERE num = 1001;
    SELECT * INTO vrow FROM tblinsa WHERE num = 1001;
    dbms_output.put_line(vrow.num);
    dbms_output.put_line(vrow.name);
    dbms_output.put_line(vrow.ssn);
    dbms_output.put_line(vrow.ibsadate);
    dbms_output.put_line(vrow.city);
    dbms_output.put_line(vrow.tel);
    dbms_output.put_line(vrow.buseo);
    dbms_output.put_line(vrow.jikwi);
    dbms_output.put_line(vrow.basicpay);
    dbms_output.put_line(vrow.sudang);
END;

-- tblmen -> tblwomen : �ű��
DECLARE
    vrow tblmen%rowtype;
BEGIN

    -- SELECT * FROM tblmen;
    -- �̵� = ���� + ����
    
    -- 1. ���� : select -> insert
    SELECT * INTO vrow FROM tblmen WHERE name = '������';
    
    -- dbms_output.put_line(vrow.name);
    -- dbms_output.put_line(vrow.age);
    
    INSERT INTO tblwomen VALUES(vrow.name, vrow.age, vrow.height, vrow.weight, vrow.couple);
    
    -- 2. ����
    DELETE FROM tblmen WHERE name = '������';
END;

SELECT * FROM tblmen;
SELECT * FROM tblwomen;

/*
    ���
    - ���ͷ�X
    - �ڹ� : final double PI = 3.14;
    - ����� constant �ڷ��� [NOT NULL] [DEFAULT]
*/

DECLARE
    -- num NUMBER := 100;
    PI CONSTANT NUMBER(3, 2) := 3.14;
BEGIN

    -- PI := 5.24; -- ���Ҵ� �ȵ�
    dbms_output.put_line(PI);
END;

/*
    �ĺ���(DB Object)
    - ������ �� ��� Ű���带 �빮�ڷ� ��ȯ -> ����
    - ������ + ���� + _
    - ���� ���� X
    - ����� ��� X -> "�����" -> ���� ����
    - �ִ� ���� ���� 30����Ʈ ����(UTF-8)
        : ���� ���� �̸�
        ex) tblcountry + name + primary key
            name VARCHAR2(20) CONSTRAINT tblcountry_name_pk PRIMARY KEY
*/
CREATE TABLE "NUMBER"(
    seq NUMBER PRIMARY KEY
);

INSERT INTO "NUMBER" VALUES(100);
SELECT * FROM "NUMBER";

CREATE TABLE tblnumber(
    seq NUMBER CONSTRAINT tblnumber_seq_pk_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa PRIMARY KEY
);

DROP TABLE tblnumber;

/*
    ���
*/

-- ���ǹ� : if��
DECLARE
    vnum NUMBER;
BEGIN
    
    vnum := 10;
    
    IF vnum > 0 THEN
        dbms_output.put_line('���');
    END IF;
    
    IF vnum > 0 THEN
        dbms_output.put_line('���');
    ELSE
        dbms_output.put_line('����');
    END IF;
    
    IF vnum > 0 THEN
        dbms_output.put_line('���');
    ELSIF vnum < 0 THEN
        dbms_output.put_line('����');
    ELSE
        dbms_output.put_line('0');
    END IF;
END;

DECLARE
    vgender CHAR(1); --�ֹι�ȣ 1�ڸ�
    vnumber NUMBER; --���� ��ȣ
BEGIN
    -- ���� ������ ���ڸ� A ���� ���� or ���ڸ� B ���� ����
    vnumber := 1003;
    SELECT substr(ssn, 8, 1) INTO vgender FROM tblinsa WHERE num = vnumber;
    
    IF vgender = '1' THEN
        UPDATE tblinsa SET basicpay = basicpay + 100000 WHERE num = vnumber;
    ELSE
        UPDATE tblinsa SET sudang = sudang + 100000 WHERE num = vnumber;
    END IF;
END;

SELECT * FROM tblinsa WHERE num = 1001;
SELECT * FROM tblinsa WHERE num = 1003;

DECLARE
    vrow tblinsa%rowtype;
BEGIN

    SELECT * INTO vrow FROM tblinsa WHERE num = 1001;
    
    -- �޿� 2�鸸�� �̻� + ����(����)�� ?
    IF vrow.basicpay >= 2000000 AND vrow.jikwi IN('����', '����') THEN
        dbms_output.put_line('����');
    ELSE
        dbms_output.put_line('����');
    END IF;
END;

/*
    case ��
    - �ڹ� : switch case ��
    - ǥ�� case���� ����
*/

DECLARE
    vcontinent tblcountry.continent%type;
    vresult VARCHAR2(30);
    vpopulation tblcountry.population%type;
BEGIN
    
    -- ���ѹα��� ��� ����� ���ϴ���?
    SELECT continent, population INTO vcontinent, vpopulation FROM tblcountry WHERE name = '���ѹα�';
    dbms_output.put_line(vcontinent);
    
    IF vcontinent = 'AS' THEN
        vresult := '�ƽþ�';
    ELSIF vcontinent = 'EU' THEN
        vresult := '����';
    ELSIF vcontinent = 'AF' THEN
        vresult := '������ī';
    END IF;
    
    dbms_output.put_line(vresult);
    
    CASE
        WHEN vcontinent = 'AS' THEN vresult := '�ƽþ�';
        WHEN vcontinent = 'EU' THEN vresult := '����';
        WHEN vcontinent = 'AF' THEN vresult := '������ī';
    END CASE;
    
    CASE vcontinent
        WHEN 'AS' THEN vresult := '�ƽþ�';
        WHEN 'EU' THEN vresult := '����';
        WHEN 'AF' THEN vresult := '������ī';
    END CASE;
    
    dbms_output.put_line(vresult);
    
    -- �α����� ���� ���� �б�
    CASE
        WHEN vpopulation > 10000 THEN vresult := '�ʹ� ����';
        WHEN vpopulation > 5000 THEN vresult := '���� ����';
        WHEN vpopulation > 1000 THEN vresult := '������';
        ELSE vresult := '���ڶ�';
    END CASE;
    dbms_output.put_line(vresult);
END;

/*
    �ݺ���
    1. LOOP
    - ���� �ݺ�
    
    2. FOR LOOP
    - ���� Ƚ�� �ݺ�(�ڹ� for��)
    
    3. WHILE LOOP
    - ���� �ݺ�(�ڹ� while��)
*/

BEGIN

    LOOP
        dbms_output.put_line('�ȳ��ϼ���.' || sysdate);
        EXIT;
    END LOOP;
END;

DECLARE
    vnum NUMBER;
BEGIN
    vnum := 1;
    
    LOOP
        dbms_output.put_line(vnum);
        vnum := vnum + 1;
        EXIT WHEN vnum = 11;
    END LOOP;
END;

DECLARE
    vnow DATE;
BEGIN
    
    LOOP
        vnow := sysdate;
        dbms_output.put_line('���� �ð��� ' || to_char(vnow, 'hh24:mi:ss') || '�Դϴ�');
        EXIT WHEN to_char(vnow, 'ss') = '59';
    END LOOP;
    dbms_output.put_line('����');
END;

CREATE TABLE tblloop(
    seq NUMBER PRIMARY KEY,
    data VARCHAR2(30) NOT NULL
);

CREATE SEQUENCE loopseq;

-- 1. �л�1
-- 2. �л�2
-- .. insert X 1000ȸ

DECLARE
    vnum NUMBER; -- ���� ���� + seq + �л� ��ȣ
BEGIN

    vnum := 1;
    
    LOOP
        INSERT INTO tblloop VALUES(vnum, '�л�' || vnum);
        vnum := vnum + 1;
        EXIT WHEN vnum >= 1001;
    END LOOP;
END;

SELECT * FROM tblloop;

TRUNCATE TABLE tblloop; -- �ѹ� �Ұ���

BEGIN
    
    LOOP
        INSERT INTO tblloop VALUES(loopseq.nextval, '�л�' || loopseq.currval);
        EXIT WHEN loopseq.currval >= 1001;
    END LOOP;
END;

SELECT * FROM tblloop;

/*
    2. FOR LOOP
    - ����Ƚ�� �ݺ�
*/
BEGIN
    -- FOR�� ���������� ���� ������ ������ �ʴ´�.
    -- i : ���� ����
    -- 1 : �ʱⰪ
    -- .. : ����
    -- 10 : �ִ밪
    FOR i IN REVERSE 1..10 LOOP
        dbms_output.put_line(i);
    END LOOP;
END;

/*
    3. WHILE LOOP
*/

DECLARE
    vnum NUMBER;
BEGIN

    vnum := 1;
    
    WHILE vnum <= 10 LOOP
        dbms_output.put_line(vnum);
        vnum := vnum + 1;
    END LOOP;
END;

-- ������
CREATE TABLE tblgugudan(
    dan NUMBER NOT NULL, -- 2 2 2
    num NUMBER NOT NULL, -- 1 2 3
    result NUMBER NOT NULL, -- 2 4 6
    
    -- ����Ű(Composite Key)
    -- : 2�� �̻��� �÷��� �𿩼� �⺻Ű(PK) ����
    -- : �÷� �������� ���� �Ұ���, ���̺� �������� ���� ����
    CONSTRAINT tblgugudan_dan_num_pk PRIMARY KEY(dan, num)
);

-- 2�� ~ 9�� : 2�� ����
DECLARE
    vdan NUMBER;
    vnum NUMBER;
    vresult NUMBER;
BEGIN
    
    vdan := 2;
    WHILE vdan <= 9 LOOP
        vnum := 1;
        WHILE vnum <= 9 LOOP
            
            INSERT INTO tblgugudan(dan, num, result) VALUES(vdan, vnum, vdan * vnum);
            vnum := vnum + 1;
        END LOOP;
        vdan := vdan + 1;
    END LOOP;
END;

SELECT * FROM tblgugudan ORDER BY dan ASC, num ASC;

TRUNCATE TABLE tblgugudan;

BEGIN
    FOR dan IN 2..9 LOOP
        FOR num IN 1..9 LOOP
            INSERT INTO tblgugudan VALUES(dan, num, dan * num);
        END LOOP;
    END LOOP;
END;

/*
    SELECT�� ���ؼ� ������ �����͸� PL/SQL ������ �ִ� ���
    1. SELECT INTO ����ϱ�
    - ������� ���ڵ尡 1���� ���� �����ϴ�.
    
    2. Ŀ��(Cursor) ����ϱ�
    - ������� ���ڵ尡 1�� �̻��� �� �����ϴ�.
    
    Ŀ�� ����
    DECLARE
        ���� ����;
        Ŀ�� ����;
    BEGIN
        Ŀ�� ����;
        LOOP
            ������ ����(���ڵ� ����);
        END LOOP;
        Ŀ�� �ݱ�;
    END;
*/

-- SELECT INTO
-- 1. ���� �÷� X ���� ��
-- 2. ���� �÷� X ���� ��

-- tblinsa ������ �������� X 60��
-- Cusor
-- 3. ���� �÷� X ���� ��

DECLARE
    CURSOR vcursor
    IS
    SELECT name FROM tblinsa ORDER BY name ASC; -- Ŀ�� ����(�������� select ���� ��)
    vname tblinsa.name%type;
BEGIN
    OPEN vcursor; -- Ŀ�� ����(�� �� select ����)
    
    LOOP
        --���ڵ� �ϳ��ϳ��� Ŀ���� ����ؼ� ����
        FETCH vcursor INTO vname;
        
        -- Ŀ�� �Ӽ�
        -- vcursor%NOTFOUND : �������� ������ false, �������� ������ true
        EXIT WHEN vcursor%NOTFOUND;
        
        dbms_output.put_line(vname);
    END LOOP;
    
    CLOSE vcursor; --Ŀ�� �ݱ�(�ڿ� ���� �ڵ�)
END;