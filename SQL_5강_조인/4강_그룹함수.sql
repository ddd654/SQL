
--그룹 함수
SELECT MAX(SALARY), MIN(SALARY), SUM(SALARY), AVG(SALARY), COUNT(SALARY) FROM EMPLOYEES;

--MIN, MAX는 날짜 문자에도 적용됨
SELECT MIN(HIRE_DATE), MAX(HIRE_DATE), MIN(FIRST_NAME), MAX(FIRST_NAME) FROM EMPLOYEES;

--COUNT 두가지 방법
SELECT COUNT(*), COUNT(COMMISSION_PCT) FROM EMPLOYEES;

--부서가 80에서 커미션이 가장 높은 사람
SELECT MAX(COMMISSION_PCT) FROM EMPLOYEES WHERE DEPARTMENT_ID = 80;

---------------------
-- 그룹함수는 일반칼럼에  동시에 사용 불가능
SELECT FIRST_NAME, AVG(SALARY) FROM EMPLOYEES;

SELECT FIRST_NAME, AVG(SALARY) OVER(), COUNT(*) OVER(), SUM(SALARY) OVER() FROM EMPLOYEES; --OVER() 를 사용해서 모두 표시
--OVER()를 사용해서 그룹함수 표시 가능
-------------------

-- GROUP BY 
SELECT DEPARTMENT_ID,
        SUM(SALARY),
        AVG(SALARY),
        MIN(SALARY),
        MAX(SALARY),
        COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- GROUP에 적힌 칼럼만 그룹화 가능하다
SELECT DEPARTMENT_ID,
        FIRST_NAME
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID; --에러

-- 2개 이상의 그룹화
SELECT DEPARTMENT_ID, JOB_ID,
        SUM(SALARY) AS "급여 합",
        AVG(SALARY) AS "급여 평균",
        COUNT(*) AS "인원수",
        COUNT(*) OVER() AS "부서별 개수" --COUNT(*) OVER() 를 사용해 출력
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID
ORDER BY DEPARTMENT_ID;

--
SELECT DEPARTMENT_ID,
        AVG(SALARY)
FROM EMPLOYEES
WHERE AVG(SALARY) >= 5000  -- 그룹의 조건을 적는 곳은 HAVING에 적는다
GROUP BY DEPARTMENT_ID;










