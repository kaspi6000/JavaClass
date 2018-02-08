-- 01. tblinsa 테이블 전체 레코드 조회
SELECT * FROM tblinsa;


-- 02. HR 사용자 소유 테이블 목록 확인
SELECT * FROM tabs;

-- 03. tblinsa 테이블 구조 확인
DESC tblinsa;

-- 04. tblinsa 테이블의 이름(name), 기본급(basicpay) 조회
SELECT name, basicpay FROM tblinsa;

-- 05. tblinsa 테이블의 이름(name), 기본급(basicpay), 수당(sudang), 기본급+수당 조회
SELECT name, basicpay, sudang, basicpay + sudang FROM tblinsa;

-- 06. 이름(name), 출신도(city), 부서명(buseo) 조회. 별명 사용.
SELECT name as 이름, city as 출신도, buseo as 부서명 FROM tblinsa;

-- 07. 서울 사람의 이름(name), 출신도(city), 부서명(buseo), 직위(jikwi) 조회
SELECT name, city, buseo, jikwi FROM tblinsa;


-- 08. 출신도가 서울 사람이면서       --> WHERE 구문
--     기본급이 150만원 이상인 사람   --> WHERE 구문
--     조회 (name, city, basicpay, ssn)
SELECT name, city, basicpay, ssn FROM tblinsa
      WHERE city = '서울' AND basicpay >= 1500000;


-- 09. 출신도가 '인천' 이면서, 기본급이 100만원이상 ~ 200만원 미만인 경우만 모든정보 조회.
SELECT * FROM tblinsa
      WHERE city = '인천' AND basicpay >= 1000000 AND basicpay < 2000000;

-- 10. 출신도가 서울 사람이거나 부서가 개발부인 자료 조회 (name, city, buseo)'
SELECT name, city, buseo FROM tblinsa
      WHERE city = '서울' or buseo = '개발부';
 
-- 11. 출신도가 서울, 경기인 사람만 조회 (name, city, buseo). IN 연산자 사용.
SELECT name, city, buseo FROM tblinsa
      WHERE city in ('서울', '경기');


-- 12. 부서가 '개발부' 이거나 '영업부'인 사원의 모든정보 조회. IN 연산자 사용.
SELECT * FROM tblinsa
      WHERE buseo in ('개발부', '영업부');


-- 13. 급여(basicpay + sudang)가 250만원 이상인 사람 조회. --> WHERE 구문
--     단, 필드명은 한글로 출력. --> 별칭
--     (name, basicpay, sudang, basicpay+sudang)
SELECT name as 이름, basicpay as 본봉, sudang as 수당, basicpay+sudang as 급여 FROM tblinsa
      WHERE (basicpay + sudang) >= 2500000;


-- 14. 주민번호를 기준으로 남자(성별란이 1, 3)만 조회. (이름(name), 주민번호(ssn)). 
--     단, SUBSTR() 함수 이용.
SELECT  name as 이름, ssn as 주민번호 FROM tblinsa
      WHERE substr(ssn, 8, 1) in ('1', '3');

 
-- 15. 주민번호를 기준으로 80년대 태어난 사람만 출력. (이름(name), 주민번호(ssn)). 
--     단, SUBSTR() 함수 이용.
SELECT  name as 이름, ssn as 주민번호 FROM tblinsa
      WHERE substr(ssn, 1, 1) = '8';


-- 16. 서울 사람 중에서 70년대 태어난 사람만 출력. SUBSTR() 함수 이용.
SELECT  * FROM tblinsa
      WHERE substr(ssn, 1, 1) = '7' AND city = '서울';

    
-- 17. 서울 사람 중에서 70년대 태어난 남자만 출력. SUBSTR() 함수 이용.
SELECT  * FROM tblinsa
      WHERE city = '서울' AND substr(ssn, 1, 1) = '7' AND substr(ssn, 8, 1) = '1';

 
-- 18. 서울 사람이면서 김씨만 출력(성씨가 1자라는 가정). (이름, 출신도). 
-- SUBSTR() 함수 이용.
SELECT  name as 이름, city as 출신도 FROM tblinsa
      WHERE city = '서울' AND substr(name, 1, 1) = '김';


-- 19. 2000년도에 입사한 사람 출력. (이름, 출신도, 입사일). 
-- SUBSTR() 또는 TO_CHAR() 함수 이용.
SELECT  name, city, ibsadate FROM tblinsa
      WHERE to_char(ibsadate, 'yyyy') = '2000';




