/*
    WHERE절
    - SELECT 컬럼리스트 FROM 테이블명 WHERE절
    - 사용자가 데이터베이스 데이터를 가져올 때 항상 모든 데이터를 취하지는 않는다.
    - 조건의 역할을 해서 일부 레코드만 가져오게 한다. -> 조건절
    - 참, 거짓을 판단하는 연산식을 사용 -> 비교연산자 & 논리연산자
    
    1. SELECT - 3
    2. FROM - 1
    3. WHERE - 2
*/
SELECT * FROM tblname WHERE weight > 70;

SELECT * FROM tblname WHERE weight >= 70 and weight <= 90;

SELECT first, last, weight FROM tblname WHERE weight >= 70 and weight <= 90;

SELECT first, last FROM tblname WHERE weight >= 70 and weight <= 90;

-- 등호
SELECT * FROM tblname WHERE last = '김';
SELECT * FROM tblname WHERE height = 184;
SELECT * FROM tblinsa WHERE ibsadate = '98/10/11';
SELECT * FROM tblinsa WHERE ibsadate = '1998-10-11'; --권장

-- 오라클은 문자열 상수를 날짜형으로 자동 형변환을 시켜준다.
-- 시분초가 들어있으면 형변환 불가능 -> 함수작업
SELECT * FROM tbltodo WHERE adddate = '2018-01-01 06:00:00';
SELECT * FROM tbltodo WHERE adddate = '2018-01-01'; -- 00:00:00

-- 비교연산
SELECT * FROM tblname WHERE height >= 170;

SELECT * FROM tblname WHERE 1 = 1;
SELECT * FROM tblname WHERE 1 > 0;

SELECT * FROM tblname WHERE weight / height * height > 20;

SELECT name, length(name) FROM tblcountry WHERE length(name) >= 4;

-- 비교 연산에 사용되는 자료형
-- 1. 숫자형
-- 2. 문자형 if("홍길동" > "아무개") -> if("홍길동".compareTo("아무개") > 0)

SELECT * FROM tblname WHERE weight > 70;
SELECT * FROM tblname WHERE first > '마';
SELECT * FROM employees WHERE first_name < 'D';
SELECT * FROM tblinsa WHERE ibsadate >= '2000-01-01';

/*
    between
    - WHERE절에서 사용(조건으로 사용)
    - 범위 조건 지정
    - 컬럼명 between 최소값 and 최대값
    - 가독성 향상
    - 최소값, 최대값 모두 포함(Inclusive)
*/
SELECT * FROM tblname WHERE weight >= 70 AND weight <= 90;

SELECT * FROM tblname WHERE weight BETWEEN 70 AND 90;

SELECT * FROM employees WHERE last_name BETWEEN 'D' AND 'F';

SELECT * FROM tblinsa WHERE ibsadate BETWEEN '1999-01-01' AND '2000-12-31';

-- BETWEEN절 사용 금지 > 비교(논리) 연산자를 사용하는게 속도가 더 빠름

/*
    in
    - WHERE 절에서 사용(조건으로 사용)
    - 열거형 조건 비교(제시값 중에서 하나라도 만족하면 true)
    - 컬럼명 in(열거형 값)
*/

SELECT * FROM tblcountry WHERE continent = 'AS' or continent = 'EU';

SELECT * FROM tblcountry WHERE continent IN ('AS', 'EU');

SELECT * FROM tblinsa WHERE buseo = '기획부' or buseo = '영업부' or buseo = '총무부';

SELECT * FROM tblinsa WHERE buseo IN ('기획부', '영업부', '총무부') and jikwi IN ('부장', '과장') and city IN ('서울', '인천') and basicpay BETWEEN 2500000 and 3000000;

/*
    like
    - WHERE 절에서 사용(조건으로 사용)
    - 패턴 조건(특정한 패턴을 가지는 문자열 검색)
    - 컬럼명 like '패턴 문자열'
    
    패턴 문자열 구성 요소
    1. _ : 임의의 문자 1개
    2. % : 임의의 문자 0개 ~ 무한대
*/

SELECT name FROM tblinsa WHERE name LIKE '김__';

SELECT * FROM tblinsa WHERE ssn LIKE '______-1______';

SELECT * FROM tblinsa WHERE tel LIKE '019%';

SELECT name FROM tblinsa WHERE name LIKE '박%';

SELECT * FROM employees WHERE first_name LIKE 'N%';

SELECT * FROM employees WHERE first_name LIKE 'N%e';

SELECT * FROM employees WHERE first_name LIKE '%an%';

/*
    null조건
    - WHERE 절에서 사용
    - null 피연산자로 사용 불가 -> 조건에도 사용 불가
    - 컬럼명 is null (컬럼명 == null)
*/
-- 인구수가 미기재인 나라?
SELECT * FROM tblcountry WHERE population = NULL; -- if (pop == null)

SELECT * FROM tblcountry WHERE population IS NULL;

-- tblinsa 연락처 미기재 직원?
SELECT * FROM tblinsa WHERE tel IS NULL;

-- 인구수가 기재된 나라만
SELECT * FROM tblcountry WHERE population IS not NULL;

SELECT * FROM tblinsa WHERE tel IS not NULL;

SELECT * FROM tblinsa WHERE not tel IS NULL;

SELECT * FROM tblinsa WHERE NOT city IN ('서울', '인천', '부산');

