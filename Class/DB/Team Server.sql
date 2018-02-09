SELECT * FROM tabs;

SELECT * FROM tbl_test;

SELECT * FROM tbl_test_record;

SELECT * FROM tbl_subject;

CREATE SEQUENCE test_seq;
CREATE SEQUENCE test_record_seq;
CREATE SEQUENCE subject_seq;

INSERT INTO tbl_test(seq, test_type, test_date) VALUES(test_seq.nextval, '필기', '2018-02-22');
INSERT INTO tbl_test(seq, test_type, test_date) VALUES(test_seq.nextval, '실기', '2018-03-12');


SELECT * FROM tbl_textbook;
SELECT * FROM tbl_course;

INSERT INTO tbl_subject(seq, name, start_date, end_date, written, performance, cseq, tseq) VALUES(subject_seq.nextval, '자바', '2017-11-27', '2018-01-03', NULL, NULL, 1, 1);

INSERT INTO tbl_subject(seq, name, start_date, end_date, written, performance, cseq, tseq) VALUES(subject_seq.nextval, '오라클', '2018-01-11', '2018-01-31', NULL, NULL, 1, 6);
INSERT INTO tbl_subject(seq, name, start_date, end_date, written, performance, cseq, tseq) VALUES(subject_seq.nextval, 'JDBC', '2018-02-05', '2018-02-16', NULL, NULL, 1, 7);
INSERT INTO tbl_subject(seq, name, start_date, end_date, written, performance, cseq, tseq) VALUES(subject_seq.nextval, 'JSP', '2018-03-01', '2018-04-13', NULL, NULL, 1, 7);
INSERT INTO tbl_subject(seq, name, start_date, end_date, written, performance, cseq, tseq) VALUES(subject_seq.nextval, 'SPRING', '2018-04-23', '2018-05-14', NULL, NULL, 1, 17);
INSERT INTO tbl_subject(seq, name, start_date, end_date, written, performance, cseq, tseq) VALUES(subject_seq.nextval, '웹디자인', '2017-10-25', '2017-12-4', NULL, NULL, 2, 23);
INSERT INTO tbl_subject(seq, name, start_date, end_date, written, performance, cseq, tseq) VALUES(subject_seq.nextval, 'HTML+CSS', '2017-11-02', '2017-12-11', NULL, NULL, 3, 18);
INSERT INTO tbl_subject(seq, name, start_date, end_date, written, performance, cseq, tseq) VALUES(subject_seq.nextval, '자바', '2017-09-27', '2017-11-20', NULL, NULL, 4, 2);
INSERT INTO tbl_subject(seq, name, start_date, end_date, written, performance, cseq, tseq) VALUES(subject_seq.nextval, 'PL/SQL', '2018-01-11', '2018-01-31', NULL, NULL, 5, 6);
INSERT INTO tbl_subject(seq, name, start_date, end_date, written, performance, cseq, tseq) VALUES(subject_seq.nextval, '컴퓨터개론', '2017-07-16', '2017-08-17', NULL, NULL, 6, 25);
INSERT INTO tbl_subject(seq, name, start_date, end_date, written, performance, cseq, tseq) VALUES(subject_seq.nextval, '자바', '2016-11-27', '2017-01-03', NULL, NULL, 7, 1);
INSERT INTO tbl_subject(seq, name, start_date, end_date, written, performance, cseq, tseq) VALUES(subject_seq.nextval, '웹디자인', '2016-10-25', '2016-12-03', NULL, NULL, 8, 23);
INSERT INTO tbl_subject(seq, name, start_date, end_date, written, performance, cseq, tseq) VALUES(subject_seq.nextval, 'HTML+CSS', '2016-11-02', '2016-12-12', NULL, NULL, 9, 18);
INSERT INTO tbl_subject(seq, name, start_date, end_date, written, performance, cseq, tseq) VALUES(subject_seq.nextval, '자바', '2016-09-27', '2016-11-12', NULL, NULL, 10, 2);
INSERT INTO tbl_subject(seq, name, start_date, end_date, written, performance, cseq, tseq) VALUES(subject_seq.nextval, 'PL/SQL', '2016-01-12', '2016-02-06', NULL, NULL, 11, 6);
INSERT INTO tbl_subject(seq, name, start_date, end_date, written, performance, cseq, tseq) VALUES(subject_seq.nextval, '컴퓨터개론', '2016-07-16', '2016-08-12', NULL, NULL, 12, 25);

SELECT * FROM tbl_subject;
SELECT * FROM tbl_test;

INSERT INTO tbl_test_record(seq, sseq, tseq) VALUES(test_record_seq.nextval, 1, 1);
INSERT INTO tbl_test_record(seq, sseq, tseq) VALUES(test_record_seq.nextval, 1, 2);

SELECT * FROM tbl_test_record;
COMMIT;

SELECT * FROM tbl_course;
-------------------------------------------------------------------------------------------------------------------------
--12
CREATE OR REPLACE PROCEDURE proc_addcourse(
    pname VARCHAR2,
    pstart DATE,
    pend DATE,
    ppopulation NUMBER,
    prseq NUMBER
)
IS
BEGIN
    INSERT INTO tbl_course(seq, name, start_date, end_date, population, rseq) VALUES(course_seq.nextval, pname, pstart, pend, ppopulation, prseq);
