/*
    <<tblcountry>>
    1. 국가명과 수도명을 가져오시오.
    
    2. 아래와 같이 가져오시오.
    - 별칭{Alias)
    - 컬럼 순서
    [국가명]   [수도]    [인구수]   [면적]    [대륙]
    대한민국    서울      4405      10        AS
    ..
    
    <<tblname>>
    3. 아래와 같이 가져오시오.
    [이름]    [키]     [몸무게]   [별명]
    유재석     178cm   64kg       메뚜기
    ..
    
    <<tblcountry>>
    4. 아래와 같이 가져오시오.
    [국가정보]
    국가명 : 대한민국, 수도명 : 서울, 인구수 : 4405명
    ..
    
    <<employees>>
    5. 직원명, 이메일, 연락처, 급여를 가져오시오.
    [이름]        [이메일]           [연락처]           [급여]
    Steven King   SKING@gmail.com   515.123.4567       $24000
    ..
    
    <<tblname>>
    6. 아래와 같이 가져오시오.
    [이름]    [비고]
    유재석     유재석의 별명은 '메뚜기'입니다.
    ..
    
    7. 아래와 같이 가져오시오.
    [이름]    [연봉]    [평균급여]
    홍길동     3100만원  250만원
*/

SELECT '별명은 "메뚜기"입니다.' FROM dual;

-- 1.
SELECT name, capital FROM tblcountry;

-- 2.
SELECT name as "국가명", capital as "수도", population as "인구수", area as "면적", continent as "대륙" FROM tblcountry;

-- 3.
SELECT last || first as "이름", height as "키", weight as "몸무게", nick FROM tblname;

-- 4.
SELECT '국가명:' || name || ',' || '수도명:' || capital || ',' || '인구수:' || population as "국가정보" FROM tblcountry;

-- 5.
SELECT first_name || ' ' || last_name as "이름", email || '@gmail.com' as "이메일", phone_number as "연락처", '$' || salary as "급여" FROM employees;

-- 6.
SELECT last || first as "이름", last || first || '의 별명은 ' || '"' || nick || '"' || '입니다.' as "비고" FROM tblname;

-- 7.
SELECT name as "이름", m1+m2+m3+m4+m5+m6+m7+m8+m9+m10+m11+m12 || '만원' as "연봉", m1+m2+m3+m4+m5+m6+m7+m8+m9+m10+m11+m12/12 as "평균급여" FROM tblsalary;

/*
    WHERE절 + 연산자
    
    <<tblcountry>>
    1. 면적(area)이 100이하인 국가의 이름과 면적을 가져오시오.
    
    2. 아시아(AS)와 유럽(EU) 대륙에 속한 나라만을 가져오시오.
    
    <<employees>>
    3. 직업(job_id)이 프로그래머(it_prog)인 직원의 이름(풀네임)과 연락처 가져오시오.
    
    4. last_name이 'Grant'인 직원의 풀네임, 연락처, 고용날짜를 가져오시오.
    
    5. 특정 매니저(120)이 관리하는 직원의 이름, 급여, 연락처를 가져오시오.
    
    6. 특정 부서(60, 80, 100)에 속한 직원들의 이름, 연락처, 이메일, 부서ID를 가져오시오.
    
    <<tblinsa>>
    7. 기획부 직원을 가져오시오.
    
    8. 서울에 있는 직원들 중 직위가 부장인 사람의 이름, 직위, 전화번호 가져오시오.
    
    9. 기본급여 + 수당 합쳐서 150만원 이상인 직원 중 서울에 있는 직원만 가져오시오.
    
    10. 수당이 15만원 이하인 직원 중 직위가 사원 or 대리인 직원만 가져오시오.
    
    11. 수당을 제외한 기본 연봉이 2천만원 이상 + 서울 + 과장(부장)만 가져오시오.
    
    12. 1990년대에 입사한 직원 중 과장 or 부장을 달지못한 사람만 가져오시오.
    
    13. 2000년 ~ 2002년 사이에 입사한 홍보부 직원만 가져오시오.
    
    <<tblname>>
    14. 남자 중 키가 170 미만인 사람을 가져오시오.
    
    15. 박씨 성을 가진 여자만 가져오시오.
    
    <<tblsalary>>
    16. 평균 급여가 250만원이 넘는 사람만 가져오시오.
    
    17. 상반기(1~6월)보다 하반기(7~12월)에 더많이 받은 사람만 가져오시오.
*/

-- 1. 면적(area)이 100이하인 국가의 이름과 면적을 가져오시오.
SELECT name, area FROM tblcountry WHERE area <= 100;

-- 2. 아시아(AS)와 유럽(EU) 대륙에 속한 나라만을 가져오시오.
SELECT name FROM tblcountry WHERE continent = 'AS' or continent = 'EU';

--3. 직업(job_id)이 프로그래머(it_prog)인 직원의 이름(풀네임)과 연락처 가져오시오.
SELECT first_name || last_name, phone_number FROM employees WHERE job_id = 'IT_PROG';

--4. last_name이 'Grant'인 직원의 풀네임, 연락처, 고용날짜를 가져오시오.
SELECT first_name || last_name, phone_number, hire_date FROM employees WHERE last_name = 'Grant';

--5. 특정 매니저(120)이 관리하는 직원의 이름, 급여, 연락처를 가져오시오.
SELECT first_name || last_name, salary, phone_number FROM employees WHERE manager_id = 120;

--6. 특정 부서(60, 80, 100)에 속한 직원들의 이름, 연락처, 이메일, 부서ID를 가져오시오.
SELECT first_name || last_name, phone_number, email, department_id FROM employees WHERE department_id = 60 or department_id = 80 or department_id = 100;

--7. 기획부 직원을 가져오시오.
SELECT * FROM tblinsa WHERE buseo = '기획부';

--8. 서울에 있는 직원들 중 직위가 부장인 사람의 이름, 직위, 전화번호 가져오시오.
SELECT name, jikwi, tel FROM tblinsa WHERE city = '서울' and jikwi = '부장';

--9. 기본급여 + 수당 합쳐서 150만원 이상인 직원 중 서울에 있는 직원만 가져오시오.
SELECT * FROM tblinsa WHERE basicpay + sudang >= 150 and city = '서울';

