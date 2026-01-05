-- ```sql
SELECT empno, ename, sal, deptno
FROM EMP
minus
SELECT empno, ename, sal, deptno
FROM EMP
where deptno = 10;

-- ```

-- ```sql
-- emp 테이블, 
comm이 없고, 
직책이 MANAGER, CLERK  인 사람중, 이름에 두번째 글자에 L이 아닌 사람
-- 조회 하시오.  
select * from emp
where COMM IS NULL
AND JOB IN ('MANAGER', 'CLERK')
AND ENAME NOT LIKE '_L%';
-- ```

-- ```sql
emp 테이블, ename에 "sc" 이란 문자가 포함된 데이터를 조회 하시오.
(단 : 문자를 변경하지 않고 )
SELECT ename, upper(ename), lower(ename), initcap(ename)
FROM EMP
;
select ename from emp
where ename like upper('%sc%');

select ename, upper('s') as alliastest 
from emp
where deptno=20;



emp 테이블에서 이름과 이름의 길이를 표시하되 
단 이름의 길이가 5이하 인것만 표시하시오.
select ename, LENGTH(ename)
from emp
where LENGTH(ename) <= 5;

select LENGTH('한글'), LENGTHb('한글') 
from dual;

select  INstr('HELLO, ORACLE!','L',5)
, INstr('HELLO, ORACLE!',',')
, substr('HELLO, ORACLE!',1, INstr('HELLO, ORACLE!',',')-1)
from DUAL;

-- emp 테이블, 사원명 중에 's'가 포함된 사원들을 조회 하시오.
select * from emp
where ename like upper('%s%');
-- 010-1234-5678 -> '01012345678'
-- '01012345678' -> '1234' , '5678'
-- 010-1234-5678 -> '1234' , '5678'
select '010-1234-5678'  
, replace('010-1234-5678','-', '')
, substr('010-1234-5678',instr('010-1234-5678','-'),4)
, substr('010-1234-5678',10,4)
, instr('010-1234-5678','0-1234-5')
from DUAL;
-- 
select '010-1234-5678', '790126-111111'
    , rpad(
        substr('010-1234-5678',1, instr('010-1234-5678','-',1,2)),
        length('010-1234-5678'), /* 길이 */
        '#') /* 대체할 문자*/
from DUAL;

-- '사번:1111 성명:scott'
select concat(empno,ename) 
, concat(concat('사번:',empno) , concat(' 성명:',ename))
from emp;

select concat(empno,ename) 
, '사번:'||empno||' 성명:'||ename
from emp;


select '[' || ' _oracle_ ' ||']' 
, '[' || trim(' _oracle_ ') ||']'
from dual;
select 
      sal/3 
    , sal/3
from emp;

--주석.

select
    round(sal/3,2)
    , trunc(sal/3,2)
     , mod(empno,2) --주석.
from emp
where mod(empno,2) = 0;