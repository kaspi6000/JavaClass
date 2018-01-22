/*
    INSERT 문
    - INSERT INTO 테이블명(컬럼리스트) VALUES(값리스트);
*/
DROP TABLE tblmemo;
CREATE TABLE tblmemo(
    seq NUMBER PRIMARY KEY, --메모번호(PK)
    name VARCHAR2(30) NOT NULL, --글쓴이
    memo VARCHAR2(1000) NOT NULL, --메모
    regdate DATE DEFAULT sysdate NOT NULL, --날짜
    etc VARCHAR2(500) DEFAULT '비고없음' NULL, --비고
    page NUMBER NULL --페이지수
);

SELECT memoseq.currval FROM dual;

-- INSERT 문의 패턴

-- 1. 표준 : 원본 테이블의 정의 컬럼 순서대로 컬럼리스트와 값리스트를 표기
INSERT INTO tblmemo(seq, name, memo, regdate, etc, page) VALUES(memoseq.nextval, '홍길동', '메모', sysdate, '비고', 1);

-- 2. 컬럼(값)의 순서 바꾸기
-- 컬럼리스트와 값리스트의 순서는 반드시 원본 테이블의 정의와 일치할 필요가 없다.
INSERT INTO tblmemo(name, memo, regdate, etc, page, seq) VALUES('홍길동', '메모', sysdate, '비고', 1, memoseq.nextval);

-- 3. NULL 제약을 가진 컬럼값 입력하기
-- 특정 컬럼에 NULL을 대입하고 싶다.

-- 3.a 대상 컬럼과 값을 생략하면 된다.
INSERT INTO tblmemo(seq, name, memo, regdate) VALUES(memoseq.nextval, '홍길동', '메모', sysdate); -- etc > 생략 > default값 입력

-- 3.b 명시적으로 NULL을 대입 -> NULL 상수를 사용한다.
INSERT INTO tblmemo(seq, name, memo, regdate, etc, page) VALUES(memoseq.nextval, '홍길동', '메모', sysdate, NULL, NULL);

-- 4. default 값 입력

-- 4.a default가 정의되어 있어도 값을 직접 입력하는 경우 > default가 아닌 사용자가 직접 입력한 값이 대입
INSERT INTO tblmemo(seq, name, memo, regdate, etc, page) VALUES(memoseq.nextval, '홍길동', '메모', sysdate, '비고', 1);

-- 4.b default 컬럼을 생략 > default 값이 대입
INSERT INTO tblmemo(seq, name, memo, page) VALUES(memoseq.nextval, '홍길동', '메모', 1);

-- 4.c default + null 에서 null 상수를 입력하면 default 동작 안함
INSERT INTO tblmemo(seq, name, memo, regdate, etc, page) VALUES(memoseq.nextval, '홍길동', '메모', sysdate, NULL, 1);

-- 4.d 명시적으로 default값 대입
INSERT INTO tblmemo(seq, name, memo, regdate, etc, page) VALUES(memoseq.nextval, '홍길동', '메모', DEFAULT, DEFAULT, 1);

SELECT * FROM tblmemo;

-- 5. 컬럼 리스트 생략
INSERT INTO tblmemo VALUES(memoseq.nextval, '홍길동', '메모', sysdate, '비고', 1);

-- 5.a 반드시 테이블이 만들어질 당시의 컬럼순서대로 값리스트를 맞춰야 한다.
INSERT INTO tblmemo VALUES('홍길동', '메모', sysdate, '비고', 1, memoseq.nextval);

-- 5.b default 처리를 위해 값 생략이 불가능하다.
INSERT INTO tblmemo VALUES(memoseq.nextval, '홍길동', '메모', 1);

-- 5.c default 사용하고 싶으면 생략은 불가능하지만 default 상수는 가능하다.
INSERT INTO tblmemo VALUES(memoseq.nextval, '홍길동', '메모', DEFAULT, DEFAULT, 1);

---------------------------------------------------일반적인 INSERT

SELECT * FROM tblmemo;

CREATE TABLE tblmemobackup(
    seq NUMBER PRIMARY KEY, --메모번호(PK)
    name VARCHAR2(30) NOT NULL, --글쓴이
    memo VARCHAR2(1000) NOT NULL, --메모
    regdate DATE DEFAULT sysdate NOT NULL, --날짜
    etc VARCHAR2(500) DEFAULT '비고없음' NULL, --비고
    page NUMBER NULL --페이지수
);

-- tblmemo -> 복사 -> tblmemobackup
INSERT INTO tblmemobackup SELECT * FROM tblmemo; --서브 쿼리

SELECT * FROM tblmemobackup;

-- tblmemo에서 page가 1인 항목들만 가지고 별도의 테이블 생성
CREATE TABLE tblmemoonepage AS SELECT * FROM tblmemo WHERE page = 1;

SELECT * FROM tblmemoonepage;

--
SELECT * FROM tblinsa;

-- 영업부 테이블
CREATE TABLE 영업부 AS SELECT * FROM tblinsa WHERE buseo = '영업부';

SELECT * FROM 영업부;

/*
    1. 존재 테이블 A -> (데이터 복사) -> 존재 테이블 B
    - insert + select
    - 업무용 O, 개발자 테스트용 O
    
    2. 존재 테이블 A -> (테이블 생성 + 데이터 복사) -> 생성 테이블 B
    - create + select
    - 업무용 X, 개발자 테스트용 O
    - 테이블이 생성될 때 데이터는 복사가 되는데.. 제약사항은 복사가 안된다.
*/