--10. 수당이 15만원 이하인 직원 중 직위가 사원 or 대리인 직원만 가져오시오.
SELECT * FROM tblinsa WHERE sudang <= 150000 and jikwi = '사원' or jikwi = '대리';

--11. 수당을 제외한 기본 연봉이 2천만원 이상 + 서울 + 과장(부장)만 가져오시오.
SELECT * FROM tblinsa WHERE basicpay * 12 >= 20000000 and city = '서울' and jikwi = '과장' or jikwi = '부장';

--12. 1990년대에 입사한 직원 중 과장 or 부장을 달지못한 사람만 가져오시오.
SELECT * FROM tblinsa WHERE ibsadate >= '1990-01-01' and ibsadate < '2000-01-01' and not(jikwi = '과장' or jikwi = '부장');

--13. 2000년 ~ 2002년 사이에 입사한 홍보부 직원만 가져오시오.
SELECT * FROM tblinsa WHERE ibsadate >= '2000-01-01' and ibsadate < '2003-01-01';

--14. 남자 중 키가 170 미만인 사람을 가져오시오.
SELECT * FROM tblname WHERE gender = 'm' and height < 170;

--15. 박씨 성을 가진 여자만 가져오시오.
SELECT * FROM tblname WHERE gender = 'f' and last = '박';

--16. 평균 급여가 250만원이 넘는 사람만 가져오시오.
SELECT * FROM tblsalary WHERE (m1+m2+m3+m4+m5+m6+m7+m8+m9+m10+m11+m12) / 12 >= 250;

--17. 상반기(1~6월)보다 하반기(7~12월)에 더많이 받은 사람만 가져오시오.
SELECT * FROM tblsalary WHERE m1+m2+m3+m4+m5+m6 < m7+m8+m9+m10+m11+m12;

/*
    조건절(WHERE) - BETWEEN, IN, LIKE, DISTINCT
    <<tblcountry>>
    1. 국가명이 'O국'인 나라를 가져오시오.
        a. 국가명 2글자 -> _
        b. 국가명 글자수 상관없이 -> %
    
    <<employees>>
    2. 연락처가 515로 시작하는 직원들을 가져오시오.
    
    3. 직업 ID가 'SA'로 시작하는 직원들을 가져오시오.
    
    4. first_name에 'de'가 들어간 직원들을 가져오시오.(대소문자 상관없이 - 문자열 함수x)
    
    <<tblinsa>>
    5. 남자 직원만 가져오시오.
    
    6. 여자 직원만 가져오시오.
    
    7. 여름에 태어난 직원들을 가져오시오.(7~8월생)
    
    8. 서울, 인천에 사는 김씨들만 가져오시오.
    
    9. 영업부, 총무부, 개발부 직원 중 사원급(사원, 대리) 인 010 사용자를 가져오시오.
    
    10. 서울, 인천, 경기에 살고 입사일이 1998 ~ 2000년 사이인 직원들을 가져오시오.
    
    <<employees>>
    11. 부서가 아직 배정이 안된 직원들을 가져오시오.
    
    -- distinct
    12. 직업이 어떤 종류가 있는지?(단, NULL은 제외)
    
    13. 고용일이 2002 ~ 2004년 사이인 직원들은 어느 부서에 근무하는지?
    
    14. 급여가 5000불 이상인 직원들의 담당 매니저는 누구인지?
    
    <<tblinsa>>
    15. 남자 직원 + 80년대생 -> 직급?
    
    16. 수당 20만원 넘는 직원들은 어디 사는지?
    
    17. 연락처가 아직 없는 직원은 어느 부서에 소속되어 있는지?
    
    <<tbldiary>>
    18. 2018년 1월 20일 이후에 날씨가 어땠는지?
    19. '오라클','자바','코딩' 이라는 키워드가 들어간 날들은 날씨가 어땠는지?
    
    <<tblhousekeeping>>
    20. 구매 총 가격(price * qty)이 50000 ~ 100000원 이내 목록?
    
    <<tbltodo>>
    21. 2018년 1월 5일 ~ 2018년 1월 10일 이내에 등록한 일 중 아직 완료를 안한 일들?
    22. '~하기' 라고 제목을 붙인 할 일 중 완료한 일들은?
    
    <<tblinsa>>
    23. 여자 직원들의 직위?
    24. 홍보부 직원들이 사는곳?
    
    <<tblmen>>
    25. 여자친구가 있으면서 몸무게를 알 수 없는 사람?
    26. 여자친구가 '김'씨이면서 자신은 '박'씨인 사람?
*/

-- 1. 국가명이 'O국'인 나라를 가져오시오.
        -- a. 국가명 2글자 -> _
        -- b. 국가명 글자수 상관없이 -> %
SELECT * FROM tblcountry WHERE name LIKE '_국';
SELECT * FROM tblcountry WHERE name LIKE '%국';

-- 2. 연락처가 515로 시작하는 직원들을 가져오시오.
SELECT * FROM employees WHERE phone_number LIKE '515%';

-- 3. 직업 ID가 'SA'로 시작하는 직원들을 가져오시오.
SELECT * FROM employees WHERE job_id LIKE 'SA%';

-- 4. first_name에 'de'가 들어간 직원들을 가져오시오.(대소문자 상관없이 - 문자열 함수x)
SELECT * FROM employees WHERE first_name LIKE '%de%' or first_name LIKE '%DE%';

-- 5. 남자 직원만 가져오시오.
SELECT * FROM tblinsa WHERE ssn LIKE '%-1%';

-- 5. 여자 직원만 가져오시오.
SELECT * FROM tblinsa WHERE ssn LIKE '%-2%';

-- 7. 여름에 태어난 직원들을 가져오시오.(7~8월생)
-- SELECT * FROM tblinsa WHERE ssn BETWEEN '__07%' and '__08%';

-- 8. 서울, 인천에 사는 김씨들만 가져오시오.
SELECT * FROM tblinsa WHERE city IN ('서울', '인천') and name LIKE '김%';

-- 9. 영업부, 총무부, 개발부 직원 중 사원급(사원, 대리) 인 010 사용자를 가져오시오.
SELECT * FROM tblinsa WHERE buseo IN ('영업부', '총무부', '개발부') and jikwi IN ('사원', '대리') and tel LIKE '010%';