-- 20. 2000년 10월에 입사한 사람 출력. (이름, 출신도, 입사일).
SELECT  name, city, ibsadate FROM tblinsa
      WHERE to_char(ibsadate, 'yyyy-mm') = '2000-10';



-- 21. 주민번호를 기준으로 직원의 나이 구하기(단, 모든 직원이 1900년대에 태어났다는 가정). (이름, 주민번호, 나이)
SELECT  name, ssn, (to_number(to_char(sysdate, 'yyyy'), '9999') - to_number('19' || substr(ssn, 1, 2), '9999')) as age FROM tblinsa;


-- 22. 주민번호 기준으로 현재 나이대가 40대인 사람만 출력.
SELECT * FROM tblinsa
      WHERE floor((to_number(to_char(sysdate, 'yyyy'), '9999') - to_number('19' || substr(ssn, 1, 2), '9999')) / 10) = 4;


-- 23. 주민번호 기준으로 5월달생만 출력. SUBSTR() 함수 이용.
SELECT * FROM tblinsa
      WHERE substr(ssn, 3, 2) = '05';


-- 24. 주민번호 기준으로 5월달생만 출력. TO_CHAR() 함수 이용.
-- 문자열 -> 날짜 -> 문자열
SELECT * FROM tblinsa
      WHERE to_char(to_date('19' || substr(ssn, 1, 2) || '-' || substr(ssn, 3, 2) || '-' || substr(ssn, 5, 2), 'yyyy-mm-dd'), 'mm') = '05';


-- 25. 출신도 내림차순으로 정렬하고, 출신도가 같으면 기본급 내림차순
SELECT * FROM tblinsa
      ORDER BY city DESC, basicpay DESC ;

 
 
-- 26. 서울 사람 중에서 기본급+수당(->급여) 내림차순으로 정렬. 
-- (이름, 출신도, 기본급+수당)
SELECT name as 이름, city as 출신도, (basicpay + sudang) as 급여 FROM tblinsa
      WHERE city = '서울'
            ORDER BY (basicpay + sudang) DESC ;


 
-- 27. 여자 중 부서 오름차순으로 정렬하고, 부서가 같으면 기본급 내림차순 정렬. (이름, 주민번호, 부서, 기본급)
SELECT name, ssn, buseo, basicpay FROM tblinsa
      WHERE substr(ssn, 8, 1) = '2'
            ORDER BY buseo ASC, basicpay DESC ;


-- 28. 남자 중에서 나이를 기준으로 오름차순 정렬해서 출력.
SELECT * FROM tblinsa
      WHERE substr(ssn, 8, 1) = '1'
            ORDER BY substr(ssn, 1, 6) ASC ;


-- 29. 서울 지역 사람들 중에서 입사일이 빠른 사람을 먼저 출력.
SELECT * FROM tblinsa
      WHERE city = '서울'
            ORDER BY ibsadate ASC ;


-- 30. 성씨가 김씨가 아닌 사람 출력. (이름, 출신도, 기본급). 
-- LIKE 연산자 또는 SUBSTR() 함수 이용.
SELECT name, city, basicpay FROM tblinsa
      WHERE substr(name, 1, 1) <> '김';


-- 31. 출신도가 서울, 부산, 대구 이면서 
-- 전화번호에 5 또는 7이 포함된 자료 출력하되 
-- 부서명의 마지막 부는 출력되지 않도록함. 
-- (이름, 출신도, 부서명, 전화번호)
SELECT name, city, substr(buseo, 1, length(buseo) - 1) as buseo, tel FROM tblinsa
      WHERE city in ('서울', '부산', '대구')
            AND (tel like '%5%' OR tel like '%7%');


  
-- 32. 전화번호가 있으면 '-'을 제거하고 출력하고, 없으면 '전화번호없음'을 출력
-- 추가문제) HR계정, employees 테이블에서 커미션 받는 사람의 수와 
-- 안받는 사람의 수를 출력
--COUNT(), NVL(), GROUP BY 구문
SELECT name, nvl(tel, '전화번호없음') FROM tblinsa;

SELECT count(*) FROM employees
      GROUP BY nvl2(commission_pct, 1, 0);



