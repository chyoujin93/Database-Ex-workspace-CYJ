SELECT deptno, sal
FROM emp
WHERE deptno = 10
UNION
SELECT deptno, sal
FROM emp
WHERE deptno = 20
ORDER BY deptno;

SELECT empno, deptno, sal
FROM emp
WHERE deptno = 10
UNION
SELECT empno, deptno, sal
FROM emp
WHERE deptno = 20
ORDER BY deptno;


SELECT empno, ename, sal, deptno
FROM emp
MINUS
SELECT empno, ename, sal, deptno
FROM emp
WHERE deptno = 10;

SELECT empno, ename, sal, deptno
FROM emp
WHERE deptno != 10;

SELECT * from emp
WHERE ename like '%S';

SELECT * from emp
where deptno = 30 AND job = 'SALESMAN';

SELECT * from emp
where deptno IN(20,30) AND SAL > 2000;

SELECT * from emp
where SAL BETWEEN 2000 AND 3000;

SELECT * from emp
where SAL < 2000 OR SAL > 3000 ;

SELECT * from emp
WHERE (ENAME LIKE '%E%' AND DEPTNO = 30)
AND SAL NOT BETWEEN 1000 AND 2000;

SELECT * from emp
WHERE (ENAME LIKE '%E%' AND DEPTNO = 30)
AND (SAL < 1000 OR SAL > 2000);

SELECT * from emp
WHERE ENAME LIKE '%E%' 
AND (SAL < 1000 OR SAL > 2000)
AND DEPTNO = 30;

SELECT * from emp
WHERE (COMM IS NULL
AND JOB IN('MANAGER', 'CLERK'))
AND NOT ENAME LIKE '_L%';

-------------------------------------------
SELECT ENAME,
UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
FROM EMP;
-------------------------------------------
--EMP테이블, ENAME에 'scott' 문자 변경하지 않고 조회.
SELECT ename from emp
where ename = UPPER('scott');

SELECT ename from emp
where lower(ename) = 'scott';
-------------------------------------------
--EMP테이블, ENAME에 'sc'이란 문자가 포함된 데이터를 조회.
--단, 문자를 변경하지 않고
SELECT ENAME FROM EMP
WHERE ENAME LIKE UPPER('%sc%');

SELECT 10, deptno from emp
where deptno = 20;

SELECT upper('%sc%') FROM dual;
-------------------------------------------
--emp테이블에서 이름은 소문자, 직책은 대문자로 조회.ALTER
SELECT lower(ename) "ENAME(소문자)", upper(job) "JOB(대문자)" from emp;
-------------------------------------------
SELECT LENGTH('%sc%')+8 as len from dual;
--emp테이블에서 이름과 이름의 길이를 표시하고, 
--단, 이름의 길이가 5 이하 인것만 표시.

SELECT ENAME, LENGTH(ename) "이름의 길이" from emp
WHERE length(ename) <= 5;

SELECT 1 + '1' from dual;

SELECT 1 || 'A' from dual;