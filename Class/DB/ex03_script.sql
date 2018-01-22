-- Hello ���̺�
DROP TABLE tblhello;

CREATE TABLE tblhello
(
	name varchar2(30) not null,
	age number not null,
	tel varchar2(30) not null,
	address varchar2(100) not null
);

INSERT INTO tblhello VALUES ('ȫ�浿', 20, '010-1234-5678', '����� ������ ���ﵿ');

COMMIT;











-- ���� ���̺�
DROP TABLE tblcountry;

CREATE TABLE tblcountry
(
	name VARCHAR2(30) NOT NULL PRIMARY KEY, -- ������
	capital VARCHAR2(30) NULL, -- ����
	population NUMBER NULL, -- �α���
	continent VARCHAR2(2) NULL, -- ���(AS, NA, SA..)
	area NUMBER NULL -- ����
);

INSERT INTO tblCountry VALUES ('���ѹα�','����',4405,'AS',10);
INSERT INTO tblCountry VALUES ('�߱�','����¡',120660,'AS',959);
INSERT INTO tblCountry VALUES ('�Ϻ�','����',12461,'AS',37);
INSERT INTO tblCountry VALUES ('�̱�','������',24963,'SA',936);
INSERT INTO tblCountry VALUES ('����','London',5741,'EU',24);
INSERT INTO tblCountry VALUES ('����Ʈ','ī�̷�',5969,'AF',99);
INSERT INTO tblCountry VALUES ('����Ʈ���ϸ���','Canberra',1787,'AU',768);
INSERT INTO tblCountry VALUES ('ĥ��','��Ƽ�ư�',1339,'SA',75);
INSERT INTO tblCountry VALUES ('������','���׺���',317,'SA',17);
INSERT INTO tblCountry VALUES ('�Ƹ���Ƽ��','�ο��뽺���̷���',3388,'SA',278);
INSERT INTO tblCountry VALUES ('�ε��׽þ�','��ī��Ÿ',19134,'AS',191);
INSERT INTO tblCountry VALUES ('�״�����','�Ͻ��׸���',1476,'EU',4);
INSERT INTO tblCountry VALUES ('�ɳ�','���̷κ�',NULL,'AF',58);
INSERT INTO tblCountry VALUES ('���⿡2','���',1012,'EU',3);

COMMIT;









-- �ڷ��� ���̺�
DROP TABLE tbltype;

CREATE TABLE tbltype
(
	txt1 VARCHAR2(30) NOT NULL,	--���ڿ�(����)
	txt2 VARCHAR2(30) NOT NULL,  --���ڿ�(����)
	num1 NUMBER NOT NULL, --����
	date1 DATE NOT NULL, --��¥
	date2 VARCHAR2(50) NOT NULL, --��¥
	txt3 CHAR(30) NOT NULL,
	txt4 VARCHAR2(30) NOT NULL
);

INSERT INTO tbltype values ('ȫ�浿', '100', 123, to_date('2018-01-01', 'yyyy-mm-dd'), '2018-01-01', '�ϳ��Ѽ�', '�ϳ��Ѽ�');

COMMIT;











-- �̸� ���̺�
DROP TABLE TBLNAME;

CREATE TABLE TBLNAME
(
	first varchar2(20) not null,
	last varchar2(20) not null,
	gender varchar2(1) check(gender in ('m', 'f')) not null,
	height number not null,
	weight number not null,
	nick varchar2(50) not null
);

INSERT INTO TBLNAME VALUES ('�缮', '��', 'm', 178, 64, '�޶ѱ�');
INSERT INTO TBLNAME VALUES ('���', '��', 'm', 172, 66, '������');
INSERT INTO TBLNAME VALUES ('����', '��', 'm', 184, 89, '���߾�');
INSERT INTO TBLNAME VALUES ('����', '��', 'm', 169, 65, '�󲿸�');
INSERT INTO TBLNAME VALUES ('����', '��', 'm', 173, 85, '��������');
INSERT INTO TBLNAME VALUES ('����', '��', 'f', 148, 58, '�ڰ���');
INSERT INTO TBLNAME VALUES ('����', '��', 'f', 167, 92, '���¿�');
INSERT INTO TBLNAME VALUES ('��ȣ', '��', 'm', 167, 82, '���� ��﷯');
INSERT INTO TBLNAME VALUES ('����', '��', 'm', 182, 113, '�����');
INSERT INTO TBLNAME VALUES ('�λ�', '��', 'm', 183, 129, '�̽ʳ�');

