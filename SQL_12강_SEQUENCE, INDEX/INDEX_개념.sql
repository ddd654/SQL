
--INDEX
-- 데이터 찾도록 도와주는 역할을 함

-- UNIQUE 컬럼에는 고유 인덱스가 쓰임
-- 일반 컬럼에는 비고유 인덱스를 지정할 수 있음
-- INDEX는 조회를 빠르게 하지만, 모든 경우는 아니다

--인덱스 생성
CREATE TABLE EMPS_IT AS (SELECT * FROM EMPLOYEES);

DESC EMPS_IT;

--인덱스가 없을때
SELECT * FROM EMPS_IT WHERE FIRST_NAME = 'Nancy';

--비고유 인덱스 생성
CREATE INDEX EMPS_IT_IX ON EMPS_IT (FIRST_NAME);

--인덱스 생성 후 FIRST_NAME으로 다시 조회
SELECT * FROM EMPS_IT WHERE FIRST_NAME = 'Nancy';
--F10 눌러서 확인 코스트가 하나 줄음


--인덱스의 삭제 >뷰나 인덱스나 삭제해도 실 테이블에 영향 없음
DROP INDEX EMPS_IT_IX;

--결합인덱스, 여러개의 컬럼을 동시에 인덱스로 지정
CREATE INDEX EMPS_IT_IX ON EMPS_IT(FIRST_NAME, LAST_NAME);

SELECT * FROM EMPLOYEES WHERE FIRST_NAME = 'Nancy'; --힌트
SELECT * FROM EMPLOYEES WHERE FIRST_NAME = 'Nancy' AND LAST_NAME = 'Greenberg';--힌트
SELECT * FROM EMPLOYEES WHERE LAST_NAME = 'Greenberg';--힌트

--고유 인덱스(PK 에서 자동생성됨)
CREATE UNIQUE INDEX 인덱스명 ~~




















