-- WebContent > code > table.sql

-- ȸ�� ���̺� + �ڵ�(�Խù�) ���̺�

CREATE TABLE tblMember (
    id VARCHAR2(30) PRIMARY KEY,    -- ���̵�
    pw VARCHAR2(30) NOT NULL,        -- ��ȣ
    name VARCHAR2(30) NOT NULL,     -- �̸�
    lv NUMBER(1) NOT NULL CHECK(lv BETWEEN 1 AND 3)     -- ���(1: �Ϲ�, 2: ������, 3: �ְ������)
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
    seq NUMBER PRIMARY KEY,     -- �Խù� ��ȣ
    subject VARCHAR2(500) NOT NULL, -- ����
    content VARCHAR2(2000) NOT NULL,    -- �ڵ� ����
    code VARCHAR2(2000) NOT NULL,   -- ���α׷��� �ڵ�
    category NUMBER NOT NULL REFERENCES tblCategory(seq),   -- ī�װ�
    regdate DATE DEFAULT sysdate NOT NULL,  -- �ۼ� �ð�
    id VARCHAR2(30) NOT NULL REFERENCES tblMember(id),   -- �ۼ���(FK)
    filename VARCHAR2(100) NULL,
    orgfilename VARCHAR2(100) NULL
);

DROP TABLE tblCode;

CREATE SEQUENCE code_seq;

SELECT * FROM tblCode;

SELECT * FROM tblAddress;