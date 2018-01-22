/*
    ��, View
    - DB Object�� �ϳ�(���̺�, ������, �� + �������)
    - ���� ���̺�
    - �������� ���̺��� ���̽��� ������ ���̺� ������ �Ѵ�.
    - ���̺��� ���纻 -> �������̺�, �����̺�, �������̺�
    - ���̺�ó�� ����ϴ� ��ü
    - SQL ��ü�� ������ ���� ���� ��ü
    - ��� �б� �������� ����Ѵ�.
*/

-- �����
CREATE VIEW vwinsa
AS
SELECT * FROM tblinsa;

-- ����
SELECT * FROM vwinsa;

CREATE TABLE vwinsa
AS
SELECT * FROM tblinsa;

-- ��� : �λ�� + ����(����) ���� SELECT X 500
SELECT * FROM tblinsa WHERE buseo = '�λ��' AND jikwi IN('����', '����');

CREATE VIEW �λ��
AS
SELECT * FROM tblinsa WHERE buseo = '�λ��' AND jikwi IN('����', '����');

CREATE TABLE �ѹ��� -- ������ ���纻(�� ����) : ������ ���纻�� �и�
AS
SELECT * FROM tblinsa WHERE buseo = '�ѹ���' AND jikwi IN('����', '����');

SELECT * FROM �λ��;
SELECT * FROM �ѹ���;

UPDATE tblinsa SET city = '����' WHERE num = 1046;
UPDATE tblinsa SET city = '���ֵ�' WHERE num = 1019;

SELECT * FROM tblinsa WHERE num = 1046;
SELECT * FROM tblinsa WHERE num = 1019;

-- 1. ���� �ݺ��Ǵ� ���� ����
CREATE VIEW vwinsa2
AS
SELECT name, basicpay, sudang, '19' || substr(ssn, 1, 2) AS birthyear,
    CASE
        WHEN substr(ssn, 8, 1) = '1' THEN 'm'
        WHEN substr(ssn, 8, 1) = '2' THEN 'f'
    END AS gender
FROM tblinsa;

SELECT * FROM vwinsa2;

-- 2. ���� �ݺ������� �ʴ��� ���ǿ� �ǹ̸� �ο��� ���� ������ ���̱� ����
CREATE VIEW ��������
AS
SELECT * FROM tblinsa WHERE substr(ssn, 8, 1) = '1';

/*
    �並 ����ϴ� ����
    1. ���� �ݺ��Ǵ� ���� ����
    2. ���ǿ� �ǹ̸� �ο��� ���� ������ ���̱� ����
    3. 1���� ���̺��� ���� �ǹ̷� ����ϰ� ������
    4. ����
        - ����ڿ��� ���ѿ� ���� �Ϻ� �����͸� �����Ű���� �� ��
*/

SELECT * FROM tblinsa;

CREATE VIEW ���
AS
SELECT * FROM tblinsa WHERE jikwi = '���';

-- ����
-- tblinsa : ��� ���� ��Ż
-- ��� : select ���� �ο�
SELECT * FROM ���;

-- �� �����ϱ�
DROP VIEW �λ��;

-- �� �����ϱ�
CREATE OR REPLACE VIEW vwsolo
AS
SELECT name, age, height, weight FROM tblmen WHERE couple IS NULL;

SELECT * FROM vwsolo;

-- ��� �б� �����̴�.
SELECT * FROM tblmen;

CREATE OR REPLACE VIEW vwmen
AS
SELECT * FROM tblmen;

SELECT * FROM vwmen;

-- �並 ������� INSERT
INSERT INTO vwmen VALUES('�׽�Ʈ', 20, 170, 60, NULL);

-- �並 ������� UPDATE
UPDATE vwmen SET age = 22 WHERE name = '�׽�Ʈ';

-- �並 ������� DELETE
DELETE FROM vwmen WHERE name = '�׽�Ʈ';

CREATE OR REPLACE VIEW vwmen2
AS
SELECT name, height FROM vwmen;

SELECT * FROM vwmen2;

SELECT * FROM vwmen2;
SELECT * FROM (SELECT name, height FROM vwmen);

INSERT INTO vwmen2 VALUES('�׽�Ʈ', 170);