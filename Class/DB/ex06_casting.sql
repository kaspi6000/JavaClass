/*
    형변환 함수
    
    1. to_char() : 숫자 -> 문자
    2. to_char() : 날짜 -> 문자
    3. to_number() : 문자 -> 숫자
    4. to_date() : 문자 -> 날짜
    
    1. 숫자 -> 문자
    - char to_char(컬럼명, 형식문자열)
    
    형식문자열 구성 요소
    - 아래의 요소 이외에는 형식문자열에 포함될 수 없다.
    a. 9 : 숫자 1자리를 문자 1개로 바꾸는 역할(모자란 자리는 공백으로 채우기) + 맨앞에 공백 1개 추가(부호)
    b. 0 : 숫자 1자리를 문자 1개로 바꾸는 역할(모자란 자리는 0으로 채우기) + 맨앞에 공백 1개 추가(부호)
    c. $ : 달러 표시용
    d. L : Locale(지역 통화 표시)
    e. . : 소수점 표시용
    f. , : 천단위 표시용
*/
SELECT 100, '100' FROM dual;

SELECT to_char(100, '999') FROM dual; -- 100 -> '100'
SELECT to_char(100, '000') FROM dual; -- 100 -> '100'

SELECT to_char(10, '999') FROM dual; -- 10 -> '10'
SELECT to_char(10, '000') FROM dual; -- 10 -> '010'

SELECT to_char(1, '999') FROM dual; -- 1 -> '1'
SELECT to_char(1, '000') FROM dual; -- 1 -> '001'

SELECT '@' || to_char(-111, '999') || '@' FROM dual; -- 1 -> '1'
SELECT '@' || to_char(1, '000') || '@' FROM dual; -- 1 -> '001'

SELECT to_char(1000, '999') FROM dual;

-- 100원
SELECT to_char(100, '$999') FROM dual;
SELECT to_char(100, 'L999') FROM dual;
SELECT to_char(100, '999') || '원' FROM dual;

SELECT to_char(123.456, '999.999') FROM dual;
SELECT to_char(123.456, '999.99') FROM dual; -- 반올림 + 문자열 변환
SELECT to_char(123.456, '999.9') FROM dual;

SELECT to_char(1000000, '9,999,999') FROM dual;
SELECT to_char(1000000, '999,9999') FROM dual;

/*
    2. 날짜 -> 문자
    - varchar2 to_char(컬럼명, '형식문자열')
    
    형식 문자열의 구성 요소
    - YYYY
    - YY
    - mon
    - mm
    - day
    - dy
    - ddd, dd, d
    - hh(hh12), hh24
    - mi
    - ss
    - am(pm)
*/
SELECT to_char(sysdate, 'YYYY-mm-dd hh:mi:ss[am]') FROM dual; -- ddd : 1월1일부터 몇일 흘렀는지, d : 이번주 기준으로 몇일 흘렀는지 = 요일

-- 조건절에 사용
-- date형을 문자열 함수에 사용하지 말것
-- date형 -> 문자열로 형변환 -> 문자열 함수 사용

-- 12월에 입사한 직원?
SELECT name, ibsadate, substr(ibsadate, 1) FROM tblinsa;

SELECT name, ibsadate, to_char(ibsadate, 'mm')
    FROM tblinsa
        WHERE to_char(ibsadate, 'mm') = '12';
        
SELECT * 
    FROM tbltodo
        -- WHERE to_char(adddate, 'am') = '오전';
        WHERE to_char(adddate, 'd') = '7'; -- 토요일 등록한 할일
        
-- 97 ~ 99년 사이에 입사한 사람
SELECT * FROM tblinsa 
    -- WHERE to_char(ibsadate, 'YY') = '97' or to_char(ibsadate, 'YY') = '98' or to_char(ibsadate, 'YY') = '99';
    WHERE to_char(ibsadate, 'YY') BETWEEN '97' AND '99';
    
-- 정렬
SELECT * FROM tblinsa
    -- ORDER BY ibsadate DESC;
    ORDER BY to_char(ibsadate, 'mm') ASC, to_char(ibsadate, 'YY') ASC, to_char(ibsadate, 'dd') ASC, num ASC;
    
/*
    3. 문자 -> 숫자
    - number to_number(문자열)
    - Integer.parseInt(문자열)
*/
SELECT to_number('123') FROM dual;

/*
    4. 문자 -> 날짜
    - date to_date(컬럼명, '형식문자열')
    - 2번에서 사용한 형식 문자열과 동일
*/
SELECT '2018-01-16', sysdate FROM dual;
SELECT * FROM tblinsa WHERE ibsadate < '2018-01-16'; -- '2018-01-16' : date

-- 형식문자열 만드는 방법 -> 앞의 데이터 포맷을 그대로 표현
SELECT to_date('2018-01-16 오전 12:23:34', 'YYYY-mm-dd pm hh:mi:ss') AS 시각, sysdate FROM dual;
SELECT to_date('2018.01.16 오전 12:23:34', 'YYYY-mm-dd pm hh:mi:ss') AS 시각, sysdate FROM dual;
SELECT to_date('20180116 12:23:34', 'YYYY-mm-dd hh24:mi:ss') AS 시각, sysdate FROM dual;