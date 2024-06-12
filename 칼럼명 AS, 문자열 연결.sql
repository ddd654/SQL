
SELECT * FROM employees;
-- ġ�� �÷� Ȯ��

SELECT * FROM DEPARTMENTS;
SELECT * FROM JOBS;

-- Ư�� �÷��� ��ȸ�ϱ� 
-- ���ڿ� ��¥�� ��������, ���ڴ� ������ ����
SELECT FIRST_NAME, HIRE_DATE, SALARY FROM employees;

-- �÷����ڸ����� ���� �Ǵ� ��¥�� ������ �ȴ�
SELECT FIRST_NAME, SALARY + SALARY * 0.1 FROM EMPLOYEES;

-- NULL
SELECT * FROM EMPLOYEES;
--EMPLOYEE_ID >> PK
--DEPARTMENT_ID >> FK

--Į���� �ٲٱ�
--�����, ��Ī "AS ��Ī"
SELECT FIRST_NAME AS ��Ī, SALARY �޿�, SALARY + SALARY * 0.1 "���� �޿�" FROM EMPLOYEES;

-- ROWNUM ��ȸ�� ����
-- ROWID
--���ڿ� ���� ||
SELECT 'HELLO'||' WORLD' FROM EMPLOYEES;

-- Ȭ ����ǥ�� �ΰ��ϸ� ǥ�õ�
SELECT FIRST_NAME || '''���� �޿��� ' || SALARY || ' �Դϴ�' AS �޿� FROM EMPLOYEES;

-- DISTINCT �ߺ� ����
SELECT DISTINCT * FROM EMPLOYEES;

SELECT DISTINCT DEPARTMENTS_ID FROM EMPLOYEES;

--��ȸ�� ���� ROWNUM, ���ڵ� ����� ��ġ ROWID
SELECT EMPLOYEE_ID, FIRST_NAME, ROWID, ROWNUM FROM EMPLOYEES;




