/*
    인덱스, Index
    - 색인
    - 검색(select)를 빠른 속도로 하기 위해서 사용하는 도구
    - 하나의 테이블에 데이터 많이 저장 -> 초반에 있는 데이터는 접근 속도 빠름. 후반에 있는 데이터는 접근 속도 느림
      -> 자주 검색되는 대상 컬럼 -> 인덱스 생성 -> 데이터 접근 : 표 사용X, 인덱스 사용O -> 원하는 레코드의 접근 속도 향상
    - 오라클은 테이블 생성 시 인덱스를 명시적으로 생성하지 않아도 자동으로 생성된다. -> PK, Unique 제약이 붙은 컬럼은
      자동으로 인덱스가 만들어진다. -> PK, Unique 컬럼들은 WHERE절에서 사용될 확률이 높아서.
*/
CREATE TABLE tblindex
AS
SELECT * FROM tblinsa;

INSERT INTO tblindex SELECT * FROM tblindex;

-- 약 1570만건 데이터
SELECT count(*) FROM tblindex;

-- 현재 tblindex 테이블은 제약 사항이 아무것도 없는 상태

-- 인덱스 처리가 안된 상태에서의 검색
SELECT DISTINCT name FROM tblindex WHERE name = '홍길동'; -- 8s 300ms

-- 인덱스 생성
CREATE INDEX idx_tblindex_name
    ON tblindex(name);

-- 인덱스를 만든 컬럼을 조건으로 다시 검색    
SELECT name FROM tblindex WHERE name = '홍길동'; -- 0.0x

/*
    인덱스 장점/단점
    - 검색 처리 속도를 향상 시킨다.
    - 쓸데없는 비용이 많이 발생
    
    인덱스 사용해야 하는 경우
    1. 테이블 행의 갯수가 많은 경우
    2. 인덱스를 적용한 컬럼이 WHERE절에 많이 사용되는 경우
    3. JOIN에 사용되는 컬럼(ON 부모테이블.PK = 자식테이블.FK)    (**)
    4. 검색 결과가 원본 테이블 데이터의 2 ~ 4% 에 해당하는 경우
    5. 해당 컬럼이 NULL을 포함하는 경우(색인에 NULL은 미포함)
    
    인덱스 사용하면 안좋은 경우
    1. 테이블 행의 갯수가 적은 경우
    2. 검색 결과가 많을 수록.
    3. 원본 테이블의 삽입, 수정, 삭제가 빈번한 경우   (**)
    
    인덱스의 종류
    1. 비고유 인덱스
    2. 고유 인덱스
    3. 단일 인덱스
    4. 결합 인덱스
*/

-- 1. 비고유 인덱스
-- : 색인의 값이 중복 가능하다.
CREATE INDEX idx_tblindex_buseo ON tblindex(buseo);

-- 2. 고유 인덱스
-- : 색인의 값이 중복 불가능하다. 유일하다.
CREATE UNIQUE INDEX idx_tblinsa_name ON tblinsa(name);

-- 3. 단일 인덱스
-- : 1개의 컬럼을 대상으로 인덱스 생성
CREATE INDEX idx_tblindex_buseo ON tblindex(buseo);
CREATE UNIQUE INDEX idx_tblinsa_name ON tblinsa(name); --**

SELECT * FROM tblinsa WHERE name = '홍길동'; -- idx_tblinsa_name 동작
SELECT * FROM tblinsa WHERE name = '홍길동' AND jikwi = '과장'; -- idx_tblinsa_name 미동작
SELECT * FROM tblinsa WHERE substr(name, 1, 1) = '홍'; -- idx_tblinsa_name 미동작

-- 4. 결합 인덱스
-- : 2개 이상의 컬럼을 대상으로 인덱스 생성
CREATE INDEX idx_tblinsa_name_jikwi ON tblinsa(name, jikwi); -- WHERE name = '홍길동' AND jikwi = '과장';

--
CREATE INDEX idx_tblinsa_lastname ON tblinsa(substr(name, 1, 1)); -- WHERE substr(name, 1, 1) = '홍';

CREATE INDEX idx_tblinsa_salary ON tblinsa(basicpay + sudang); -- WHERE basicpay + sudang > 1500000

-- 오라클(DBMS)의 키워드는 대/소문자를 구분하지 않는다.(SQL특징)
-- 데이터의 대/소문자는 구분한다.
-- 오라클은 DDL을 사용해서 생성한 모든 식별자를 대문자로 변환시켜서 저장한다.
-- 오라클에서 SQL 작성 시 식별자를 대문자로 적어라.

SELECT * FROM user_tab_columns; -- 시스템 테이블

SELECT * FROM user_tab_columns WHERE table_name = 'tblname';

SELECT * FROM user_tab_columns WHERE table_name = 'TBLNAME';

SELECT * FROM tblname;