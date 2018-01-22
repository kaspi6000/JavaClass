-- 문제.sql
/*

<<tblcountry>>

1. 국가명과 수도명을 가져오시오.

2. 아래와 같이 가져오시오.
- 별칭(Alias)
- 컬럼 순서
[국가명]       [수도]        [인구수]       [면적]        [대륙]
대한민국        서울          4405            10          AS
..

<<tblname>>
3. 아래와 같이 가져오시오.
[이름]        [키]             [몸무게]          [별명]
유재석         178cm        64kg            메뚜기
...

<<tblcountry>>
4. 아래와 같이 가져오시오.
[국가정보]
국가명:대한민국, 수도명:서울, 인구수:4405명
..

<<employees>>
5. 직원명, 이메일, 연락처, 급여를 가져오시오.
[이름]              [이메일]                       [연락처]                   [급여]
Steven King   SKING@gmail.com     515.123.4567         $24000
..


<<tblname>>
6. 아래와 같이 가져오시오.
[이름]        [비고]
유재석       유재석의 별명은 '메뚜기'입니다.
..

<<tblslary>>
7. 아래와 같이 가져오시오.
[이름]        [연봉]            [평균급여]
홍길동        3100만원      250만원
..

*/
SELECT * FROM employees;

SELECT '별명은  ''메뚜기''입니다.' FROM dual;

SELECT * FROM TBLSALARY;







--1. 국가명과 수도명을 가져오시오.
SELECT name, capital FROM tblcountry;



--2. 아래와 같이 가져오시오.
--- 별칭(Alias)
--- 컬럼 순서
--[국가명]       [수도]        [인구수]       [면적]        [대륙]
--대한민국        서울          4405            10          AS
--..
SELECT name as 국가명, capital as 수도, population as 인구수, area as 면적, continent as 대륙 FROM tblcountry;



--3. 아래와 같이 가져오시오.
--[이름]        [키]             [몸무게]          [별명]
--유재석         178cm        64kg            메뚜기
--...
SELECT last || first as 이름, height || 'cm' as 키, weight || 'kg' as 몸무게, nick FROM tblname;





--4. 아래와 같이 가져오시오.
--[국가정보]
--국가명:대한민국, 수도명:서울, 인구수:4405명
--..
SELECT '국가명 : ' || name || ', 수도명 : ' || capital || ', 인구수 : ' || population as 국가정보 FROM  tblcountry;




--5. 직원명, 이메일, 연락처, 급여를 가져오시오.
--[이름]              [이메일]                       [연락처]                   [급여]
--Steven King   SKING@gmail.com     515.123.4567         $24000
--..
SELECT first_name || ' ' || last_name as 이름, email || '@gmail.com' as 이메일, phone_number as 연락처, '$' || salary as 급여 FROM employees;