COMMIT;






-- �޿� ���̺�
DROP TABLE tblsalary;

CREATE TABLE tblsalary
(
	name varchar2(30) not null,
	m1 number not null,
	m2 number not null,
	m3 number not null,
	m4 number not null,
	m5 number not null,
	m6 number not null,
	m7 number not null,
	m8 number not null,
	m9 number not null,
	m10 number not null,
	m11 number not null,
	m12 number not null
);

INSERT INTO tblsalary VALUES ('ȫ�浿', 200, 220, 200, 210, 190, 180, 190, 200, 200, 220, 240, 250);
INSERT INTO tblsalary VALUES ('�ƹ���', 150, 160, 160, 150, 160, 180, 190, 170, 160, 150, 170, 190);
INSERT INTO tblsalary VALUES ('�׽�Ʈ', 220, 230, 250, 220, 220, 230, 250, 230, 220, 250, 260, 240);
INSERT INTO tblsalary VALUES ('ȣȣȣ', 260, 280, 260, 250, 290, 280, 290, 260, 290, 250, 280, 260);
INSERT INTO tblsalary VALUES ('����', 110, 120, 100, 110, 190, 180, 190, 100, 100, 120, 140, 150);

COMMIT;

SELECT * FROM tblsalary;







-- �λ� ���̺�

DROP TABLE tblinsa;

CREATE TABLE tblinsa(
        num NUMBER(5) NOT NULL CONSTRAINT tblinsa_pk PRIMARY KEY
       ,name VARCHAR2(20) NOT NULL
       ,ssn  VARCHAR2(14) NOT NULL
       ,ibsaDate DATE     NOT NULL
       ,city  VARCHAR2(10)
       ,tel   VARCHAR2(15)
       ,buseo VARCHAR2(15) NOT NULL
       ,jikwi VARCHAR2(15) NOT NULL
       ,basicPay NUMBER(10) NOT NULL
       ,sudang NUMBER(10) NOT NULL
);

INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1001, 'ȫ�浿', '771212-1022432', '1998-10-11', '����', '011-2356-4528', '��ȹ��',
   '����', 2610000, 200000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1002, '�̼���', '801007-1544236', '2000-11-29', '���', '010-4758-6532', '�ѹ���',
   '���', 1320000, 200000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1003, '�̼���', '770922-2312547', '1999-02-25', '��õ', '010-4231-1236', '���ߺ�',
   '����', 2550000, 160000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1004, '������', '790304-1788896', '2000-10-01', '����', '019-5236-4221', '������',
   '�븮', 1954200, 170000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1005, '�Ѽ���', '811112-1566789', '2004-08-13', '����', '018-5211-3542', '�ѹ���',
   '���', 1420000, 160000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1006, '�̱���', '780505-2978541', '2002-02-11', '��õ', '010-3214-5357', '���ߺ�',
   '����', 2265000, 150000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1007, '����ö', '780506-1625148', '1998-03-16', '����', '011-2345-2525', '���ߺ�',
   '�븮', 1250000, 150000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1008, '�迵��', '821011-2362514', '2002-04-30', '����', '016-2222-4444', 'ȫ����',
