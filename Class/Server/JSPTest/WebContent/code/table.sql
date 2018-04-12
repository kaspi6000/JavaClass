-- WebContent > code > table.sql

-- 회원 테이블 + 코드(게시물) 테이블

CREATE TABLE tblMember (
    id VARCHAR2(30) PRIMARY KEY,    -- 아이디
    pw VARCHAR2(30) NOT NULL,        -- 암호
    name VARCHAR2(30) NOT NULL,     -- 이름
    lv NUMBER(1) NOT NULL CHECK(lv BETWEEN 1 AND 3)     -- 등급(1: 일반, 2: 관리자, 3: 최고관리자)
);

DROP TABLE tblCategory;

CREATE TABLE tblCategory (
    seq NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL
);

INSERT INTO tblCategory VALUES(1, 'Java');
INSERT INTO tblCategory VALUES(2, 'Oracle');
INSERT INTO tblCategory VALUES(3,'HTML');
INSERT INTO tblCategory VALUES(4,'CSS');
INSERT INTO tblCategory VALUES(5,'JavaScript');

COMMIT;

CREATE TABLE tblCode(
    seq NUMBER PRIMARY KEY,     -- 게시물 번호
    subject VARCHAR2(500) NOT NULL, -- 제목
    content VARCHAR2(2000) NOT NULL,    -- 코드 설명
    code VARCHAR2(2000) NOT NULL,   -- 프로그래밍 코드
    category NUMBER NOT NULL REFERENCES tblCategory(seq),   -- 카테고리
    regdate DATE DEFAULT sysdate NOT NULL,  -- 작성 시간
    id VARCHAR2(30) NOT NULL REFERENCES tblMember(id),   -- 작성자(FK)
    filename VARCHAR2(100) NULL,
    orgfilename VARCHAR2(100) NULL
);

DROP TABLE tblCode;

CREATE SEQUENCE code_seq;

SELECT * FROM tblCode;

SELECT * FROM tblAddress;