/*
    ������, Sequence
    - ������ ��ü(DB Object �� �ϳ�)
    
    ������ ��ü �����ϱ�
    - CREATE : ����
    - ALTER : ����
    - DROP : ����
    - CREATE SEQUENCE ��������;
    
    ������ ���
    1. testseq.nextval
    2. testseq.currval
*/
CREATE SEQUENCE testseq;

SELECT testseq.nextval FROM dual;
SELECT testseq.currval FROM dual;

DROP TABLE tblmemo;

CREATE TABLE tblmemo(
    seq NUMBER,
    name VARCHAR2(20),
    memo VARCHAR2(1000) NOT NULL,
    
    CONSTRAINT tblmemo_seq_pk PRIMARY KEY(seq),
    CONSTRAINT tblmemo_name_uq UNIQUE(name),
    CONSTRAINT tblmemo_memo_ck CHECK(length(memo) >= 10)
);

CREATE SEQUENCE memoseq;

INSERT INTO tblmemo(seq, name, memo) VALUES(1, 'ȫ�浿', '������ �׽�Ʈ�Դϴ�.');

INSERT INTO tblmemo(seq, name, memo) VALUES(memoseq.nextval, 'ȫ�浿3', '������ �׽�Ʈ�Դϴ�.');

SELECT * FROM tblmemo;

delete from tblmemo;

-- ��ǰ ���̺�
-- : ��ǰ�ڵ�, ��ǰ��, ����, ����
-- : ��ǰ�ڵ�(PK) -> 1, 2, 3, 4(X)
-- : ��ǰ�ڵ�(PK) -> AA001

CREATE TABLE tblproduct(
    seq VARCHAR2(5) PRIMARY KEY, -- ��ǰ�ڵ�
    name VARCHAR2(50) NOT NULL,
    price number NOT NULL,
    qty number NOT NULL
);

-- AA001, AA002, AA003
CREATE SEQUENCE productseq;

INSERT INTO tblproduct(seq, name, price, qty) VALUES('AA' || trim(to_char(productseq.nextval, '000')), '���� û�ұ�', 100000, 1);

INSERT INTO tblproduct(seq, name, price, qty) VALUES('AA' || trim(to_char(productseq.nextval, '000')), '�ɷ�', 100000, 1);

INSERT INTO tblproduct(seq, name, price, qty) VALUES('AA' || trim(to_char(productseq.nextval, '000')), '����', 100000, 1);

SELECT * FROM tblproduct;

DROP TABLE tblproduct;
DROP SEQUENCE productseq;

-- ������ ��ü �ʱ�ȭ(1���� �ٽ� �����ϵ���)

SELECT productseq.nextval FROM dual;

-- 1. �ٽ� �����
DROP SEQUENCE productseq;
CREATE SEQUENCE productseq;

-- 2. �����ϱ�(�����ϱ�)
DROP SEQUENCE productseq;

CREATE SEQUENCE productseq
    INCREMENT BY 1 --����ġ
    START WITH 1 --���۰�
    MAXVALUE 10 --�ִ밪(������ �����߻�)
    MINVALUE -5 --�ּҰ�
    CYCLE
    CACHE 3
    ;

SELECT productseq.nextval FROM dual;