-- 10. 서울, 인천, 경기에 살고 입사일이 1998 ~ 2000년 사이인 직원들을 가져오시오.
SELECT * FROM tblinsa WHERE city IN ('서울', '인천', '경기') and ibsadate BETWEEN '1998-01-01' and '2000-12-31';

-- 11. 부서가 아직 배정이 안된 직원들을 가져오시오.
SELECT * FROM employees WHERE department_id IS NULL;

-- 12. 직업이 어떤 종류가 있는지?(단, NULL은 제외)
SELECT DISTINCT job_id FROM employees WHERE job_id IS NOT NULL;

-- 13. 고용일이 2002 ~ 2004년 사이인 직원들은 어느 부서에 근무하는지?
SELECT * FROM employees WHERE hire_date BETWEEN '2002-01-01' and '2004-12-31';

-- 14. 급여가 5000불 이상인 직원들의 담당 매니저는 누구인지?
SELECT DISTINCT manager_id FROM employees WHERE manager_id IS NOT NULL and salary >= 5000;

-- 15. 남자 직원 + 80년대생 -> 직급?
SELECT DISTINCT jikwi FROM tblinsa WHERE ssn LIKE '%-1%' and ssn BETWEEN '80' and '90';

-- 16. 수당 20만원 넘는 직원들은 어디 사는지?
SELECT DISTINCT city FROM tblinsa WHERE sudang > 200000;

-- 17. 연락처가 아직 없는 직원은 어느 부서에 소속되어 있는지?
SELECT DISTINCT buseo FROM tblinsa WHERE tel IS NULL;

-- <<tbldiary>>
-- 18. 2018년 1월 20일 이후에 날씨가 어땠는지?
SELECT weather FROM tbldiary WHERE regdate >= '2018-01-20';

-- 19. '오라클','자바','코딩' 이라는 키워드가 들어간 날들은 날씨가 어땠는지?
SELECT weather FROM tbldiary WHERE subject LIKE '%오라클%' or subject LIKE '%자바%' or subject LIKE '%코딩%';
    
-- <<tblhousekeeping>>
-- 20. 구매 총 가격(price * qty)이 50000 ~ 100000원 이내 목록?
SELECT * FROM tblhousekeeping WHERE price * qty BETWEEN 50000 AND 100000;
    
-- <<tbltodo>>
-- 21. 2018년 1월 5일 ~ 2018년 1월 10일 이내에 등록한 일 중 아직 완료를 안한 일들?
SELECT title FROM tbltodo WHERE adddate BETWEEN '2018-01-05' AND '2018-01-10' and completedate IS NULL;

-- 22. '~하기' 라고 제목을 붙인 할 일 중 완료한 일들은?
SELECT title FROM tbltodo WHERE title LIKE '%하기' and completedate IS NOT NULL;
    
-- <<tblinsa>>
-- 23. 여자 직원들의 직위?
SELECT DISTINCT jikwi FROM tblinsa WHERE ssn LIKE '%-2%';

-- 24. 홍보부 직원들이 사는곳?
SELECT DISTINCT city FROM tblinsa WHERE buseo = '홍보부';
    
-- <<tblmen>>
-- 25. 여자친구가 있으면서 몸무게를 알 수 없는 사람?
SELECT * FROM tblmen WHERE couple IS NOT NULL and weight IS NULL;

-- 26. 여자친구가 '김'씨이면서 자신은 '박'씨인 사람?
SELECT * FROM tblmen WHERE couple LIKE '김%' and name LIKE '박%';
/*
    count()
    
    <<tblcountry>>
    1. 아시아와 유럽에 속한 국가는 몇개국?
    
    2. 인구가 5000 ~ 20000 사이에 속하는 국가는 몇개국?
    
    <<employees>>
    3. IT_PRO 중에서 급여가 5000불 넘는 직원 몇명?
    
    <<tblinsa>>
    4. 연락처가 010이 아닌 사람이 몇명?(연락처 있는 사람들 중에서)
    
    5. 서울 사람 빼고 몇명?
    
    6. 여자 직원 몇명?
    
    <<tblmen>>
    7. 솔로가 몇명?
    
    <<tblhousekeeping>>
    8. 구매 총액이 10만원을 넘는 구매를 총 몇회?
    
    sum()
    1. EU와 AF에 속한 나라의 총 인구합?
    
    2. 매니저(108)가 관리하는 직원의 급여 합?
    
    3. 직업(ST_CLERK, SH_CLERK)을 가지는 직원 급여 합?
    
    4. 서울과 부산에 있는 직원들의 급여 합(급여 + 수당)
    
    5. 부장, 과장들의 총 급여 합?
    
    avg()
    1. 아시아에 속한 국가의 평균 인구수?
    
    2. 이름(first_name)에 'AN'이 포함된 직원들의 급여 평균?(대소문자 구분 없이)
    
    3. 간부급(과장,부장)의 평균 급여?
    
    4. 사원급(대리,사원)의 평균 급여?
    
    max(), min()
    1. 면적이 가장 넓은 나라의 면적?
    
    2. 급여(급여 + 수당)가 가장 적게 받는 사람의 급여액?
    
    3. tblhousekeeping 가장 크게 지른 금액?(price * qty)
*/
-- count()
-- 1. 아시아와 유럽에 속한 국가는 몇개국?
SELECT count(*) FROM tblcountry WHERE continent IN ('AS', 'EU');

-- 2. 인구가 5000 ~ 20000 사이에 속하는 국가는 몇개국?
SELECT count(*) FROM tblcountry WHERE population BETWEEN 5000 and 20000;

-- 3. IT_PRO 중에서 급여가 5000불 넘는 직원 몇명?
SELECT count(*) FROM employees WHERE job_id = 'IT_PROG' and salary > 5000;

-- 4. 연락처가 010이 아닌 사람이 몇명?(연락처 있는 사람들 중에서)
SELECT count(*) FROM tblinsa WHERE tel NOT LIKE '010%';

-- 5. 서울 사람 빼고 몇명?
SELECT count(*) FROM tblinsa WHERE NOT city = '서울';
    
-- 6. 여자 직원 몇명?
SELECT count(*) FROM tblinsa WHERE ssn LIKE '%-2%';

