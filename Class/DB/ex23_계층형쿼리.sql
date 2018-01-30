/*

ex23_계층형쿼리.sql

계층형 쿼리, Hierarchial Query
- 오라클에서만 지원
- 답변형 게시판, 카테고리 처리, BOM(bill of matarial)(자재 명세서)등.. 부모와 자식으로 구성된 트리 구조의 데이터 처리

[부품 정보]
컴퓨터
    - 본체
        - 메인보드
        - 렌카드
        - 메모리(RAM)
    - 모니터
        - 편광필름
    - 프린터
        - 잉크 카트리지
        - A4 용지


*/

CREATE TABLE tblcomputer
(
    seq NUMBER PRIMARY KEY, --식별자
    name VARCHAR2(100) NOT NULL, --부품명
    qty NUMBER NOT NULL, --수량
    pseq NUMBER REFERENCES tblcomputer(seq) NULL --부모부품
);

INSERT INTO tblcomputer VALUES (1,'컴퓨터',1,NULL); --루트노트
INSERT INTO tblcomputer VALUES (2,'본체',1,1);
INSERT INTO tblcomputer VALUES (3,'메인보드',1,2);
INSERT INTO tblcomputer VALUES (4,'랜카드',1,3);
INSERT INTO tblcomputer VALUES (5,'RAM',1,3);
INSERT INTO tblcomputer VALUES (6,'모니터',1,1);
INSERT INTO tblcomputer VALUES (7,'편광필름',1,6);
INSERT INTO tblcomputer VALUES (8,'프린터',1,1);
INSERT INTO tblcomputer VALUES (9,'잉크 카트리지',1,8);
INSERT INTO tblcomputer VALUES (10,'A4 용지',1,8);
INSERT INTO tblcomputer VALUES (11,'파워서플라이',1,2);
INSERT INTO tblcomputer VALUES (12,'그래픽 카드',1,3);

COMMIT;

SELECT * FROM tblcomputer;

--1. 조인 사용 -> 계층형 데이터 접근
--: 자기 참조 -> 셀프 조인
--: 내부 조인? 외부 조인?
SELECT c1.name, c2.name as pname FROM tblcomputer c1
    LEFT OUTER JOIN tblcomputer c2
        ON c1.pseq = c2.seq; --자식테이블 <-> 부모테이블


--2. start with 절 connect by 절
--: 계층형 데이터를 대상으로 질의
SELECT * FROM tblcomputer
    START WITH seq = 1
        CONNECT BY PRIOR seq = pseq;

--의사 컬럼
SELECT lpad(' ',(level-1)*6)||name, pseq, level FROM tblcomputer c2
    START WITH seq = 1
        CONNECT BY PRIOR seq = pseq;

--비상관 서브 쿼리
--: 바깥쪽 쿼리와는 전혀 상관없는 독립적인 안쪽 서브 쿼리

--상관 서브 쿼리
--: 바깥쪽의 쿼리 결과를 안쪽 쿼리에 사용하는 서브 쿼리
SELECT lpad(' ',(level-1)*6)||name,
    (SELECT name FROM tblcomputer WHERE seq = c2.pseq),
        level FROM tblcomputer c2
            START WITH seq = 1
                CONNECT BY PRIOR seq = pseq;

--의사 컬럼
--prior : 부모 레코드 참조
SELECT seq,lpad(' ',(level-1)*6)||name,
    prior name, prior seq,
    level FROM tblcomputer c2
    START WITH seq = 1
        CONNECT BY PRIOR seq = pseq;

--start with 절 역할
--: 질의의 루트 노드를 지정하는 역할
SELECT lpad(' ',(level-1)*6)||name as name, prior name
    FROM tblcomputer
        --START WITH seq = 1 --정적으로 지정(내가 알고있기 때문에)
        --START WITH pseq IS NULL --부모가 없는 노트(=루트 노드)
        --START WITH seq = (SELECT seq FROM tblcomputer WHERE name = '컴퓨터')
        START WITH seq = 1
            CONNECT BY PRIOR seq = pseq;

--connect by 역할
--부모컬럼 = 자식컬럼 연결
--반드시 prior 의사컬럼과 같이 사용
SELECT lpad(' ',(level-1)*6)||name as name, prior name
    FROM tblcomputer
        START WITH seq = 1
            CONNECT BY PRIOR seq = pseq;