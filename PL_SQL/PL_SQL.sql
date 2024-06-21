
--PL/SQL, 프로그램 SQL
--익명블록
-- 실행을 F5로 컴파일 시켜서 실행시킨다, 범위를 지정해서 CTRL + ENTER 


SET SERVEROUTPUT ON;
--익명블록
DECLARE
    V_NUM NUMBER;
    V_NAME VARCHAR2(30) := '사과';
BEGIN
    
    V_NUM :=10;
    --V_NAME := '사과';
    
    dbms_output.put_line(V_NAME || '님의 나이는 ' || V_NUM || '입니다');

END;
--범위 지정해서 실행할것


DECLARE
    NAME VARCHAR2(30);
    SALARY NUMBER;
    LAST_NAME EMPLOYEES.LAST_NAME%TYPE; --EMP테이블의 LAST_NAME 갈럼과 동일한 타입읋 선언하겠음
BEGIN
    SELECT FIRST_NAME, LAST_NAME, SALARY
    INTO NAME, LAST_NAME, SALARY --위에 선언된 변수에 대입
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 100;
    
    DBMS_OUTPUT.PUT_LINE(NAME); --출력 구문
    DBMS_OUTPUT.PUT_LINE(LAST_NAME);
    DBMS_OUTPUT.PUT_LINE(SALARY);
    
END;

------------------------------
--2008년 입사한 사원의 급여 평균을 구해서 새로운 테이블에 INSERT 
CREATE TABLE EMP_SAL(
    YEARS VARCHAR2(50),
    SALARY NUMBER(10)
);



DECLARE
    YEARS VARCHAR2(50) := 2008;
    SALARY NUMBER;
BEGIN
    SELECT AVG(SALARY)
    INTO SALARY -- 변수 SALARY에 대입
    FROM EMPLOYEES
    WHERE TO_CHAR(HIRE_DATE, 'YYYY') = YEARS;

    INSERT INTO EMP_SAL VALUES(YEARS, SALARY);
    COMMIT;
END;


--SELECT AVG(SALARY)
--FROM EMPLOYEES
--WHERE TO_CHAR(HIRE_DATE, 'YYYY') = 2008;

------------------------
--사원 테이블에서 사원번호가 제일 큰 사원을 찾아낸 뒤, 
--	 이 번호 +1번으로 아래의 사원을 emps테이블에 employee_id, last_name, email, hire_date, job_id를  신규 입력하는 익명 블록을 만들어 봅시다.
--<사원명>   : steven
--<이메일>   : stevenjobs
--<입사일자> : 오늘날짜
--<JOB_ID> : CEO

SELECT MAX(EMPLOYEE_ID) FROM EMPS_IT;

DECLARE
    NUM NUMBER;
BEGIN
    SELECT MAX(EMPLOYEE_ID) +1
    INTO NUM
    FROM EMPS_IT;
    
    INSERT INTO EMPS_IT(EMPLOYEES_ID, LAST_NAME, EMAIL)
    VALUES(1,2,3);
    
    COMMIT;
END;