-- 7. 솔로가 몇명?
SELECT count(*) FROM tblmen WHERE couple IS NULL;

--  8. 구매 총액이 10만원을 넘는 구매를 총 몇회?
SELECT count(price * qty) FROM tblhousekeeping WHERE price * qty > 30000;

 -- sum()
 --1. EU와 AF에 속한 나라의 총 인구합?
SELECT sum(population) FROM tblcountry WHERE continent IN ('EU', 'AF');
    
-- 2. 매니저(108)가 관리하는 직원의 급여 합?
SELECT sum(salary) FROM employees WHERE manager_id = 108;
    
-- 3. 직업(ST_CLERK, SH_CLERK)을 가지는 직원 급여 합?
SELECT sum(salary) FROM employees WHERE job_id IN('ST_CLERK', 'SB_CLERK');
    
-- 4. 서울과 부산에 있는 직원들의 급여 합(급여 + 수당)
SELECT sum(basicpay + sudang) FROM tblinsa WHERE city IN ('서울', '부산');
    
-- 5. 부장, 과장들의 총 급여 합?
SELECT sum(basicpay + sudang) FROM tblinsa WHERE jikwi IN('부장', '과장');

-- avg()
-- 1. 아시아에 속한 국가의 평균 인구수?
SELECT avg(population) FROM tblcountry WHERE continent = 'AS';
    
-- 2. 이름(first_name)에 'AN'이 포함된 직원들의 급여 평균?(대소문자 구분 없이)
SELECT avg(salary) FROM employees WHERE first_name LIKE '%an%' or first_name LIKE '%AN%';
    
-- 3. 간부급(과장,부장)의 평균 급여?
SELECT avg(basicpay) FROM tblinsa WHERE jikwi IN ('과장', '부장');
    
-- 4. 사원급(대리,사원)의 평균 급여?
SELECT avg(basicpay) FROM tblinsa WHERE jikwi IN ('사원', '대리');
    
-- max(), min()
-- 1. 면적이 가장 넓은 나라의 면적?
SELECT max(area) FROM tblcountry;
    
-- 2. 급여(급여 + 수당)가 가장 적게 받는 사람의 급여액?
SELECT min(basicpay + sudang) FROM tblinsa;
    
-- 3. tblhousekeeping 가장 크게 지른 금액?(price * qty)
SELECT max(price * qty) FROM tblhousekeeping;

/*
    1. 직원명과 생년을 가져오시오.(1900년대 생 -> ssn)
    [이름]    [생년]
    홍길동     1980
    아무개     1985
    
    2. 서울에 사는 여직원 중 80년대생 몇명인지?
    
    3. 간부급(과장/부장)들은 어떤 성(김,이,박..)이 있는지?
    
    4. 직원들을 태어난 월순으로 정렬해서 가져오시오.(오름차순 -> 월, 이름)
    
    5. 이름(first_name + last_name) 이 가장 긴 순서대로 가져오시오.
    
    6. 이름(first_name + last_name)이 가장 긴사람은 몇글자?
    
    7. last_name이 4자인 사람들은 first_name이 몇글자?
*/
-- 1.
SELECT name AS 이름, '19' || substr(ssn, 1, 2) AS 생년 FROM tblinsa;

-- 2.
SELECT * FROM tblinsa WHERE city = '서울' and substr(ssn, 1, 2) BETWEEN 80 AND 89 and substr(ssn, 8, 1) = '2';

-- 3. 간부급(과장/부장)들은 어떤 성(김,이,박..)이 있는지?
SELECT DISTINCT subStr(name, 1, 1) AS 성 FROM tblinsa WHERE jikwi IN ('과장', '부장');

-- 4. 직원들을 태어난 월순으로 정렬해서 가져오시오.(오름차순 -> 월, 이름)
SELECT * FROM tblinsa ORDER BY substr(ssn, 3, 2) ASC, name ASC;

-- 5. 이름(first_name + last_name) 이 가장 긴 순서대로 가져오시오.
SELECT * FROM employees ORDER BY length(first_name || last_name) DESC;

-- 6. 이름(first_name + last_name)이 가장 긴사람은 몇글자?
SELECT max(length(first_name || last_name)) AS 글자수 FROM employees;

-- 7. last_name이 4자인 사람들은 first_name이 몇글자?
SELECT length(first_name) AS 글자수 FROM employees WHERE length(last_name) = 4;

-- 1.
SELECT * FROM tblinsa;

-- 2.
SELECT * FROM tabs;

-- 4.
SELECT name, basicpay FROM tblinsa;

-- 5.
SELECT name, basicpay, sudang, basicpay + sudang FROM tblinsa;

-- 6.
SELECT name AS 이름, city AS 출신도, buseo AS 부서명 FROM tblinsa;

-- 7.
SELECT name, city, buseo, jikwi FROM tblinsa WHERE city = '서울';

-- 8.
SELECT  name, city, basicpay, ssn FROM tblinsa WHERE city = '서울' AND basicpay >= 1500000;

-- 9.
SELECT * FROM tblinsa WHERE city = '인천' AND basicpay BETWEEN 1000000 AND 1999999;

-- 10.
SELECT name, city, buseo FROM tblinsa WHERE city = '서울' AND buseo = '개발부';

-- 11.
SELECT name, city, buseo FROM tblinsa WHERE city IN('서울', '경기');

-- 12.
SELECT * FROM tblinsa WHERE buseo IN('개발부', '영업부');

-- 13.
SELECT name AS 이름, basicpay AS 기본급여, sudang AS 수당, basicpay + sudang AS 급여 FROM tblinsa WHERE basicpay + sudang >= 2500000;

-- 14.
SELECT * FROM tblinsa WHERE substr(ssn, 8, 1) IN('1', '3');

-- 15.
SELECT * FROM tblinsa WHERE substr(ssn, 1, 2) BETWEEN 80 AND 89;

-- 16.
SELECT * FROM tblinsa WHERE city = '서울' AND substr(ssn, 1, 2) BETWEEN 70 AND 79;

-- 17.
SELECT * FROM tblinsa WHERE city = '서울' AND substr(ssn, 1, 2) BETWEEN 70 AND 79 AND substr(ssn, 8, 1) IN('1', '3');

