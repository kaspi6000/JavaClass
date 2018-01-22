-- 01. tblinsa 테이블 전체 레코드 조회

-- 02. HR 사용자 소유 테이블 목록 확인

-- 03. tblinsa 테이블 구조 확인

-- 04. tblinsa 테이블의 이름(name), 기본급(basicpay) 조회

-- 05. tblinsa 테이블의 이름(name), 기본급(basicpay), 수당(sudang), 기본급+수당 조회

-- 06. 이름(name), 출신도(city), 부서명(buseo) 조회. 별명 사용.

-- 07. 서울 사람의 이름(name), 출신도(city), 부서명(buseo), 직위(jikwi) 조회

-- 08. 출신도가 서울 사람이면서       --> WHERE 구문
--     기본급이 150만원 이상인 사람   --> WHERE 구문
--     조회 (name, city, basicpay, ssn)

-- 09. 출신도가 '인천' 이면서, 기본급이 100만원이상 ~ 200만원 미만인 경우만 모든정보 조회.

-- 10. 출신도가 서울 사람이거나 부서가 개발부인 자료 조회 (name, city, buseo)
 
-- 11. 출신도가 서울, 경기인 사람만 조회 (name, city, buseo). IN 연산자 사용.

-- 12. 부서가 '개발부' 이거나 '영업부'인 사원의 모든정보 조회. IN 연산자 사용.

-- 13. 급여(basicpay + sudang)가 250만원 이상인 사람 조회. --> WHERE 구문
--     단, 필드명은 한글로 출력. --> 별칭
--     (name, basicpay, sudang, basicpay+sudang)


-- 14. 주민번호를 기준으로 남자(성별란이 1, 3)만 조회. (이름(name), 주민번호(ssn)). 
--     단, SUBSTR() 함수 이용.

 
-- 15. 주민번호를 기준으로 80년대 태어난 사람만 출력. (이름(name), 주민번호(ssn)). 
--     단, SUBSTR() 함수 이용.


-- 16. 서울 사람 중에서 70년대 태어난 사람만 출력. SUBSTR() 함수 이용.

    
-- 17. 서울 사람 중에서 70년대 태어난 남자만 출력. SUBSTR() 함수 이용.

 
-- 18. 서울 사람이면서 김씨만 출력(성씨가 1자라는 가정). (이름, 출신도). 
-- SUBSTR() 함수 이용.


-- 19. 2000년도에 입사한 사람 출력. (이름, 출신도, 입사일). 
-- SUBSTR() 또는 TO_CHAR() 함수 이용.


-- 20. 2000년 10월에 입사한 사람 출력. (이름, 출신도, 입사일). 


-- 21. 주민번호를 기준으로 직원의 나이 구하기(단, 모든 직원이 1900년대에 태어났다는 가정). (이름, 주민번호, 나이)


-- 22. 주민번호 기준으로 현재 나이대가 40대인 사람만 출력.


-- 23. 주민번호 기준으로 5월달생만 출력. SUBSTR() 함수 이용.


-- 24. 주민번호 기준으로 5월달생만 출력. TO_CHAR() 함수 이용.
-- 문자열 -> 날짜 -> 문자열


-- 25. 출신도 내림차순으로 정렬하고, 출신도가 같으면 기본급 내림차순

 
 
-- 26. 서울 사람 중에서 기본급+수당(->급여) 내림차순으로 정렬. 
-- (이름, 출신도, 기본급+수당)



 
-- 27. 여자 중 부서 오름차순으로 정렬하고, 부서가 같으면 기본급 내림차순 정렬. (이름, 주민번호, 부서, 기본급)



-- 28. 남자 중에서 나이를 기준으로 오름차순 정렬해서 출력.


-- 29. 서울 지역 사람들 중에서 입사일이 빠른 사람을 먼저 출력.


-- 30. 성씨가 김씨가 아닌 사람 출력. (이름, 출신도, 기본급). 
-- LIKE 연산자 또는 SUBSTR() 함수 이용.


-- 31. 출신도가 서울, 부산, 대구 이면서 
-- 전화번호에 5 또는 7이 포함된 자료 출력하되 
-- 부서명의 마지막 부는 출력되지 않도록함. 
-- (이름, 출신도, 부서명, 전화번호)


  
-- 32. 전화번호가 있으면 '-'을 제거하고 출력하고, 없으면 '전화번호없음'을 출력
-- 추가문제) HR계정, employees 테이블에서 커미션 받는 사람의 수와 
-- 안받는 사람의 수를 출력
--COUNT(), NVL(), GROUP BY 구문



-- 33. tblinsa 테이블에서 basicpay+sudang가 100만원 미만
-- , 100만원 이상~200만원 미만, 200만원 이상인 직원들의 수 출력.
--GROUP BY 구문


