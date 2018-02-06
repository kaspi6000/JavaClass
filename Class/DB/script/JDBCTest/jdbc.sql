SELECT * FROM tabs;
SELECT * FROM tbladdress;

SELECT * FROM tblhong;

INSERT INTO tbladdress(seq, name, age, tel, address, regdate) VALUES(address_seq.nextval, '후후후', 20, '010-1111-2222', '서울시', DEFAULT);

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
    seq NUMBER PRIMARY KEY, --메모번호
    name VARCHAR2(50) NOT NULL, --작성자
    memo VARCHAR2(1000) NOT NULL, --메모내용
    regdate DATE DEFAULT sysdate NOT NULL, -- 작성시간
    priority NUMBER(1) CHECK(priority BETWEEN 1 AND 3) NOT NULL --우선순위(1.높음 ~ 3.낮음)
);

DROP SEQUENCE memoseq;
CREATE SEQUENCE memoseq;

SELECT * FROM tblmemo;

INSERT INTO tblmemo VALUES(memoseq.nextval, '강경일', '메모입니다.', DEFAULT, 2);
INSERT INTO tblmemo VALUES(memoseq.nextval, '아무개', '안녕하세요 아무개 입니다.', DEFAULT, 1);
INSERT INTO tblmemo VALUES(memoseq.nextval, '하하하', 'JDBC 수업중 입니다', DEFAULT, 3);

COMMIT;

SELECT seq, name, to_char(regdate, 'hh24:mi:ss') AS regdate, CASE WHEN priority = 1 THEN '높음' WHEN priority = 2 THEN '중간' WHEN priority = 3 THEN '낮음' END AS priority, memo FROM tblmemo ORDER BY seq DESC;

SELECT * FROM tbladdress;
ROLLBACK;

-- CallableStatement 예제 프로시저
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