-- 33. tblinsa 테이블에서 basicpay+sudang가 100만원 미만
-- , 100만원 이상~200만원 미만, 200만원 이상인 직원들의 수 출력.
--GROUP BY 구문
SELECT floor((basicpay + sudang) / 1000000) * 100 as 급여, count(*) FROM tblinsa
      GROUP BY floor((basicpay + sudang) / 1000000);



-- 34. tblinsa 테이블에서 주민번호를 가지고 생년월일의 년도별 직원수 출력
SELECT '19' || substr(ssn, 1, 2), count(*) FROM tblinsa
      GROUP BY substr(ssn, 1, 2)
            ORDER BY substr(ssn, 1, 2);



-- 35. 주민번호를 기준으로 월별 오름차순, 월이 같으면 년도 내림차순 출력. 
-- (이름, 주민번호) . SUBSTR() 함수 이용.
SELECT name, ssn FROM tblinsa
      ORDER BY substr(ssn, 3, 2) ASC, substr(ssn, 1, 2);


-- 36. 입사일을 기준으로  월별 오름차순, 월이 같으면 년도 내림차순 출력. 
-- 주의. 입사일은 자료형이 DATE이다.
SELECT * FROM tblinsa
      ORDER BY to_char(ibsadate, 'mm') ASC, to_char(ibsadate, 'yyyy') DESC ;
    

-- 37. 전체인원수, 남자인원수, 여자인원수를 동시 출력.
SELECT
      count(decode(substr(ssn, 8, 1), '1', '1')) as 남자인원수,
      count(decode(substr(ssn, 8, 1), '2', '1')) as 여자인원수
FROM tblinsa;


-- 38. 개발부, 영업부, 총무부 인원수 출력. COUNT(), DECODE() 함수 이용.
SELECT
      count(decode(buseo, '개발부', '1')) as 개발부,
      count(decode(buseo, '영업부', '1')) as 영업부,
      count(decode(buseo, '총무부', '1')) as 총무부
FROM tblinsa;

        
-- 39. 서울 사람의 남자 인원수 출력.
SELECT count(*) FROM tblinsa
      WHERE city = '서울' AND substr(ssn, 8, 1) = '1';


-- 40. 부서가 영업부이고, 남자 인원수, 여자 인원수 출력.  COUNT(), DECODE() 함수 이용.        
SELECT
      count(decode(substr(ssn, 8, 1), '1', '1')) as 남자인원수,
      count(decode(substr(ssn, 8, 1), '2', '1')) as 여자인원수
FROM tblinsa
      WHERE buseo = '영업부';
    
-- 41. 개발부, 영업부, 총무부 인원수 출력. 단, 지역은 '서울'로 한정.
SELECT
      count(decode(buseo, '개발부', '1')) as 개발부,
      count(decode(buseo, '영업부', '1')) as 영업부,
      count(decode(buseo, '총무부', '1')) as 총무부
FROM tblinsa
WHERE city = '서울';


 
-- 42. 서울 사람의 남자와 여자의 기본급합 출력.
SELECT substr(ssn, 8, 1), sum(basicpay)
      FROM tblinsa
            WHERE city = '서울'
                  GROUP BY substr(ssn, 8, 1);


-- 43. 남자와 여자의 기본급 평균값 출력. AVG(), DECODE() 함수 이용.
SELECT
      avg(decode(substr(ssn, 8, 1), '1', basicpay)) as 남자,
      avg(decode(substr(ssn, 8, 1), '2', basicpay)) as 여자
FROM tblinsa;


-- 44. 개발부의 남자, 여자 기본급 평균값 출력.
SELECT
      avg(decode(substr(ssn, 8, 1), '1', basicpay)) as 남자,
      avg(decode(substr(ssn, 8, 1), '2', basicpay)) as 여자
FROM tblinsa
WHERE buseo = '개발부';


-- 45. 부서별 남자와 여자 인원수 구하기
SELECT
      buseo,
      substr(ssn, 8, 1),
      count(*)
FROM tblinsa
      GROUP BY buseo, substr(ssn, 8, 1)
            ORDER BY buseo, substr(ssn, 8, 1);

        
-- 46. 지역별 남자와 여자 인원수 구하기
SELECT
      city,
      substr(ssn, 8, 1),
      count(*)
FROM tblinsa
      GROUP BY city, substr(ssn, 8, 1)
            ORDER BY city, substr(ssn, 8, 1);


-- 47. 입사년도별 남자와 여자 인원수 구하기
SELECT
      to_char(ibsadate, 'yyyy'),
      substr(ssn, 8, 1),
      count(*)
