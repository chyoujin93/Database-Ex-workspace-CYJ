--1. 단일 열에서 중복 제거(직무)
SELECT DISTINCT JOB FROM EMP;
--ALL 생략이 된 상태.
SELECT JOB FROM EMP;

--2. 다중 열에서 중복 제거(직무, 부서번호 **조합**으로)
SELECT DISTINCT JOB, DEPTNO FROM EMP;
-- DISTINCT 제거할 경우,
-- 직무/부서번호 **조합**으로 중복 제거 안됨.
SELECT JOB, DEPTNO FROM EMP;



--실습2-1. 직무목록 중복없이 출력(직무)
--정답: 직무 5개 출력됨
SELECT DISTINCT JOB FROM EMP;

--실습2-2. 직무+부서번호 조합의 고유 데이터 추출(직무, 부서번호)
SELECT DISTINCT JOB, DEPTNO FROM EMP;

--실습2-3. 중복 포함하여 전체 출력(직무, 부서번호)
SELECT JOB, DEPTNO FROM EMP;

--실습2-4. EMP 테이블에서 중복되지 않는 부서번호만 출력하시오
SELECT DISTINCT DEPTNO FROM EMP;

--실습2-5. EMP 테이블에서 사원 직무와 부서번호 조합이 고유한 결과만 출력하시오
SELECT DISTINCT JOB, DEPTNO FROM EMP;

--실습2-6. EMP 테이블에서 중복 없이 사원의 급여를 조회하시오.
SELECT DISTINCT SAL FROM EMP;

--실습2-7. EMP 테이블에서 직무, 부서번호, 급여 조합이 고유한 행만 조회하시오.
SELECT DISTINCT JOB, DEPTNO, SAL FROM EMP;