'���', 950000 , 145000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1009, '������', '810810-1552147', '2003-10-10', '���', '019-1111-2222', '�λ��',
   '���', 840000 , 220400);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1010, '������', '751010-1122233', '1997-08-08', '�λ�', '011-3214-5555', '������',
   '����', 2540000, 130000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1011, '������', '801010-2987897', '2000-07-07', '����', '010-8888-4422', '������',
   '���', 1020000, 140000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1012, '���ѱ�', '760909-1333333', '1999-10-16', '����', '018-2222-4242', 'ȫ����',
   '���', 880000 , 114000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1013, '���̼�', '790102-2777777', '1998-06-07', '���', '019-6666-4444', 'ȫ����',
   '�븮', 1601000, 103000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1014, 'Ȳ����', '810707-2574812', '2002-02-15', '��õ', '010-3214-5467', '���ߺ�',
   '���', 1100000, 130000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1015, '������', '800606-2954687', '1999-07-26', '���', '016-2548-3365', '�ѹ���',
   '���', 1050000, 104000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1016, '�̻���', '781010-1666678', '2001-11-29', '���', '010-4526-1234', '���ߺ�',
   '����', 2350000, 150000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1017, '�����', '820507-1452365', '2000-08-28', '��õ', '010-3254-2542', '���ߺ�',
   '���', 950000 , 210000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1018, '�̼���', '801028-1849534', '2004-08-08', '����', '018-1333-3333', '���ߺ�',
   '���', 880000 , 123000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1019, '�ڹ���', '780710-1985632', '1999-12-10', '����', '017-4747-4848', '�λ��',
   '����', 2300000, 165000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1020, '������', '800304-2741258', '2003-10-10', '����', '011-9595-8585', '�����',
   '���', 880000 , 140000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1021, 'ȫ�泲', '801010-1111111', '2001-09-07', '���', '011-9999-7575', '���ߺ�',
   '���', 875000 , 120000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1022, '�̿���', '800501-2312456', '2003-02-25', '����', '017-5214-5282', '��ȹ��',
   '�븮', 1960000, 180000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1023, '���μ�', '731211-1214576', '1995-02-23', '����', NULL           , '������',
   '����', 2500000, 170000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1024, '�踻��', '830225-2633334', '1999-08-28', '����', '011-5248-7789', '��ȹ��',
   '�븮', 1900000, 170000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1025, '�����', '801103-1654442', '2000-10-01', '����', '010-4563-2587', '������',
   '���', 1100000, 160000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1026, '�����', '810907-2015457', '2002-08-28', '���', '010-2112-5225', '������',
   '���', 1050000, 150000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1027, '�迵��', '801216-1898752', '2000-10-18', '����', '019-8523-1478', '�ѹ���',
   '����', 2340000, 170000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1028, '�̳���', '810101-1010101', '2001-09-07', '����', '016-1818-4848', '�λ��',
   '���', 892000 , 110000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1029, '�踻��', '800301-2020202', '2000-09-08', '����', '016-3535-3636', '�ѹ���',
   '���', 920000 , 124000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1030, '������', '790210-2101010', '1999-10-17', '�λ�', '019-6564-6752', '�ѹ���',
   '����', 2304000, 124000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1031, '����ȯ', '771115-1687988', '2001-01-21', '����', '019-5552-7511', '��ȹ��',
   '����', 2450000, 160000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1032, '�ɽ���', '810206-2222222', '2000-05-05', '����', '016-8888-7474', '�����',
   '���', 880000 , 108000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1033, '��̳�', '780505-2999999', '1998-06-07', '����', '011-2444-4444', '������',
   '���', 1020000, 104000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1034, '������', '820505-1325468', '2005-09-26', '���', '011-3697-7412', '��ȹ��',
   '���', 1100000, 160000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1035, '������', '831010-2153252', '2002-05-16', '��õ', NULL           , '���ߺ�',
   '���', 1050000, 140000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1036, '���翵', '701126-2852147', '2003-08-10', '����', '011-9999-9999', '�����',
   '���', 960400 , 190000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1037, '�ּ���', '770129-1456987', '1998-10-15', '��õ', '011-7777-7777', 'ȫ����',
   '����', 2350000, 187000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1038, '���μ�', '791009-2321456', '1999-11-15', '�λ�', '010-6542-7412', '������',
   '�븮', 2000000, 150000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1039, '�����', '800504-2000032', '2003-12-28', '���', '010-2587-7895', '������',
   '�븮', 2010000, 160000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1040, '�ڼ���', '790509-1635214', '2000-09-10', '���', '016-4444-7777', '�λ��',
   '�븮', 2100000, 130000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1041, '�����', '721217-1951357', '2001-12-10', '�泲', '016-4444-5555', '�����',
   '����', 2300000, 150000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1042, 'ä����', '810709-2000054', '2003-10-17', '���', '011-5125-5511', '���ߺ�',
   '���', 1020000, 200000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1043, '��̿�', '830504-2471523', '2003-09-24', '����', '016-8548-6547', '������',
   '���', 1100000, 210000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1044, '����ȯ', '820305-1475286', '2004-01-21', '����', '011-5555-7548', '������',
   '���', 1060000, 220000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1045, 'ȫ����', '690906-1985214', '2003-03-16', '����', '011-7777-7777', '������',
   '���', 960000 , 152000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1046, '����', '760105-1458752', '1999-05-04', '�泲', '017-3333-3333', '�ѹ���',
   '����', 2650000, 150000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1047, '�긶��', '780505-1234567', '2001-07-15', '����', '018-0505-0505', '������',
   '�븮', 2100000, 112000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1048, '�̱��', '790604-1415141', '2001-06-07', '����', NULL           , '���ߺ�',
   '�븮', 2050000, 106000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1049, '�̹̼�', '830908-2456548', '2000-04-07', '��õ', '010-6654-8854', '���ߺ�',
   '���', 1300000, 130000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1050, '�̹���', '810403-2828287', '2003-06-07', '���', '011-8585-5252', 'ȫ����',
   '�븮', 1950000, 103000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1051, '�ǿ���', '790303-2155554', '2000-06-04', '����', '011-5555-7548', '������',
   '����', 2260000, 104000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1052, '�ǿ���', '820406-2000456', '2000-10-10', '���', '010-3644-5577', '��ȹ��',
   '���', 1020000, 105000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1053, '��̽�', '800715-1313131', '1999-12-12', '����', '011-7585-7474', '�����',
   '���', 960000 , 108000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1054, '����ȣ', '810705-1212141', '1999-10-16', '����', '016-1919-4242', 'ȫ����',
   '���', 980000 , 114000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1055, '���ѳ�', '820506-2425153', '2004-06-07', '����', '016-2424-4242', '������',
   '���', 1000000, 104000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1056, '������', '800605-1456987', '2004-08-13', '��õ', '010-7549-8654', '������',
   '�븮', 1950000, 200000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1057, '�̹̰�', '780406-2003214', '1998-02-11', '���', '016-6542-7546', '�����',
   '����', 2520000, 160000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1058, '�����', '800709-1321456', '2003-08-08', '��õ', '010-2415-5444', '��ȹ��',
   '�븮', 1950000, 180000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1059, '�Ӽ���', '810809-2121244', '2001-10-10', '����', '011-4151-4154', '���ߺ�',
   '���', 890000 , 102000);
