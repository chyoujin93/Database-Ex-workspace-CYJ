-- ORDER BY 문장 해석 연습 (3문제)
-- 문제 1
-- EMP 테이블에서 사원명과 부서번호를 부서번호 기준으로 내림차순 정렬하시오.
-- 👉 작성할 것은:
SELECT ENAME, DEPTNO FROM EMP
ORDER BY DEPTNO DESC;

-- 문제 2
-- EMP 테이블에서 부서번호와 직무를 기준으로 오름차순 정렬하여 출력하시오.
-- 👉 포인트:
-- 정렬 기준 컬럼이 몇 개인지
-- 우선순서
SELECT * FROM EMP
ORDER BY DEPTNO, JOB;



-- 문제 3
-- EMP 테이블에서 사원명, 급여, 부서번호를 출력하되
-- 부서번호 오름차순, 급여 내림차순으로 정렬하시오.
-- 👉 포인트:
-- 출력 컬럼
-- 정렬 기준 순서
SELECT ENAME, SAL, DEPTNO FROM EMP
ORDER BY DEPTNO ASC, SAL DESC;