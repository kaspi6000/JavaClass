/*
    서브쿼리, Sub Query
    - SQL 안에 또 다른 SQL이 들어 있는 형태
    - SELECT 문이 서브쿼리 형태로 사용된다.
    - 서브쿼리가 들어갈 수 있는 위치
        a. WHERE절 : 서브쿼리의 결과셋을 조건값으로 사용
        b. 컬럼리스트 : 서브쿼리의 결과셋을 또 하나의 컬럼 데이터로 사용
        c. FROM 절 : 서브쿼리의 결과셋을 하나의 테이블로 사용 -- 뷰(View)
        d. ORDER BY절
        e. GROUP BY절
*/

SELECT * FROM tblhousekeeping ORDER BY price DESC;

-- 단가가 가장 높은 물건명?
SELECT max(price) FROM tblhousekeeping; -- 15000

SELECT item FROM tblhousekeeping WHERE price = max(price);

SELECT item FROM tblhousekeeping WHERE price = (SELECT max(price) FROM tblhousekeeping);

SELECT * FROM tbltodo;
-- 가장 최근에 등록한 할일?(adddate가 가장 마지막 날짜)

SELECT max(adddate) FROM tbltodo; -- 18/01/12 12:30:23

SELECT title FROM tbltodo WHERE adddate = to_date('2018-01-12 12:30:23', 'YYYY-mm-dd hh24:mi:ss');

SELECT title FROM tbltodo WHERE adddate = (SELECT max(adddate) FROM tbltodo);

-- 회사 평균 월급(155만원)보다 많이 받는 직원들 명단?
SELECT * FROM tblinsa;

SELECT avg(basicpay) FROM tblinsa;

SELECT * FROM tblinsa WHERE basicpay > (SELECT avg(basicpay) FROM tblinsa);

SELECT DISTINCT buseo FROM tblinsa WHERE basicpay > (SELECT avg(basicpay) FROM tblinsa WHERE buseo = '총무부') AND buseo <> '총무부';

SELECT * FROM tblinsa WHERE name = '홍길동';

SELECT * FROM tblinsa WHERE basicpay > (SELECT basicpay FROM tblinsa WHERE name = '홍길동');

SELECT * FROM tblinsa WHERE basicpay > (SELECT basicpay FROM tblinsa WHERE jikwi = '과장');

SELECT * FROM tblinsa WHERE basicpay > (SELECT max(basicpay) FROM tblinsa WHERE jikwi = '과장');

SELECT * FROM tblmen;
SELECT * FROM tblwomen;

-- 남자 170cm -> 여자친구 -> 키?
SELECT height FROM tblwomen WHERE name = (SELECT couple FROM tblmen WHERE height = 170 AND weight IS NULL);

-- hr
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM locations;

-- 직원 Steven King이 소속된 부서가 어느 지역에 있는지 주소를 알려주세요.
SELECT * FROM locations WHERE location_id = (SELECT location_id FROM departments WHERE department_id = (SELECT department_id FROM employees WHERE first_name || last_name = 'StevenKing'));

-- 컬럼리스트에 서브쿼리 사용

-- 기획부 직원들은 길동이보다 얼마를 더 받고 얼마를 덜 받는지 차액이 궁금?
SELECT name, basicpay, (SELECT basicpay FROM tblinsa WHERE name = '홍길동') - basicpay AS 차액 FROM tblinsa WHERE buseo = '기획부';

-- 집계함수를 컬럼리스트에 사용 -> 서브쿼리
SELECT name, basicpay, (SELECT max(basicpay) FROM tblinsa) FROM tblinsa;
SELECT name, basicpay, (SELECT max(basicpay) FROM tblinsa) - basicpay FROM tblinsa;

-- 바깥쪽 테이블의 데이터를 안쪽 테이블의 조건으로 사용 -- 보류

-- FROM절 -> 서브쿼리
SELECT * FROM (SELECT * FROM tblname WHERE gender = 'm'); -- 임시 남자 테이블

CREATE TABLE tbltempmen
AS
SELECT * FROM tblname WHERE gender = 'm';

SELECT * FROM tbltempmen;

SELECT * FROM (SELECT name, ssn, jikwi, city FROM tblinsa WHERE buseo = '기획부');

SELECT name, ssn, jikwi, city FROM (SELECT name, ssn AS jumin, jikwi, city FROM tblinsa WHERE buseo = '기획부');

-- 서브쿼리의 결과가 다중값일 때
-- 1. 다중 행
-- 2. 다중 컬럼

-- 홍길동(부장)와 이순애(부장)이 속한 부서 직원들을 가져오시오.
SELECT name, buseo FROM tblinsa
    -- WHERE buseo = '기획부' OR buseo = '개발부';
    WHERE buseo IN('기획부', '개발부');

SELECT * FROM tblinsa WHERE name = '홍길동' OR name = '이순신';

SELECT name, buseo FROM tblinsa WHERE buseo IN(SELECT buseo FROM tblinsa WHERE name = '홍길동' OR name = '이순애');

SELECT buseo, jikwi FROM tblinsa
    WHERE name = '나윤균';
    
-- 나윤균과 같은 부서에 소속 + 같은 직위를 가지는 사람들?
SELECT * FROM tblinsa
    WHERE buseo = '인사부' AND jikwi = '사원';
    
SELECT * FROM tblinsa
    WHERE buseo = (SELECT buseo FROM tblinsa WHERE name = '나윤균')
    AND jikwi = (SELECT jikwi FROM tblinsa WHERE name = '나윤균');
    
SELECT * FROM tblinsa
    WHERE buseo = (SELECT buseo FROM tblinsa WHERE num = 1035)
    AND jikwi = (SELECT jikwi FROM tblinsa WHERE num = 1035);
    
SELECT * FROM tblinsa
    WHERE buseo = (SELECT buseo FROM tblinsa WHERE basicpay = (SELECT min(basicpay) FROM tblinsa))
    AND jikwi = (SELECT jikwi FROM tblinsa WHERE basicpay = (SELECT min(basicpay) FROM tblinsa));
    
SELECT * FROM tblinsa
    WHERE (buseo, jikwi) = (SELECT buseo, jikwi FROM tblinsa WHERE name = '나윤균');
    
-- 순서만 중요
SELECT * FROM tblinsa
    WHERE (buseo, jikwi) = (SELECT buseo, jikwi AS position FROM tblinsa WHERE name = '나윤균');
    
-- 다중컬럼 + 다중행 -> 서브쿼리 조건값으로 사용
SELECT * FROM tblinsa
    WHERE (buseo, jikwi) IN (SELECT buseo, jikwi FROM tblinsa WHERE name = '나윤균');