
--스토어드 프로시져

--
SET SERVEROUTPUT ON;

--선언과 호출이 있음
CREATE OR REPLACE PROCEDURE NEW_JOB_POC -- 포르시져명
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('HELLO');
END;

EXEC NEW_JOB_POC;

---
CREATE OR REPLACE PROCEDURE NEW_JOB_POC
(P_JOB_ID IN VARCHAR2,
P_JOB_TITLE IN VARCHAR2,
P_MIN_SALARY IN JOBS.MIN_SALARY%TYPE := 0,
P_MAX_SALARY IN JOBS.MAX_SALARY%TYPE := 100

)
IS
BEGIN

    INSERT INTO JOBS_IT VALUES(P_JOB_ID, P_JOB_TITLE, P_MIN_SALARY, P_MAX_SALARY);
    COMMIT;
END;

EXEC NEW_JOB_PROC('SAM', 'SAM', 100, 10); --매개변수가 일치해야 함

EXEC NEW_JOB_PROC('SAM1', 'SAM2'); // DEFAULT 매개변수가 있다면, 기본값으로 전환된다

SELECT * FROM JOBS_IT;

CREATE TABLE JOBS_IT (
A, B, C
);
DESC JOBS_IT;


-- PLSQL 모든 구문 제어문, 탈출문, 커서 구문을 프로시져에 쓸 수 있습니다.
-- JOB_ID 가 존재하면 UPDATE, 없으면 INSERT
CREATE OR REPLACE PROCEDURE NEW_JOB_PROC
    (A IN VARCHAR2,
    B IN VARCHAR2,
    C IN NUMBER,
    D IN NUMBER
    )
IS
    CNT NUMBER;
BEGIN
    SELECT COUNT(*)
    WHERE CNT -- 있다면 CNT에 값을 저장
    FROM JOBS_IT
    WHERE JOB_ID = 'A'; --JOB_ID가 A인

    IF CNT = 0 THEN
    --INSERT 하겠다
        INSERT INTO JOBS_IT VALUES(A,B,C,D);
    ELSE
        --UPDATE
        UPDATE JOBS_IT
        SET JOB_ID = A,
            JOB_TITLE = B,
            MIN_SALARY = C,
            MAX_SALARY = D
        WHERE JOB_ID = A;
    END IF;
END;
--
EXEC NEW_JOB_PROC('AD', 'ADMIN', 1000, 10000);
EXEC NEW_JOB_PROC('AD_VF', 'ADMIN2', 1000, 10000);


------------
--OUT 매개변수 - 외부로 값을 돌려주기위한 매개변수
CREATE OR REPLACE PROCEDURE NEW_JOB_PROC
    (A IN VARCHAR2, --JOB_ID
    B IN VARCHAR2, --
    C IN NUMBER, 
    D IN NUMBER,
    E OUT NUMBER --외부로 전달할 매개 변수
    )
IS
    CNT NUMBER;
BEGIN
    SELECT COUNT(*)
    WHERE CNT -- 있다면 CNT에 값을 저장
    FROM JOBS_IT
    WHERE JOB_ID = 'A'; --JOB_ID가 A인

    IF CNT = 0 THEN
    --INSERT 하겠다
        INSERT INTO JOBS_IT VALUES(A,B,C,D);
    ELSE
        --UPDATE
        UPDATE JOBS_IT
        SET JOB_ID = A,
            JOB_TITLE = B,
            MIN_SALARY = C,
            MAX_SALARY = D
        WHERE JOB_ID = A;
    END IF;
    
    E := CNT;
    
    COMMIT;
    
END;

--
DECLARE
    CNT NUMBER;
BEGIN
    --익명 블럭 안에서는 EXEC 제외
    NEW_JOB_PROC('AD_VF', 'ADMIN', 1000, 10000, CNT);
    
    DBMS_OUTPUT.PUT_LINE('프로시저 내부에서 할당받은 값:' || CNT);
END;

EXEC








