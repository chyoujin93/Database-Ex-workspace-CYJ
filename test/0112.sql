SELECT * FROM DBA_USERS
WHERE USERNAME = 'SYSTEM';

DROP TABLE EMP;
DROP TABLE DEPT;

CREATE TABLE DEPT(
    DEPTNO VARCHAR2(6) PRIMARY KEY,
    DNAME VARCHAR2(10) UNIQUE,
    AREA VARCHAR2(10)
);

DESC DEPT;

INSERT INTO DEPT 
VALUES (101, '영업부', NULL);
INSERT INTO DEPT 
VALUES (102, '총무부', NULL);
INSERT INTO DEPT 
VALUES (103, '기획부', NULL);
INSERT INTO DEPT 
VALUES (104, '홍보부', NULL);

SELECT * FROM DEPT;  

CREATE TABLE EMP(
    EMPNO NUMBER PRIMARY KEY,
    NAME VARCHAR2(10) UNIQUE,
    DEPTNO VARCHAR2(6) REFERENCES DEPT(DEPTNO),
    POSITION VARCHAR2(10),
    PAY NUMBER NOT NULL,
    PEMPNO NUMBER
);

DESC EMP;

INSERT INTO EMP 
VALUES('1001', '홍길동', 101, '부장', 450, NULL);
INSERT INTO EMP 
VALUES('1002', '김연아', 102, '부장', 400, NULL);
INSERT INTO EMP 
VALUES('1003', '박지성', 101, '과장', 350, 1001);
INSERT INTO EMP 
VALUES('1004', '김태근', 103, '과장', 410, NULL);
INSERT INTO EMP 
VALUES('1005', '서찬수', 101, '대리', 300, 1003);
INSERT INTO EMP 
VALUES('1006', '김수현', 103, '대리', 400, 1004);
INSERT INTO EMP 
VALUES('1007', '정동민', 102, '대리', 320, 1002);
INSERT INTO EMP 
VALUES('1008', '이성규', 102, '사원', 380, 1007);
INSERT INTO EMP 
VALUES('1009', '임진영', 103, '사원', 250, 1006);
INSERT INTO EMP 
VALUES('1010', '서진수', 101, '사원', 200, 1005);

SELECT * FROM EMP;

-- 1. EMP테이블에 데이터 추가 
INSERT INTO EMP 
VALUES('1011', '이순신', 104, '부장', 500, NULL);

SELECT * FROM EMP;

-- 2. dept 테이블에 area 필드의 값을 영업부는 서울, 나머지는 부산으로 값을 업데이트하라.
UPDATE DEPT
SET AREA = '서울'
WHERE DNAME = '영업부';

UPDATE DEPT
SET AREA = '부산'
WHERE DNAME != '영업부';

SELECT * FROM DEPT;

-- 3. emp 테이블에서 부서 이름이 홍보부인 데이터를 삭제하라. 
-- 홍보부는 104번 -> 이순신
DELETE FROM EMP E
WHERE E.DEPTNO IN (SELECT D.DEPTNO FROM DEPT D
                    WHERE DNAME = '홍보부');
SELECT * FROM EMP;


-- 4. emp 테이블을 사용하여 이름,  급여, 세금을 출력하라. 
-- 단 세금은 급여가 0-200이면 급여의 5%, 201-300이면 급여의 10%, 
-- 301-400 이면 급여의 15%, 나머지는 급여의 20%로 지정한다.
-- (case문, decode문 각각 2가지로 작성.)
SELECT * FROM EMP;
-- CASE문
SELECT NAME, PAY,
CASE 
WHEN PAY BETWEEN 0 AND 200 THEN PAY*0.05
WHEN PAY BETWEEN 201 AND 300 THEN PAY*0.1
WHEN PAY BETWEEN 301 AND 400 THEN PAY*0.15
ELSE PAY*0.2
END AS TAX
FROM EMP;
-- DECODE문
SELECT NAME, PAY
, DECODE (PAY
, BETWEEN 0 AND 200, PAY*0.05
, BETWEEN 201 AND 300, PAY*0.1
, BETWEEN 301 AND 400, PAY*0.15
, PAY*0.2) AS TAX
FROM EMP;
SELECT * FROM EMP;
-- 5. 영업부 직원과 총무부 직원의 이름, 부서명, 직급을 
-- 이름순으로 오름차순으로 출력하라.
SELECT E.NAME, D.DNAME, E.POSITION
FROM EMP E 
JOIN DEPT D
ON E.DEPTNO = D.DEPTNO 
WHERE DNAME IN('영업부','총무부')
ORDER BY NAME;

-- 6. emp 테이블을 이용하여 사원의 이름과 직속상관의 이름을 출력하라. 
-- 단 직속상관이 없는 경우 null이 표시되도록 하라.
SELECT E1.NAME, E2.NAME PEMPNAME 
FROM EMP E1 LEFT JOIN EMP E2 
ON E1.PEMPNO = E2.EMPNO;


SELECT * FROM EMP;
SELECT * FROM DEPT;

-- 7. 부서별 급여의 평균이 350 이상인 부서의 부서명, 급여의 평균을 구하라.
SELECT D.DNAME, AVG(E.PAY) 
FROM DEPT D JOIN EMP E 
ON D.DEPTNO = E.DEPTNO
GROUP BY D.DNAME
HAVING AVG(E.PAY) >= 350
;

-- 8. emp 테이블에서 각 부서별 급여가 가장 높은 사람의 
-- 이름, 부서명, 급여를 출력하라(sub query).
SELECT E.NAME, D.DNAME, E.PAY
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE PAY = (SELECT MAX(PAY) FROM EMP
WHERE E.DEPTNO = E.DEPTNO);


-- 9. emp 테이블에서 이성규와 같은 부서의 직원의 
-- 이름과 부서명을 출력하라.(sub query)
SELECT E.NAME, D.DNAME
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E.DEPTNO = 
(SELECT DEPTNO FROM EMP
WHERE NAME = '이성규');


SELECT * FROM EMP
WHERE POSITION = '과장';
SELECT * FROM DEPT;
-- 10. 과장의 최소급여보다 높은 급여를 받는 사람의 
-- 이름, 직급, 급여를 출력하라.(sub query)
SELECT E.NAME, E.POSITION, E.PAY FROM EMP E
WHERE PAY > (SELECT MIN(PAY) FROM EMP
WHERE POSITION = '과장');



-- 11. mongoDB의 특징을 간략히 기술하고 
-- RDBMS와 차이점을 논리적구조에 대해서 표로 비교하시오.

-- 12.

 {
    title: "Post Title 2",
    body: "Body of post.",
    category: "Event",
    likes: 2,
    tags: ["news", "events"],
    date: Date()
  }
  {
    title: "Post Title 3",
    body: "Body of post.",
    category: "Technology",
    likes: 3,
    tags: {"news", "events"},
    date: Date()
  }