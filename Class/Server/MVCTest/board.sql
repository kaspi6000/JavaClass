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