--6. 아래와 같이 가져오시오.
--[이름]        [비고]
--유재석       유재석의 별명은 '메뚜기'입니다.
--..
SELECT last || first as 이름, last || first || '의 별명은 ''' || nick || '''입니다.' as 비고 FROM tblname;




--7. 아래와 같이 가져오시오.
--[이름]        [연봉]            [평균급여]
--홍길동        3100만원      250만원
SELECT name as 이름, (m1 + m2 + m3 + m4 + m5 + m6 + m7 + m8 + m9 + m10 + m11 + m12) || '만원' as 연봉, ((m1 + m2 + m3 + m4 + m5 + m6 + m7 + m8 + m9 + m10 + m11 + m12) / 12) || '만원' as 평균급여 FROM tblsalary;




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
7. 기획부 직원들 가져오시오.

8. 서울에 있는 직원들 중 직위가 부장인 사람의 이름, 직위, 전화번호 가져오시오.

9. 기본급여 + 수당 합쳐서 150만원 이상인 직원 중 서울에 있는 직원만 가져오시오.

10. 수당이 15만원 이하인 직원 중 직위가 사원 or 대리만 직원만 가져오시오.

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





--1. 면적(area)이 100이하인 국가의 이름과 면적을 가져오시오.
SELECT name, area FROM tblcountry
    WHERE area <= 100;


--2. 아시아(AS)와 유럽(EU) 대륙에 속한 나라만을 가져오시오.
SELECT * FROM tblcountry
    WHERE continent = 'AS' or continent = 'EU';


--3. 직업(job_id)이 프로그래머(it_prog)인 직원의 이름(풀네임)과 연락처 가져오시오.
SELECT last_name || ' ' || first_name as name, phone_number FROM employees
    WHERE job_id = 'IT_PROG';


--4. last_name이 'Grant'인 직원의 풀네임, 연락처, 고용날짜를 가져오시오.
SELECT last_name || ' ' || first_name as name, phone_number, hire_date FROM employees
    WHERE last_name = 'Grant';



--5. 특정 매니저(120)이 관리하는 직원의 이름, 급여, 연락처를 가져오시오.
SELECT last_name || ' ' || first_name as name, salary, phone_number FROM employees
    WHERE manager_id = 120;




--6. 특정 부서(60, 80, 100)에 속한 직원들의 이름, 연락처, 이메일, 부서ID를 가져오시오.
SELECT last_name || ' ' || first_name as name, phone_number, email, department_id FROM employees
    WHERE department_id = 60 or department_id = 80 or department_id = 100;



--7. 기획부 직원들 가져오시오.
SELECT * FROM tblinsa
        WHERE buseo = '기획부';



--8. 서울에 있는 직원들 중 직위가 부장인 사람의 이름, 직위, 전화번호 가져오시오.
SELECT name, jikwi, tel FROM tblinsa
        WHERE jikwi = '부장' and city = '서울';




--9. 기본급여 + 수당 합쳐서 150만원 이상인 직원 중 서울에 있는 직원만 가져오시오.
SELECT * FROM tblinsa
        WHERE (basicpay + sudang) >= 1500000 and city = '서울';



--10. 수당이 15만원 이하인 직원 중 직위가 사원 or 대리만 직원만 가져오시오.
SELECT * FROM tblinsa
        WHERE sudang <= 150000 and (jikwi = '사원' or jikwi = '대리');




--11. 수당을 제외한 기본 연봉이 2천만원 이상 + 서울 + 과장(부장)만 가져오시오.
SELECT * FROM tblinsa
        WHERE (basicpay * 12) >= 20000000 and city = '서울' and (jikwi = '과장' or jikwi = '부장');



--12. 1990년대에 입사한 직원 중 과장 or 부장을 달지못한 사람만 가져오시오.
SELECT * FROM tblinsa
        WHERE ibsadate >= '1990-01-01' and ibsadate < '2000-01-01' and (jikwi <> '과장' and jikwi <> '부장');



--13. 2000년 ~ 2002년 사이에 입사한 홍보부 직원만 가져오시오.
SELECT * FROM tblinsa
        WHERE ibsadate >= '2000-01-01' and ibsadate < '2003-01-01' and buseo = '홍보부';



--14. 남자 중 키가 170 미만인 사람을 가져오시오.
SELECT * FROM tblname
        WHERE gender = 'm' and height < 170;



--15. 박씨 성을 가진 여자만 가져오시오.
SELECT * FROM tblname
        WHERE last = '박' and gender = 'f';


--16. 평균 급여가 250만원이 넘는 사람만 가져오시오.
SELECT * FROM tblsalary
        WHERE ((m1 + m2 + m3 + m4 + m5 + m6 + m7 + m8 + m9 + m10 + m11 + m12) / 12) >= 250;




--17. 상반기(1~6월)보다 하반기(7~12월)에 더많이 받은 사람만 가져오시오.
SELECT * FROM tblsalary
        WHERE (m1 + m2 + m3 + m4 + m5 + m6) < (m7 + m8 + m9 + m10 + m11 + m12);



/*

조건절(where) - between, in, like, distinct

<<tblcountry>>
1. 국가명이 'O국'인 나라를 가져오시오.
    a. 국가명 2글자 -> _
    b. 국가명 글자수 상관없이 -> %

<<employees>>
2. 연락처가 515로 시작하는 직원들을 가져오시오.

3. 직업 ID가 'SA'로 시작하는 직원들을 가져오시오.

4. first_name에  'de'가 들어간 직원들을 가져오시오.(대소문자 상관없이 - 문자열 함수X)

<<tblinsa>>
5. 남자 직원만 가져오시오.

6. 여자 직원만 가져오시오.

7. 여름에 태어난 직원들을 가져오시오.(7~8월생)

8. 서울, 인천에 사는 김씨들만 가져오시오.

9. 영업부,총무부,개발부 직원 중 사원급(사원,대리) 인 010 사용자를 가져오시오.

10. 서울, 인천, 경기에 살고 입사일이 1998~2000년 사이인 직원들을 가져오시오.

<<employees>>
11. 부서가 아직 배정이 안된 직원들을 가져오시오.

-- distinct
12. 직업이 어떤 종류가 있는지? (단, NULL 제외)

13. 고용일이 2002~2004년 사이인 직원들은 어느 부서에 근무하는지?

14. 급여가 5000불 이상인 직원들의 담당 매니저는 누구인지?

<<tblinsa>>
15. 남자 직원 + 80년대생 -> 직급?

16. 수당 20만원 넘는 직원들은 어디 사는지?

17. 연락처가 아직 없는 직원은 어느 부서에 소속되어 있는지?



<<tbldiary>>
18. 2018년 1월 20일 이후에 날씨가 어땠는지?
19. '오라클', '자바', '코딩' 이라는 키워드가 들어간 날들은 날씨가 어땠는지?

<<tblhousekeeping>>
20. 구매 총 가격(price * qty)이 50000~100000원 이내 목록?

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
4. 서울과 부산에 있는 직원들의 급여 합(급여 + 수당)?
5. 부장, 과장들의 총 급여합?

avg()
1. 아시아에 속한 국가의 평균 인구수?
2. 이름(first_name)에 'AN'이 포함된 직원들의 급여 평균?(대소문자 구분없이)
3. 간부급(과장,부장)의 평균 급여?
4. 사원급(대리,사원)의 평균 급여?

max(), min()
1. 면적이 가장 넓은 나라의 면적?
2. 급여(급여+수당)가 가장 적게 받는 사람의 급여액?
3. tblhousekeeping 가장 크게 지른 금액? (price * qty)


*/




-- 1. 국가명이 'O국'인 나라를 가져오시오.
--     a. 국가명 2글자 -> _
--     b. 국가명 글자수 상관없이 -> %

SELECT * FROM tblcountry
      WHERE name like '_국';

SELECT * FROM tblcountry
      WHERE name like '%국';


-- 2. 연락처가 515로 시작하는 직원들을 가져오시오.
SELECT * FROM employees
      WHERE phone_number like '515%';


-- 3. 직업 ID가 'SA'로 시작하는 직원들을 가져오시오.
SELECT * FROM employees
      WHERE job_id like 'SA%';


-- 4. first_name에  'de'가 들어간 직원들을 가져오시오.(대소문자 상관없이 - 문자열 함수X)
SELECT * FROM employees
      WHERE first_name like '%de%'
            or first_name like '%DE%'
            or first_name like '%De%'
            or first_name like '%dE%';




-- 5. 남자 직원만 가져오시오.
SELECT * FROM tblinsa
      WHERE ssn like '%-1%';

-- 6. 여자 직원만 가져오시오.
SELECT * FROM tblinsa
      WHERE ssn like '%-2%';

-- 7. 여름에 태어난 직원들을 가져오시오.(7~8월생)
SELECT * FROM tblinsa
      WHERE ssn like '__07%' or ssn like '__08%';

-- 8. 서울, 인천에 사는 김씨들만 가져오시오.
SELECT * FROM tblinsa
      WHERE city in ('서울', '인천') and name like '김%';

-- 9. 영업부,총무부,개발부 직원 중 사원급(사원,대리) 인 010 사용자를 가져오시오.
SELECT * FROM tblinsa
      WHERE buseo in ('영업부', '총무부', '개발부') and jikwi in ('사원', '대리') and tel like ('010%');

-- 10. 서울, 인천, 경기에 살고 입사일이 1998~2000년 사이인 직원들을 가져오시오.
SELECT * FROM tblinsa
      WHERE city in ('서울', '인천', '경기')
            and ibsadate BETWEEN '1998-01-01' AND '2001-01-01';


--11. 부서가 아직 배정이 안된 직원들을 가져오시오.
SELECT * FROM employees
      WHERE department_id IS  NULL ;


-- 12. 직업이 어떤 종류가 있는지? (단, NULL 제외)
SELECT distinct job_id from employees;

-- 13. 고용일이 2002~2004년 사이인 직원들은 어느 부서에 근무하는지?
SELECT DISTINCT  department_id FROM employees
      WHERE hire_date BETWEEN '2002-01-01' AND  '2005-01-01';

SELECT DISTINCT  buseo FROM tblinsa
      WHERE ibsadate BETWEEN '2002-01-01' AND  '2005-01-01';

-- 14. 급여가 5000불 이상인 직원들의 담당 매니저는 누구인지?
SELECT DISTINCT manager_id FROM employees
      WHERE salary >= 5000;


-- 15. 남자 직원 + 80년대생 -> 직급?
SELECT DISTINCT jikwi FROM tblinsa
      WHERE ssn like '8%-1%' ;


-- 16. 수당 20만원 넘는 직원들은 어디 사는지?
SELECT DISTINCT city FROM tblinsa
      WHERE sudang >= 200000;



-- 17. 연락처가 아직 없는 직원은 어느 부서에 소속되어 있는지?
SELECT DISTINCT buseo FROM tblinsa
      WHERE tel IS NULL ;





-- 18. 2018년 1월 20일 이후에 날씨가 어땠는지?
SELECT DISTINCT weather FROM tbldiary
      WHERE regdate >= '2018-01-20';


-- 19. '오라클', '자바', '코딩' 이라는 키워드가 들어간 날들은 날씨가 어땠는지?
SELECT DISTINCT weather FROM tbldiary
      WHERE subject like '%오라클%' or subject like '%자바%' or subject like '%코딩%';


--20. 구매 총 가격(price * qty)이 50000~100000원 이내 목록?
SELECT * FROM tblhousekeeping
      WHERE price * qty BETWEEN 50000 AND 100000;


-- 21. 2018년 1월 5일 ~ 2018년 1월 10일 이내에 등록한 일 중 아직 완료를 안한 일들?
SELECT * FROM tbltodo
      WHERE adddate BETWEEN '2018-01-05' AND '2018-01-11'
            AND completedate IS NULL ;


-- 22. '~하기' 라고 제목을 붙인 할 일 중 완료한 일들은?
SELECT * FROM tbltodo
      WHERE title like '%하기' AND completedate IS NOT NULL ;


-- 23. 여자 직원들의 직위?
SELECT DISTINCT jikwi FROM tblinsa
      WHERE ssn like '%-2%';

-- 24. 홍보부 직원들이 사는곳?
SELECT DISTINCT city FROM tblinsa
      WHERE buseo = '홍보부';



-- 25. 여자친구가 있으면서 몸무게를 알 수 없는 사람?
SELECT * FROM tblmen
      WHERE couple IS NOT NULL AND weight IS NULL ;


-- 26. 여자친구가 '김'씨이면서 자신은 '박'씨인 사람?
SELECT * FROM tblmen
      WHERE couple like '김%' and name like '박%';





-- 1. 아시아와 유럽에 속한 국가는 몇개국?
SELECT count(*) FROM tblcountry
      WHERE continent in ('AS', 'EU');

-- 2. 인구가 5000 ~ 20000 사이에 속하는 국가는 몇개국?
SELECT count(*) FROM tblcountry
      WHERE population BETWEEN 5000 AND 20000;


--3. IT_PRO 중에서 급여가 5000불 넘는 직원 몇명?
SELECT count(*) FROM employees
      WHERE job_id = 'IT_PROG' AND salary >= 5000;



-- 4. 연락처가 010이 아닌 사람이 몇명?(연락처 있는 사람들 중에서)
SELECT count(*) FROM tblinsa
      WHERE NOT tel like '010%'  AND tel IS NOT NULL ;

-- 5. 서울 사람 빼고 몇명?
SELECT count(*) FROM tblinsa
      WHERE city <> '서울';


-- 6. 여자 직원 몇명?
SELECT count(*) FROM tblinsa
      WHERE ssn like '%-2%';


--7. 솔로가 몇명?
SELECT count(*) FROM tblmen
      WHERE couple IS NULL ;


--8. 구매 총액이 3만원을 넘는 구매를 총 몇회?
SELECT * FROM tblhousekeeping
      WHERE (price * qty) >= 30000;



-- 1. EU와 AF에 속한 나라의 총 인구합?
SELECT sum(population) FROM tblcountry
      WHERE continent in ('EU', 'AF');

-- 2. 매니저(108)가 관리하는 직원의 급여 합?
SELECT sum(salary) FROM employees
      WHERE manager_id = 108;

-- 3. 직업(ST_CLERK, SH_CLERK)을 가지는 직원 급여 합?
SELECT sum(salary) FROM employees
      WHERE job_id in ('ST_CLERK', 'SH_CLERK');

-- 4. 서울과 부산에 있는 직원들의 급여 합(급여 + 수당)?
SELECT sum(basicpay + sudang) FROM tblinsa
      WHERE city in ('서울', '부산');

-- 5. 부장, 과장들의 총 급여합?
SELECT sum(basicpay) FROM tblinsa
      WHERE jikwi in ('부장', '과장');



-- 1. 아시아에 속한 국가의 평균 인구수?
SELECT avg(population) FROM tblcountry
      WHERE continent = 'AS';

-- 2. 이름(first_name)에 'AN'이 포함된 직원들의 급여 평균?(대소문자 구분없이)
SELECT avg(salary) FROM employees
      WHERE first_name like '%AN%'
            OR first_name like '%an%'
            OR first_name like '%An%'
            OR first_name like '%aN%';

-- 3. 간부급(과장,부장)의 평균 급여?
SELECT avg(basicpay) FROM tblinsa
      WHERE jikwi in ('과장', '부장');

-- 4. 사원급(대리,사원)의 평균 급여?
SELECT avg(basicpay) FROM tblinsa
      WHERE jikwi in ('대리', '사원');


-- 1. 면적이 가장 넓은 나라의 면적?
SELECT max(area) FROM tblcountry;

-- 2. 급여(급여+수당)가 가장 적게 받는 사람의 급여액?
SELECT min(basicpay + sudang) FROM tblinsa;

-- 3. tblhousekeeping 가장 크게 지른 금액? (price * qty)
SELECT max(price * qty) FROM tblhousekeeping;





