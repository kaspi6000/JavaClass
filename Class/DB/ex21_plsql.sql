/*
    PL/SQL
    - Procedural Language Extensions to SQL
    - 표준 SQL : 비 절차성 언어(순서가 없고, 연속적이지 않다.)
    - 표준 SQL + 절차적 기능 추가 -> 오라클 추가 SQL -> PL/SQL
    - 추가된 부분 -> 자바의 프로그래밍 기능 추가(변수, 제어문, 메소드 등..)
    - 오라클 전용 SQL
    
    - 표준 SQL <-> PL/SQL : 자료형 호환이 된다.
    - 표준 SQL : 문장 종결자 필수 X
    - PL/SQL : 문장 종결자 필수 O
    
    SQL 처리 과정 & 순서
    1. 표준 SQL
     : 클라이언트 구문 작성(SELECT 문) -> 실행(Ctrl + Enter) -> 네트워크를 통해 SQL이 DBMS 서버에게 전달 -> 구문 분석(파싱) -> 컴파일 -> 실제 실행(CPU) -> 결과 처리
     : 위에서 실행한 동일 SQL을 다시 실행 -> 위의 과정 처음부터 끝까지 다시 반복(**)
    
    2. PL/SQL
     : 클라이언트 구문 작성(SELECT 문) -> 실행(Ctrl + Enter) -> 네트워크를 통해 SQL이 DBMS 서버에게 전달 -> 구문 분석(파싱) -> 컴파일 -> 실제 실행(CPU) -> 결과 처리
        2.a 처음 실행 : 위의 과정 처음 ~ 끝까지 실행(표준 SQL과 동일한 방식)
        2.b 이후 반복 실행 : 구문 분석(파싱) ~ 컴파일 부분이 생략
         : (저장) 프로시저 -> Stored Procedure : 자바의 메소드(함수)
         
    프로시저, Procedure
    - 메소드, 함수, 서브루틴 등..특정 목적을 가지고 모인 순서대로 실행할 명령어의 집합
    1. 익명 프로시저 -> 이름없음 -> 재호출을 목적으로 하지 않는 프로시저
    2. 익명 프로시저 -> 이름없음 -> 재호출을 목적으로 하는 프로시저
*/
set serveroutput on;

BEGIN
    dbms_output.put_line('Hello'); --syso
END;

/*
    PL/SQL
    - 프로그래밍 기능이 제공 + 표준 SQL
    - 주로 프로시저 형태로 사용 -> 블럭 형태로 사용
    
    PL/SQL 블럭 구조
    1. 4개 키워드로 구성
    - DECLARE
    - BEGIN
    - EXCEPTION
    - END;
    
    2. DECLARE
    - 선언부, declare section
    - 프로그램에서 사용되는 변수, 객체 등을 선언하는 영역
    - 생략 가능
    
    3. BEGIN
    - 실행부, 구현부, executable section
    - BEGIN ~ END
    - 프로그램에서 실제 구현 내용을 선언하는 영역
    - 연산, 제어, 표준 SQL 등으로 구현
    - 생략 불가능
    
    4. EXCEPTION
    - 예외 처리부, exception section
    - catch 절 역할
    - 예외 처리 코드를 선언하는 영역
    - 생략 가능
    
    5. END;
    - 블럭의 종료
    - 생략 불가능
    
    6. PL/SQL 블럭 = 선언부 + 실행부 + 예외처리부
    
    자바
    {
        {
        
        }
    }
    오라클
    BEGIN
        BEGIN
        
        END;
    END;
    
    DECLARE
        변수, 자원 선언하기
    BEGIN
        구현부
    EXCEPTION
        예외처리부
    END;
    
    자료형 & 변수
    
    자료형
    - 오라클과 동일(거의 유사)
    
    변수 선언하기
    - 변수명 자료형 [NOT NULL] [DEFAULT 값]
    - 변수의 역할 : 질의의 결과나 인자값을 저장하는 용도
    
    연산자
    - 표준 SQL과 동일
    
    표준 SQL 대입 연산자
    - 용도 : 컬럼값 대입
    - 컬럼명 = 값
    
    PL/SQL 연산자
    - 용도 : 변수값 대입
    - 변수 := 값
*/
DECLARE
    num NUMBER;
    name VARCHAR2(30);
    today DATE;
BEGIN
    num := 10; -- 정수형 상수(리터럴)
    dbms_output.put_line(num);
    
    name := '홍길동'; -- 문자열 상수(리터럴)
    dbms_output.put_line(name);
    
    today := sysdate;
    dbms_output.put_line(today);
    dbms_output.put_line(to_char(today, 'YYYY-mm-dd'));
