
--제어문
/*


*/

SET SERVEROUTPUT ON;

DECLARE
    POINT NUMBER := TRUNC(DBMS_RANDOM.VALUE(1,101)); -- 1 ~ 101미만 랜덤수
    
BEGIN
    
--    DBMS_OUTPUT.PUT_LINE(POINT);
--    
--    IF POINT >= 60 THEN
--        DBMS_OUTPUT.PUT_LINE('A학점 입니다.');
--    ELSIF POINT >=70 THEN        
--        DBMS_OUTPUT.PUT_LINE('B학점 입니다.');
--
--    ELSE
--        DBMS_OUTPUT.PUT_LINE('C학점 입니다.');
--
--    END IF;
    
    CASE WHEN THEN >=90 THEN DBMS_OUTPUT.PUT_LINE('A');
    WHEN THEN >=80 THEN DBMS_OUTPUT.PUT_LINE('B');
    WHEN THEN >=70 THEN DBMS_OUTPUT.PUT_LINE('C');
    ELSE DBMS_OUTPUT.PUT_LINE('D');
    END CASE --조건문 다른 방식
    
    
END;
--
--CASE WHEN THEN >=90 THEN DBMS_OUTPUT.PUT_LINE('A');
--    WHEN THEN >=80 THEN DBMS_OUTPUT.PUT_LINE('B');
--    WHEN THEN >=70 THEN DBMS_OUTPUT.PUT_LINE('C');
--    ELSE DBMS_OUTPUT.PUT_LINE('D');
--    END CASE;


----------------
--WHILE

DECLARE
    CNT NUMBER := 1;
    
    
BEGIN
    WHILE CNT <= 9
    LOOP
        DBMS_OUTPUT.PUT_LINE('3 X ' || CNT || ' = ' || CNT * 3);
        CNT := CNT +1; -- 1증가
    END LOOP;

END;

---- FOR
DECLARE


BEGIN
    FOR I IN 1..5 -- 1~5까지 반복
    LOOP
        CONTINUE WHEN I = 5; --I가 5면 다음으로
        DBMS_OUTPUT.PUT_LINE('3 X ' || I || ' = ' || I *3); --I만큼
        EXIT WHEN I = 5; --면 탈출
    END LOOP;    
    
    
END;
-------

DECLARE

    
BEGIN
    FOR I IN 1..9 LOOP
    
        FOR J IN 1..9
        LOOP
        DBMS_OUTPUT.PUT_LINE(I ||' X ' || J || ' = ' || I*J);
        END LOOP;
        
    END LOOP;
END;

----
--커서
SELECT 


DECLARE
    NAME VARCHAR2(30);

BEGIN
    --여러행일떄 커서를 사용
    SELECT FIRST_NAME
    INTO NAME
    FROM EMPLOYEES WHERE HOB_ID = 'IT_PROG';

    DBMS_OUTPUT.PUT_LINE(NAME);
END;


--------------
DECLARE 
    NM VARCHAR2(30);
    SALARY NUMBER;
    CURSOR X IS SELECT FIRST_NAME, SALARY FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG';
BEGIN
    OPEN X; --커서 선언
        DBMS_OUTPUT.PUT_LINE('---커서 시작---');
    LOOP
        FETCH X INTO NM, SALARY; -- NM 변수와 SALARY에 저장한다
        EXIT WHEN X%NOTFOUND; -- X커서에서 더이상 읽을 값이 없으면 TRUE
        
        DBMS_OUTPUT.PUT_LINE(NM);
        DBMS_OUTPUT.PUT_LINE(SALARY);
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('--커서 종료--');
    DBMS_OUTPUT.PUT_LINE('데이터수:' || X%ROWCOUNT);

    CLOSE X; --커서 닫기
    
END;
--
--4. 부서벌 급여합을 출력하는 커서구문을 작성해봅시다.
--


SELECT DEPARTMENT_ID,  SUM(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENT_ID;

DECLARE
    DEPART NUMBER;
    SALARY NUMBER;
    CURSOR A IS SELECT DEPARTMENT_ID,  SUM(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENT_ID;
BEGIN
    OPEN A;
        
    LOOP
        FETCH A INTO DEPART, SALARY;
        EXIT WHEN A%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE(DEPART || ' ' || SALARY);
    END LOOP;
    
    CLOSE A;
    
END;



--5. 사원테이블의 연도별 급여합을 구하여 EMP_SAL에 순차적으로 INSERT하는 커서구문을 작성해봅시다.
-- 연도별 급여합은?
SELECT 



-----
DECLARE 
    NM VARCHAR2(30);
    SALARY NUMBER;
    CURSOR X IS SELECT FIRST_NAME, SALARY FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG';
BEGIN
    OPEN X; --커서 선언
        DBMS_OUTPUT.PUT_LINE('---커서 시작---');
    LOOP
        FETCH X INTO NM, SALARY; -- NM 변수와 SALARY에 저장한다
        EXIT WHEN X%NOTFOUND; -- X커서에서 더이상 읽을 값이 없으면 TRUE
        
        DBMS_OUTPUT.PUT_LINE(NM1);
        DBMS_OUTPUT.PUT_LINE(SALARY);
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('--커서 종료--');
    DBMS_OUTPUT.PUT_LINE('데이터수:' || X%ROWCOUNT);

    CLOSE X; --커서 닫기
END;
----

DECLARE
		NM VARCHAR2(50);
    SALARY NUMBER;
    CURSOR c_name IS SELECT  FIRST_NAME, SALARY FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG'; -- 1.커서선언.
BEGIN
    OPEN c_name; --2. 커서열기
				DBMS_OUTPUT.PUT_LINE('=============================');
    LOOP
        FETCH c_name INTO NM, SALARY;--3. 커서로부터 데이터 읽기
        EXIT WHEN c_name%NOTFOUND; --커서에서 데이터를 찾을수 없으면 반복문 빠져나가라.
        DBMS_OUTPUT.PUT_LINE('IT_PROG의 이름은 ' || NM);
        DBMS_OUTPUT.PUT_LINE('IT_PROG의 급여는 ' || SALARY);
    END LOOP;
		
				DBMS_OUTPUT.PUT_LINE('결과 레코드수 => ' || c_name%ROWCOUNT);
    CLOSE c_name ;--4. 커서 닫기
END;














