/*
    UPDATE
    - 데이터를 수정하는 명령어
    
    UPDATE 구문
    - UPDATE 테이블명 SET 
      컬럼명 = 수정할값
      [,컬럼명 = 수정할값] X N
      WHERE 조건 : -- 수정할 행을 선택하는 조건(SELECT 에서 배웠던 WHERE의 사용과 100% 동일)
*/
COMMIT;
ROLLBACK;

UPDATE tblname SET
    gender = 'f'
    WHERE first = '재석' AND last = '유'; --PK조건으로
    
SELECT * FROM tblname;

SELECT * FROM tblinsa;

-- 단일 행 수정(직원1명 -> 식별 -> PK -> num컬럼 -> num을 조건으로)
UPDATE tblinsa SET
    jikwi = '이사'
    WHERE num = 1001;
    
-- 다중 행 수정(기획부 직원 -> 급여 인상 -> 10%인상 -> buseo 컬럼)
UPDATE tblinsa SET
    basicpay = basicpay * 1.1 --누적 basicpay *= 1.1
    WHERE buseo = '기획부';
    
--
UPDATE tblinsa SET
    num = 1100
    WHERE num = 1001;
    
/*
    DELETE
    - 데이터를 삭제하는 명령어
    - 행 삭제
    - 특정 컬럼값만 삭제X -> UPDATE 문으로 특정 컬럼값을 NULL수정
    
    DELETE문
    - DELETE [FROM] 테이블명 [WHERE절]
*/
SELECT * FROM tblinsa;

SELECT * FROM tblcountry;

DELETE FROM tblcountry WHERE name = '중국' OR name = '일본' OR continent = 'AS';
ROLLBACk;