INSERT INTO tblinsa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1060, '��ž�', '810809-2111111', '2001-10-10', '����', '011-4151-4444', '���ߺ�',
   '���', 900000 , 102000);

COMMIT;










-- ���̾ ���̺�
DROP TABLE tbldiary;

CREATE TABLE tbldiary
(
	seq number primary key,
	subject varchar2(500) not null,
	weather varchar2(10) not null,
	regdate date not null
);

INSERT INTO tbldiary VALUES (1, '����Ŭ�� ó������ ��ġ�ߴ�', '����', '2018-01-18');
INSERT INTO tbldiary VALUES (2, '�ڹ� ���͵� �ϴ� ��. ���ῡ ī�信�� ����', '����', '2018-01-19');
INSERT INTO tbldiary VALUES (3, '������ ���µ� ��� ������ �𸣰ڴ�;;', '�帲', '2018-01-20');
INSERT INTO tbldiary VALUES (4, '��ȭ���� ���ٰ� �ڴٿԴ�.', '�帲', '2018-01-22');
INSERT INTO tbldiary VALUES (5, '����ŷ�� ���� ���� �Ծ���.', '����', '2018-01-18');
INSERT INTO tbldiary VALUES (6, '��ü�� ���콺�� Ű���� �ٲ۳�~', '��', '2018-01-18');
INSERT INTO tbldiary VALUES (7, 'ó������ �ڵ��ϸ� ����!!', '����', '2018-01-20');
INSERT INTO tbldiary VALUES (8, '���� ���ϰ� ����� ������..', '����', '2018-01-25');
INSERT INTO tbldiary VALUES (9, '�ճ��� �������� ����� �����ߴ�.', '��', '2018-01-26');
INSERT INTO tbldiary VALUES (10, '�� ������ �� ������ �Ⱥ��ϱ�?', '�帲', '2018-01-28');

COMMIT;






-- ���� ��� ���̺�
DROP TABLE tblhousekeeping;

CREATE TABLE tblhousekeeping
(
	seq number primary key,
	item varchar2(50) not null,
	price number not null,
	qty number not null,
	buydate date not null,
	memo varchar2(1000) null
);



