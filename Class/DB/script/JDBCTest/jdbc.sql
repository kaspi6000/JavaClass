SELECT * FROM tabs;
SELECT * FROM tbladdress;

SELECT * FROM tblhong;

INSERT INTO tbladdress(seq, name, age, tel, address, regdate) VALUES(address_seq.nextval, '������', 20, '010-1111-2222', '�����', DEFAULT);

SELECT address_seq.currval FROM dual;

SELECT memoseq.currval FROM dual;

CREATE SEQUENCE address_seq;

UPDATE tbladdress SET age = 23 WHERE seq = 7;

SELECT name FROM tbladdress WHERE seq = 22;

SELECT name FROM tblinsa WHERE basicpay = (SELECT max(basicpay) FROM tblinsa WHERE rownum = 1);

SELECT * FROM tblinsa WHERE num = 1001;

SELECT * FROM tblmen m INNER JOIN tblwomen w ON m.couple = w.name;

SELECT * FROM tblinsa;

SELECT * FROM tblmemo;

DROP TABLE tblmemo;

CREATE TABLE tblmemo(
    seq NUMBER PRIMARY KEY, --�޸��ȣ
    name VARCHAR2(50) NOT NULL, --�ۼ���
    memo VARCHAR2(1000) NOT NULL, --�޸𳻿�
    regdate DATE DEFAULT sysdate NOT NULL, -- �ۼ��ð�
    priority NUMBER(1) CHECK(priority BETWEEN 1 AND 3) NOT NULL --�켱����(1.���� ~ 3.����)
);

DROP SEQUENCE memoseq;
CREATE SEQUENCE memoseq;

SELECT * FROM tblmemo;

INSERT INTO tblmemo VALUES(memoseq.nextval, '������', '�޸��Դϴ�.', DEFAULT, 2);
INSERT INTO tblmemo VALUES(memoseq.nextval, '�ƹ���', '�ȳ��ϼ��� �ƹ��� �Դϴ�.', DEFAULT, 1);
INSERT INTO tblmemo VALUES(memoseq.nextval, '������', 'JDBC ������ �Դϴ�', DEFAULT, 3);

COMMIT;

SELECT seq, name, to_char(regdate, 'hh24:mi:ss') AS regdate, CASE WHEN priority = 1 THEN '����' WHEN priority = 2 THEN '�߰�' WHEN priority = 3 THEN '����' END AS priority, memo FROM tblmemo ORDER BY seq DESC;

SELECT * FROM tbladdress;
ROLLBACK;

-- CallableStatement ���� ���ν���
-- m1()
CREATE OR REPLACE PROCEDURE proc_m1(
    pname tbladdress.name %type,
    page tbladdress.age %type,
    ptel tbladdress.tel %type,
    paddress tbladdress.address % type
)
IS
BEGIN
    INSERT INTO tbladdress VALUES(address_seq.nextval, pname, page, ptel, paddress, DEFAULT);
    COMMIT;
END;

SELECT * FROM tbladdress;

-- m2()
CREATE OR REPLACE PROCEDURE proc_m2
IS
BEGIN
    DELETE FROM tbladdress;
    COMMIT;
    --TRUNCATE TABLE tbladdress;
END;

-- m3()
-- ��ȯ��
-- a. out �Ķ����
-- b. return ��

CREATE OR REPLACE PROCEDURE proc_m3(
    vcount OUT NUMBER
)
IS
BEGIN
    SELECT count(*) INTO vcount FROM tbladdress;
END;

DECLARE
    vcount NUMBER;
BEGIN
    proc_m3(vcount);
    DBMS_OUTPUT.put_line(vcount);
END;

CREATE OR REPLACE PROCEDURE proc_m3(
    pseq IN NUMBER,
    pname OUT VARCHAR2,
    page OUT NUMBER,
    ptel OUT VARCHAR2
)
IS
BEGIN
    SELECT name, age, tel INTO pname, page, ptel FROM tbladdress WHERE seq = pseq;
END;

INSERT INTO tbladdress VALUES(address_seq.nextval, 'ȫ�浿', 20, '010-1234-5678', '�����', DEFAULT);

SELECT * FROM tbladdress;

CREATE OR REPLACE PROCEDURE proc_m4(
    pcity VARCHAR2,
    pcursor OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN pcursor FOR
        SELECT name, buseo, jikwi FROM tblinsa WHERE city = pcity;
END;

CREATE OR REPLACE PROCEDURE proc_m5(
    ptel VARCHAR2,
    pcursor OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN pcursor FOR
        SELECT name, buseo, jikwi, tel FROM tblinsa WHERE replace(tel, '-', '') LIKE '%' || ptel || '%';
END;

SELECT * FROM tblinsa;

-----------------------------------------------------------------------------------------------------------------
CREATE TABLE tblbuy(
    seq NUMBER PRIMARY KEY,
    name VARCHAR2(50) NOT NULL,
    item VARCHAR2(50) NOT NULL,
    qty NUMBER NOT NULL,
    regdate DATE DEFAULT sysdate NOT NULL
);

CREATE SEQUENCE buyseq;
DROP SEQUENCE buyseq;

CREATE OR REPLACE PROCEDURE proc_addbuy(
    pname VARCHAR2,
    pitem VARCHAR2,
    pqty NUMBER
)
IS
    vcount NUMBER;
BEGIN
    SELECT count(*) INTO vcount FROM tblbuy WHERE name = pname AND item = pitem;
    
    IF vcount = 1 THEN
        UPDATE tblbuy SET qty = pqty;
    ELSE
        INSERT INTO tblbuy VALUES(buyseq.nextval, pname, pitem, pqty, DEFAULT);
    END IF;
END;

SELECT * FROM tblbuy;
SELECT name || item FROM tblbuy;
DELETE FROM tblbuy;
INSERT INTO tblbuy VALUES(buyseq.nextval, 'ȫ�浿', 'Ű����', 8, DEFAULT);

CREATE OR REPLACE PROCEDURE proc_listbuy(
    pqty NUMBER,
    pcursor OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN pcursor FOR
        SELECT * FROM tblbuy WHERE qty = pqty;
END;

--�䱸����
--1. 100���� �����͸� ������ INSERT
--2. ������� + ������ǰ = ���� UPDATE
--3. ��� ���



SELECT * FROM tblinsa;