END;

DECLARE
    num NUMBER DEFAULT 100; --NULL 허용
    age NUMBER NOT NULL DEFAULT 200;
BEGIN

    -- default 선언된 변수는 NULL 상태로 값을 사용하면 자동으로 default값이 대입된다.
    
    -- num
    dbms_output.put_line(num);
    
    -- age
    dbms_output.put_line(age);
END;

/*
    테이블에서 조회한 데이터를 변수에 담아야하는 경우
    - 질의의 결과가 단일값이여야 한다.(다중 컬럼 or 다중 레코드 모두 불가능)
     a. 결과셋이 1개의 레코드와 1개의 컬럼으로 구성(PK 조건절)
     b. 집계 함수의 결과셋
*/
DECLARE
    vbuseo VARCHAR2(15);
BEGIN
    -- 하나의 컬럼값을 하나의 변수에 대입
    SELECT buseo INTO vbuseo FROM tblinsa WHERE name = '홍길동';
    dbms_output.put_line('홍길동의 부서는 ' || vbuseo || '입니다');
END;

DECLARE
    vsalary NUMBER; -- 평균 급여(basicpay + sudang)
BEGIN

    -- 변수 := 값;
    -- 컬럼값 into 변수
    SELECT round(avg(basicpay + sudang)) INTO vsalary FROM tblinsa;
    dbms_output.put_line(vsalary);
END;

/*
    SELECT INTO 절
    1. 1개의 결과값을 1개의 변수에 저장(1:1)
    2. N개의 결과값을 N개의 변수에 저장(N:N) 단 결과값의 갯수와 변수의 갯수가 일치
*/

DECLARE
    vname VARCHAR2(20);
    vbuseo VARCHAR2(15);
    vjikwi VARCHAR2(15);
    vbasicpay NUMBER;
