-- ���ڿ� �Լ�
SELECT LOWER('HELLO') AS NAME FROM DUAL; -- �������̺�, Ȯ�ο�

-- �ҹ���, �빮��, ù �빮��
SELECT LOWER(FIRST_NAME), UPPER(FIRST_NAME), INITCAP(FIRST_NAME) FROM EMPLOYEES;

-- ���ڿ� ����
SELECT FIRST_NAME, LENGTH(FIRST_NAME) FROM EMPLOYEES;

-- INSTR ���ڿ� �߿� ã��
SELECT FIRST_NAME, INSTR(FIRST_NAME, 'a') FROM EMPLOYEES; -- ������ 0 ����

-- SUBSTR ���ڿ� �ڸ���
SELECT FIRST_NAME, SUBSTR(FIRST_NAME, 3), LAST_NAME ,SUBSTR(LAST_NAME,2, 3) FROM EMPLOYEES; --3�̸� �ڸ��� ǥ���ϱ� , 

-- CONCAT ���ڿ� ��ġ��
SELECT FIRST_NAME || LAST_NAME, CONCAT(FIRST_NAME,LAST_NAME) FROM EMPLOYEES;

-- LPAD, RPAD ���� ���� �� Ư�� ���ڷ� ä���
SELECT LPAD('ABC', 10, '*') FROM DUAL; --LEFT 10ĭ�� ��ä��
SELECT LPAD(FIRST_NAME, 10, '*'),RPAD(FIRST_NAME, 10, '*') FROM EMPLOYEES; --RIGHT 10ĭ�� ��

--LTRIM, RTRIM, TRIM
SELECT LTRIM('  HELLO WORLD  '), TRIM('  HELLO WORLD  '), RTRIM('  HELLO WORLD  ') FROM DUAL; --�������
SELECT LTRIM('HELLO WORLD', 'HEL') FROM DUAL; -- ���� ���ŷε� ����


-- REPLACE
SELECT REPLACE('���� �뱸 ���� �λ� ���', ' ', '>' ) FROM DUAL; --���鿡 > �ֱ�
SELECT REPLACE('���� �뱸 ���� �λ� ���', ' ', '' ) FROM DUAL; -- ���鿡 ������ֱ�

