FROM tblinsa
      GROUP BY to_char(ibsadate, 'yyyy'), substr(ssn, 8, 1)
            ORDER BY to_char(ibsadate, 'yyyy'), substr(ssn, 8, 1);


-- 48. 영업부, 총무부 인원만을 가지고 입사년도별 남자와 여자 인원수 구하기
SELECT
      to_char(ibsadate, 'yyyy'),
      substr(ssn, 8, 1),
      count(*)
FROM tblinsa
      WHERE buseo in ('영업부', '총무부')
            GROUP BY to_char(ibsadate, 'yyyy'), substr(ssn, 8, 1)
                  ORDER BY to_char(ibsadate, 'yyyy'), substr(ssn, 8, 1);



-- 49. 서울 사람중 부서별 남자와 여자인원수, 남자와 여자 급여합 출력.
SELECT
      buseo,
      substr(ssn, 8, 1),
      count(*),
      sum(basicpay)
FROM tblinsa
      WHERE city = '서울'
            GROUP BY buseo, substr(ssn, 8, 1)
                  ORDER BY buseo, substr(ssn, 8, 1);


-- 50. 부서별 인원수 출력. 인원수가 10 이상인 경우만.
SELECT buseo, count(*) FROM tblinsa
      GROUP BY buseo
            HAVING count(*) >= 10;


-- 51. 부서별 남,여 인원수 출력. 여자인원수가 5명 이상인 부서만 출력.
SELECT
      buseo,
      substr(ssn, 8, 1),
      count(*)
FROM tblinsa
      GROUP BY buseo, substr(ssn, 8, 1)
            HAVING count(*) >= 5
                  ORDER BY buseo, substr(ssn, 8, 1);

 
-- 52. 이름, 성별, 나이 출력
--        성별: 주민번호 1,3->남자, 2,4->여자 (DECODE 사용)
--        나이: 주민번호 이용해서
SELECT
      name,
      decode(substr(ssn, 8, 1), '1', '남자', '3', '남자', '2', '여자', '2', '여자') as 성별,
      to_number(to_char(sysdate, 'yyyy')) - to_number('19' || substr(ssn, 1, 2), '9999') as 나이
FROM tblinsa;

 
-- 53. 서울 사람 중에서 기본급이 200만원 이상이 사람. (이름, 기본급)
SELECT name, basicpay FROM tblinsa
      WHERE city = '서울' AND basicpay >= 2000000;


 
-- 54. 입사월별 인원수 구하기. (월, 인원수)   COUNT, GROUP BY, TO_CHAR 사용
--         출력형태 ----------
--         월      인원수
--         1월    10명
--         2월    25명
SELECT
      to_char(ibsadate, 'mm') || '월' as 월,
      count(*) as 인원수
FROM tblinsa
      GROUP BY to_char(ibsadate, 'mm')
            ORDER BY to_char(ibsadate, 'mm') ASC ;



-- 55. 이름, 생년월일, 기본급, 수당을 출력.
--        생년월일은 주민번호 기준 (2000-10-10 형식으로 출력)
--        기본급은 \1,000,000 형식으로 출력
SELECT name, '19' || substr(ssn, 1, 2) || '-' || substr(ssn, 3, 2) || '-' || substr(ssn, 5, 2) as 생년월일, to_char(basicpay, 'L9,999,999') as 기본급 FROM tblinsa;


 
-- 56. 이름, 출신도, 기본급을 출력하되 출신도 내림차순 출력(1차 정렬 기준). 
-- 출신도가 같으면 기본급 오름차순 출력(2차 정렬 기준).
SELECT name, city, basicpay FROM tblinsa
      ORDER BY city DESC , basicpay ASC ;


 
-- 57. 전화번호가 NULL이 아닌것만 출력. (이름, 전화번호)
SELECT name, tel FROM tblinsa
      WHERE tel IS NOT NULL ;


-- 58. 근무년수가 15년 이상인 사람 출력. (이름, 입사일)
SELECT name, ibsadate, months_between(sysdate, ibsadate) / 12 FROM tblinsa
      WHERE months_between(sysdate, ibsadate) >= (15 * 12);


 
-- 59. 주민번호를 기준으로 75~82년생 출력. (이름, 주민번호, 출신도). 
-- SUBSTR() 함수, BEWTEEN AND 구문, TO_NUMBER() 함수 이용.
SELECT  name, ssn, city FROM tblinsa
      WHERE to_number(substr(ssn, 1, 2)) BETWEEN 75 AND 82;


