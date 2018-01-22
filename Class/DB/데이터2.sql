-- �� ������
insert into tblcustomer (seq, name, tel, address)
		values (1, 'ȫ�浿', '010-1234-5678', '�����');
insert into tblcustomer (seq, name, tel, address)
		values (2, '�ƹ���', '010-3333-4444', '��õ��');
insert into tblcustomer (seq, name, tel, address)
		values (3, '������', '010-5555-6666', '�λ��');


-- �Ǹ� ������
insert into tblsales (seq, item, qty, customer) values (1, '��ȭ��', 1, 1);
insert into tblsales (seq, item, qty, customer) values (2, '���̾', 3, 2);
insert into tblsales (seq, item, qty, customer) values (3, '��Ʈ', 10, 2);
insert into tblsales (seq, item, qty, customer) values (4, '����', 20, 3);
insert into tblsales (seq, item, qty, customer) values (5, '���찳', 15, 3);
insert into tblsales (seq, item, qty, customer) values (6, '���콺', 5, 1);
insert into tblsales (seq, item, qty, customer) values (7, 'Ű����', 2, 3);
insert into tblsales (seq, item, qty, customer) values (8, '�����', 1, 2);
insert into tblsales (seq, item, qty, customer) values (9, '��ǳ��', 2, 1);







-- �帣 ������
INSERT INTO tblGenre VALUES (genreSeq.NEXTVAL, '�׼�',1500,2);
INSERT INTO tblGenre VALUES (genreSeq.NEXTVAL, '����',1000,1);
INSERT INTO tblGenre VALUES (genreSeq.NEXTVAL, '���',1000,3);
INSERT INTO tblGenre VALUES (genreSeq.NEXTVAL, '�ڹ̵�',2000,2);
INSERT INTO tblGenre VALUES (genreSeq.NEXTVAL, '���',2000,1);
INSERT INTO tblGenre VALUES (genreSeq.NEXTVAL, '��Ÿ',1800,2);




-- ���� ������
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre) VALUES (videoSeq.NEXTVAL, '������ ��ĥ��',5,'�����ʸ�','�ɿ���','��ĥ��',3);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre) VALUES (videoSeq.NEXTVAL, '���ޱ���',5,'���� ���δ���','�谨��','�ڿ���',2);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre) VALUES (videoSeq.NEXTVAL, '�й̳�����',3,'�Ķ󸶿�Ʈ','James','John',1);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre) VALUES (videoSeq.NEXTVAL, '������',3,'�븸��ȭ��','ȫ����','����',4);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre) VALUES (videoSeq.NEXTVAL, '�ǻ��ұ��',6,'�ǻǻ�','�ڰ���','������',5);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre) VALUES (videoSeq.NEXTVAL, '������ ��ȥ',2,'�Ķ󸶿�Ʈ','James','Mike',5);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre) VALUES (videoSeq.NEXTVAL, '�ֶ�� ������',1,NULL,NULL,NULL,1);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre) VALUES (videoSeq.NEXTVAL, 'Ÿ�̰� ŷ',4,'Walt','Kebin','Tiger',3);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre) VALUES (videoSeq.NEXTVAL, '�ڹ� ���긮 ��',10,'�����ʸ�','������','������',5);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre) VALUES (videoSeq.NEXTVAL, '����',7,'�λ��ʸ�','�ڰ���','�嵿��',1);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre) VALUES (videoSeq.NEXTVAL, '�������ﱸ��',2,'�ǻǻ�','�ڰ���','�̺���',1);




-- ȸ�� ������
INSERT INTO tblMember (seq, Name,Grade,Byear,Tel,address,Money) VALUES (memberSeq.NEXTVAL, '������',1,1970,'123-4567','12-3���� 301ȣ',10000);
INSERT INTO tblMember (seq, Name,Grade,Byear,Tel,address,Money) VALUES (memberSeq.NEXTVAL, '������',1,1978,'111-1111','777-2���� 101ȣ',0);
INSERT INTO tblMember (seq, Name,Grade,Byear,Tel,address,Money) VALUES (memberSeq.NEXTVAL, '������',1,1978,'222-2222','86-9����',20000);
INSERT INTO tblMember (seq, Name,Grade,Byear,Tel,address,Money) VALUES (memberSeq.NEXTVAL, '������',1,1982,'333-3333',NULL,15000);
INSERT INTO tblMember (seq, Name,Grade,Byear,Tel,address,Money) VALUES (memberSeq.NEXTVAL, '�ż���',1,1988,'444-4444','���� APT 1012ȣ',0);
INSERT INTO tblMember (seq, Name,Grade,Byear,Tel,address,Money) VALUES (memberSeq.NEXTVAL, '���߱�',1,1981,'555-5555','���Ѻ��� 102ȣ',1000);
INSERT INTO tblMember (seq, Name,Grade,Byear,Tel,address,Money) VALUES (memberSeq.NEXTVAL, '������',1,1981,'666-6666','12-1����',0);
INSERT INTO tblMember (seq, Name,Grade,Byear,Tel,address,Money) VALUES (memberSeq.NEXTVAL, '�̼���',1,1981,'777-7777',NULL,1500);
INSERT INTO tblMember (seq, Name,Grade,Byear,Tel,address,Money) VALUES (memberSeq.NEXTVAL, '��ν�',1,1981,'888-8888','73-6����',-1000);
INSERT INTO tblMember (seq, Name,Grade,Byear,Tel,address,Money) VALUES (memberSeq.NEXTVAL, '������',1,1981,'999-9999','���� APT 902ȣ',1200);



-- �뿩 ������

INSERT INTO tblRent (seq, member, video, Rentdate, Retdate) VALUES (rentSeq.NEXTVAL, 1,1,'2007-01-01',NULL);
INSERT INTO tblRent (seq, member, video, Rentdate, Retdate) VALUES (rentSeq.NEXTVAL, 2,2,'2007-02-02','2001-02-03');
INSERT INTO tblRent (seq, member, video, Rentdate, Retdate) VALUES (rentSeq.NEXTVAL, 3,3,'2007-02-03',NULL);
INSERT INTO tblRent (seq, member, video, Rentdate, Retdate) VALUES (rentSeq.NEXTVAL, 4,3,'2007-02-04','2001-02-08');
INSERT INTO tblRent (seq, member, video, Rentdate, Retdate) VALUES (rentSeq.NEXTVAL, 5,5,'2007-02-05',NULL);
INSERT INTO tblRent (seq, member, video, Rentdate, Retdate) VALUES (rentSeq.NEXTVAL, 1,2,'2007-02-10',NULL);