SELECT count(*) from emp e;
-- 14 
SELECT * FROM(
SELECT 
    ROWNUM RN
    , t1.* 
from (SELECT e.* 
      from emp e
      order by sal
      ) t1 
    ) T2
where RN BETWEEN 6 and 10
;
-- 페이징(11버전~) ROWNUM의 특성파악하기 
-- WHERE, 서브쿼리, 오더바이, ROWNUM 한번에 파악가능


SELECT ROWNUM, e.* from emp e
-- where rownum BETWEEN 1 and 5
order by sal
;
-- 왜 안되는지 알려주실 예정


SELECT 
    e.* 
from emp e
order by sal
FETCH NEXT 5 rows only;
-- 오라클12에서 실행됨 
-- 방식 알고 있어야 함. 다른 버전에서 해보기.


-- 시퀀스_순번생성기 (아끼지 않고 필요한대로 많이 쓰면 됨)
-- 

-- select max (empno) + 1 from emp;
-- a += 1

INSERT into emp(empno,hiredate) 
values(( select max (empno) +1 from emp ), SYSDATE);

SELECT * from emp
ORDER by empno;

-- 13-28
CREATE SEQUENCE seq_dept_SEQUENCE
increment by 10
start with 10
maxvalue 90
minvalue 0
nocycle
cache 2;
-- 시퀀스 생성

-- 13-29
SELECT * from USER_SEQUENCES;
-- 생성한 시퀀스 확인

-- 13-30
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');
SELECT * FROM DEPT_SEQUENCE
ORDER BY DEPTNO;

SHOW USER;


-- 되새김문제
-- 1
CREATE TABLE EMPIDX
 AS SELECT * FROM EMP 
 WHERE 1<>1;

SELECT * FROM EMPIDX;

CREATE INDEX IDX_EMPIDX_EMPNO 
ON EMPIDX(EMPNO);

SELECT index_name, table_name, uniqueness, status
FROM user_indexes
WHERE table_name IN ('EMP', 'EMPIDX')
ORDER BY table_name, index_name;

-- 
CREATE VIEW VW_EMP20
    AS (SELECT EMPNO, ENAME, JOB, DEPTNO
        FROM EMP 
        WHERE DEPTNO = 20);
        -- 실습13-15. 뷰 생성

        SELECT * FROM USER_VIEWS;

-- 2
CREATE VIEW EMPIDX_OVER15K
    AS (SELECT EMPNO, ENAME, JOB, DEPTNO, SAL, 
        NVL2(COMM,'O','X') COMM
        FROM EMPIDX
        WHERE SAL > 1500);

SELECT * FROM USER_VIEWS;

SELECT * FROM EMPIDX_OVER15K;