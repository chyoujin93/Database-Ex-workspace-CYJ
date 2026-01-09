-- 
SELECT * from emp 
where sal in (select max(sal) 
                from emp 
                GROUP by deptno);

-- 
SELECT max(sal) from emp 
GROUP by deptno;

-- 
SELECT * from emp 
where sal < any (select sal from emp 
                    WHERE deptno=30)
order by sal, empno;

-- 
SELECT * from emp 
where sal = any (select max(sal)
                    from emp 
                    group by deptno);

-- 
SELECT * from emp 
where sal = some (select max(sal)
                    from emp 
                    GROUP by deptno);

-- 
SELECT sal from emp 
where deptno = 30 ;

-- 
SELECT * from emp 
where sal > any (select sal from emp 
                WHERE deptno = 30);


-- -- some, any 연산자 체크

-- 
SELECT * from emp 
where sal < all (select sal from emp 
                where deptno = 30);

-- 
SELECT * from emp  
WHERE sal > all (select sal from emp 
                where deptno = 30);

-- 
SELECT * from emp 
where EXISTS (select dname from dept 
                WHERE deptno = 10);

-- 
SELECT * from emp 
where exists (select ename from emp 
                where deptno = 50);
-- 서브쿼리 결과값이 없어서 안나옴

-- 
SELECT * from emp 
WHERE HIREDATE < all (select HIREDATE
            from emp 
            where deptno = 10);

-- 
SELECT * from emp 
where (deptno, sal) in (select deptno, max(sal) from emp
                        GROUP by deptno);