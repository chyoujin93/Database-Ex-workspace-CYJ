-- 기본 예시코드
-- ``sql
-- 1. 이름을 모두 대문자로 출력
SELECT ENAME, 
UPPER(ENAME) AS "대문자변환",
LOWER(ENAME) AS "소문자변환",
INITCAP(ENAME) AS "첫글자만 대문자변환"
FROM EMP;

-- 2. 사원 이름의 길이 출력
-- 영문자 1글자: 1바이트, 한글: 약 2바이트
-- 1바이트: 8비트, 1비트: 0 또는 1
-- 1바이트: 0000 0001(8자리를 의미함)
SELECT ENAME, 
LENGTH(ENAME) AS "이름의 길이",
LENGTHB(ENAME) AS "이름의 바이트 길이"
FROM EMP;

-- 3. 직무 문자열 안에 'A'가 포함된 위치
SELECT JOB, INSTR(JOB, 'A') 
AS "'A'가 포함된 위치" FROM EMP;

