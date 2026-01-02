-- 실습5
-- 1)부서번호가 30이면서 급여가 1600 이상인 사원을 조회하시오.
SELECT * FROM EMP
WHERE DEPTNO = 30 AND SAL >= 1600;

-- 2)직무가 'MANAGER' 또는 'ANALYST'인 사원을 출력하시오.
SELECT * FROM EMP
WHERE JOB = 'MANAGER' OR JOB = 'ANALYST';
-- 문자열이므로 따옴표 필수 사용

-- 3)부서번호가 10 또는 20이고, 직무가 'CLERK'인 사원만 조회하시오.
SELECT * FROM EMP
WHERE (DEPTNO = 10 OR DEPTNO = 20) AND JOB = 'CLERK';

-- 4)급여가 1500 이상이고 커미션이 NULL이 아닌 사원만 조회하시오.
-- 힌트) 커미션이 NULL이 아닌 : COMM IS NOT NULL
SELECT * FROM EMP
WHERE SAL >= 1500 AND COMM IS NOT NULL;

-- 5) 직무가 ‘SALESMAN’이거나, 급여가 3000 이상인 사원을 출력하시오.
SELECT * FROM EMP
WHERE JOB = 'SALESMAN' OR SAL >= 3000;

-- 6) 부서번호가 10, 20, 30 중 하나이고, 급여가 2000 이상인 사원을 출력하시오.
-- 힌트) 10, 20, 30 중 하나 : IN (10, 20, 30)
SELECT * FROM EMP
WHERE DEPTNO IN(10,20,30) AND SAL >= 2000;