-- 60. 근무년수가 15~20년인 사람 출력. (이름, 입사일)
SELECT name, ibsadate FROM tblinsa
      WHERE months_between(sysdate, ibsadate) BETWEEN (15 * 12) AND (20 * 12);

 
-- 61. 김씨, 이씨, 박씨만 출력 (이름, 부서). SUBSTR() 함수 이용.
SELECT name, buseo FROM tblinsa
      WHERE substr(name, 1, 1) in ('김', '이', '박');

 
-- 62. 입사일을 "년-월-일 요일" 형식으로 남자만 출력 (이름, 주민번호, 입사일)
SELECT name, ssn, to_char(ibsadate, 'yyyy') || '년 ' || to_char(ibsadate, 'mm') || '월 ' || to_char(ibsadate, 'dd') || '일 ' || to_char(ibsadate, 'day') FROM tblinsa
      WHERE substr(ssn, 8, 1) = '1';


-- 63. 부서별 직위별 급여합 구하기. (부서, 직위, 급여합)
SELECT buseo, jikwi, sum(basicpay) FROM tblinsa
      GROUP BY buseo, jikwi
            ORDER BY buseo, sum(basicpay);


-- 64. 부서별 직위별 인원수, 급여합, 급여평균 구하기. (부서, 직위, 급여합)
SELECT buseo, jikwi, count(*), sum(basicpay), round(avg(basicpay)) FROM tblinsa
      GROUP BY buseo, jikwi
            ORDER BY buseo, jikwi;

 
-- 65. 부서별 직위별 인원수를 구하되 인원수가 5명 이상인 경우만 출력.
SELECT buseo, jikwi, count(*) FROM tblinsa
      GROUP BY buseo, jikwi
            HAVING count(*) >= 5
                  ORDER BY count(*);


-- 66. 2000년에 입사한 여사원. (이름, 주민번호, 입사일)
SELECT name, ssn, ibsadate FROM tblinsa
      WHERE to_char(ibsadate, 'yyyy') = '2000';

 
-- 67. 성씨가 한 글자(김, 이, 박 등)라는 가정하에 성씨별 인원수 (성씨, 인원수)
SELECT substr(name, 1, 1), count(*) FROM tblinsa
      GROUP BY substr(name, 1, 1)
            ORDER BY count(*) DESC, substr(name, 1, 1) ASC ;

    
-- 68. 출신도(CITY)별 성별 인원수.
SELECT city, substr(ssn, 8, 1), count(*) FROM tblinsa
      GROUP BY city, substr(ssn, 8, 1)
            ORDER BY city, substr(ssn, 8, 1);

 
-- 69. 부서별 남자인원수가 5명 이상인 부서와 남자인원수.
SELECT buseo, count(*)
FROM tblinsa
      WHERE substr(ssn, 8, 1) = '1'
            GROUP BY buseo
                  HAVING count(*) >= 5;

 
-- 70. 입사년도별 인원수.
SELECT to_char(ibsadate, 'yyyy'), count(*) FROM tblinsa
      GROUP BY to_char(ibsadate, 'yyyy')
            ORDER BY to_char(ibsadate, 'yyyy') ASC ;


-- 71. 전체인원수, 2000년, 1999년, 1998년도에 입사한 인원을 다음의 형식으로 출력.
--         전체 2000 1999 1998
--          60    x    x    x
SELECT
      count(*) as 전체,
      count(decode(to_char(ibsadate, 'yyyy'), '2000', 1)) as "2000",
      count(decode(to_char(ibsadate, 'yyyy'), '1999', 1)) as "1999",
      count(decode(to_char(ibsadate, 'yyyy'), '1998', 1)) as "1998"
FROM tblinsa


-- 72. 아래 형식으로 지역별 인원수 출력.
--         전체 서울  인천  경기
--          60    x     x     x
SELECT
      count(*) as 전체,
      count(decode(city, '서울', 1)) as "서울",
      count(decode(city, '인천', 1)) as "인천",
      count(decode(city, '경기', 1)) as "경기"
FROM tblinsa



-- 73. 기본급(basicpay)이 평균 이하인 사원 출력. (이름, 기본급). AVG() 함수. 하위쿼리.
SELECT * FROM tblinsa
      WHERE basicpay <= (SELECT avg(basicpay) FROM tblinsa);



