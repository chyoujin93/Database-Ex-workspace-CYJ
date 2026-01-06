SELECT sysdate
, sysdate-1, sysdate +1
FROM dual;

SELECT sysdate
, add_months(sysdate,1)
FROM dual;
--현재날짜+1일


-- emp테이블, 입사 20주년 되는 날짜를 구하시오.
-- 표시는 사번, 이름, 입사일, 20주년일
select empno, ename, HIREDATE
, add_months(HIREDATE, 240) as "20주년" FROM emp;

SELECT ename, HIREDATE from emp 
WHERE add_months(hiredate, 480) < sysdate;
--40주년

SELECT ename, HIREDATE, months_between(HIREDATE,sysdate)
from emp ;

select sysdate, next_day(sysdate, '월요일') from dual;

select sysdate
, next_day(sysdate, '월요일') 
, last_day(sysdate) from dual;

select 
    to_char(1)
    , 1
    , '1'
    , empno
    , '사번: ' || empno
    , '사번: ' || to_char(empno)
from emp;
--날짜 데이터를 문자열 데이터로 변환

SELECT 
to_char(sysdate, 'YYYY') || '년'
,to_char(sysdate, 'MM') || '월'
,to_char(sysdate, 'DD') || '일'
,to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS')
,to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS')
,to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS')
from dual;

SELECT 
    TO_CHAR(SAL, '$999,999')
    , ENAME
FROM EMP;
--달려화폐로 표시(문자형식)

SELECT 
    TO_CHAR(SAL, 'L999,999')
    , ENAME
    , TO_CHAR(121211321, 'L999,999,999')
    , LENGTH(SAL)
FROM EMP
ORDER BY LENGTH(SAL) DESC;
--원화표시

SELECT
    TO_NUMBER('1,333', '999,999') +1
FROM EMP;

SELECT TO_DATE('2024-08-14', 'YYYY-MM-DD') AS TODATE1,
    TO_DATE('2024/08/14', 'YYYY/MM/DD') AS TODATE2
FROM DUAL;

-- 최초 입사자와 각각 입사자의 근무일차를 구하시오
-- 사번, 이름, 입사일, 차이일

SELECT EMPNO, ENAME, HIREDATE
FROM EMP
ORDER BY HIREDATE;
-- 최초입사자: 7369_SMITH_1980-12-17
-- 1. 최초입사자, 그 일자를 카피(문자), 날짜 - 날짜
-- 2. 그렇다면.. 최초입사자와 1년이상 차이나는 사람을 조회
SELECT EMPNO, ENAME, HIREDATE
, HIREDATE - TO_DATE('1980-12-17')
FROM EMP;

SELECT EMPNO, ENAME, HIREDATE
, HIREDATE - TO_DATE('1980-12-17') 
FROM EMP
WHERE HIREDATE - TO_DATE('1980-12-17') >= 365 
ORDER BY HIREDATE;

SELECT
    NVL(COMM, 0) 
FROM EMP;
-- COMM이 NULL이면 값을 0으로(숫자만 가능) 채운다. 

SELECT
    NVL(ENAME, 1)
FROM EMP;
-- 1번째 인자의 데이터타입으로 맞춰야함. 
-- ENAME의 경우에는 컨버젼이 자동으로 돼서 실행된것임.

SELECT 1, '3' FROM DUAL
UNION ALL
SELECT 1, 'A' FROM DUAL;
-- 인자수와 데이터타입이 동일해야함. 

SELECT
    NVL(COMM, 0) +1 
    ,NVL2(COMM, COMM, 10) 
    ,COMM
FROM EMP;

SELECT EMPNO, ENAME, COMM
    , NVL2(COMM, 'O', 'X') "NVL2"
    , DECODE(COMM, 
    0, 'X', 
    NULL, 'X', 
    'O') "DECODE"
    , NVL2(COMM, SAL*12+COMM, SAL*12) AS ANNSAL
FROM EMP;
-- NVL2는 데이터타입이 달라도 되지만, 2번째, 3번째 인자는 동일해야함.


-- ▼ DECODE문 (콤마로만 구분해서 사용)
SELECT EMPNO, ENAME, JOB, SAL,
DECODE(JOB
    ,'MANAGER', SAL*1.1
    ,'SALESMAN', SAL*1.05
    ,'ANALYST', SAL
    , SAL*1.03) AS UPSAL
FROM EMP;

-- ▼ CASE문 (콤마가 없고 WHEN, THEN, END 사용)
SELECT EMPNO, ENAME, JOB, SAL,
    CASE JOB 
        WHEN 'MANAGER' THEN SAL*1.1
        WHEN 'SALESMAN' THEN SAL*1.05
        WHEN 'ANALYST' THEN SAL
        ELSE SAL*1.03
    END AS UPSAL
FROM EMP;

-- → 동일한 결과값 산출됨. CASE문이 최근에 생성된 함수. 기능이 하나더 있음.
SELECT EMPNO, ENAME, JOB, SAL,
    CASE 
        WHEN JOB = 'MANAGER' THEN 1
        WHEN ENAME = 'SMITH' THEN 2
        ELSE 4
    END AS UPSAL
FROM EMP;
-- CASE문은 이렇게도 사용가능 