-- 18.
SELECT * FROM tblinsa WHERE city = '서울' AND substr(name, 1, 1) = '김';

-- 19.
SELECT name, city, ibsadate FROM tblinsa WHERE substr(ibsadate, 1, 2) < substr(sysdate, 1, 2);

-- 20.
SELECT name, city, ibsadate FROM tblinsa WHERE substr(ibsadate, 1, 2) = 00 AND substr(ibsadate, 4, 2) = 10;

-- 21.
SELECT name, ('20' || substr(sysdate, 1, 2)) - ('19' || substr(ssn, 1, 2)) AS 나이 FROM tblinsa;

-- 22.
SELECT * FROM tblinsa WHERE substr(('20' || substr(sysdate, 1, 2)) - ('19' || substr(ssn, 1, 2)), 1, 1) = '4';

-- 23.
SELECT * FROM tblinsa WHERE substr(ssn, 4, 1) = '5';

-- 24.
SELECT * FROM tblinsa WHERE to_char(to_date('19' || substr(ssn, 1, 6), 'YYYY-mm-dd'), 'mm') = '05';

-- 25.
SELECT * FROM tblinsa ORDER BY city DESC, basicpay DESC;

-- 26.
SELECT name, city, basicpay + sudang FROM tblinsa WHERE city = '서울' ORDER BY basicpay + sudang DESC;

-- 27.
SELECT name, ssn, buseo, basicpay FROM tblinsa WHERE substr(ssn, 8, 1) = '2' ORDER BY buseo ASC, basicpay DESC;

-- 28.
SELECT * FROM tblinsa WHERE substr(ssn, 8, 1) = '1' ORDER BY substr(ssn, 1, 2) ASC;

-- 29.
SELECT * FROM tblinsa WHERE city = '서울' ORDER BY to_char(ibsadate, 'yyyymmdd') DESC;

-- 30.
SELECT name, city, basicpay FROM tblinsa WHERE substr(name, 1, 1) <> '김';

-- 31.
SELECT name, city, replace(buseo, '부', '') AS buseo, tel FROM tblinsa WHERE city IN('서울', '부산', '대구') AND (tel LIKE '%5%' OR tel LIKE '%7%');

-- 32.
SELECT
CASE
    WHEN tel IS NOT NULL THEN replace(tel, '-', '')
    WHEN tel IS NULL THEN '전화번호없음'
END
FROM tblinsa;

-- 33.
SELECT round(((basicpay + sudang) / 1000000)) || '00만원대' AS 급여, count(*) FROM tblinsa GROUP BY round(((basicpay + sudang) / 1000000));

-- 34.
SELECT substr(ssn, 1, 2), count(*) FROM tblinsa GROUP BY substr(ssn, 1, 2);

-- 35.
SELECT name, ssn FROM tblinsa ORDER BY substr(ssn, 3, 2) ASC, substr(ssn, 1, 2) DESC;

-- 36.
SELECT * FROM tblinsa ORDER BY to_char(ibsadate, 'mm') ASC, to_char(ibsadate, 'YYYY') DESC;

-- 37.
SELECT count(*),
        count(decode(substr(ssn, 8, 1), '1', 1)) AS 남자,
        count(decode(substr(ssn, 8, 1), '2', 1)) AS 여자
FROM tblinsa;

-- 38.
SELECT count(decode(buseo, '개발부', 1)) AS 개발부, count(decode(buseo, '영업부', 1)) AS 영업부, count(decode(buseo, '총무부', 1)) AS 총무부 FROM tblinsa;

-- 39.
SELECT count(*) FROM tblinsa WHERE city = '서울' AND substr(ssn, 8, 1) = '1';

-- 40.
SELECT count(decode(substr(ssn, 8, 1), '1', 1)) AS 남자, count(decode(substr(ssn, 8, 1), '2', 1)) AS 여자 FROM tblinsa WHERE buseo = '영업부';

-- 41.
SELECT count(decode(buseo, '개발부', 1)) AS 개발부, count(decode(buseo, '영업부', 1)) AS 영업부, count(decode(buseo, '총무부', 1)) AS 총무부 FROM tblinsa WHERE city = '서울';

-- 42. 서울 사람의 남자와 여자의 기본급합 출력.
SELECT sum(decode(substr(ssn, 8, 1), '1', basicpay)) AS 남자급여, sum(decode(substr(ssn, 8, 1), '2', basicpay)) AS 여자급여 FROM tblinsa WHERE city = '서울';

-- 43. 남자와 여자의 기본급 평균값 출력. AVG(), DECODE() 함수 이용.
SELECT round(avg(decode(substr(ssn, 8, 1), '1', basicpay))) AS 남자평균, round(avg(decode(substr(ssn, 8, 1), '2', basicpay))) AS 여자평균 FROM tblinsa;

-- 44. 개발부의 남자, 여자 기본급 평균값 출력.
SELECT round(avg(decode(substr(ssn, 8, 1), '1', basicpay))) AS 남자평균, round(avg(decode(substr(ssn, 8, 1), '2', basicpay))) AS 여자평균 FROM tblinsa WHERE buseo = '개발부';

-- 45. 부서별 남자와 여자 인원수 구하기
SELECT buseo, count(decode(substr(ssn, 8, 1), '1', 1)) AS 남자, count(decode(substr(ssn, 8, 1), '2', 1)) AS 여자 FROM tblinsa GROUP BY buseo;
        
-- 46. 지역별 남자와 여자 인원수 구하기
SELECT city, count(decode(substr(ssn, 8, 1), '1', 1)) AS 남자, count(decode(substr(ssn, 8, 1), '2', 1)) AS 여자 FROM tblinsa GROUP BY city;

-- 47. 입사년도별 남자와 여자 인원수 구하기
SELECT to_char(ibsadate, 'YY') || '년도' AS 입사년도, count(decode(substr(ssn, 8, 1), '1', 1)) AS 남자, count(decode(substr(ssn, 8, 1), '2', 1)) AS 여자 FROM tblinsa GROUP BY to_char(ibsadate, 'YY');

