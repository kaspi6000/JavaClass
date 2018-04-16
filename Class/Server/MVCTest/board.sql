-- MVCTest > board.sql

DROP TABLE tblBoard CASCADE CONSTRAINTS;

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