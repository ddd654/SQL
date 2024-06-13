

-- �߿��� ��ȯ �Լ�
-- EX) CHAR >> NUMBER, DATE

------------------------------
--���ڸ� ���ڷ�
-- �ڵ�����ȯ
SELECT * FROM EMPLOYEES WHERE SALARY >= '20000'; --���ڸ� �ڵ� ����ȯ���� ���� > ���ڷ� �ν��ؼ� ã���ش�
SELECT * FROM EMPLOYEES WHERE HIRE_DATE >= '06/01/01'; -- ���� >> ��¥ �������� �ڵ� ����ȯ���ش�

-- ���� ����ȯ
-- TO CHAR -> ��¥�� ���ڷ� ��ȯ����
SELECT TO_CHAR( SYSDATE , 'YYYY-MM-DD MM:HH:SS') AS ��¥ 
FROM DUAL;

SELECT TO_CHAR( SYSDATE, 'YY-MM-DD AM HH12:MM:SS') AS TIME 
FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YY"��" MM"��" DD"��"') AS DATE1 FROM DUAL; -- " �ֵ���ǥ�� ���ڵ� ����ϱ�

-- TO_CHAR -> ���ڸ� ���ڷ�
SELECT TO_CHAR(20000, '99999999') AS NUM FROM DUAL; --9�� �׳� �ڸ��� ǥ�ð� 8�� �Ἥ 8�ڸ��� ���ڰ� �Ǿ���
SELECT TO_CHAR(20000, '099999999') AS NUM FROM DUAL; -- ���ڸ��� 0���� ä��
SELECT TO_CHAR(20000, '999') AS NUM FROM DUAL; --�ڸ����� �����ϸ� # ����

SELECT TO_CHAR(20000.123, '999999.9999') AS NUM FROM DUAL; -- ����6�ڸ� �Ǽ�4�ڸ� ǥ���ϱ�
SELECT TO_CHAR(20000, '$999999') AS NUM FROM DUAL; --6�ڸ� �ְ�, �տ� $ ǥ��

SELECT TO_CHAR(20000, 'L9,999,999') AS RESULT FROM DUAL; -- �տ� ��ȭ��ȣ ǥ���ϱ�, �ڸ��� �޸��� ǥ���ϱ�

-- ���� ȯ�� 1372.17�� SALARY ���� ��ȭ�� ǥ���ϱ�
SELECT TO_CHAR(SALARY * 1372.17, 'L999,999,999,999') AS ��ȭ FROM EMPLOYEES;

-- TO_CHAR ���ڸ� ��¥��
SELECT '2024-06-13' FROM DUAL; -- �ٷ� ��¥�� ǥ�� ����
SELECT TO_DATE('2024-02-13', 'YYYY-MM-DD') FROM DUAL; -- ��¥�� �Ǿ���
SELECT SYSDATE - TO_DATE('2024-02-13', 'YYYY-MM-DD') FROM DUAL; --���� ����

SELECT TO_DATE('2024�� 06�� 13��', 'YYYY"��" MM"��" DD"��"') FROM DUAL; --��¥ ���� ���ڰ� �ƴ϶��
SELECT TO_DATE('24-06-13 11�� 35�� 33��', 'YYYY-MM-DD HH"��" MI"��" SS"��"') FROM DUAL; --���� MI �̰�, ���ڷ� ��ȯ��

-- 24�� 06�� 13�Ϸ� �ٲٱ�
SELECT '240613' FROM DUAL;
SELECT  TO_DATE(TO_CHAR( 240613, '9999999999' ), 'YYYY"��" MM"��" DD"��"' ) FROM DUAL; 
SELECT  TO_CHAR(TO_DATE( 240613, 'YYMMDD' ), 'YYYY"��" MM"��" DD"��"' ) FROM DUAL;

SELECT TO_CHAR(TO_DATE(240613, 'YYMMDD'), 'YYYY"��" MM"��" DD"��"') FROM DUAL;

---------------------------
--���ڸ� ���ڷ� 

