-- 8장 되새김문제
-- 1.
-- 표준문법
SELECT d.deptno, d.dname, e.empno, e.ename, e.sal
from emp e 
join dept d 
on e.deptno = d.deptno
where e.SAL > 2000 ;
-- 이전방식
SELECT d.deptno, d.dname, e.empno, e.ename, e.sal
from emp e, dept d 
WHERE e.deptno = d.deptno
AND e.SAL > 2000 ;

-- 2. 
-- 표준문법
SELECT 
  d.deptno
, d.dname
, trunc(avg(e.sal)) AVG_SAL
, max(e.sal) MAX_SAL 
, min(e.sal) MIN_SAL 
, count(*) CNT
from emp e 
join dept d 
on e.deptno = d.DEPTNO
group by d.deptno, d.dname;
-- 이전방식
SELECT 
  d.deptno
, d.dname
, trunc(avg(e.sal)) AVG_SAL
, max(e.sal) MAX_SAL 
, min(e.sal) MIN_SAL 
, count(*) CNT
from emp e, dept d 
WHERE e.deptno = d.DEPTNO
group by d.deptno, d.dname;

-- 3. 
-- 표준문법
SELECT 
  d.deptno
, d.dname
, e.empno 
, e.ename 
, e.job 
, e.sal 
from dept d 
left outer join emp e 
on d.deptno = e.deptno 
ORDER by deptno, dname;
-- 이전방식
SELECT 
  d.deptno
, d.dname
, e.empno 
, e.ename 
, e.job 
, e.sal 
from dept d, emp e 
where d.deptno = e.deptno(+)
ORDER by deptno, dname;

-- 4. 
-- 표준문법
SELECT 
d.deptno, d.dname
, e.EMPNO, e.ename, e.MGR, e.SAL, e.deptno
, s.losal, s.HISAL, s.grade
, m.empno MGR_EMPNO, m.ename MGR_ENAME
from DEPT D 

left OUTER join emp e 
on d.deptno = e.deptno

left OUTER join SALGRADE s
on e.sal BETWEEN s.losal and s.hisal

left OUTER join emp m
on e.mgr = m.empno

ORDER BY d.deptno, e.empno
;
-- 수업.문제풀이 
SELECT
    e.ename
    , e.mgr
    , e2.empno
    , d.*
from dept d
    , emp e
    , emp e2
    , SALGRADE s 
where d.deptno = e.deptno(+)
and e.mgr = e2.empno(+)
and e.sal BETWEEN s.losal(+) and s.hisal(+)
;