SELECT EMPNO, ENAME, JOB, SAL,
    CASE COMM 
        WHEN NULL THEN 'X'
        WHEN 0 THEN 'X'
        ELSE 'O'
    END AS UPSAL
FROM EMP;

SELECT EMPNO, ENAME, JOB, SAL, COMM,
    CASE 
        WHEN JOB = 'MANAGER' THEN 1
        WHEN ENAME = 'SMITH' THEN 2
        WHEN COMM IS NULL THEN 3
        ELSE 4
    END AS UPSAL
FROM EMP;

SELECT EMPNO, ENAME, COMM,
    CASE   
        WHEN COMM IS NULL THEN '해당 사항 없음'
        WHEN COMM = 0 THEN '수당 없음'
        WHEN COMM > 0 THEN '수당 : ' || COMM
        WHEN COMM > 0 THEN TO_CHAR(COMM)
    END AS COMM_TEXT 
FROM EMP;

-- 4교시: 오전에 했던 내용 모두다 정리 20분

-- 테이블정보, 제약조건(널 허용 가능한지 안되는지 등..) 확인해야함. 알고 해야함.

-- 179페이지 되새김문제 (시험문제는 이거보다 조금 쉽고, 실습보단 조금 어려움)
-- 1.
SELECT EMPNO
, RPAD(SUBSTR(EMPNO,1,2), LENGTH(EMPNO), '*') "MASKING_EMPNO" --사번앞2자리만 보여주고 나머지는 *
, ENAME
, RPAD(SUBSTR(ENAME,1,1), LENGTH(ENAME), '*') "MASKING_ENAME" --이름앞1자리만 보여주고 나머지는 *
FROM EMP
WHERE LENGTH(ENAME) >= 5 AND LENGTH(ENAME) < 6; --이름길이가 5글자인 사람만 조회
-- WHERE LENGTH(ENAME) = 5;

-- RPAD(문자열, 최종길이, 채울문자)
-- LPAD(문자열, 최종길이, 채울문자)
-- INSTR(문자열, 찾을문자, 시작위치, 몇번째)

-- 2.
SELECT EMPNO, ENAME, SAL 
, TRUNC(SAL/21.5,2) DAY_PAY
, ROUND((SAL/21.5)/8,1) TIME_PAY
FROM EMP;


-- 3. 
SELECT EMPNO, ENAME
, TO_CHAR(HIREDATE, 'DD/MM/YY') HIREDATE
, TO_CHAR(ADD_MONTHS(HIREDATE, 3), 'YYYY-MM-DD') R_JOB
, DECODE(COMM,
    NULL, 'N/A',
    0, 'N/A',
    COMM) COMM
FROM EMP;

-- 4. 
SELECT EMPNO, ENAME, MGR
, CASE
    WHEN MGR IS NULL THEN '0000'
    WHEN SUBSTR(MGR,1,2)= '75' THEN '5555'
    WHEN SUBSTR(MGR,1,2)= '76' THEN '6666'
    WHEN SUBSTR(MGR,1,2)= '77' THEN '7777'
    WHEN SUBSTR(MGR,1,2)= '78' THEN '8888'
    ELSE TO_CHAR(MGR) 
    END AS "CHG_MGR"
FROM EMP;







-- 07-2
-- 소수점2자리 반올림
SELECT ROUND(AVG(SAL),2), '10' AS DEPTNO FROM EMP WHERE DEPTNO = 10
UNION ALL
SELECT ROUND(AVG(SAL),2), '20' FROM EMP WHERE DEPTNO = 20
UNION ALL
SELECT ROUND(AVG(SAL),2), '30' FROM EMP WHERE DEPTNO = 30;

SELECT ROUND(AVG(SAL),2) 부서별_평균급여, DEPTNO FROM EMP 
GROUP BY DEPTNO;

SELECT DEPTNO, SUM(SAL)
FROM EMP 
WHERE DEPTNO IN (10,20)
GROUP BY DEPTNO 
    HAVING SUM(SAL) = 10875;



-- 7장 되새김 문제
-- 1.
SELECT DEPTNO, TRUNC(AVG(SAL)), MAX(SAL), MIN(SAL), COUNT(*) 
FROM EMP
GROUP BY DEPTNO;

-- 2.
SELECT JOB, COUNT(*) FROM EMP 
GROUP BY JOB
HAVING COUNT(*) >= 3;

-- 3.
SELECT TO_CHAR(HIREDATE, 'YYYY'), DEPTNO, COUNT(*) FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO;

-- 4.
SELECT 
    NVL2(COMM, 'O', 'X') AS EXIST_COMM 
    , COUNT(*) AS CNT 
FROM EMP 
GROUP BY NVL2(COMM, 'O', 'X');

-- 10-1
CREATE TABLE DEPT_TEMP
    AS SELECT * FROM DEPT;




-- 10 되새김 문제
CREATE TABLE CHAP10HW_EMP AS SELECT * FROM EMP;
CREATE TABLE CHAP10HW_DEPT AS SELECT * FROM DEPT;
CREATE TABLE CHAP10HW_SALGRADE AS SELECT * FROM SALGRADE;

SELECT * FROM CHAP10HW_DEPT;


UPDATE CHAP10HW_DEPT
    SET DEPTNO = 'ORACLE',
        LOC = 'BUSAN'
    WHERE DEPTNO = 50;