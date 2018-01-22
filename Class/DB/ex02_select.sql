/*
    SQL은 대소문자를 구분하지 않는다.
    
    1. SQL 키워드 : 대문자
    2. 객체 식별자 : 소문자(풀)
        a. memberpoint
        b. memberPoint
        c. member_point
        d. MEMBER_POINT
        
        
    SQL 자료형
    - DBMS에 따라 차이가 심함
    
    1. 숫자형
        a. NUMBER
            - 정수 + 실수
            - (유효자리) 38자리 이하의 숫자를 표현 -> 자바 double -> 20byte
            - number(precision, scale)
                1. precision : 소수 이하를 포함한 전체 자릿수(1~38)
                2. scale : 소수점 이하 자릿수
            ex)
                number : 38자리까지 표현이 가능한 모든 숫자(정수, 실수)
                number(3) : 최대 3자리까지 표현이 가능한 숫자(-999 ~ 999)
                number(4,2) : 최대 4자리까지 + 소수이하 2자리 포함(-99.99 ~ 99.99)
                number(10,3) : -9999999.999 ~ 9999999.999
        b. 나머지 타입
            - INTEGER, DOUBLE, DECIMAL, REAL 등.. : 다른 시스템 or 예전 버전들과의 호환성 때문에..
    
    2. 문자형
        - 자바 : 문자(char) + 문자열(String)
        - 오라클은 문자와 문자열의 구분이 없다. 모두 다 문자형으로 취급한다
        
        - 오라클 기본 인코딩 : ~8(EUC-KR) -> 9i ~ 12c(UTF-8)
        
        a. CHAR / NCHAR
            - 고정 자릿수
            - CHAR(N) : N자리 문자열(길이 - 바이트)
            ex) CHAR(3) : 3바이트까지 문자를 저장(abc ->, 홍길동 ->)
        
        b. VARCHAR / NVARCHAR -> VARCHAR2 / NVARCHAR2
            - 가변 자릿수
            - VARCHAR2(N) : N자리 문자열(길이 - 바이트)
            - 최대 크기 : 4000바이트
            - 최소 크기 : 1바이트
            
        c. N의 유무
            - 문자셋의 차이
            1. N이 없으면 : 오라클의 기본 인코딩 사용(UTF-8)
                ex) CHAR(3) : UTF-8 3바이트
            2. N이 있으면 : 오라클의 기본 인코딩과 상관없이 무조건 UTF-16을 사용
                ex) NCHAR(3) : 3글자까지
    
    3. 날짜 시간형
        a. DATE
            - 거의 이 자료형만 사용
            - 자바 Calendar 유사
            - 날짜 + 시간 포함
            - 시각 데이터
            - 7byte
            - B.C 4712년 1월 1일 ~ A.D 9999년 12월 31일
            - 최소단위 : 초까지
        
        b. TIMESTAMP
            - DATE의 버전업
            - 10억분의 1초까지(나노초)
        
        c. INTERVAL
            - 시간 데이터
            - 틱값
            
    4. 대용량 자료형
        a. lob(롭), Large Object
            - 참조형(속도 느림)
            - 인덱스 대상 X
            1. BLOB
                - 대용량 바이너리 데이터
                - 큰 이미지, 동영상 등..
                - 최대 크기 : 4GB\
            2. CLOB
                - 대용량 문자 데이터
                - 최대 크기 : 4GB
*/
SELECT * FROM tabs;

select * from tabs;

-- 테이블 생성하기
DROP TABLE tbltype;

CREATE TABLE tbltype
(
    -- 컬럼 정의하기
    -- 컬럼명 자료형(길이) 제약사항
    --age NUMBER,
    --height NUMBER(3),
    --weight NUMBER(4, 1)
    --name char(3)
    --name nchar(3)
    --txt varchar2(30)
    
    txt1 char(30),
    txt2 varchar2(30)
);

desc tbltype;

-- 데이터 추가하기
INSERT INTO tbltype(age) VALUES (20);
INSERT INTO tbltype(age) VALUES (20000000000000000);
INSERT INTO tbltype(age) VALUES (12345678901234567890123456789012345678);
INSERT INTO tbltype(age) VALUES (123456789012345678901234567890123456789);
INSERT INTO tbltype(age) VALUES (12345678901234567890123456789012345678901234567890);

INSERT INTO tbltype(age, height) VALUES (20, 180);
INSERT INTO tbltype(age, height) VALUES (20, 999);
INSERT INTO tbltype(age, height) VALUES (20, 1000);
INSERT INTO tbltype(age, height) VALUES (20, -999);
INSERT INTO tbltype(age, height) VALUES (20, -1000);

INSERT INTO tbltype(age, height, weight) VALUES (20, 170, 65.5);
INSERT INTO tbltype(age, height, weight) VALUES (20, 170, 999.9);
INSERT INTO tbltype(age, height, weight) VALUES (20, 170, 9999.9);
INSERT INTO tbltype(age, height, weight) VALUES (20, 170, 999.99);
INSERT INTO tbltype(age, height, weight) VALUES (20, 170, 99.99);
INSERT INTO tbltype(age, height, weight) VALUES (20, 170, 12.34);

INSERT INTO tbltype(age, height, weight) VALUES (20, 175.14, 12.34);

-- 데이터 가져오기
SELECT * FROM tbltype; -- 20 NULL NULL

-- name CHAR(3) : UTF-8 -> 3바이트
INSERT INTO tbltype(name) VALUES ('abc'); -- O
INSERT INTO tbltype(name) VALUES ('홍길동'); -- X
INSERT INTO tbltype(name) VALUES ('홍'); -- O

-- txt VARCHAR2(30) -> 30바이트
INSERT INTO tbltype(txt) VALUES ('abcdeabcdeabcdeabcdeabcdeabcde'); -- O
INSERT INTO tbltype(txt) VALUES ('abcdeabcdeabcdeabcdeabcdeabcdea'); -- X
INSERT INTO tbltype(txt) VALUES ('일이삼사오육칠팔구십'); -- O
INSERT INTO tbltype(txt) VALUES ('일이삼사오육칠팔구십일'); -- X

INSERT INTO tbltype(txt) VALUES ('일이삼사오육칠팔구 ab'); -- O
INSERT INTO tbltype(txt) VALUES ('일이삼사오육칠팔구 abc'); -- O

SELECT*FROM tbltype;
INSERT INTO tbltype(txt1, txt2) VALUES('홍길동', '홍길동');

SELECT*FROM tbltype WHERE txt1 = txt2;
SELECT*FROM tbltype WHERE trim(txt1) = trim(txt2);

