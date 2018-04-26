-- MVCTest > board.sql

DROP TABLE tblBoard CASCADE CONSTRAINTS;
DELETE FROM tblBoard WHERE id = 'test' CASCADE;

-- 2. 寃뚯떆�뙋 �뀒�씠釉�(�썝湲�)
CREATE TABLE tblBoard (
    seq NUMBER PRIMARY KEY, -- �떆���뒪
    subject VARCHAR2(500) NOT NULL, -- 湲� �젣紐�
    content VARCHAR2(2000) NOT NULL, -- 湲��궡�슜
    id VARCHAR2(30) not null REFERENCES tblMember(id), -- �옉�꽦�옄
    regdate DATE DEFAULT sysdate NOT NULL, -- 湲��벖�떆媛�
    readcount NUMBER DEFAULT 0 NOT NULL, -- 議고쉶�닔
    tag VARCHAR2(1) NOT NULL CHECK(tag in('y', 'n'))-- 湲� �궡�슜�뿉 �깭洹� �뿀�슜

);

CREATE SEQUENCE board_seq;

INSERT INTO tblBoard (seq, subject, content, id, regdate, readcount, tag)
    VALUES (board_seq.nextval, '寃뚯떆�뙋 泥リ��엯�땲�떎.', '�궡�슜�엯�땲�떎.', 'hong', default, default, 'y');

SELECT * FROM tblBoard;

DELETE FROM tblBoard WHERE seq = 13;
COMMIT;

SELECT * FROM (SELECT a.*, rownum as rnum FROM (SELECT seq, subject, id, (SELECT name FROM tblMember WHERE id = b.id) as name, regdate, readcount, round((sysdate - regdate) * 24 * 60) as gap, content FROM tblBoard b ORDER BY seq DESC) a) WHERE rnum >= 11 and rnum >= 20 ORDER BY seq DESC;

-- 댓글 테이블
DROP TABLE tblComment;
CREATE TABLE tblComment (
    seq NUMBER PRIMARY KEY, -- 댓글번호(PK)
    id VARCHAR2(30) NOT NULL REFERENCES tblMember(id), -- 글쓴이
    content VARCHAR2(1000) NOT NULL, -- 댓글 내용
    regdate DATE DEFAULT SYSDATE NOT NULL, -- 글쓴 시각
    pseq NUMBER NOT NULL REFERENCES tblBoard(seq) -- 부모글(FK)
    
);

CREATE SEQUENCE comment_seq;

SELECT * FROM tblComment;






SELECT c.*, (SELECT name FROM tblMember WHERE id = c.id) as name FROM tblComment c WHERE pseq = 32 ORDER BY seq DESC;





SELECT seq, subject, id, (SELECT name FROM tblMember WHERE id = b.id) as name, regdate, readcount, content, (SELECT count(*) FROM tblComment WHERE b.SEQ = PSEQ) as ccount, round((sysdate - regdate) * 24 * 60) as gap FROM tblBoard b;

-------------------------------------------------------------------------------------------------------------------

CREATE TABLE tblBoard (
    seq NUMBER PRIMARY KEY, -- �떆���뒪
    subject VARCHAR2(500) NOT NULL, -- 湲� �젣紐�
    content VARCHAR2(2000) NOT NULL, -- 湲��궡�슜
    id VARCHAR2(30) not null REFERENCES tblMember(id), -- �옉�꽦�옄
    regdate DATE DEFAULT sysdate NOT NULL, -- 湲��벖�떆媛�
    readcount NUMBER DEFAULT 0 NOT NULL, -- 議고쉶�닔
    tag VARCHAR2(1) NOT NULL CHECK(tag in('y', 'n')),-- 湲� �궡�슜�뿉 �깭洹� �뿀�슜
    thread NUMBER NOT NULL,     -- 답변형(정렬)
    depth NUMBER NOT NULL       -- 답변형(들여쓰기)
);

CREATE TABLE tblComment (
    seq NUMBER PRIMARY KEY, -- 댓글번호(PK)
    id VARCHAR2(30) NOT NULL REFERENCES tblMember(id), -- 글쓴이
    content VARCHAR2(1000) NOT NULL, -- 댓글 내용
    regdate DATE DEFAULT SYSDATE NOT NULL, -- 글쓴 시각
    pseq NUMBER NOT NULL REFERENCES tblBoard(seq) -- 부모글(FK)
);

DROP TABLE tblComment;
DROP TABLE tblBoard;