-- 74. 기본급 상위 10%만 출력. (이름, 기본급)
SELECT name, basicpay FROM tblinsa
      WHERE rownum <= (SELECT count(*) FROM tblinsa) / 10;


-- 75.기본급 순위가 5순위까지만 출력
SELECT * FROM
      (SELECT a.*, rownum as rnum FROM
            (SELECT * FROM tblinsa
                  ORDER BY basicpay DESC) a)
                        WHERE rnum <= 5;


-- 76. 입사일이 빠른 순서로 5순위까지만 출력.
SELECT * FROM
      (SELECT a.*, rownum as rnum FROM
            (SELECT * FROM tblinsa
                  ORDER BY ibsadate ASC) a)
                        WHERE rnum <= 5;



-- 77. 평균 급여보다 많은 급여를 받는 직원 출력
SELECT * FROM tblinsa
      WHERE basicpay >= (SELECT avg(basicpay) FROM tblinsa);


-- 78. '이순애' 직원의 급여보다 더 많은 급여를 받는 직원 출력.
SELECT * FROM tblinsa
      WHERE basicpay > (SELECT basicpay FROM tblinsa WHERE name = '이순애');


-- 79. 총무부의 평균 급여보다 많은 급여를 받는 직원들의 이름, 부서명 출력.
SELECT name, buseo FROM tblinsa
      WHERE basicpay >= (SELECT avg(basicpay) FROM tblinsa WHERE buseo = '총무부');


-- 80. 총무부 직원들보다 더 많은 급여를 받는 직원 정보.
SELECT name, buseo FROM tblinsa
      WHERE basicpay > (SELECT max(basicpay) FROM tblinsa WHERE buseo = '영업부')
            AND buseo <> '영업부';



-- 81. 직원 전체 평균 급여보다 많은 급여를 받는 직원의 수 출력.
SELECT count(*) FROM tblinsa
      WHERE basicpay > (SELECT avg(basicpay) FROM tblinsa);



-- 82. '홍길동' 직원과 같은 부서의 직원 정보.
SELECT * FROM tblinsa
      WHERE buseo = (SELECT buseo FROM tblinsa WHERE name = '홍길동');



-- 83. '김신애' 직원과 같은 부서, 직위를 가진 직원 정보
SELECT * FROM tblinsa
      WHERE (buseo, jikwi) = (SELECT buseo, jikwi FROM tblinsa WHERE name = '김신애');

            


-- 84. 부서별 기본급이 가장 높은 사람 출력. (이름, 부서, 기본급)
SELECT a.*,
      (SELECT name FROM tblinsa WHERE basicpay = a.m AND buseo = a.buseo)
            FROM (SELECT buseo, max(basicpay) as m FROM tblinsa i
                  GROUP BY buseo) a;

       


-- 85. 남자 기본급 순위 출력.
    -- 여자 기본급 순위 출력.
SELECT rownum, a.* FROM
      (SELECT * FROM tblinsa
            WHERE substr(ssn, 8, 1)  = '1'
                  ORDER BY basicpay DESC) a;

SELECT rownum, a.* FROM
      (SELECT * FROM tblinsa
            WHERE substr(ssn, 8, 1)  = '2'
                  ORDER BY basicpay DESC) a;

        
-- 86. 지역(city)별로 급여(기본급+수당) 1순위 직원만 출력.
SELECT * FROM tblinsa
      WHERE  (city, (basicpay + sudang)) IN (SELECT city, max(basicpay + sudang) FROM tblinsa GROUP BY city);



-- 87. 부서별 인원수가 가장 많은 부서 및 인원수 출력.
SELECT * FROM
      (SELECT buseo, count(*) FROM tblinsa
            GROUP BY buseo
                  ORDER BY count(*) DESC)
                        WHERE rownum = 1;


        
-- 88. 지역(city)별 인원수가 가장 많은 지역 및 인원수 출력.
SELECT * FROM
      (SELECT city, count(*) FROM tblinsa
            GROUP BY city
                  ORDER BY count(*) DESC)
                        WHERE rownum = 1;



-- 89. 지역(city)별 평균 급여(basicpay+sudang)가 
 --      가장 높은 지역 및 평균급여 출력.
SELECT * FROM
      (SELECT city, avg(basicpay+sudang) FROM tblinsa
            GROUP BY city
                  ORDER BY avg(basicpay+sudang) DESC)
                        WHERE rownum = 1;


