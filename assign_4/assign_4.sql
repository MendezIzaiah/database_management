USE Ch08_AviaCo_MySQL;
SET SQL_SAFE_UPDATES = 0;

/*
ADDING 2 COL TO EMP_2 

ALTER TABLE EMP_2
ADD EMP_PCT DECIMAL(4,2),
ADD PROJ_NUM CHAR(3);
*/
-- 1. Modify the MODEL table to add the attribute and insert the values shown in the following table. 
-- 2. Write the queries to update the MOD_WAIT_CHG attribute values based on question 1. 

/*
I want to add the column MOD_WAIT_CHG to the MODEL table
I also want to add these values:
100 for C-90A
50 for PA23-250
75 for PA31-350
*/
ALTER TABLE MODEL
ADD MOD_WAIT_CHG NUMERIC;
-- NOW WE ADD THE VALUES
UPDATE MODEL SET MOD_WAIT_CHG = 100 WHERE MOD_CODE = 'C-90A';
UPDATE MODEL SET MOD_WAIT_CHG = 50 WHERE MOD_CODE = 'PA23-250';
UPDATE MODEL SET MOD_WAIT_CHG = 75 WHERE MOD_CODE = 'PA31-350';

-- 3. Modify the CHARTER table to add the attributes shown in the following table. 
SELECT * FROM CHARTER;
/*
WE NEED TO ADD THE FOLLOWING COLUMN TO THE CHARTER TABLE:
ADD CHAR_WAIT_CHG NUMERIC
ADD CHAR_FLT_CHG_HR NUMERIC
ADD CHAR_FLT_CHG NUMERIC
ADD CHAR_TAX_CHG NUMERIC
ADD CHAR_TOT_CHG NUMERIC
ADD CHAR_PYMT NUMERIC
ADD CHAR_BALANCE NUMERIC
*/

ALTER TABLE CHARTER
ADD CHAR_WAIT_CHG NUMERIC,
ADD CHAR_FLT_CHG_HR NUMERIC,
ADD CHAR_FLT_CHG NUMERIC,
ADD CHAR_TAX_CHG NUMERIC,
ADD CHAR_TOT_CHG NUMERIC,
ADD CHAR_PYMT NUMERIC,
ADD CHAR_BALANCE NUMERIC;

SELECT * FROM CHARTER;

-- 4. Create a view that will display all the aircrafts along with their manufacturers. 
SELECT * FROM AIRCRAFT;
SELECT * FROM MODEL;

/*
WE NEED TO MAKE THIS QUERY INTO A VIEW: 
SELECT AC_NUMBER,
	   MOD_CODE,
       MOD_MANUFACTURER,
       MOD_NAME
FROM AIRCRAFT
JOIN MODEL USING (MOD_CODE);
*/
SELECT * FROM aircraft_man_view;

-- 5. Write SQL code to create a copy of CHARTER, including all of its data, and naming the copy CHARTER_1. 
CREATE TABLE CHARTER_1 AS SELECT * FROM CHARTER;

/*
6. Using the CHARTER_1 table, write a stored procedure to change the CHAR_FLT_CHG_HR 
value to 55.00 for all flights with hours flown less than 5. 

*/
SELECT * FROM CHARTER;
/*
STORED PROCEDURE:
UPDATE CHARTER_1
SET CHAR_FLT_CHG_HR = 55.00
WHERE CHAR_HOURS_FLOWN < 5
*/
call flights();
select * from charter_1;