SELECT * FROM tblBoard;

CREATE TABLE tblBoard (
    seq NUMBER PRIMARY KEY, -- �떆���뒪
    subject VARCHAR2(500) NOT NULL, -- 湲� �젣紐�
    content VARCHAR2(2000) NOT NULL, -- 湲��궡�슜
    id VARCHAR2(30) not null REFERENCES tblMember(id), -- �옉�꽦�옄
    regdate DATE DEFAULT sysdate NOT NULL, -- 湲��벖�떆媛�
    readcount NUMBER DEFAULT 0 NOT NULL, -- 議고쉶�닔
    tag VARCHAR2(1) NOT NULL CHECK(tag in('y', 'n')),-- 湲� �궡�슜�뿉 �깭洹� �뿀�슜
    thread NUMBER NOT NULL,     -- 답변형(정렬)
    depth NUMBER NOT NULL,       -- 답변형(들여쓰기)
    filename VARCHAR2(100) NULL,    -- 첨부파일명(물리명)
    orgfilename VARCHAR2(100) NULL,  -- 첨부파일명(원본명)
    downloadcount NUMBER DEFAULT 0 NULL     -- 파일 다운로드 횟수
);


-- like
CREATE TABLE tblGood (
    seq NUMBER PRIMARY KEY,
    state VARCHAR2(1) NOT NULL CHECK(state in('g', 'b')),    -- g: 좋아요, b: 싫어요
    id VARCHAR2(30) NOT NULL REFERENCES tblMember(id),
    bseq NUMBER NOT NULL REFERENCES tblBoard(seq)
);

CREATE SEQUENCE good_seq;

SELECT * FROM tblGood;

COMMIT;

SELECT(SELECT count(*) FROM tblGood WHERE bseq = ? AND state = 'g') AS good, (SELECT count(*) FROM tblGood WHERE bseq = ? AND state = 'b') AS bad FROM dual;

CREATE TABLE tblBoard (
    seq NUMBER PRIMARY KEY, -- �떆���뒪
    subject VARCHAR2(500) NOT NULL, -- 湲� �젣紐�
    content VARCHAR2(2000) NOT NULL, -- 湲��궡�슜
    id VARCHAR2(30) not null REFERENCES tblMember(id), -- �옉�꽦�옄
    regdate DATE DEFAULT sysdate NOT NULL, -- 湲��벖�떆媛�
    readcount NUMBER DEFAULT 0 NOT NULL, -- 議고쉶�닔
    tag VARCHAR2(1) NOT NULL CHECK(tag in('y', 'n')),-- 湲� �궡�슜�뿉 �깭洹� �뿀�슜
    thread NUMBER NOT NULL,     -- 답변형(정렬)
    depth NUMBER NOT NULL,       -- 답변형(들여쓰기)
    filename VARCHAR2(100) NULL,    -- 첨부파일명(물리명)
    orgfilename VARCHAR2(100) NULL,  -- 첨부파일명(원본명)
    downloadcount NUMBER DEFAULT 0 NULL,     -- 파일 다운로드 횟수
    notice VARCHAR2(1) NOT NULL CHECK(notice in ('1', '0'))
);

DROP TABLE tblBoard CASCADE CONSTRAINTS;

SELECT * FROM tblBoard;
SELECT * FROM tblComment;
SELECT * FROM tblGood;

-- 첫 페이지에만 공지사항을 띄울때
SELECT * FROM tblBoard ORDER BY notice DESC, thread DESC;

SELECT * FROM (
SELECT * FROM tblBoard WHERE notice = 1
UNION
SELECT * FROM tblBoard WHERE notice = 0) ORDER BY notice DESC, thread DESC;

-- 해시태그 테이블
CREATE TABLE tblHashTag (
    seq NUMBER PRIMARY KEY,                             -- PK
    tag VARCHAR2(100) NOT NULL,                         -- 해시태그
    bseq NUMBER NOT NULL REFERENCES tblBoard(seq)       -- 글번호
);

CREATE SEQUENCE hashtag_seq;

SELECT * FROM tblHashTag;

SELECT * FROM tblBoard WHERE seq IN (SELECT b.seq, t.tag FROM tblBoard b INNER JOIN tblHashTag t ON b.seq = t.bseq GROUP BY b.seq);

