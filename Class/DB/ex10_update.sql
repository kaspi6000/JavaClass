/*
    UPDATE
    - �����͸� �����ϴ� ��ɾ�
    
    UPDATE ����
    - UPDATE ���̺�� SET 
      �÷��� = �����Ұ�
      [,�÷��� = �����Ұ�] X N
      WHERE ���� : -- ������ ���� �����ϴ� ����(SELECT ���� ����� WHERE�� ���� 100% ����)
*/
COMMIT;
ROLLBACK;

UPDATE tblname SET
    gender = 'f'
    WHERE first = '�缮' AND last = '��'; --PK��������
    
SELECT * FROM tblname;

SELECT * FROM tblinsa;

-- ���� �� ����(����1�� -> �ĺ� -> PK -> num�÷� -> num�� ��������)
UPDATE tblinsa SET
    jikwi = '�̻�'
    WHERE num = 1001;
    
-- ���� �� ����(��ȹ�� ���� -> �޿� �λ� -> 10%�λ� -> buseo �÷�)
UPDATE tblinsa SET
    basicpay = basicpay * 1.1 --���� basicpay *= 1.1
    WHERE buseo = '��ȹ��';
    
--
UPDATE tblinsa SET
    num = 1100
    WHERE num = 1001;
    
/*
    DELETE
    - �����͸� �����ϴ� ��ɾ�
    - �� ����
    - Ư�� �÷����� ����X -> UPDATE ������ Ư�� �÷����� NULL����
    
    DELETE��
    - DELETE [FROM] ���̺�� [WHERE��]
*/
SELECT * FROM tblinsa;

SELECT * FROM tblcountry;

DELETE FROM tblcountry WHERE name = '�߱�' OR name = '�Ϻ�' OR continent = 'AS';
ROLLBACk;