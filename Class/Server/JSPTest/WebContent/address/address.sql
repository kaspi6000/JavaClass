SELECT * FROM tabs ORDER BY table_name asc;

SELECT * FROM tbladdress;

DROP TABLE tbladdress;

CREATE TABLE tbladdress (
    seq NUMBER PRIMARY KEY,
    name VARCHAR2(30) NOT NULL,
    address VARCHAR2(300) NOT NULL,
    age NUMBER NOT NULL,
    gender VARCHAR2(1) CHECK (gender in ('m', 'f')) NOT NULL,
    tel VARCHAR2(15) NOT NULL
)

DROP SEQUENCE address_seq;
CREATE SEQUENCE address_seq;

SELECT * FROM tbladdress;