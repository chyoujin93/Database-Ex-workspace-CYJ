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

SELECT 1 || 'A' "1A" from dual;

SELECT ENAME, LENGTH(ename) from emp
WHERE length(ename) <= 5;

SELECT length('한글'), lengthb('한글')
from dual;
--1글자당 3바이트 / ex. 10바이트 = 3글자가능, 10 = 10글자가능
-----------------------------------------------------------
--SUBSTR:문자열 일부 추출(문자열데이터,시작위치,추출길이)
SELECT JOB, SUBSTR(JOB,1,2), SUBSTR(JOB,3,2), SUBSTR(JOB,5),
length(substr(job,5,length(job)-5)) FROM EMP;
--오류나는 프로그램도 있음.

SELECT job, substr(job,-length(job)) from emp;
-----------------------------------------------------------
--instr
SELECT job, instr(job, 'K') from emp;

SELECT instr('HELLO, ORACLE!', 'L') from dual;

SELECT instr('HELLO, ORACLE!', 'L', 5) from dual;
--세번째 파라미터는 옵션. 5번쨰부터 찾는다

SELECT instr('HELLO, ORACLE!', 'L', 2,2) from dual;
--두번째부터 찾는다, 두번째로 나타나는 L.

SELECT instr('HELLO, ORACLE!', 'L', 5) 
, instr('HELLO, ORACLE!',',')
, substr('HELLO, ORACLE!', 1, instr('HELLO, ORACLE!',',')-1)
from dual;

--emp테이블에서, 사원명 중에 's'가 포함된 사원들을 조회.
select ename from emp
WHERE ename like upper('%s%');

select ename from emp 
where instr(ename, upper('s')) > 0;

select instr(ename, upper('s')) ename from emp 
where instr(ename, upper('s')) > 0;
-----------------------------------------------------------
--replace
select ename, replace(ename, 'S', '!') from emp;

-- 010-1234-5678 -> 01012345678
SELECT '010-1234-5678', replace('010-1234-5678', '-', '') from dual;

-- 01012345678 -> '1234', '5678'
SELECT '010-1234-5678', 
substr('010-1234-5678',5,4) "1234", 
substr('010-1234-5678', 10) "5678" 
from dual;

SELECT '010-1234-5678', 
substr('010-1234-5678', 
instr('010-1234-5678', '-'),5) "1234", 
substr('010-1234-5678', 10) "5678" 
from dual;
-----------------------------------------------------------
--LPAD, RPAD
SELECT '010-1234-', '931111-2'
,LPAD('12345',10,'#')
,RPAD('12345',10,'#')
,RPAD('12345',3,'#')
FROM DUAL;

SELECT '010-1234-', '931111-2'
,RPAD('010-1234-',13,'*')
,RPAD('931111-2',14,'*')
FROM DUAL;

SELECT '010-1234-5678' 전체,
       RPAD(
         SUBSTR('010-1234-5678', 1, 
         INSTR('010-1234-5678', '-', 1, 2)),
         LENGTH('010-1234-5678'),
         '#')  부분비공개
FROM DUAL;


SELECT PHONE, JUMIN
, RPAD(SUBSTR(PHONE,1,INSTR('010-1234-5678','-',1,2))
, LENGTH(PHONE),'#')
FROM DUAL;

--CONCAT
SELECT CONCAT('사번:', EMPNO)||CONCAT(' 성명:', ENAME)
FROM EMP;

SELECT CONCAT(CONCAT('사번:', EMPNO),CONCAT(' 성명:', ENAME))
FROM EMP;

SELECT CONCAT(EMPNO, ENAME), '사번:'||EMPNO||' 성명:'||ENAME
FROM EMP;
-----------------------------------------------------------
--TRIM, LTRIM, RTRIM: 특정문자 지우기

SELECT '[' || ' _oracle_ ' ||']'
, trim('[ _oracle_ ]')
from dual;
-----------------------------------------------------------
--round:반올림  trunc:버림
--CEIL:,     FLOOR:,    MOD:나머지
SELECT 
    ROUND(SAL/3,2)
    , TRUNC(SAL/3,2)
    , MOD(EMPNO,2)
FROM EMP
WHERE MOD(EMPNO,2) = 0; --사번이 짝수인 사람만 출력 

-----------------------------------------------------------
--WEERE절 숨쉬듯이. 조회할 행을 선별하기 위한 조건식.
--단일행함수, 존재는 알아야함. 
--SELECT는 조회할 열이름. 
--가급적OR사용자제, 쓸때는 검산.(되도록IN사용)
--비트윈/등호사용
--인풋,파라메터,인수,알규멘트
--SUBSTR,INSTR중요
--콘캣=||
-----------------------------------------------------------
/* 다중행 주석. 중간에 단일주석때도 이걸로 쓰는게 좋음 */
--6-3장_154페이지까지 진행/ 내일 6장마무리~7장, 모레 7장, 8장~