INSERT INTO tblhousekeeping VALUES (1, '�縻', 2000, 5, '2018-01-05', null);
INSERT INTO tblhousekeeping VALUES (2, 'Ƽ����', 5000, 1, '2018-01-06', null);
INSERT INTO tblhousekeeping VALUES (3, '������Ʈ', 10000, 4, '2018-01-07', null);
INSERT INTO tblhousekeeping VALUES (4, '��', 3000, 2, '2018-01-08', null);
INSERT INTO tblhousekeeping VALUES (5, '����', 1000, 10, '2018-01-09', null);
INSERT INTO tblhousekeeping VALUES (6, '����', 5000, 1, '2018-01-09', null);
INSERT INTO tblhousekeeping VALUES (7, '��Į', 15000, 1, '2018-01-10', null);
INSERT INTO tblhousekeeping VALUES (8, '��������', 1000, 5, '2018-01-10', null);
INSERT INTO tblhousekeeping VALUES (9, '������', 100, 100, '2018-01-10', null);
INSERT INTO tblhousekeeping VALUES (10, '��Ƽ��', 1000, 50, '2018-01-13', null);
INSERT INTO tblhousekeeping VALUES (11, '������', 1000, 20, '2018-01-15', null);
INSERT INTO tblhousekeeping VALUES (12, '��Ʈ', 1400, 5, '2018-01-18', null);
INSERT INTO tblhousekeeping VALUES (13, '�̾��ð�', 10, 3000, '2018-01-18', null);
INSERT INTO tblhousekeeping VALUES (14, '�������', 3000, 1, '2018-01-19', null);
INSERT INTO tblhousekeeping VALUES (15, '����', 9000, 2, '2018-01-19', null);
INSERT INTO tblhousekeeping VALUES (16, '�����ħ��', 3000, 2, '2018-01-20', null);
INSERT INTO tblhousekeeping VALUES (17, '������', 8000, 3, '2018-01-20', null);
INSERT INTO tblhousekeeping VALUES (18, 'ġ��', 4000, 4, '2018-01-21', null);
INSERT INTO tblhousekeeping VALUES (19, 'ĩ��', 1700, 9, '2018-01-21', null);
INSERT INTO tblhousekeeping VALUES (20, '��', 2500, 6, '2018-01-21', null);

COMMIT;









-- ���� ���� ���̺�
DROP TABLE tblmen;
DROP TABLE tblwomen;


CREATE TABLE tblmen
(
	name varchar2(30) primary key,
	age number not null,
	height number null,
	weight number null,
	couple varchar2(30) null
);

CREATE TABLE tblwomen
(
	name varchar2(30) primary key,
	age number not null,
	height number null,
	weight number null,
	couple varchar2(30) null
);


INSERT INTO tblmen VALUES ('ȫ�浿', 25, 180, 70, '�嵵��');
INSERT INTO tblmen VALUES ('�ƹ���', 22, 175, NULL, '�̼���');
INSERT INTO tblmen VALUES ('������', 27, NULL, 80, NULL);
INSERT INTO tblmen VALUES ('����', 21, 177, 72, NULL);
INSERT INTO tblmen VALUES ('���缮', 29, NULL, NULL, '���');
INSERT INTO tblmen VALUES ('�ڸ��', 30, 170, NULL, '������');
INSERT INTO tblmen VALUES ('������', 31, 183, NULL, '�ź���');
INSERT INTO tblmen VALUES ('������', 28, NULL, 92, NULL);
INSERT INTO tblmen VALUES ('�缼��', 22, 166, 55, '��ΰ�');
INSERT INTO tblmen VALUES ('����ȣ', 24, 165, 58, '������');

INSERT INTO tblwomen VALUES ('�ڳ���', 23, 150, 55, NULL);
INSERT INTO tblwomen VALUES ('�嵵��', 28, 177, 65, 'ȫ�浿');
INSERT INTO tblwomen VALUES ('������', 30, 160, NULL, '�ڸ��');
INSERT INTO tblwomen VALUES ('���', 34, 158, NULL, '���缮');
INSERT INTO tblwomen VALUES ('������', 27, NULL, NULL, '����ȣ');
INSERT INTO tblwomen VALUES ('��ΰ�', 22, 169, 88, '�缼��');
INSERT INTO tblwomen VALUES ('ȫ����', 20, 158, 75, NULL);
INSERT INTO tblwomen VALUES ('�ź���', 26, 170, 60, '������');
INSERT INTO tblwomen VALUES ('�̼���', 28, 163, NULL, '�ƹ���');
INSERT INTO tblwomen VALUES ('�ź���', 27, 162, NULL, NULL);


COMMIT;









-- ���� ���̺�
DROP TABLE tbltodo;

