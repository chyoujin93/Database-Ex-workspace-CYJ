-- 실습1 (260102)
-- 1) EMP 테이블에서 사원 이름에 "Name"이라는 별칭을 부여하여 출력하시오.  
SELECT ENAME AS "Name" FROM EMP;
SELECT ENAME "Name" FROM EMP;
SELECT ENAME Name FROM EMP;

-- 2) EMP 테이블에서 급여(SAL)를 연봉(Annual Salary)으로 계산하여 출력하시오. 
SELECT SAL * 12 AS "연봉(Annual Salary)" FROM EMP;
SELECT SAL * 12 "연봉(Annual Salary)" FROM EMP;
-- 특수문자나 공백이 있는 경우, 큰따옴표는 꼭 사용해야함.

-- 3) 사원명(ENAME)과 직무(JOB)를 각각 "사원이름", "직무"로 출력하시오.  
SELECT ENAME AS "사원이름", JOB AS "직무" FROM EMP;
SELECT ENAME "사원이름", JOB "직무" FROM EMP;
SELECT ENAME 사원이름, JOB 직무 FROM EMP;

-- AS나 큰따옴표는 사용하지 않아도 실행은 되지만, 
-- 가독성이나 실수방지를 위해, AS 큰따옴표 사용을 권장한다.
-- 단, 특수문자나 공백이 있는 경우, 큰따옴표는 꼭 사용해야한다! (AS는 생략 가능)