BEGIN
    SELECT name, buseo, jikwi, basicpay INTO vname, vbuseo, vjikwi, vbasicpay FROM tblinsa WHERE num = 1001;
    dbms_output.put_line(vname || '은 ''' || vbuseo || '''에 근무하는 ''' || vjikwi || '''입니다.');
END;

/*
    참조형 선언
    - 원본(컬럼)의 자료형을 몰라도 된다.
    - 유지 보수성이 좋다
    - 테이블과 뷰를 대상으로 한다.
    
    1. %type
    - 사용하는 테이블 특정 컬럼의 자료형과 길이를 참조해서 이곳에 적용하겠습니다.
    - 복사되는 정보
        a. 자료형
        b. 길이
        c. NOT NULL 제약
*/
DECLARE
    vname tblinsa.name%type; -- vname VARCHAR2(20)
BEGIN
    SELECT name INTO vname FROM tblinsa WHERE basicpay = (SELECT max(basicpay) FROM tblinsa);
    dbms_output.put_line(vname);
END;

DECLARE
    vfirst tblname.first%type;
BEGIN

    SELECT first INTO vfirst FROM tblname WHERE nick = '메뚜기';
    dbms_output.put_line(vfirst);
    
    SELECT first INTO vfirst FROM tblname WHERE nick = '이십끼';
    dbms_output.put_line(vfirst);
    
    SELECT first INTO vfirst FROM tblname WHERE nick = '정중앙';
    dbms_output.put_line(vfirst);
    
    vfirst := '상수';
    dbms_output.put_line(vfirst);
END;

DECLARE
    vbasicpay tblinsa.basicpay%type;
    vname tblinsa.name%type;
BEGIN

    SELECT max(basicpay) INTO vbasicpay FROM tblinsa; --2650000
    
    SELECT name INTO vname FROM tblinsa WHERE basicpay = vbasicpay;
    
    dbms_output.put_line(vname);
END;

DECLARE
    vcouple tblmen.couple%type;
BEGIN

    -- 홍길동의 여자친구 바람 -> 하하하
    -- SELECT * FROM tblmen; -- 홍길동 - 장도연
    
    -- 1.
    SELECT couple INTO vcouple FROM tblmen WHERE name = '홍길동';
    
    -- 2.
    UPDATE tblmen SET couple = vcouple WHERE name = '하하하';
    
    -- 3.
    UPDATE tblmen SET couple = NULL WHERE name = '홍길동';
    
    -- 4.
    -- SELECT * FROM tblwomen;
    UPDATE tblwomen SET couple = '하하하' WHERE name = vcouple;
END;

SELECT * FROM tblmen;
SELECT * FROM tblwomen;

-- tblinsa 직원 중 일부에게 지급할 보너스 내역 저장
CREATE TABLE tblbonus(
    seq NUMBER PRIMARY KEY,
    name VARCHAR2(15) NOT NULL, -- 참조키(다른 테이블 PK 참조)
    -- num NUMBER REFERENCES tblinsa(num), -- 정답
    bonus NUMBER NOT NULL
);

DECLARE
    vname tblinsa.name%type;
    vsudang tblinsa.sudang%type;
BEGIN

    SELECT name, sudang * 3 INTO vname, vsudang FROM tblinsa WHERE city = '서울' AND jikwi = '부장' AND months_between(sysdate, ibsadate) / 12 >= 20;
    
    -- dbms_output.put_line(vname);
    -- dbms_output.put_line(vsudang);
    
    INSERT INTO tblbonus VALUES(1, vname, vsudang);
END;

SELECT * FROM tblbonus;

/*
    2. %rowtype
    - 테이블의 레코드 구조를 참조한다.(%type : 컬럼 참조)
    - %type 의 집합
*/
DECLARE
    --vrow tblinsa.컬럼명%type;
    vrow tblinsa%rowtype; -- 레코드의 타입 전체를 복사(컬럼 10개 복사)
BEGIN

--    SELECT num, name, ssn, ibsadate, city, tel, buseo, jikwi, basicpay, sudang
--        INTO vnum, vname, vssn, vibsadate, vcity, vtel, vbuseo, vjikwi, vbasicpay, vsudang
--            FROM tblinsa WHERE num = 1001;
    SELECT * INTO vrow FROM tblinsa WHERE num = 1001;
    dbms_output.put_line(vrow.num);
    dbms_output.put_line(vrow.name);
    dbms_output.put_line(vrow.ssn);
    dbms_output.put_line(vrow.ibsadate);
    dbms_output.put_line(vrow.city);
    dbms_output.put_line(vrow.tel);
    dbms_output.put_line(vrow.buseo);
    dbms_output.put_line(vrow.jikwi);
    dbms_output.put_line(vrow.basicpay);
    dbms_output.put_line(vrow.sudang);
END;

-- tblmen -> tblwomen : 옮기기
DECLARE
    vrow tblmen%rowtype;
BEGIN

    -- SELECT * FROM tblmen;
    -- 이동 = 복사 + 삭제
    
    -- 1. 복사 : select -> insert
    SELECT * INTO vrow FROM tblmen WHERE name = '정형돈';
    
    -- dbms_output.put_line(vrow.name);
    -- dbms_output.put_line(vrow.age);
    
    INSERT INTO tblwomen VALUES(vrow.name, vrow.age, vrow.height, vrow.weight, vrow.couple);
    
    -- 2. 삭제
    DELETE FROM tblmen WHERE name = '정형돈';
END;

SELECT * FROM tblmen;
SELECT * FROM tblwomen;

/*
    상수
    - 리터럴X
    - 자바 : final double PI = 3.14;
    - 상수명 constant 자료형 [NOT NULL] [DEFAULT]
*/

DECLARE
    -- num NUMBER := 100;
    PI CONSTANT NUMBER(3, 2) := 3.14;
BEGIN

    -- PI := 5.24; -- 재할당 안됨
    dbms_output.put_line(PI);
END;

/*
    식별자(DB Object)
    - 컴파일 시 모든 키워드를 대문자로 변환 -> 저장
    - 영문자 + 숫자 + _
    - 숫자 시작 X
    - 예약어 사용 X -> "예약어" -> 쓰지 말것
    - 최대 길이 제한 30바이트 이하(UTF-8)
        : 제약 사항 이름
        ex) tblcountry + name + primary key
            name VARCHAR2(20) CONSTRAINT tblcountry_name_pk PRIMARY KEY
*/
CREATE TABLE "NUMBER"(
    seq NUMBER PRIMARY KEY
);

INSERT INTO "NUMBER" VALUES(100);
SELECT * FROM "NUMBER";

CREATE TABLE tblnumber(
    seq NUMBER CONSTRAINT tblnumber_seq_pk_aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa PRIMARY KEY
);

DROP TABLE tblnumber;

/*
    제어문
*/

-- 조건문 : if문
DECLARE
    vnum NUMBER;
BEGIN
    
    vnum := 10;
    
    IF vnum > 0 THEN
        dbms_output.put_line('양수');
    END IF;
    
    IF vnum > 0 THEN
        dbms_output.put_line('양수');
    ELSE
        dbms_output.put_line('음수');
    END IF;
    
    IF vnum > 0 THEN
        dbms_output.put_line('양수');
    ELSIF vnum < 0 THEN
        dbms_output.put_line('음수');
    ELSE
        dbms_output.put_line('0');
    END IF;
END;

DECLARE
    vgender CHAR(1); --주민번호 1자리
    vnumber NUMBER; --직원 번호
BEGIN
    -- 현재 직원이 남자면 A 업무 진행 or 여자면 B 업무 진행
    vnumber := 1003;
    SELECT substr(ssn, 8, 1) INTO vgender FROM tblinsa WHERE num = vnumber;
    
    IF vgender = '1' THEN
        UPDATE tblinsa SET basicpay = basicpay + 100000 WHERE num = vnumber;
    ELSE
        UPDATE tblinsa SET sudang = sudang + 100000 WHERE num = vnumber;
    END IF;
END;

SELECT * FROM tblinsa WHERE num = 1001;
SELECT * FROM tblinsa WHERE num = 1003;

DECLARE
    vrow tblinsa%rowtype;
BEGIN

    SELECT * INTO vrow FROM tblinsa WHERE num = 1001;
    
    -- 급여 2백만원 이상 + 부장(과장)급 ?
    IF vrow.basicpay >= 2000000 AND vrow.jikwi IN('부장', '과장') THEN
        dbms_output.put_line('성공');
    ELSE
        dbms_output.put_line('실패');
    END IF;
END;

/*
    case 문
    - 자바 : switch case 문
    - 표준 case문과 동일
*/

DECLARE
    vcontinent tblcountry.continent%type;
    vresult VARCHAR2(30);
    vpopulation tblcountry.population%type;
BEGIN
    
    -- 대한민국이 어느 대륙에 속하는지?
    SELECT continent, population INTO vcontinent, vpopulation FROM tblcountry WHERE name = '대한민국';
    dbms_output.put_line(vcontinent);
    
    IF vcontinent = 'AS' THEN
        vresult := '아시아';
    ELSIF vcontinent = 'EU' THEN
        vresult := '유럽';
    ELSIF vcontinent = 'AF' THEN
        vresult := '아프리카';
    END IF;
    
    dbms_output.put_line(vresult);
    
    CASE
        WHEN vcontinent = 'AS' THEN vresult := '아시아';
        WHEN vcontinent = 'EU' THEN vresult := '유럽';
        WHEN vcontinent = 'AF' THEN vresult := '아프리카';
    END CASE;
    
    CASE vcontinent
        WHEN 'AS' THEN vresult := '아시아';
        WHEN 'EU' THEN vresult := '유럽';
        WHEN 'AF' THEN vresult := '아프리카';
    END CASE;
    
    dbms_output.put_line(vresult);
    
    -- 인구수에 따라 업무 분기
    CASE
        WHEN vpopulation > 10000 THEN vresult := '너무 많음';
        WHEN vpopulation > 5000 THEN vresult := '조금 많음';
        WHEN vpopulation > 1000 THEN vresult := '적당함';
        ELSE vresult := '모자람';
    END CASE;
    dbms_output.put_line(vresult);
END;

/*
    반복문
    1. LOOP
    - 조건 반복
    
    2. FOR LOOP
    - 지정 횟수 반복(자바 for문)
    
    3. WHILE LOOP
    - 조건 반복(자바 while문)
*/

BEGIN

    LOOP
        dbms_output.put_line('안녕하세요.' || sysdate);
        EXIT;
    END LOOP;
END;

DECLARE
    vnum NUMBER;
BEGIN
    vnum := 1;
    
    LOOP
        dbms_output.put_line(vnum);
        vnum := vnum + 1;
        EXIT WHEN vnum = 11;
    END LOOP;
END;

DECLARE
    vnow DATE;
BEGIN
    
    LOOP
        vnow := sysdate;
        dbms_output.put_line('현재 시간은 ' || to_char(vnow, 'hh24:mi:ss') || '입니다');
        EXIT WHEN to_char(vnow, 'ss') = '59';
    END LOOP;
    dbms_output.put_line('종료');
END;

CREATE TABLE tblloop(
    seq NUMBER PRIMARY KEY,
    data VARCHAR2(30) NOT NULL
);

CREATE SEQUENCE loopseq;

-- 1. 학생1
-- 2. 학생2
-- .. insert X 1000회

DECLARE
    vnum NUMBER; -- 루프 변수 + seq + 학생 번호
BEGIN

    vnum := 1;
    
    LOOP
        INSERT INTO tblloop VALUES(vnum, '학생' || vnum);
        vnum := vnum + 1;
        EXIT WHEN vnum >= 1001;
    END LOOP;
END;

SELECT * FROM tblloop;

TRUNCATE TABLE tblloop; -- 롤백 불가능

BEGIN
    
    LOOP
        INSERT INTO tblloop VALUES(loopseq.nextval, '학생' || loopseq.currval);
        EXIT WHEN loopseq.currval >= 1001;
    END LOOP;
END;

SELECT * FROM tblloop;

/*
    2. FOR LOOP
    - 지정횟수 반복
*/
BEGIN
    -- FOR의 루프변수는 따로 선언문을 가지지 않는다.
    -- i : 루프 변수
    -- 1 : 초기값
    -- .. : 증가
    -- 10 : 최대값
    FOR i IN REVERSE 1..10 LOOP
        dbms_output.put_line(i);
    END LOOP;
END;

/*
    3. WHILE LOOP
*/

DECLARE
    vnum NUMBER;
BEGIN

    vnum := 1;
    
    WHILE vnum <= 10 LOOP
        dbms_output.put_line(vnum);
        vnum := vnum + 1;
    END LOOP;
END;

-- 구구단
CREATE TABLE tblgugudan(
    dan NUMBER NOT NULL, -- 2 2 2
    num NUMBER NOT NULL, -- 1 2 3
    result NUMBER NOT NULL, -- 2 4 6
    
    -- 복합키(Composite Key)
    -- : 2개 이상의 컬럼이 모여서 기본키(PK) 역할
    -- : 컬럼 수준으로 선언 불가능, 테이블 수준으로 선언 가능
    CONSTRAINT tblgugudan_dan_num_pk PRIMARY KEY(dan, num)
);

-- 2단 ~ 9단 : 2중 루프
DECLARE
    vdan NUMBER;
    vnum NUMBER;
    vresult NUMBER;
BEGIN
    
    vdan := 2;
    WHILE vdan <= 9 LOOP
        vnum := 1;
        WHILE vnum <= 9 LOOP
            
            INSERT INTO tblgugudan(dan, num, result) VALUES(vdan, vnum, vdan * vnum);
            vnum := vnum + 1;
        END LOOP;
        vdan := vdan + 1;
    END LOOP;
END;

SELECT * FROM tblgugudan ORDER BY dan ASC, num ASC;

TRUNCATE TABLE tblgugudan;

BEGIN
    FOR dan IN 2..9 LOOP
        FOR num IN 1..9 LOOP
            INSERT INTO tblgugudan VALUES(dan, num, dan * num);
        END LOOP;
    END LOOP;
END;

/*
    SELECT를 통해서 가져온 데이터를 PL/SQL 변수에 넣는 방법
    1. SELECT INTO 사용하기
    - 결과셋의 레코드가 1개일 때만 가능하다.
    
    2. 커서(Cursor) 사용하기
    - 결과셋의 레코드가 1개 이상일 때 가능하다.
    
    커서 구문
    DECLARE
        변수 선언;
        커서 선언;
    BEGIN
        커서 열기;
        LOOP
            데이터 접근(레코드 접근);
        END LOOP;
        커서 닫기;
    END;
*/

-- SELECT INTO
-- 1. 단일 컬럼 X 단일 행
-- 2. 다중 컬럼 X 단일 행

-- tblinsa 직원명 가져오기 X 60명
-- Cusor
-- 3. 단일 컬럼 X 다중 행

DECLARE
    CURSOR vcursor
    IS
    SELECT name FROM tblinsa ORDER BY name ASC; -- 커서 선언(아직까진 select 실행 전)
    vname tblinsa.name%type;
BEGIN
    OPEN vcursor; -- 커서 열기(이 때 select 실행)
    
    LOOP
        --레코드 하나하나를 커서를 사용해서 접근
        FETCH vcursor INTO vname;
        
        -- 커서 속성
        -- vcursor%NOTFOUND : 다음행이 있으면 false, 다음행이 없으면 true
        EXIT WHEN vcursor%NOTFOUND;
        
        dbms_output.put_line(vname);
    END LOOP;
    
    CLOSE vcursor; --커서 닫기(자원 해제 코드)
END;