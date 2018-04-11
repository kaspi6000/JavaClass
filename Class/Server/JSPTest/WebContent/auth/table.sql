-- Webcontent > auth > table.sql

DROP TABLE tblMember CASCADE CONSTRAINTS;

CREATE TABLE tblMember (
    id VARCHAR2(30) PRIMARY KEY,
    pw VARCHAR2(30) NOT NULL,
    name VARCHAR2(30) NOT NULL,
    lv NUMBER(1) NOT NULL CHECK(lv BETWEEN 1 AND 3)
);

SELECT * FROM tblMember;

INSERT INTO tblMember VALUES('hong', '1111', '홍길동', 1);
INSERT INTO tblMember VALUES('test', '1111', '테스트', 1);
INSERT INTO tblMember VALUES('dog', '1111', '강아지', 2);
INSERT INTO tblMember VALUES('cat', '1111', '고양이', 2);
INSERT INTO tblMember VALUES('admin', '1111', '관리자', 3);

COMMIT;

SELECT * FROM tabs;