-- 34. tblinsa 테이블에서 주민번호를 가지고 생년월일의 년도별 직원수 출력


-- 35. 주민번호를 기준으로 월별 오름차순, 월이 같으면 년도 내림차순 출력. 
-- (이름, 주민번호) . SUBSTR() 함수 이용.


-- 36. 입사일을 기준으로  월별 오름차순, 월이 같으면 년도 내림차순 출력. 
-- 주의. 입사일은 자료형이 DATE이다.

    

-- 37. 전체인원수, 남자인원수, 여자인원수를 동시 출력.


-- 38. 개발부, 영업부, 총무부 인원수 출력. COUNT(), DECODE() 함수 이용.

        
-- 39. 서울 사람의 남자 인원수 출력.


-- 40. 부서가 영업부이고, 남자 인원수, 여자 인원수 출력.  COUNT(), DECODE() 함수 이용.        

    
-- 41. 개발부, 영업부, 총무부 인원수 출력. 단, 지역은 '서울'로 한정.

 
-- 42. 서울 사람의 남자와 여자의 기본급합 출력.


-- 43. 남자와 여자의 기본급 평균값 출력. AVG(), DECODE() 함수 이용.



-- 44. 개발부의 남자, 여자 기본급 평균값 출력.


-- 45. 부서별 남자와 여자 인원수 구하기

        
-- 46. 지역별 남자와 여자 인원수 구하기


-- 47. 입사년도별 남자와 여자 인원수 구하기


-- 48. 영업부, 총무부 인원만을 가지고 입사년도별 남자와 여자 인원수 구하기



-- 49. 서울 사람중 부서별 남자와 여자인원수, 남자와 여자 급여합 출력.



-- 50. 부서별 인원수 출력. 인원수가 10 이상인 경우만.



-- 51. 부서별 남,여 인원수 출력. 여자인원수가 5명 이상인 부서만 출력.


 
-- 52. 이름, 성별, 나이 출력
--        성별: 주민번호 1,3->남자, 2,4->여자 (DECODE 사용)
--        나이: 주민번호 이용해서


 
-- 53. 서울 사람 중에서 기본급이 200만원 이상이 사람. (이름, 기본급)

 
-- 54. 입사월별 인원수 구하기. (월, 인원수)   COUNT, GROUP BY, TO_CHAR 사용
--         출력형태 ----------
--         월      인원수
--         1월    10명
--         2월    25명



-- 55. 이름, 생년월일, 기본급, 수당을 출력.
--        생년월일은 주민번호 기준 (2000-10-10 형식으로 출력)
--        기본급은 \1,000,000 형식으로 출력

 
-- 56. 이름, 출신도, 기본급을 출력하되 출신도 내림차순 출력(1차 정렬 기준). 
-- 출신도가 같으면 기본급 오름차순 출력(2차 정렬 기준).

 
-- 57. 전화번호가 NULL이 아닌것만 출력. (이름, 전화번호)


-- 58. 근무년수가 15년 이상인 사람 출력. (이름, 입사일)


 
-- 59. 주민번호를 기준으로 75~82년생 출력. (이름, 주민번호, 출신도). 
-- SUBSTR() 함수, BEWTEEN AND 구문, TO_NUMBER() 함수 이용.


-- 60. 근무년수가 15~20년인 사람 출력. (이름, 입사일)

 
-- 61. 김씨, 이씨, 박씨만 출력 (이름, 부서). SUBSTR() 함수 이용.

 
-- 62. 입사일을 "년-월-일 요일" 형식으로 남자만 출력 (이름, 주민번호, 입사일)


-- 63. 부서별 직위별 급여합 구하기. (부서, 직위, 급여합)


-- 64. 부서별 직위별 인원수, 급여합, 급여평균 구하기. (부서, 직위, 급여합)

 
-- 65. 부서별 직위별 인원수를 구하되 인원수가 5명 이상인 경우만 출력.


-- 66. 2000년에 입사한 여사원. (이름, 주민번호, 입사일)

 
-- 67. 성씨가 한 글자(김, 이, 박 등)라는 가정하에 성씨별 인원수 (성씨, 인원수)

    
-- 68. 출신도(CITY)별 성별 인원수.

 
-- 69. 부서별 남자인원수가 5명 이상인 부서와 남자인원수.

 
-- 70. 입사년도별 인원수.


-- 71. 전체인원수, 2000년, 1999년, 1998년도에 입사한 인원을 다음의 형식으로 출력.
--         전체 2000 1999 1998
--          60    x    x    x


-- 72. 아래 형식으로 지역별 인원수 출력.
--         전체 서울  인천  경기
--          60    x     x     x