SELECT * FROM tblinsa WHERE NOT name LIKE '김%';

-- completedate : 할일 완료 시각
-- 아직 일을 완료 못한것들만 가져오기
SELECT * FROM tbltodo WHERE completedate IS NULL;
SELECT * FROM tbltodo WHERE completedate IS NOT NULL;

-- 도서관 대여 테이블
-- 대여일, 반납일
SELECT * FROM 대여테이블 WHERE 반납일 IS NULL; -- 아직 대여중인 목록

/*
    distinct
    - 컬럼 리스트에서 사용
    - distinct 컬럼명
    - 중복값 제거
    - NULL도 데이터의 한 종류로 인식한다. -> NULL을 가지는 레코드들도 중복값 제거후 1개 반환
    - 복합 컬럼을 대상으로 distinct 사용
*/

SELECT DISTINCT continent FROM tblcountry;

-- 성이 뭐가?
SELECT DISTINCT gender FROM tblname;

-- tblinsa 직위가 어떤것들이 있는지?
SELECT DISTINCT jikwi FROM tblinsa;

SELECT DISTINCT last FROM tblname;
SELECT DISTINCT first FROM tblname;

SELECT DISTINCT population FROM tblcountry WHERE population IS NOT NULL;

SELECT * FROM tblmen;
SELECT * FROM tblwomen;

SELECT * FROM tblmen WHERE couple IS NULL; -- 솔로
SELECT * FROM tblwomen WHERE couple IS NULL; -- 솔로

-- distinct를 복수컬럼에도 적용할 수 있다.
SELECT DISTINCT price FROM tblhousekeeping;
SELECT DISTINCT price, qty FROM tblhousekeeping;
-- SELECT DISTINCT price, DISTINCT qty FROM tblhousekeeping;

/*
    case
    - 컬럼 리스트에 사용
    - 조건절에 사용
    - 자바에서의 if + case 문과 유사
*/
SELECT last || first as name, case when gender = 'm' then '남자' when gender = 'f' then '여자' end as gender FROM tblname;

SELECT name,
    case
        when continent = 'AS' then '아시아'
        when continent = 'EU' then '유럽'
        else '기타'
    end
FROM tblcountry;

-- 이번달 급여 -> 부장(과장)은 sudang x 2배 지급
SELECT name, basicpay, sudang,
    CASE
       WHEN jikwi = '부장' THEN sudang * 2
       WHEN jikwi = '과장' THEN sudang * 2
       WHEN jikwi = '대리' THEN sudang
       ELSE sudang
    END AS sudang_1
, jikwi FROM tblinsa;

SELECT name, basicpay,
    CASE
        WHEN basicpay >= 2000000 THEN '고액 연봉'
        WHEN basicpay >= 1000000 THEN '일반 연봉'
        ELSE '저액 연봉'
    END AS basicpay_1
FROM tblinsa;

SELECT name, weight, couple,
    CASE
        WHEN weight > 90 THEN '과체중'
        WHEN weight > 60 THEN '정상체중'
        WHEN weight > 0 THEN '저체중'
        ELSE '미정'
    END AS 체중상태,
    CASE
        WHEN couple IS NOT NULL THEN '여자친구 있음'
        WHEN couple IS NULL THEN '솔로'
    END AS 연애상태
FROM tblmen;

SELECT title, completedate,
    CASE
        WHEN completedate IS NULL THEN '실행중'
        WHEN completedate IS NOT NULL THEN '완료'
    END AS 완성상태
FROM tbltodo;

/*
    1. SELECT
    2. FROM
    3. WHERE
    4. ORDER BY
    
    정렬, Sorting
    - 결과셋 레코드의 순서를 정렬(원본 테이블과는 무관)
    - 원본 테이블의 레코드 순서는 DBMS가 알아서 함
    - ORDER BY 컬럼명 [ASC|DESC]
        - ORDER BY 컬럼명 ASC // Ascending, 오름차순
        - ORDER BY 컬럼명 DESC // Descending, 내림차순
        - ORDER BY 컬럼명 // ASC, 오름차순
    - ASC
        - 10 -> 20 -> 30
        - '가' -> '나' -> '다'
        - '2016' -> '2017' -> '2018'
*/
SELECT * FROM tblinsa 
    -- ORDER BY name ASC;
    -- ORDER BY ibsadate DESC;
    -- ORDER BY basicpay DESC;
    -- ORDER BY basicpay + sudang DESC;
    ORDER BY buseo ASC, jikwi ASC, basicpay DESC; -- 다중 정렬
    
-- 최근 완료한 할일부터 가져오시오.
SELECT * FROM tbltodo ORDER BY completedate DESC;

-- 정렬 대상에 NULL이 포함되어 있으면 일반적으로 빼고 정렬한다.(우위 비교가 불가능하기 때문에)
-- 만약 NULL이 포함되는 정렬이라면 -> NULL의 위치는? -> DBMS에 따라 다르다.
SELECT * FROM tbltodo WHERE completedate IS NOT NULL ORDER BY completedate DESC;

/*
    1. SELECT - 3
    2. FROM - 1
    3. WHERE - 2
    4. ORDER BY - 4
*/
SELECT last || first AS name
FROM tblname
-- WHERE name = '유재석';
-- WHERE last || first = '유재석';
-- ORDER BY name DESC;
ORDER BY last || first DESC;