-- 48. 영업부, 총무부 인원만을 가지고 입사년도별 남자와 여자 인원수 구하기
SELECT to_char(ibsadate, 'YY') || '년도' AS 입사년도, count(decode(substr(ssn, 8, 1), '1', 1)) AS 남자, count(decode(substr(ssn, 8, 1), '2', 1)) AS 여자 FROM tblinsa WHERE buseo IN('영업부', '총무부') GROUP BY to_char(ibsadate, 'YY');

-- 49. 서울 사람중 부서별 남자와 여자인원수, 남자와 여자 급여합 출력.
SELECT buseo, count(decode(substr(ssn, 8, 1), '1', 1)) AS 남자, count(decode(substr(ssn, 8, 1), '2', 1)) AS 여자, sum(decode(substr(ssn, 8, 1), '1', basicpay)) AS 남자급여, sum(decode(substr(ssn, 8, 1), '2', basicpay)) AS 여자급여 FROM tblinsa WHERE city = '서울' GROUP BY buseo;

-- 50. 부서별 인원수 출력. 인원수가 10 이상인 경우만.
SELECT buseo, count(*) FROM tblinsa GROUP BY buseo HAVING count(*) >= 10;

-- 51. 부서별 남,여 인원수 출력. 여자인원수가 5명 이상인 부서만 출력.
SELECT buseo, count(decode(substr(ssn, 8, 1), '1', 1)) AS 남자, count(decode(substr(ssn, 8, 1), '2', 1)) AS 여자 FROM tblinsa GROUP BY buseo HAVING count(decode(substr(ssn, 8, 1), '2', 1)) >= 5;
 
-- 52. 이름, 성별, 나이 출력
--        성별: 주민번호 1,3->남자, 2,4->여자 (DECODE 사용)
--        나이: 주민번호 이용해서
SELECT name, decode(substr(ssn, 8, 1), '1', '남자', '2', '여자') AS 성별, ('20' || substr(sysdate, 1, 2)) - ('19' || substr(ssn, 1, 2)) AS 나이 FROM tblinsa;
 
-- 53. 서울 사람 중에서 기본급이 200만원 이상이 사람. (이름, 기본급)
SELECT name, basicpay FROM tblinsa WHERE city = '서울' AND basicpay >= 2000000;
 
-- 54. 입사월별 인원수 구하기. (월, 인원수)   COUNT, GROUP BY, TO_CHAR 사용
--         출력형태 ----------
--         월      인원수
--         1월    10명
--         2월    25명
SELECT to_char(ibsadate, 'mm') || '월' AS 입사월, count(*) FROM tblinsa GROUP BY to_char(ibsadate, 'mm');

-- 55. 이름, 생년월일, 기본급, 수당을 출력.
--        생년월일은 주민번호 기준 (2000-10-10 형식으로 출력)
--        기본급은 \1,000,000 형식으로 출력
SELECT name, to_char(to_date('19' || substr(ssn, 1, 6), 'YYYY-mm-dd'), 'YYYY-mm-dd') AS 생년월일, to_char(basicpay, '999,999,999,999') AS 기본급여, sudang FROM tblinsa;
 
-- 56. 이름, 출신도, 기본급을 출력하되 출신도 내림차순 출력(1차 정렬 기준). 
-- 출신도가 같으면 기본급 오름차순 출력(2차 정렬 기준).
SELECT name, city, basicpay FROM tblinsa ORDER BY city DESC, basicpay ASC;
 
-- 57. 전화번호가 NULL이 아닌것만 출력. (이름, 전화번호)
SELECT name, tel FROM tblinsa WHERE tel IS NOT NULL;

-- 58. 근무년수가 15년 이상인 사람 출력. (이름, 입사일)
SELECT name, ibsadate FROM tblinsa WHERE to_char(sysdate, 'YYYY') - to_char(ibsadate, 'YYYY') >= 15;
 
-- 59. 주민번호를 기준으로 75~82년생 출력. (이름, 주민번호, 출신도). 
-- SUBSTR() 함수, BEWTEEN AND 구문, TO_NUMBER() 함수 이용.
SELECT name, ssn, city FROM tblinsa WHERE substr(ssn, 1, 2) BETWEEN 75 AND 82;

-- 60. 근무년수가 15~20년인 사람 출력. (이름, 입사일)
SELECT name, ibsadate FROM tblinsa WHERE to_char(sysdate, 'YYYY') - to_char(ibsadate, 'YYYY') BETWEEN 15 AND 20;
 
-- 61. 김씨, 이씨, 박씨만 출력 (이름, 부서). SUBSTR() 함수 이용.
SELECT name, buseo FROM tblinsa WHERE substr(name, 1, 1) IN('김', '이', '박');
 
-- 62. 입사일을 "년-월-일 요일" 형식으로 남자만 출력 (이름, 주민번호, 입사일)
SELECT name, ssn, to_char(ibsadate, 'YYYY-mm-dd d') AS 입사일 FROM tblinsa WHERE substr(ssn, 8, 1) IN('1', '3');

-- 63. 부서별 직위별 급여합 구하기. (부서, 직위, 급여합)
SELECT buseo, jikwi, sum(basicpay) FROM tblinsa GROUP BY buseo, jikwi ORDER BY buseo;

-- 64. 부서별 직위별 인원수, 급여합, 급여평균 구하기. (부서, 직위, 급여합)
SELECT buseo, jikwi, count(*), sum(basicpay), round(avg(basicpay)) FROM tblinsa GROUP BY buseo, jikwi ORDER BY buseo;
 
-- 65. 부서별 직위별 인원수를 구하되 인원수가 5명 이상인 경우만 출력.
SELECT buseo, jikwi, count(*) FROM tblinsa GROUP BY buseo, jikwi HAVING count(*) >= 5;

-- 66. 2000년에 입사한 여사원. (이름, 주민번호, 입사일)
SELECT name, ssn, ibsadate FROM tblinsa WHERE to_char(ibsadate, 'YYYY') = '2000' AND substr(ssn, 8, 1) = 2;
 
-- 67. 성씨가 한 글자(김, 이, 박 등)라는 가정하에 성씨별 인원수 (성씨, 인원수)
SELECT substr(name, 1, 1) AS 성씨, count(*) AS 인원수 FROM tblinsa GROUP BY substr(name, 1, 1);
    
-- 68. 출신도(CITY)별 성별 인원수.
SELECT city, count(*) FROM tblinsa GROUP BY city;
 
