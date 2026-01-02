-- 실습7
-- 1)이름이 'SCOTT'인 사원을 대소문자 구분 없이 찾으시오.
SELECT * FROM EMP
WHERE UPPER(ENAME) = 'SCOTT';

-- 2)이름의 길이가 5 이상인 사원만 출력하시오.
SELECT * FROM EMP
WHERE LENGTH(ENAME) >= 5;

-- 3)직무에서 'S' 문자가 포함된 행만! 출력하시오.
-- 힌트) INSTR(JOB, 'S')
SELECT JOB FROM EMP
WHERE INSTR(JOB, 'S') > 0;
--> JOB만 출력

SELECT JOB, INSTR(JOB, 'S') 
AS S_POSITION FROM EMP
WHERE INSTR(JOB, 'S') > 0;
--> JOB이랑 위치도 같이 출력

SELECT JOB, 
INSTR(JOB, 'S') 
AS S_POS FROM EMP;
--> 모든 행을 출력함.
