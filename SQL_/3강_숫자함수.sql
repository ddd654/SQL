
--숫자 함수

--ROUND 반올림
SELECT ROUND(45.823), ROUND(45.823, 1), ROUND(45.876, 2) FROM DUAL;

--TRUMC, 절삭하는 함수
SELECT TRUNC(45.345), TRUNC(45.345, 0), TRUNC(45.345, 1), TRUNC(45.345, -1) FROM DUAL;

--ABS, 절대값
--CEIL 올림
--FLOOR 내림
SELECT ABS(-123), CEIL(23.3), FLOOR(23.8) FROM DUAL;

--MOD 나머지
SELECT 4/5, MOD(5,3)  FROM DUAL;