-- 69. 부서별 남자인원수가 5명 이상인 부서와 남자인원수.
SELECT buseo, count(*) FROM tblinsa GROUP BY buseo HAVING count(*) >= 5;
 
-- 70. 입사년도별 인원수.
SELECT to_char(ibsadate, 'YYYY') AS 입사년도, count(*) FROM tblinsa GROUP BY to_char(ibsadate, 'YYYY');

-- 71. 전체인원수, 2000년, 1999년, 1998년도에 입사한 인원을 다음의 형식으로 출력.
--         전체 2000 1999 1998
--          60    x    x    x
SELECT (SELECT count(*) FROM tblinsa) AS 전체,
        (SELECT count(*) FROM tblinsa WHERE to_char(ibsadate, 'YYYY') = '2000') AS "2000년",
        (SELECT count(*) FROM tblinsa WHERE to_char(ibsadate, 'YYYY') = '1999') AS "1999년",
        (SELECT count(*) FROM tblinsa WHERE to_char(ibsadate, 'YYYY') = '1998') AS "1998년"
FROM dual;

-- 72. 아래 형식으로 지역별 인원수 출력.
--         전체 서울  인천  경기
--          60    x     x     x
SELECT (SELECT count(*) FROM tblinsa) AS 전체,
        (SELECT count(*) FROM tblinsa WHERE city = '서울') AS 서울,
        (SELECT count(*) FROM tblinsa WHERE city = '인천') AS 인천,
        (SELECT count(*) FROM tblinsa WHERE city = '경기') AS 경기
FROM dual;

-- 73. 기본급(basicpay)이 평균 이하인 사원 출력. (이름, 기본급). AVG() 함수. 하위쿼리.
SELECT name, basicpay FROM tblinsa WHERE basicpay <= (SELECT avg(basicpay) FROM tblinsa);

-- 74. 기본급 상위 10%만 출력. (이름, 기본급)
SELECT name, basicpay FROM (SELECT * FROM tblinsa ORDER BY basicpay DESC) WHERE rownum <= (SELECT count(*) FROM tblinsa) / 10;

-- 75.기본급 순위가 5순위까지만 출력
SELECT * FROM (SELECT * FROM tblinsa ORDER BY basicpay DESC) WHERE rownum <= 5;

-- 76. 입사일이 빠른 순서로 5순위까지만 출력.
SELECT * FROM (SELECT * FROM tblinsa ORDER BY ibsadate ASC) WHERE rownum <= 5;

-- 77. 평균 급여보다 많은 급여를 받는 직원 출력  
SELECT * FROM tblinsa WHERE (SELECT avg(basicpay) FROM tblinsa) < basicpay;

-- 78. '이순애' 직원의 급여보다 더 많은 급여를 받는 직원 출력.
SELECT * FROM tblinsa WHERE (SELECT basicpay FROM tblinsa WHERE name = '이순애') < basicpay;

-- 79. 총무부의 평균 급여보다 많은 급여를 받는 직원들의 이름, 부서명 출력.
SELECT name, buseo FROM tblinsa WHERE (SELECT avg(basicpay) FROM tblinsa WHERE buseo = '총무부') < basicpay;

-- 80. 총무부 직원들보다 더 많은 급여를 받는 직원 정보.
SELECT * FROM tblinsa WHERE (SELECT avg(basicpay) FROM tblinsa WHERE buseo = '총무부') < basicpay;

-- 81. 직원 전체 평균 급여보다 많은 급여를 받는 직원의 수 출력.
SELECT count(*) FROM tblinsa WHERE (SELECT avg(basicpay) FROM tblinsa) < basicpay;

-- 82. '홍길동' 직원과 같은 부서의 직원 정보.
SELECT * FROM tblinsa WHERE buseo = (SELECT buseo FROM tblinsa WHERE name = '홍길동');

-- 83. '김신애' 직원과 같은 부서, 직위를 가진 직원 정보
SELECT * FROM tblinsa WHERE buseo = (SELECT buseo FROM tblinsa WHERE name = '김신애') AND jikwi = (SELECT jikwi FROM tblinsa WHERE name = '김신애');

-- 84. 부서별 기본급이 가장 높은 사람 출력. (이름, 부서, 기본급) ------------
SELECT buseo, basicpay, name FROM tblinsa ORDER BY buseo, basicpay DESC;
SELECT buseo, max(basicpay) FROM tblinsa GROUP BY buseo;

-- 85. 남자 기본급 순위 출력.
    -- 여자 기본급 순위 출력.
SELECT * FROM tblinsa WHERE substr(ssn, 8, 1) = 1 ORDER BY basicpay DESC;

-- 86. 지역(city)별로 급여(기본급+수당) 1순위 직원만 출력.
SELECT * FROM tblinsa;

-- 87. 부서별 인원수가 가장 많은 부서 및 인원수 출력. 
SELECT max(SELECT count(*) FROM tblinsa GROUP BY buseo) FROM tblinsa;
SELECT buseo, count(*) FROM tblinsa GROUP BY buseo;
        
-- 88. 지역(city)별 인원수가 가장 많은 지역 및 인원수 출력.


-- 89. 지역(city)별 평균 급여(basicpay+sudang)가 
 --      가장 높은 지역 및 평균급여 출력.


-- 90. 여자 인원수가 가장 많은 부서 및 인원수 출력.

-- 91. 지역별 인원수 순위 출력.
SELECT city, count(*) FROM tblinsa GROUP BY city ORDER BY count(*) DESC;

-- 92. 지역별 인원수 순위 출력하되 5순위까지만 출력.
SELECT * FROM (SELECT city, count(*) FROM tblinsa GROUP BY city ORDER BY count(*) DESC) WHERE rownum <= 5;
 
-- 93. 이름, 부서, 출신도, 기본급, 수당, 기본급+수당, 세금, 실수령액 출력
--        세금: 총급여가 250만원 이상이면 2%, 200만원 이상이면 1%, 나머지 0.
--        실수령액: 총급여-세금
--        CASE~END 문 사용.
SELECT name, buseo, city, basicpay, sudang, basicpay + sudang,
    CASE
        WHEN basicpay + sudang >= 2500000 THEN '2%'
        WHEN basicpay + sudang >= 2000000 THEN '1%'
        ELSE '0'
    END AS 세금,
    CASE
        WHEN basicpay + sudang >= 2500000 THEN (basicpay + sudang) - ((basicpay + sudang) * 0.02)
        WHEN basicpay + sudang >= 2000000 THEN (basicpay + sudang) - ((basicpay + sudang) * 0.01)
        ELSE basicpay + sudang
    END AS 실수령액