-- 73. 기본급(basicpay)이 평균 이하인 사원 출력. (이름, 기본급). AVG() 함수. 하위쿼리.



-- 74. 기본급 상위 10%만 출력. (이름, 기본급)



-- 75.기본급 순위가 5순위까지만 출력



-- 76. 입사일이 빠른 순서로 5순위까지만 출력.



-- 77. 평균 급여보다 많은 급여를 받는 직원 출력  


-- 78. '이순애' 직원의 급여보다 더 많은 급여를 받는 직원 출력.



-- 79. 총무부의 평균 급여보다 많은 급여를 받는 직원들의 이름, 부서명 출력.



-- 80. 총무부 직원들보다 더 많은 급여를 받는 직원 정보.



-- 81. 직원 전체 평균 급여보다 많은 급여를 받는 직원의 수 출력.



-- 82. '홍길동' 직원과 같은 부서의 직원 정보.



-- 83. '김신애' 직원과 같은 부서, 직위를 가진 직원 정보


            


-- 84. 부서별 기본급이 가장 높은 사람 출력. (이름, 부서, 기본급)        

       


-- 85. 남자 기본급 순위 출력.
    -- 여자 기본급 순위 출력.
    

        
-- 86. 지역(city)별로 급여(기본급+수당) 1순위 직원만 출력.


-- 87. 부서별 인원수가 가장 많은 부서 및 인원수 출력. 


        
-- 88. 지역(city)별 인원수가 가장 많은 지역 및 인원수 출력.



-- 89. 지역(city)별 평균 급여(basicpay+sudang)가 
 --      가장 높은 지역 및 평균급여 출력.



-- 90. 여자 인원수가 가장 많은 부서 및 인원수 출력.


    
-- 91. 지역별 인원수 순위 출력.


                
-- 92. 지역별 인원수 순위 출력하되 5순위까지만 출력.


 
-- 93. 이름, 부서, 출신도, 기본급, 수당, 기본급+수당, 세금, 실수령액 출력
--        세금: 총급여가 250만원 이상이면 2%, 200만원 이상이면 1%, 나머지 0.
--        실수령액: 총급여-세금
--        CASE~END 문 사용.


-- 94. 부서별 평균 급여를 출력하되, A, B, C 등급으로 나눠서 출력.
-- 200만원 초과 - A등급
-- 150~200만원 - B등급
-- 150만원 미만 - C등급


 
-- 95. 기본급+수당이 가장 많은 사람의 이름, 기본급+수당 출력. 
-- MAX() 함수, 하위 쿼리 이용.



-- 96. tblinsa. 80년대생 남자 직원들의 평균 월급(basicpay)보다 더 많이 받는 70년대생 여직원들을 출력.



-- 97. tblStaff, tblProject. 현재 재직중인 모든 직원의 이름, 주소, 월급, 담당프로젝트명을 출력.


-- 98. tblVideo, tblRent, tblMember. '뽀뽀할까요' 라는 비디오를 빌려간 회원의 이름?


-- 99. tblinsa. 평균 이상의 월급을 받는 직원들?


-- 100. tblStaff, tblProejct. '노조협상건'을 담당한 직원의 월급?


-- 101. tblMember. 가장 나이가 많은 회원의 주소? (bYear)


-- 102. tblvideo. '털미네이터' 비디오를 한번이라도 빌려갔던 회원들의 이름?


-- 103. tblStaff, tblProject. 서울시에 사는 직원을 제외한 나머지 직원들의
--     이름, 월급, 담당프로젝트명을 출력하시오.


-- 104. tblCustomer, tblSales. 상품을 2개(단일상품) 이상 구매한 회원의
--    연락처, 이름, 구매상품명, 수량 출력


-- 105. tblvideo. 모든 비디오 제목, 보유수량, 대여가격을 출력



-- 106. tblvideo. 2007년 2월에 대여된 구매내역을 출력하시오. 회원명, 비디오명, 언제, 대여가격



-- 107. tblvideo. 현재 반납을 안한 회원명과 비디오명, 대여날짜 출력.




-- 108. tblhousekeeping. 지출 내역(가격 * 수량) 중 가장 많은 금액을 지출한 내역 3가지를 출력.



-- 109. tblinsa. 평균 급여 2위인 부서에 속한 직원들을 출력



-- 110. tblinsa. 부서별 최고 연봉을 받는 직원들을 출력(7명)



-- 111. tbltodo. 등록 후 가장 빠르게 완료한 할일을 순서대로 5개 출력



-- 112. tblinsa. 남자 직원 중에서 급여를 3번째로 많이 받는 직원과 9번째로 많이 받는 직원의 급여 차액은 얼마?