CREATE TABLE tbltodo
(
	seq number primary key,
	title varchar2(200) not null,
	adddate date not null,
	completedate date null
);

INSERT INTO tbltodo VALUES (1, '���� ��ȹ �����', to_date('2018-01-01 06:00:00', 'yyyy-mm-dd hh24:mi:ss'), to_date('2018-01-01 18:30:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO tbltodo VALUES (2, '��Ʈ �庸��', to_date('2018-01-03 13:00:00', 'yyyy-mm-dd hh24:mi:ss'), to_date('2018-01-04 20:28:30', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO tbltodo VALUES (3, '�ڹ� �ܼ� ������Ʈ �������', to_date('2018-01-11 14:22:24', 'yyyy-mm-dd hh24:mi:ss'), to_date('2018-01-11 17:32:54', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO tbltodo VALUES (4, '���� û���ϱ�', to_date('2018-01-08 22:00:00', 'yyyy-mm-dd hh24:mi:ss'), NULL);
INSERT INTO tbltodo VALUES (5, '������ ��å��Ű��', to_date('2018-01-07 10:11:34', 'yyyy-mm-dd hh24:mi:ss'), NULL);
INSERT INTO tbltodo VALUES (6, '���̾�Ʈ �����ϱ�', to_date('2018-01-01 12:53:20', 'yyyy-mm-dd hh24:mi:ss'), NULL);
INSERT INTO tbltodo VALUES (7, '�����ͺ��̽� å �뿩�ϱ�', to_date('2018-01-02 11:34:52', 'yyyy-mm-dd hh24:mi:ss'), to_date('2018-01-15 12:10:15', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO tbltodo VALUES (8, '��Ʈ�� �����ϱ�', to_date('2018-01-02 19:32:12', 'yyyy-mm-dd hh24:mi:ss'), to_date('2018-01-02 19:50:22', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO tbltodo VALUES (9, 'ġ�� �����ϱ�', to_date('2018-01-04 11:22:33', 'yyyy-mm-dd hh24:mi:ss'), to_date('2018-01-08 12:32:02', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO tbltodo VALUES (10, '�Ƹ������� Ű���� �����ϱ�', to_date('2018-01-08 09:21:11', 'yyyy-mm-dd hh24:mi:ss'), NULL);
INSERT INTO tbltodo VALUES (11, '��Ÿ���� ���̾ �����ϱ�', to_date('2018-01-02 17:23:43', 'yyyy-mm-dd hh24:mi:ss'), to_date('2018-01-03 15:43:21', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO tbltodo VALUES (12, '�����ϱ�', to_date('2018-01-09 23:33:23', 'yyyy-mm-dd hh24:mi:ss'), to_date('2018-01-12 15:48:52', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO tbltodo VALUES (13, 'ģ������ ��ȭ�ϱ�', to_date('2018-01-09 14:42:21', 'yyyy-mm-dd hh24:mi:ss'), to_date('2018-01-09 15:32:34', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO tbltodo VALUES (14, '����� Ƽ�� �����ϱ�', to_date('2018-01-06 12:23:53', 'yyyy-mm-dd hh24:mi:ss'), to_date('2018-01-11 09:46:22', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO tbltodo VALUES (15, '�Ƹ�����Ʈ ��༭ �ۼ��ϱ�', to_date('2018-01-12 12:30:23', 'yyyy-mm-dd hh24:mi:ss'), to_date('2018-01-12 15:32:45', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO tbltodo VALUES (16, '���� �����ϱ�', to_date('2018-01-10 15:03:21', 'yyyy-mm-dd hh24:mi:ss'), NULL);
INSERT INTO tbltodo VALUES (17, 'AS ���� �湮�ϱ�', to_date('2018-01-11 22:44:22', 'yyyy-mm-dd hh24:mi:ss'), to_date('2018-01-12 16:30:52', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO tbltodo VALUES (18, '���͵� �׷� ¥��', to_date('2018-01-03 22:10:20', 'yyyy-mm-dd hh24:mi:ss'), NULL);
INSERT INTO tbltodo VALUES (19, '���� ���� �����ϱ�', to_date('2018-01-06 21:21:02', 'yyyy-mm-dd hh24:mi:ss'), NULL);
INSERT INTO tbltodo VALUES (20, '�ｺ ����ϱ�', to_date('2018-01-05 19:24:42', 'yyyy-mm-dd hh24:mi:ss'), NULL);

COMMIT;