FROM tblinsa;

-- 94. 부서별 평균 급여를 출력하되, A, B, C 등급으로 나눠서 출력.
-- 200만원 초과 - A등급
-- 150~200만원 - B등급
-- 150만원 미만 - C등급
SELECT buseo, round(avg(basicpay)) AS 평균급여,
    CASE
        WHEN avg(basicpay) > 2000000 THEN 'A등급'
        WHEN avg(basicpay) >= 1500000 THEN 'B등급'
        WHEN avg(basicpay) < 1500000 THEN 'C등급'
    END AS 등급
FROM tblinsa GROUP BY buseo;

-- 95. 기본급+수당이 가장 많은 사람의 이름, 기본급+수당 출력. 
-- MAX() 함수, 하위 쿼리 이용.
SELECT name, basicpay + sudang FROM tblinsa WHERE basicpay + sudang = (SELECT max(basicpay + sudang) FROM tblinsa);

-- 96. tblinsa. 80년대생 남자 직원들의 평균 월급(basicpay)보다 더 많이 받는 70년대생 여직원들을 출력.
SELECT * FROM tblinsa WHERE (SELECT avg(basicpay) FROM tblinsa WHERE substr(ssn, 1, 2) BETWEEN 80 AND 89 AND substr(ssn, 8, 1) = '1') < basicpay AND substr(ssn, 1, 2) BETWEEN 70 AND 79 AND substr(ssn, 8, 1) = '2';

-- 97. tblStaff, tblProject. 현재 재직중인 모든 직원의 이름, 주소, 월급, 담당프로젝트명을 출력.
SELECT * FROM tblstaff s INNER JOIN tblproject p ON s.seq = p.staff;

-- 98. tblVideo, tblRent, tblMember. '뽀뽀할까요' 라는 비디오를 빌려간 회원의 이름?
SELECT m.name FROM tblvideo v INNER JOIN tblrent r ON v.seq = r.video INNER JOIN tblmember m ON r.member = m.seq WHERE v.name = '뽀뽀할까요';

-- 99. tblinsa. 평균 이상의 월급을 받는 직원들?
SELECT * FROM tblinsa WHERE (SELECT avg(basicpay) FROM tblinsa) < basicpay;

-- 100. tblStaff, tblProejct. '노조협상건'을 담당한 직원의 월급?
SELECT * FROM tblstaff;
SELECT * FROM tblproject;

SELECT s.salary FROM tblstaff s INNER JOIN tblproject p ON s.seq = p.staff WHERE p.name = '노조 협상';

-- 101. tblMember. 가장 나이가 많은 회원의 주소? (bYear)
SELECT address FROM tblmember WHERE (SELECT min(byear) FROM tblmember) = byear;

-- 102. tblvideo. '털미네이터' 비디오를 한번이라도 빌려갔던 회원들의 이름?
SELECT m.name FROM tblvideo v INNER JOIN tblrent r ON v.seq = r.video INNER JOIN tblmember m ON r.member = m.seq WHERE v.name = '털미네이터';

-- 103. tblStaff, tblProject. 서울시에 사는 직원을 제외한 나머지 직원들의
--     이름, 월급, 담당프로젝트명을 출력하시오.
SELECT * FROM tblstaff;
SELECT * FROM tblproject;

SELECT s.name, s.salary, p.name FROM tblstaff s INNER JOIN tblproject p ON s.seq = p.staff WHERE s.address <> '서울시';

-- 104. tblCustomer, tblSales. 상품을 2개(단일상품) 이상 구매한 회원의
--    연락처, 이름, 구매상품명, 수량 출력
SELECT c.tel, c.name, s.item, s.qty FROM tblcustomer c INNER JOIN tblsales s ON c.seq = s.customer WHERE s.qty >= 2;

-- 105. tblvideo. 모든 비디오 제목, 보유수량, 대여가격을 출력
SELECT v.name, v.qty, g.price FROM tblgenre g INNER JOIN tblvideo v ON g.seq = v.genre;

-- 106. tblvideo. 2007년 2월에 대여된 구매내역을 출력하시오. 회원명, 비디오명, 언제, 대여가격
SELECT * FROM tblvideo;
SELECT * FROM tblrent;

SELECT m.name, v.name, r.rentdate, g.price FROM tblgenre g INNER JOIN tblvideo v ON g.seq = v.genre INNER JOIN tblrent r ON v.seq = r.video INNER JOIN tblmember m ON r.member = m.seq WHERE to_char(r.rentdate, 'YYYY-mm') = '2007-02';

-- 107. tblvideo. 현재 반납을 안한 회원명과 비디오명, 대여날짜 출력.
SELECT m.name, v.name, r.rentdate FROM tblvideo v INNER JOIN tblrent r ON v.seq = r.video INNER JOIN tblmember m ON r.member = m.seq WHERE r.retdate IS NULL;

-- 108. tblhousekeeping. 지출 내역(가격 * 수량) 중 가장 많은 금액을 지출한 내역 3가지를 출력.
SELECT * FROM (SELECT seq, item, price, qty, buydate, memo, price * qty FROM tblhousekeeping ORDER BY price * qty DESC) WHERE rownum <= 3;

-- 109. tblinsa. 평균 급여 2위인 부서에 속한 직원들을 출력
SELECT * FROM tblinsa;

-- 110. tblinsa. 부서별 최고 연봉을 받는 직원들을 출력(7명)
SELECT * FROM tblinsa;

-- 111. tbltodo. 등록 후 가장 빠르게 완료한 할일을 순서대로 5개 출력
SELECT * FROM tbltodo WHERE completedate;

-- 112. tblinsa. 남자 직원 중에서 급여를 3번째로 많이 받는 직원과 9번째로 많이 받는 직원의 급여 차액은 얼마?

-- 84, 86, 87, 88, 89, 90, 109