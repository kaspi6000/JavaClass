/*
  의사 컬럼. Pseudo Colum
  
  rownum
  - 오라클
  - 행번호
  - 행의 순서를 번호로 봔한하는 가상 컬럼(개발자가 직접 생성하지 않더라도 존재하는 컬럼)
  - 서브 쿼리를 잘해야 사용하기 쉽다.
  - rownum은 FROM절을 실행할 때 번호를 할당한다.
*/
SELECT * FROM tblinsa;
SELECT name, buseo, jikwi, rownum FROM tblinsa;

SELECT name, buseo, jikwi, basicpay, rownum FROM tblinsa;

SELECT name, buseo, jikwi, basicpay, rownum --2
    FROM tblinsa --1
        ORDER BY basicpay DESC; --3

SELECT name, buseo, jikwi, basicpay, rownum FROM
(SELECT name, buseo, jikwi, basicpay
    FROM tblinsa
        ORDER BY basicpay DESC) WHERE rownum <= 3;
        
-- rownum이 조건으로 사용 -> 1위가 포함
SELECT name, basicpay, rownum FROM tblinsa;
SELECT name, basicpay, rownum FROM tblinsa WHERE rownum = 1;
SELECT name, basicpay, rownum FROM tblinsa WHERE rownum = 3;
SELECT name, basicpay, rownum FROM tblinsa WHERE rownum <= 5;
SELECT name, basicpay, rownum FROM tblinsa WHERE rownum >= 6 AND rownum <= 10;

-- rownum을 조건으로 사용하기 위해서 -> 서브쿼리 사용 -> rownum 변하지 않도록 하기 위해서(정적)
SELECT name, basicpay, rownum FROM tblinsa;

SELECT name, basicpay, rownum, rnum FROM (SELECT name, basicpay, rownum AS rnum FROM tblinsa) WHERE rnum >= 5 AND rnum <= 10;

-- 급여가 많은 순서대로 정렬
SELECT b.* FROM (SELECT rownum AS rnum, a.* FROM (SELECT t.* FROM tblinsa t ORDER BY basicpay DESC) a) b WHERE rnum >= 3 AND rnum <= 5;