-- 90. 여자 인원수가 가장 많은 부서 및 인원수 출력.
SELECT * FROM
      (SELECT buseo, count(*) FROM tblinsa
            WHERE substr(ssn, 8, 1) = '2'
                  GROUP BY buseo
                        ORDER BY count(*) DESC)
                              WHERE rownum = 1;

    
-- 91. 지역별 인원수 순위 출력.
SELECT a.*, rownum FROM
      (SELECT city, count(*) FROM tblinsa
            GROUP BY city
                  ORDER BY count(*) DESC) a;


                
-- 92. 지역별 인원수 순위 출력하되 5순위까지만 출력.
SELECT * FROM
      (SELECT a.*, rownum as rnum FROM
            (SELECT city, count(*) FROM tblinsa
                  GROUP BY city
                        ORDER BY count(*) DESC) a)
                              WHERE rnum <= 5;

 
-- 93. 이름, 부서, 출신도, 기본급, 수당, 기본급+수당, 세금, 실수령액 출력
--        세금: 총급여가 250만원 이상이면 2%, 200만원 이상이면 1%, 나머지 0.
--        실수령액: 총급여-세금
--        CASE~END 문 사용.
SELECT
      name, buseo, city, basicpay, sudang, basicpay + sudang,
      CASE
            WHEN (basicpay + sudang) >= 2500000 THEN (basicpay + sudang) * 0.02
            WHEN (basicpay + sudang) >= 2000000 THEN (basicpay + sudang) * 0.01
            ELSE 0
      END as 세금,
      CASE
            WHEN (basicpay + sudang) >= 2500000 THEN (basicpay + sudang) - (basicpay + sudang) * 0.02
            WHEN (basicpay + sudang) >= 2000000 THEN (basicpay + sudang) - (basicpay + sudang) * 0.01
            ELSE (basicpay + sudang)
      END as 총급여
FROM tblinsa;


-- 94. 부서별 평균 급여를 출력하되, A, B, C 등급으로 나눠서 출력.
-- 200만원 초과 - A등급
-- 150~200만원 - B등급
-- 150만원 미만 - C등급
SELECT buseo, round(avg(basicpay)),
      CASE
            WHEN avg(basicpay) > 2000000 THEN 'A'
            WHEN avg(basicpay) > 1500000 THEN 'B'
            ELSE 'C'
      END  as 등급
      FROM tblinsa
            GROUP BY buseo;


 
-- 95. 기본급+수당이 가장 많은 사람의 이름, 기본급+수당 출력. 
-- MAX() 함수, 하위 쿼리 이용.
SELECT name, basicpay + sudang FROM tblinsa
      WHERE (basicpay + sudang) = (SELECT max(basicpay + sudang) FROM tblinsa);


-- 96. tblinsa. 80년대생 남자 직원들의 평균 월급(basicpay)보다 더 많이 받는 70년대생 여직원들을 출력.
SELECT * FROM tblinsa
      WHERE substr(ssn, 1, 1) = '7' AND substr(ssn, 8, 1) = '2'
            AND basicpay > (SELECT avg(basicpay) FROM tblinsa WHERE substr(ssn, 1, 1) = '8' AND substr(ssn, 8, 1) = '1');


-- 97. tblStaff, tblProject. 현재 재직중인 모든 직원의 이름, 주소, 월급, 담당프로젝트명을 출력.
SELECT s.name, s.address, s.salary, p.name as pname FROM tblstaff s
      LEFT OUTER JOIN tblproject p
            ON s.seq = p.staff;


-- 98. tblVideo, tblRent, tblMember. '뽀뽀할까요' 라는 비디오를 빌려간 회원의 이름?
SELECT m.name FROM tblvideo v
      INNER JOIN tblrent r
            ON v.seq = r.video
                  INNER JOIN tblmember m
                        ON m.seq = r.member
                              WHERE v.name = '뽀뽀할까요';


-- 99. tblinsa. 평균 이상의 월급을 받는 직원들?
SELECT * FROM tblinsa
      WHERE basicpay >= (SELECT avg(basicpay) FROM tblinsa);



-- 100. tblStaff, tblProejct. '노조협상건'을 담당한 직원의 월급?
SELECT s.name, s.salary FROM tblstaff s
      INNER JOIN tblproject p
            ON s.seq = p.staff
                  WHERE p.name = '노조 협상';


-- 101. tblMember. 가장 나이가 많은 회원의 주소? (bYear)
SELECT name, address FROM tblmember
      WHERE byear = (SELECT min(byear) FROM tblmember);


