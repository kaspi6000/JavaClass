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
CREATE OR REPLACE PROCEDURE proc_addcourse(pname VARCHAR2, pstart DATE, pend DATE, ppopulation NUMBER, prseq NUMBER)
IS
BEGIN
    INSERT INTO tbl_course(seq, name, start_date, end_date, population, rseq) VALUES(course_seq.nextval, pname, pstart, pend, ppopulation, prseq);
END;

SELECT * FROM tbl_subject;
SELECT * FROM tbl_classroom;
SELECT * FROM tbl_course;

--13
SELECT s.name, c.start_date || ' ~ ' || c.end_date, r.name, c.population FROM tbl_subject s INNER JOIN tbl_course c ON s.cseq = c.seq INNER JOIN tbl_classroom r ON r.seq = c.rseq;

SELECT t.name, substr(t.ssn, 8), t.tel, t.register_date, d.result FROM tbl_subject s INNER JOIN tbl_score c ON s.seq = c.sseq INNER JOIN tbl_lecture_record r ON r.seq = c.lseq INNER JOIN tbl_student t ON t.seq = r.sseq INNER JOIN tbl_complete_record d ON r.seq = d.seq;

--14
CREATE OR REPLACE PROCEDURE proc_name_modifiedcourse(pname VARCHAR2)
IS
BEGIN
    UPDATE tbl_course SET name = pname;
END;

CREATE OR REPLACE PROCEDURE proc_startdate_modifiedcourse(pstart DATE)
IS
BEGIN
    UPDATE tbl_course SET start_date = pstart;
END;

CREATE OR REPLACE PROCEDURE proc_enddate_modifiedcourse(pend DATE)
IS
BEGIN
    UPDATE tbl_course SET end_date = pend;
END;

CREATE OR REPLACE PROCEDURE proc_population_modifiedcourse(ppopulation DATE)
IS
BEGIN
    UPDATE tbl_course SET population = ppopulation;
END;

CREATE OR REPLACE PROCEDURE proc_rseq_modifiedcourse(prseq NUMBER)
IS
BEGIN
    UPDATE tbl_course SET rseq = prseq;
END;

SELECT * FROM tbl_course;
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