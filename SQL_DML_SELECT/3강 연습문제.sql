



--���� 1. EMPLOYEES ���̺� ���� �̸�, �Ի����� �÷����� �����ؼ� �̸������� �������� ��� �մϴ�.
--���� 1) �̸� �÷��� first_name, last_name�� �ٿ��� ����մϴ�.
--���� 2) �Ի����� �÷��� xx/xx/xx�� ����Ǿ� �ֽ��ϴ�. xxxxxx���·� �����ؼ� ����մϴ�.
SELECT * FROM EMPLOYEES;
SELECT FIRST_NAME || ' ' || LAST_NAME AS NAME, HIRE_DATE FROM EMPLOYEES;

SELECT CONCAT(FIRST_NAME, LAST_NAME), RTRIM(LPAD(HIRE_DATE, 14, '*'), HIRE_DATE) FROM EMPLOYEES ORDER BY HIRE_DATE ASC;

SELECT CONCAT(FIRST_NAME, LAST_NAME) AS NAME,
REPLACE(HIRE_DATE, '7', ' ') AS �Ի�����
FROM EMPLOYEES
ORDER BY NAME;

--���� 2.
--EMPLOYEES ���̺� ���� phone_numbe�÷��� ###.###.####���·� ����Ǿ� �ִ�
--���⼭ ó�� �� �ڸ� ���� ��� ���� ������ȣ (02)�� �ٿ� ��ȭ ��ȣ�� ����ϵ��� ������ �ۼ��ϼ���
SELECT '02' || SUBSTR(PHONE_NUMBER, 4) FROM EMPLOYEES;

SELECT CONCAT('02', SUBSTR(PHONE_NUMBER, 4)) AS PHONE_NUMBER FROM EMPLOYEES;

--���� 3. EMPLOYEES ���̺��� JOB_ID�� it_prog�� ����� �̸�(first_name)�� �޿�(salary)�� ����ϼ���.
--���� 1) ���ϱ� ���� ���� �ҹ��ڷ� �Է��ؾ� �մϴ�.(��Ʈ : lower �̿�)
--���� 2) �̸��� �� 3���ڱ��� ����ϰ� �������� *�� ����մϴ�. 
--�� ���� �� ��Ī�� name�Դϴ�.(��Ʈ : rpad�� substr �Ǵ� substr �׸��� length �̿�)
--���� 3) �޿��� ��ü 10�ڸ��� ����ϵ� ������ �ڸ��� *�� ����մϴ�. 
--�� ���� �� ��Ī�� salary�Դϴ�.(��Ʈ : lpad �̿�)
SELECT * FROM EMPLOYEES;

SELECT RPAD(SUBSTR(FIRST_NAME,1,3), 10, '*') AS NAME, LPAD(SALARY, 10, '*') AS salary FROM EMPLOYEES WHERE LOWER(JOB_ID) = 'it_prog';


SELECT FIRST_NAME, RPAD(SUBSTR(FIRST_NAME, 1, 3), LENGTH(FIRST_NAME), '*'), SALARY
FROM EMPLOYEES WHERE LOWER(JOB_ID) = 'it_prog';