-- TO_NUMBER ���ڸ� ���ڷ�
SELECT '4000' - 1000 FROM DUAL; --�ڵ�����ȯ
SELECT TO_NUMBER('4000') - 1000 FROM DUAL; --����� ����ȯ

SELECT '$4,400' - 1000 FROM DUAL;
SELECT TO_NUMBER('$4,400', '$999,999') -1000 FROM DUAL; --����� ��ȯ �� ���

-------------------
--NULL ó�� �Լ�
SELECT NVL(1000, 0), NVL(NULL, 0) FROM DUAL;
SELECT NULL + 1000 FROM DUAL; --NULL�� �� ������ NULL

SELECT FIRST_NAME, SALARY, COMMISSION_PCT, SALARY + SALARY * COMMISSION_PCT FROM EMPLOYEES;
SELECT FIRST_NAME, SALARY, COMMISSION_PCT, SALARY + SALARY * NVL(COMMISSION_PCT, 0) AS �����޿� FROM EMPLOYEES;


-- NVL (���, ���̾ƴѰ��, ���ΰ��) >> �տ����� �� ���
SELECT NVL2(NULL, 'NULL�� �ƴմϴ�', 'NULL�Դϴ�') FROM DUAL;
SELECT NVL2(300, 'NULL�� �ƴմϴ�', 'NULL�Դϴ�') FROM DUAL;

SELECT FIRST_NAME, SALARY, COMMISSION_PCT, NVL2(COMMISSION_PCT, SALARY + SALARY * COMMISSION_PCT, SALARY) AS �����޿� FROM EMPLOYEES;
--���� ������ ���

-- COALESC(��, ��, ��, ....) > NULL�� �ƴ� ù��° �� ���
SELECT COALESCE(1, 2, 3) FROM DUAL; -- 1���
SELECT COALESCE(NULL, 2, 3, 4) FROM DUAL; --2
SELECT COALESCE(NULL, NULL, 3, NULL) FROM DUAL;
SELECT COALESCE(COMMISSION_PCT, 0) FROM EMPLOYEES; --NVL�� ����

-- DECODE(���, �񱳰�, �����, �񱳰�, �����, ...) >
SELECT JOB_ID, SALARY, DECODE( JOB_ID, 'IT_PROG', 'SALARY') FROM EMPLOYEES;
SELECT DECODE('A', 'A', 'A�Դϴ�') FROM DUAL; -- A�� A�̸� A�̴�

SELECT DECODE('V', 'A', 'A�Դϴ�', 'A�� �ƴմϴ�') FROM DUAL;

SELECT DECODE('B', 'A', 'A�Դϴ�' 
, 'B', 'B�Դϴ�'
, 'C', 'C�Դϴ�'
, '���ξƴմϴ�'
)
FROM DUAL;

SELECT DECODE(JOB_ID, 'IT_PROG', SALARY * 1.1
,'AD_VI', SALARY * 1.2
,'FI_MGR', SALARY * 1.3
, SALARY
) AS �޿� 
FROM EMPLOYEES;

--CASE WHEN WHEN THEN END, ����ġ��
SELECT JOB_ID, SALARY,
CASE JOB_ID WHEN 'IT_PROG' THEN SALARY * 1.2 END
FROM EMPLOYEES;

SELECT JOB_ID,
       CASE JOB_ID WHEN 'IT_PROG' THEN SALARY * 1.1
                   WHEN 'AD VF'   THEN SALARY * 1.2
                   WHEN 'FI_MGR'  THEN SALARY * 1.3
                   ELSE SALARY
       END AS �޿�
FROM EMPLOYEES;

-- �񱳿� ���� ������ WHEN���� �� �� ����, ���� ���� �����
SELECT JOB_ID,
        CASE WHEN JOB_ID = 'IR_PROG' THEN SALARY * 1.2
            WHEN JOB_ID = 'AD VF' THEN SALARY * 1.3
            WHEN JOB_ID = 'FI_MGR' THEN SALARY * 1.4
            ELSE SALARY
            END AS �޿�
FROM EMPLOYEES;