END;

SELECT * FROM tbl_subject;
SELECT * FROM tbl_classroom;
SELECT * FROM tbl_course;

--13
CREATE OR REPLACE PROCEDURE proc_view_subject
IS
BEGIN
    SELECT s.name AS subjectName, c.start_date || ' ~ ' || c.end_date AS subjectDate, r.name AS roomName, c.population AS coursePopulation FROM tbl_subject s INNER JOIN tbl_course c ON s.cseq = c.seq INNER JOIN tbl_classroom r ON r.seq = c.rseq;
END;

SELECT t.name, substr(t.ssn, 8), t.tel, t.register_date, d.result FROM tbl_subject s INNER JOIN tbl_score c ON s.seq = c.sseq INNER JOIN tbl_lecture_record r ON r.seq = c.lseq INNER JOIN tbl_student t ON t.seq = r.sseq INNER JOIN tbl_complete_record d ON r.seq = d.seq;

--14
SELECT * FROM tbl_course;
CREATE OR REPLACE PROCEDURE proc_mod_course(
    pname VARCHAR2,
    pstart VARCHAR2,
    pend VARCHAR2,
    ppopulation VARCHAR2
)
IS
BEGIN
    UPDATE tbl_course SET name = pname, start_date = pstart, end_date = pend, population = ppopulation;
END;

--15
CREATE OR REPLACE PROCEDURE proc_deletecourse(pseq NUMBER)
IS
BEGIN
    DELETE FROM tbl_course WHERE seq = pseq;
END;

--16
CREATE OR REPLACE PROCEDURE proc_completioncourse
IS
BEGIN
    DELETE FROM tbl_course WHERE sysdate >= end_date;
END;

-- 17
-- 하나의 개설 과정에 여러 개의 개설 과목을 종속적으로 등록할 수 있어야 한다.
-- 개설 과목 입력 메뉴를 선택한다.
-- 과목명, 과목기간(시작 년월일, 끝 년월일), 교재명, 교사명을 입력한다.
-- 교재명은 기초 정보 교재명을 이용에서 선택하여 등록한다.
-- 교사명은 교사 명단에서 선택하여 등록한다.
-- 교사 명단은 현재 과목과 강의 가능 과목이 같은 경우만 리스트에 출력한다.
-- 모든 정보 입력시 데이터베이스에 저장한다.

SELECT * FROM tbl_course;
SELECT * FROM tbl_subject;
SELECT * FROM tbl_textbook;
SELECT * FROM tbl_teacher;

CREATE OR REPLACE PROCEDURE proc_add_subject(
    pcourseName VARCHAR2,
    pcourseDate VARCHAR2,
    pbookName VARCHAR2,
    pteacherName VARCHAR2
)
IS
BEGIN
    INSERT INTO tbl_course() VALUES
    SELECT s.name AS courseName, s.start_date || ' ~ ' || s.end_date AS courseDate, t.name AS bookName, c.name AS teacherName FROM tbl_subject s INNER JOIN tbl_textbook t ON t.seq = s.tseq INNER JOIN tbl_able a ON s.seq = a.sseq INNER JOIN tbl_teacher c ON c.seq = a.tseq;
    SELECT * FROM tbl_subject s INNER JOIN tbl_textbook t ON t.seq = s.tseq INNER JOIN tbl_able a ON s.seq = a.sseq INNER JOIN tbl_teacher c ON c.seq = a.tseq;
END;

--18.
-- 개설 과목 출력 메뉴를 선택한다.
-- 개설 과정 정보인 과정명, 과정 기간(시작 년월일, 끝 년월일), 강의실정보와 개설 과목 정보인 과목명, 과목기간(시작 년월일, 끝 년월일), 교재명, 교사명을 출력한다.

CREATE OR REPLACE PROCEDURE proc_view_subject
IS
BEGIN
    SELECT c.name AS courseName, c.start_date || ' ~ ' || c.end_date AS courseDate, r.name AS roomName, r.limit AS roomLimit, s.name AS subjectName, s.start_date || ' ~ ' || s.end_date, b.name AS bookName, t.name AS teacherName FROM tbl_subject s INNER JOIN tbl_course c ON c.seq = s.cseq INNER JOIN tbl_classroom r ON r.seq = c.rseq INNER JOIN tbl_textbook b ON b.seq = s.tseq INNER JOIN tbl_able a ON s.seq = a.sseq INNER JOIN tbl_teacher t ON t.seq = a.tseq;
END;
-- s, c, r, b, a, t

--19
-- 개설 과목 수정 메뉴를 선택한다.
-- 개설 과목 정보 리스트가 출력된다.
-- 수정하고 싶은 정보를 선택한다.
-- 새로운 정보를 입력한다.
-- 확인 시, 수정된 정보가 데이터베이스에 저장된다.
CREATE OR REPLACE PROCEDURE proc_mod_subject(
    pname VARCHAR2,
    pstart VARCHAR2,
    pend VARCHAR2,
    pwritten VARCHAR2,
    pperformance VARCHAR2
)
IS
BEGIN
    UPDATE tbl_subject SET name = pname, start_date = pstart, end_date = pend, written = pwritten, performance = pperformance;
END;