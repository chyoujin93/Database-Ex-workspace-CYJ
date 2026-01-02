--실습1. 급여가 3000이상인 직원만 조회하시오.
SELECT * from EMP
where SAL >= 3000;

--실습2. EMP 테이블에서 이름(ENAME), 급여(SAL), 부서번호(DEPTNO)만 조회하시오.
SELECT ENAME, SAL, DEPTNO FROM EMP;

--실습3. 20번 부서의 사원 이름과 급여를 조회하시오.
--+ 추가 부서번호(DEPTNO), 상여금(comm) 
SELECT ENAME, SAL, DEPTNO, comm FROM EMP
WHERE DEPTNO = 20;

--예약어는 대문자 권장, 소문자도 인식은 됨. 
--단, 따옴표 쓸 경우, 대소문자 가림.

