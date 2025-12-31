-- 샘플 emp 테이블 조회 해보기
-- vscode에서 실행하는 방법 , 한문장 단위 실행 : ctrl + enter
-- 주의사항, 최초 실행시, vscode 측에서, 서버를 선택하는 메뉴가 나오면, 
-- 이전에 설치한 연결 설정을 선택하기. 
select * from emp; 

--현재 시간 조회 
select sysdate from dual;

--
-- ① 셀렉션 (Selection) – 행 중심 조회  
-- 특정 조건을 만족하는 **행(Row)**만 조회
-- sql
-- SELECT * : 해당 테이블의 모든 컬럼을 조회 
-- FROM EMP : 조회할 테이블명 
-- WHERE 컬럼명 = 값;  : 조건을 만족하는 문구
-- 예시) WHERE JOB = 'MANAGER';
-- 해석: emp 테이블에서, 조건 job 컬럼의 값이 manager 인 사원을 찾는다. 

-- 찾을 때 보고 싶은 열은 모든 컬럼. 
SELECT * FROM EMP
WHERE JOB = 'MANAGER';

-- 보고싶은 열, ENAME 사원 이름, SAL 급여
SELECT ENAME, SAL FROM EMP

-- 보고싶은 모든 열
SELECT * FROM EMP;

--보고싶은 열: ENAME 사원이름, SAL 급여
SELECT ENAME, SAL FROM EMP
WHERE SAL > 2000;

--실습1. 급여가 3000이상인 직원만 조회하시오.
SELECT ENAME, SAL FROM EMP
WHERE SAL >= 3000;

--실습2. EMP 테이블에서 이름(ENAME), 급여(SAL), 부서번호(DEPTNO만 조회하시오.
SELECT ENAME, SAL, DEPTNO FROM EMP;

--실습3. 20번 부서의 사원 이름과 급여를 조회하시오.
SELECT ENAME, SAL FROM EMP
WHERE DEPTNO = 20;