CREATE TABLE tblBoard (
    seq NUMBER PRIMARY KEY, -- �떆���뒪
    subject VARCHAR2(500) NOT NULL, -- 湲� �젣紐�
    content VARCHAR2(2000) NOT NULL, -- 湲��궡�슜
    id VARCHAR2(30) not null REFERENCES tblMember(id), -- �옉�꽦�옄
    regdate DATE DEFAULT sysdate NOT NULL, -- 湲��벖�떆媛�
    readcount NUMBER DEFAULT 0 NOT NULL, -- 議고쉶�닔
    tag VARCHAR2(1) NOT NULL CHECK(tag in('y', 'n')),-- 湲� �궡�슜�뿉 �깭洹� �뿀�슜
    thread NUMBER NOT NULL,     -- 답변형(정렬)
    depth NUMBER NOT NULL,       -- 답변형(들여쓰기)
    filename VARCHAR2(100) NULL,    -- 첨부파일명(물리명)
    orgfilename VARCHAR2(100) NULL,  -- 첨부파일명(원본명)
    downloadcount NUMBER DEFAULT 0 NULL,     -- 파일 다운로드 횟수
    notice VARCHAR2(1) NOT NULL CHECK(notice in ('1', '0')),
    secret VARCHAR2(1) NOT NULL check(secret in('1', '0'))
);

DROP TABLE tblBoard CASCADE CONSTRAINT;

SELECT * FROM tblBoard;
SELECT * FROM tblHashTag;
SELECT * FROM tblComment;
SELECT * FROM tblBoard;


CREATE TABLE tblBoard (
    seq NUMBER PRIMARY KEY, -- �떆���뒪
    subject VARCHAR2(500) NOT NULL, -- 湲� �젣紐�
    content VARCHAR2(2000) NOT NULL, -- 湲��궡�슜
    id VARCHAR2(30) not null REFERENCES tblMember(id), -- �옉�꽦�옄
    regdate DATE DEFAULT sysdate NOT NULL, -- 湲��벖�떆媛�
    readcount NUMBER DEFAULT 0 NOT NULL, -- 議고쉶�닔
    tag VARCHAR2(1) NOT NULL CHECK(tag in('y', 'n')),-- 湲� �궡�슜�뿉 �깭洹� �뿀�슜
    thread NUMBER NOT NULL,     -- 답변형(정렬)
    depth NUMBER NOT NULL,       -- 답변형(들여쓰기)
    filename VARCHAR2(100) NULL,    -- 첨부파일명(물리명)
    orgfilename VARCHAR2(100) NULL,  -- 첨부파일명(원본명)
    downloadcount NUMBER DEFAULT 0 NULL,     -- 파일 다운로드 횟수
    notice VARCHAR2(1) NOT NULL CHECK(notice in ('1', '0')),
    secret VARCHAR2(1) NOT NULL check(secret in('1', '0')),
    movie VARCHAR2(100) NULL
);


-- 전체 회원수
SELECT count(*) FROM tblMember;

-- 전체 게시물 수
SELECT count(*) FROM tblBoard;

-- 전체 댓글 수
SELECT count(*) FROM tblComment;

-- 미디어 수(첨부 이미지, 첨부 동영상)
SELECT count(filename) + count(movie) FROM tblBoard;

-- 회원별 게시물 카운트
SELECT cnt FROM (SELECT count(*) AS cnt, (SELECT name FROM tblMember WHERE id = b.id) AS name FROM tblBoard b GROUP BY id) ORDER BY name ASC;

SELECT count(b.seq) FROM tblMember m LEFT OUTER JOIN tblBoard b ON m.id = b.id GROUP BY m.name ORDER BY m.name;

-- 회원별 댓글 카운트
SELECT cnt FROM (SELECT count(*) AS cnt, (SELECT name FROM tblMember WHERE id = b.id) AS name FROM tblComment b GROUP BY id) ORDER BY name ASC;

SELECT count(b.seq) FROM tblMember m LEFT OUTER JOIN tblComment b ON m.id = b.id GROUP BY m.name ORDER BY m.name;


CREATE TABLE tblResearch (
    seq NUMBER PRIMARY KEY,
    question VARCHAR2(500) NOT NULL,
    answer1 VARCHAR2(100),
    answer2 VARCHAR2(100),
    answer3 VARCHAR2(100),
    answer4 VARCHAR2(100),
    cnt1 NUMBER,
    cnt2 NUMBER,
    cnt3 NUMBER,
    cnt4 NUMBER
);

INSERT INTO tblResearch VALUES (1, 'test1', 'test2', 'test3', 'test4', 1, 2, 3, 4);