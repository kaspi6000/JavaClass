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

-- m3()
-- 반환값
-- a. out 파라미터
-- b. return 문

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

INSERT INTO tbladdress VALUES(address_seq.nextval, '홍길동', 20, '010-1234-5678', '서울시', DEFAULT);

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
INSERT INTO tblbuy VALUES(buyseq.nextval, '홍길동', '키보드', 8, DEFAULT);

CREATE OR REPLACE PROCEDURE proc_listbuy(
    pqty NUMBER,
    pcursor OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN pcursor FOR
        SELECT * FROM tblbuy WHERE qty = pqty;
END;

--요구사항
--1. 100건의 데이터를 난수로 INSERT
--2. 같은사람 + 같은물품 = 수량 UPDATE
--3. 목록 출력


CREATE VIEW vw_gender
AS
SELECT DISTINCT substr(ssn, 8, 1) AS gender,
    CASE
        WHEN substr(ssn, 8, 1) = 1 THEN '남자'
        WHEN substr(ssn, 8, 1) = 2 THEN '여자'
    END AS gender_name
FROM tblinsa;

SELECT * FROM vw_gender ORDER BY gender_name ASC;

CREATE VIEW vw_buseo
AS
SELECT DISTINCT buseo FROM tblinsa;

SELECT * FROM vw_buseo ORDER BY buseo ASC;

CREATE VIEW vw_city
AS
SELECT DISTINCT city FROM tblinsa;


-- 최종 목록 가져오기
CREATE OR REPLACE PROCEDURE proc_list_insa(
    pgender VARCHAR2,
    pbuseo VARCHAR2,
    pcity VARCHAR2,
    pcursor OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN pcursor FOR
        SELECT * FROM tblinsa WHERE substr(ssn, 8, 1) = pgender AND buseo = pbuseo AND city = pcity ORDER BY name ASC;
END;

SELECT * FROM tblinsa;

UPDATE tblinsa SET city = '서울' WHERE name = '홍길동';
UPDATE tblinsa SET city = '경기' WHERE name = '이순신';
COMMIT;


-- JDBC 5번
CREATE TABLE tbl_point
(
	seq NUMBER PRIMARY KEY, --PK
	name VARCHAR(100) NOT NULL, --장소명
	latitude NUMBER NOT NULL, --위도
	longitude NUMBER NOT NULL --경도
);

CREATE SEQUENCE point_seq;

INSERT INTO tbl_point VALUES (point_seq.nextval, '쌍용 교육원 강남 센터', 37.499306, 127.033202);
INSERT INTO tbl_point VALUES (point_seq.nextval, '강남역 2호선', 37.497901, 127.027631);
INSERT INTO tbl_point VALUES (point_seq.nextval, '역삼역 2호선', 37.500649, 127.036476);
INSERT INTO tbl_point VALUES (point_seq.nextval, '광화문', 37.576015, 126.976914);
INSERT INTO tbl_point VALUES (point_seq.nextval, '홍대 입구', 37.556724, 126.923615);
INSERT INTO tbl_point VALUES (point_seq.nextval, '이태원', 37.534456, 126.993887);
INSERT INTO tbl_point VALUES (point_seq.nextval, '인사동', 37.571734, 126.986966);
INSERT INTO tbl_point VALUES (point_seq.nextval, '어린이 대공원', 37.549330, 127.081160);
INSERT INTO tbl_point VALUES (point_seq.nextval, '서울역', 37.553185, 126.971530);

<<프로시저>>
CREATE OR REPLACE PROCEDURE proc_distance (
	구현
)
IS
BEGIN
	구현
END;

SELECT * FROM tbl_point;

SELECT SQRT(30) FROM dual;

-- JDBC 1번
CREATE TABLE tblauth
(
	id VARCHAR2(50) PRIMARY KEY --아이디
);

INSERT INTO tblauth VALUES ('hong');
INSERT INTO tblauth VALUES ('test');
INSERT INTO tblauth VALUES ('aaa');

<<프로시저>>
CREATE OR REPLACE PROCEDURE proc_auth(
	pid VARCHAR2
)
IS
    vid VARCHAR2;
BEGIN
	SELECT id INTO vid FROM tblauth;
    DBMS_OUTPUT.PUT_LINE(vid);
END;

SELECT * FROM tblauth;


-- 회원 + 메모

-- 회원 테이블
-- 회원 번호, 회원명, 나이, 연락처, 이메일, 포인트, 비밀번호

CREATE TABLE tbl_member(
    seq NUMBER PRIMARY KEY,
    name VARCHAR2(50) NOT NULL,
    age NUMBER NOT NULL,
    tel VARCHAR2(15) NOT NULL,
    email VARCHAR2(100) NOT NULL,
    point NUMBER DEFAULT 1000 NOT NULL,
    pw VARCHAR2(50) NOT NULL,
    ing NUMBER(1) DEFAULT 1 NOT NULL
);

-- 메모 테이블
-- 메모번호, 제목, 내용, 작성자(회원번호), 작성시간
CREATE TABLE tbl_memo(
    seq NUMBER PRIMARY KEY,
    subject VARCHAR2(100) NOT NULL,
    content VARCHAR2(1000) NOT NULL,
    mseq NUMBER NOT NULL REFERENCES tbl_member(seq),
    regdate DATE DEFAULT sysdate NOT NULL
);

CREATE SEQUENCE member_seq;
CREATE SEQUENCE memo_seq;

SELECT * FROM tbl_member;
SELECT * FROM tbl_memo;

SELECT m.seq, m.subject, m.content, (SELECT name FROM tbl_member WHERE seq = m.mseq) AS mname, m.regdate FROM tbl_memo m WHERE (SELECT ing FROM tbl_member WHERE seq = m.mseq) = 1 ORDER BY seq DESC