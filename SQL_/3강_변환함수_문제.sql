
--���� 1.
--�������ڸ� �������� EMPLOYEE���̺��� �Ի�����(hire_date)�� �����ؼ� �ټӳ���� 10�� �̻���
--����� ������ ���� ������ ����� ����ϵ��� ������ �ۼ��� ������. 
--���� 1) �ټӳ���� ���� ��� ������� ����� �������� �մϴ�.
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME, FLOOR((SYSDATE - HIRE_DATE)/ 365) AS YEAR1 FROM EMPLOYEES ORDER BY YEAR1 DESC;

SELECT EMPLOYEES_ID,
        CONCAT(FIRST_NAME || ' ', LAST_NAME),
        HIRE_DATE,
        TRUNC((SYSDATE - HIRE_DATE)/356)

FROM EMPLOYEES;
--���� 2.
--EMPLOYEE ���̺��� manager_id�÷��� Ȯ���Ͽ� first_name, manager_id, ������ ����մϴ�.
--100�̶�� �����塯 
--120�̶�� �����塯
--121�̶�� ���븮��
--122��� �����ӡ�
--�������� ������� ���� ����մϴ�.
--���� 1) �μ��� 50�� ������� ������θ� ��ȸ�մϴ�
--���� 2) DECODE�������� ǥ���غ�����.
--���� 3) CASE�������� ǥ���غ�����.
SELECT FIRST_NAME FROM EMPLOYEES WHERE DEPARTMENT_ID = 50;

SELECT FIRST_NAME,  MANAGER_ID, 
    DECODE(MANAGER_ID, '100', '����'
                    , '120', '����'
                    , '121', '�븮'
                    , '122', '����'
                    , '���') AS ����
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50;


SELECT FIRST_NAME, MANAGER_ID,
    CASE MANAGER_ID WHEN 100 THEN '����'
                    WHEN 120 THEN '����'
                    WHEN 121 THEN '�븮'
                    WHEN 122 THEN '����'
                    ELSE '���'
                    END AS GOOD
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50;

--���� 3. 
--EMPLOYEES ���̺��� �̸�, �Ի���, �޿�, ���޴�� �� ����մϴ�.
--����1) HIRE_DATE�� XXXX��XX��XX�� �������� ����ϼ���.
--����2) �޿��� Ŀ�̼ǰ��� �ۼ�Ʈ�� ������ ���� ����ϰ�, 1300�� ���� ��ȭ�� �ٲ㼭 ����ϼ���.
--����3) ���޴���� 5�� ���� �̷�� ���ϴ�. �ټӳ���� 5�� ������ ���޴������ ����մϴ�.
--����4) �μ��� NULL�� �ƴ� �����͸� ������� ����մϴ�.
SELECT * FROM EMPLOYEES;

SELECT CONCAT(FIRST_NAME || ' ', LAST_NAME) AS �̸�,
        TO_CHAR(HIRE_DATE, 'YYYY"��" MM"��" DD"��"') AS �Ի���,
         TO_CHAR(( SALARY +SALARY * NVL(COMMISSION_PCT, 0)) * 1300, 'L999,999,999') AS �޿�,

        TRUNC((SYSDATE - HIRE_DATE)/356),
        DECODE(MOD( TRUNC((SYSDATE - HIRE_DATE)/356), 5), 0, '���޴��', '���޴�� �ƴ�') AS ���޴��
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL;



SELECT FIRST_NAME || ' ' || LAST_NAME) AS �̸�,
       TO_CHAR(HIRE_DATE, 'YYYY"��" MM"��" DD"��"') AS �Ի���,
       SALARY + SALARY * NVL(COMMISSION_PCT, 0) AS �ѱ޿�,
       TO_CHAR((SALARY + SALARY * NVL(COMMISSION_PCT, 0)) * 1300, 'L999.999.999') AS �޿�,
       TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)/12) AS �ٹ����,
       DECODE(MOD(TRUNC((SYSDATE - HIRE_DATE)/356), 5), 0, '���޴��', '���޴�� �ƴ�') AS ���޴��
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL;













