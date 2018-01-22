/*
    시퀀스, Sequence
    - 시퀀스 객체(DB Object 중 하나)
    
    시퀀스 객체 생성하기
    - CREATE : 생성
    - ALTER : 수정
    - DROP : 삭제
    - CREATE SEQUENCE 시퀀스명;
    
    시퀀스 사용
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

INSERT INTO tblmemo(seq, name, memo) VALUES(1, '홍길동', '시퀀스 테스트입니다.');

INSERT INTO tblmemo(seq, name, memo) VALUES(memoseq.nextval, '홍길동3', '시퀀스 테스트입니다.');

SELECT * FROM tblmemo;

delete from tblmemo;

-- 상품 테이블
-- : 상품코드, 상품명, 가격, 수량
-- : 상품코드(PK) -> 1, 2, 3, 4(X)
-- : 상품코드(PK) -> AA001

CREATE TABLE tblproduct(
    seq VARCHAR2(5) PRIMARY KEY, -- 상품코드
    name VARCHAR2(50) NOT NULL,
    price number NOT NULL,
    qty number NOT NULL
);

-- AA001, AA002, AA003
CREATE SEQUENCE productseq;

INSERT INTO tblproduct(seq, name, price, qty) VALUES('AA' || trim(to_char(productseq.nextval, '000')), '진공 청소기', 100000, 1);

INSERT INTO tblproduct(seq, name, price, qty) VALUES('AA' || trim(to_char(productseq.nextval, '000')), '걸레', 100000, 1);

INSERT INTO tblproduct(seq, name, price, qty) VALUES('AA' || trim(to_char(productseq.nextval, '000')), '행주', 100000, 1);

SELECT * FROM tblproduct;

DROP TABLE tblproduct;
DROP SEQUENCE productseq;

-- 시퀀스 객체 초기화(1부터 다시 시작하도록)

SELECT productseq.nextval FROM dual;

-- 1. 다시 만들기
DROP SEQUENCE productseq;
CREATE SEQUENCE productseq;

-- 2. 수정하기(제어하기)
DROP SEQUENCE productseq;

CREATE SEQUENCE productseq
    INCREMENT BY 1 --증감치
    START WITH 1 --시작값
    MAXVALUE 10 --최대값(넘으면 에러발생)
    MINVALUE -5 --최소값
    CYCLE
    CACHE 3
    ;

SELECT productseq.nextval FROM dual;