-- 102. tblvideo. '털미네이터' 비디오를 한번이라도 빌려갔던 회원들의 이름?
SELECT m.name FROM tblvideo v
      INNER JOIN tblrent r
            ON v.seq = r.video
                  INNER JOIN tblmember m
                        ON m.seq = r.member
                              WHERE v.name = '털미네이터';


-- 103. tblStaff, tblProject. 서울시에 사는 직원을 제외한 나머지 직원들의
--     이름, 월급, 담당프로젝트명을 출력하시오.
SELECT s.name, s.address, s.salary, p.name as pname FROM tblstaff s
      INNER JOIN tblproject p
            ON s.seq = p.staff
                  WHERE s.address <> '서울시';


-- 104. tblCustomer, tblSales. 상품을 2개(단일상품) 이상 구매한 회원의
--    연락처, 이름, 구매상품명, 수량 출력
SELECT c.name, c.tel, s.item, s.qty FROM tblcustomer c
      INNER JOIN tblsales s
            ON c.seq = s.customer
                  WHERE s.qty >= 2;



-- 105. tblvideo. 모든 비디오 제목, 보유수량, 대여가격을 출력
SELECT v.name, v.qty, g.price FROM tblgenre g
      INNER JOIN tblvideo v
            ON g.seq = v.genre;



-- 106. tblvideo. 2007년 2월에 대여된 구매내역을 출력하시오. 회원명, 비디오명, 언제, 대여가격
SELECT m.name as mname, v.name as vname, r.rentdate, g.price FROM tblmember m
      INNER JOIN tblrent r
            ON m.seq = r.member
                  INNER JOIN tblvideo v
                        ON v.seq = r.video
                              INNER JOIN tblgenre g
                                    ON g.seq = v.genre
                                          WHERE to_char(r.rentdate, 'mm') = '02';


-- 107. tblvideo. 현재 반납을 안한 회원명과 비디오명, 대여날짜 출력.
SELECT m.name as mname, v.name as vname, r.rentdate, r.retdate FROM tblmember m
      INNER JOIN tblrent r
            ON m.seq = r.member
                  INNER JOIN tblvideo v
                        ON v.seq = r.video
                              INNER JOIN tblgenre g
                                    ON g.seq = v.genre
                                          WHERE r.retdate IS NULL ;



-- 108. tblhousekeeping. 지출 내역(가격 * 수량) 중 가장 많은 금액을 지출한 내역 3가지를 출력.
SELECT a.*, rownum FROM
      (SELECT h.*, (price * qty) FROM tblhousekeeping h
            ORDER BY (price * qty) DESC) a
                  WHERE rownum <= 3;


-- 109. tblinsa. 평균 급여 2위인 부서에 속한 직원들을 출력
SELECT * FROM
      (SELECT a.*, rownum as rnum FROM
            (SELECT buseo, avg(basicpay) FROM tblinsa
                  GROUP BY buseo
                        ORDER BY avg(basicpay) DESC ) a)
                              WHERE rnum = 2;


-- 110. tblinsa. 부서별 최고 연봉을 받는 직원들을 출력(7명)
SELECT * FROM tblinsa
      where (buseo, basicpay) in (SELECT buseo, max(basicpay) FROM tblinsa
            GROUP BY buseo);



-- 111. tbltodo. 등록 후 가장 빠르게 완료한 할일을 순서대로 5개 출력
SELECT * FROM
      (SELECT * FROM tbltodo
            WHERE completedate IS NOT NULL
                  ORDER BY (completedate - adddate) asc)
                        WHERE rownum <= 5;


-- 112. tblinsa. 남자 직원 중에서 급여를 3번째로 많이 받는 직원과 9번째로 많이 받는 직원의 급여 차액은 얼마?
SELECT
      (SELECT basicpay FROM
            (SELECT a.*, rownum as rnum FROM
                  (SELECT * FROM tblinsa
                        WHERE substr(ssn, 8, 1) = '1'
                              ORDER BY basicpay desc) a)
                                    WHERE rnum = 3)
      -
      (SELECT basicpay FROM
            (SELECT a.*, rownum as rnum FROM
                  (SELECT * FROM tblinsa
                        WHERE substr(ssn, 8, 1) = '2'
                              ORDER BY basicpay desc) a)
                                    WHERE rnum = 9)
      FROM dual;


commit;