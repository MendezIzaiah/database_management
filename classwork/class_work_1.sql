/* CREATING A NEW TABLE IN THE CH8 SCHEMA */
USE ch8;

CREATE TABLE EMP_1 (
EMP_NUM varchar(3) Primary Key,
EMP_LNAME varchar(15) NOT NULL,
EMP_FNAME varchar(15) NOT NULL,
EMP_INITIAL varchar(1),
EMP_HIRE_DATE date,
JOB_CODE varchar(3), 
Foreign key (JOB_CODE) references JOB(JOB_CODE));

/*  INSERTING VALUES INTO EMP_1 TABLE */
INSERT INTO EMP_1 VALUES ('101','News','John','G','2000-11-08','502');
INSERT INTO EMP_1 VALUES ('102','Senior','David','H','1989-07-12','501');

SELECT * FROM EMP_1;
SELECT * FROM EMPLOYEE;

INSERT INTO EMP_1
(SELECT EMP_NUM, EMP_LNAME, EMP_FNAME, EMP_INITIAL, EMP_HIREDATE, JOB_CODE
FROM EMPLOYEE WHERE EMP_NUM BETWEEN '103' AND '109');
COMMIT;


-- UPDATING A RECORD
UPDATE EMP_1
SET JOB_CODE = '501'
WHERE EMP_NUM = '107';

/*
IF YOU RUN INTO UPDATE PROBLEMS RUN

SET SQL_SAFE_UPDATES = 0;

THIS ALLOWS YOU TO UPDATE OR DELETE STATEMENTS WITHOUT A WHERE CLAUSE
*/

SELECT * FROM EMP_1;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM EMP_1
WHERE EMP_LNAME = 'Smithfield'
AND EMP_FNAME = 'William'
AND EMP_HIRE_DATE = '2004-06-22'
AND JOB_CODE = '500';

SELECT * FROM EMP_1;

/* November 2nd */
-- creating a copy of table EMP_1
CREATE TABLE EMP_2 AS SELECT * FROM EMP_1;

SELECT * FROM EMP_2;
-- ADDING 2 COL TO EMP_2 
ALTER TABLE EMP_2
ADD EMP_PCT DECIMAL(4,2),
ADD PROJ_NUM CHAR(3);

UPDATE EMP_2
SET EMP_PCT = 3.85
WHERE EMP_NUM = 103;

-- updating multiple values 
UPDATE EMP_2
SET EMP_PCT = 5
WHERE EMP_NUM IN ('101','105','107');

UPDATE EMP_2
SET EMP_PCT = 10 
WHERE EMP_PCT IS NULL;

-- update based on employee name; add .15 to the emp_pct
UPDATE EMP_2
SET EMP_PCT = EMP_PCT + .15
WHERE EMP_FNAME = 'Maria'
AND EMP_LNAME = 'Alonzo'
AND EMP_INITIAL = 'D';

UPDATE EMP_2
SET PROJ_NUM = 18
WHERE JOB_CODE = 500;

UPDATE EMP_2
SET PROJ_NUM = 25
WHERE JOB_CODE >= 502;

UPDATE EMP_2
SET PROJ_NUM = 14
WHERE EMP_HIRE_DATE < '1994-01-01'
AND JOB_CODE >= 501;

SELECT * FROM EMP_2;









