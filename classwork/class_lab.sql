USE Ch07_SaleCo_MySQL_demo;

SELECT CUS_FNAME AS FIRST_NAME, CUS_LNAME AS LAST_NAME, CUS_BALANCE FROM CUSTOMER
WHERE CUS_BALANCE > 500
ORDER BY CUS_BALANCE DESC;

SELECT * FROM PRODUCT;

SELECT V_CODE, V_NAME AS NAME FROM VENDOR
WHERE V_CODE = 25595;

SELECT DISTINCT V_CODE FROM PRODUCT;

SELECT CUS_FNAME AS FIRST_NAME, CUS_LNAME AS LAST_NAME, CUS_BALANCE FROM CUSTOMER
ORDER BY CUS_BALANCE ASC;

SELECT P_DESCRIPT AS DESCRIPTION, P_QOH AS QUANTITY_ON_HAND, P_PRICE AS PRICE, V_CODE AS VENDOR_CODE FROM PRODUCT
WHERE V_CODE = '21344' OR V_CODE = '24288';
/* can write WHERE V_CODE IN ('21344','24288') */

SELECT P_DESCRIPT AS DESCRIPTION, P_QOH AS QUANTITY_ON_HAND, P_PRICE AS PRICE, V_CODE AS VENDOR_CODE FROM PRODUCT
WHERE V_CODE != '21344';

/* write a sql statement that will determine the total value of each of the products currently held in inventory */
SELECT P_DESCRIPT AS DESCRIPTION, P_QOH * P_PRICE AS TOTAL_VALUE FROM PRODUCT;

/* Write a sql statement thtat will return the prodct description of dates before 1/20/2018 */
SELECT P_DESCRIPT, P_INDATE FROM PRODUCT
WHERE P_INDATE > '2018-01-20';

/* Write a sql statement that will return all of the records for which the price is greater than 100 and quantity 
is less than 20*/
SELECT P_DESCRIPT, P_PRICE, P_QOH FROM PRODUCT
WHERE P_PRICE > '100' AND P_QOH < '20';

/* WRITE A SQL STATEMENT THAT WILL RETURN ALL RECORDS FROM VENDOR 25595 OR 24288 AMD THE PRICE IS GREATER THAN $100*/
SELECT * FROM PRODUCT 
WHERE V_CODE IN ('25595','24288') AND P_PRICE > '100';

/* Write sql statement that will return all products whose prices are between 50 and 100*/
SELECT * FROM PRODUCT 
WHERE P_PRICE BETWEEN '50' AND '100';

/* write a sql statement that will reutrn all vendor rows from contacts whose last name begins with smith*/
SELECT * FROM VENDOR
WHERE V_CONTACT LIKE 'smith%'; -- to include the name before or after close the string in % 

-- aggregate functions 
/* Write a sql statemnt that will return the number of products whose price is less than 10*/ 
SELECT COUNT(P_PRICE) FROM PRODUCT
WHERE P_PRICE < '10';

-- MIN AND MAX
SELECT MAX(P_PRICE), MIN(P_PRICE) FROM PRODUCT;

/* Write a sql statement that will return the total value of all items carried in inventory */
SELECT SUM(P_PRICE * P_QOH) AS TOTAL_VALUE FROM PRODUCT;

/* find the average price of all the products */
SELECT AVG(P_PRICE) AS AVERAGE FROM PRODUCT;

/* find the average price of all the products provided by each vendor */
SELECT V_CODE, AVG(P_PRICE) FROM PRODUCT
GROUP BY V_CODE;

-- Joining two tables (customer and invoice); natural join
SELECT CUS_CODE, CUS_LNAME, INV_NUMBER, INV_DATE 
FROM CUSTOMER NATURAL JOIN INVOICE;

-- Joining 3 tables 
SELECT INV_NUMBER, P_CODE, P_DESCRIPT, LINE_NUMBER, LINE_UNITS
FROM INVOICE NATURAL JOIN LINE NATURAL JOIN PRODUCT; 

-- Joining using a common column name 
SELECT P_CODE AS PRODUCT_CODE, 
	   P_DESCRIPT AS PRODUCT_DESCRIPTION, 
       V_NAME AS VENDOR_NAME,  
       V_AREACODE AS VENDOR_AREA_CODE, 
       V_PHONE AS VENDOR_PHONE
FROM PRODUCT 
JOIN VENDOR USING (V_CODE);

-- Join on 
SELECT INVOICE.INV_NUMBER, 
	   PRODUCT.P_CODE, 
       PRODUCT.P_DESCRIPT, 
       LINE.LINE_UNITS, 
       LINE.LINE_PRICE
FROM INVOICE 
JOIN LINE ON INVOICE.INV_NUMBER = LINE.INV_NUMBER
JOIN PRODUCT ON PRODUCT.P_CODE = LINE.P_CODE;

-- left outer joins; returns unmatched values as well as matching values
SELECT PRODUCT.P_CODE, VENDOR.V_CODE, VENDOR.V_NAME
FROM VENDOR LEFT JOIN PRODUCT
ON VENDOR.V_CODE = PRODUCT.V_CODE;

-- Right outer join
SELECT PRODUCT.P_CODE, VENDOR.V_CODE, VENDOR.V_NAME
FROM VENDOR RIGHT JOIN PRODUCT
ON VENDOR.V_CODE = PRODUCT.V_CODE;

-- full outer join; both matched and unmatched values; MYSQL does not natively support full outer join
SELECT PRODUCT.P_CODE, VENDOR.V_CODE, VENDOR.V_NAME
FROM VENDOR LEFT JOIN PRODUCT
ON VENDOR.V_CODE = PRODUCT.V_CODE
UNION /* full outer join using left and right outer joins*/
SELECT PRODUCT.P_CODE, VENDOR.V_CODE, VENDOR.V_NAME
FROM VENDOR RIGHT JOIN PRODUCT
ON VENDOR.V_CODE = PRODUCT.V_CODE;

-- Recurrsive join
SELECT E.EMP_NUM, 
	   E.EMP_FNAME, 
       E.EMP_LNAME, 
       E.EMP_MGR, 
       M.EMP_FNAME, 
       M.EMP_LNAME 
FROM EMP E 
JOIN EMP M ON E.EMP_MGR = M.EMP_NUM;

SELECT * FROM PRODUCT
ORDER BY P_PRICE; -- CAN USE DSC TO SHOW IN DESCENDING ORDER

-- Filtering based on condition 
SELECT * FROM PRODUCT
WHERE P_PRICE > 100
ORDER BY P_PRICE DESC;

SELECT COUNT(EMP_NUM) FROM EMPLOYEE;

-- Subqueries
-- FIND A LIST OF VENDORS WHO DO NOT SUPPLY ANY PRODUCTS
SELECT V_CODE, V_NAME
FROM VENDOR
WHERE V_CODE NOT IN (SELECT V_CODE FROM PRODUCT WHERE V_CODE IS NOT NULL);

-- generate a list of all products with a price greater than or equal to the averag product line

-- JOIN
-- list all customers who ordered a claw hammer
SELECT DISTINCT CUS_CODE, CUS_FNAME, CUS_LNAME
FROM CUSTOMER 
NATURAL JOIN INVOICE 
NATURAL JOIN LINE 
NATURAL JOIN PRODUCT
WHERE P_DESCRIPT = 'claw hammer';

-- list the product code and date the product was last received into stock for all products 
SELECT P_CODE AS 'PRODUCT CODE', P_DESCRIPT AS DESCRIPTION, DATE_FORMAT(P_INDATE,'%d/%m/%y') AS 'DATE RECEIVED' FROM PRODUCT;
-- usig uppercase D,M,Y will give verbose output

-- list all employees who were born in november 
SELECT EMP_FNAME 'FIRST NAME', EMP_LNAME AS 'LAST NAME', DATE_FORMAT(EMP_DOB,'%d/%m/%y') AS 'BORN IN NOVEMBER' FROM EMPLOYEE
WHERE MONTH(EMP_DOB) = '11';

-- list all products with the date those will be on the shelf for 30 days; add 30 days
SELECT P_CODE AS 'PRODUCT CODE', 
	   P_DESCRIPT 'PRODUCT DESCRIPTION', 
	   DATE_FORMAT(P_INDATE,'%M/%D/%Y') AS 'INITIAL INDATE', 
       DATE_FORMAT(ADDDATE(P_INDATE,30),'%M/%D/%Y') AS 'EXPIRATION '
FROM PRODUCT;

-- list all products with their expiration date (two years from the pruchase date)
SELECT P_CODE AS 'PRODUCT CODE', 
	   P_DESCRIPT 'PRODUCT DESCRIPTION', 
	   DATE_FORMAT(P_INDATE,'%M/%D/%Y') AS 'INITIAL INDATE', 
       DATE_FORMAT(DATE_ADD(P_INDATE,INTERVAL 2 YEAR),'%M/%D/%Y') AS EXPIRATION
FROM PRODUCT
ORDER BY EXPIRATION; -- LAST OUTPUTS WERENT ORDERED

SELECT P_CODE AS 'PRODUCT CODE', 
	   P_DESCRIPT 'PRODUCT DESCRIPTION', 
	   DATE_FORMAT(P_INDATE,'%M/%D/%Y') AS 'INITIAL INDATE', 
       DATE_FORMAT(DATE_ADD(P_INDATE,INTERVAL 2 YEAR),'%M/%D/%Y') AS EXPIRATION
FROM PRODUCT
ORDER BY str_to_date(EXPIRATION,'%M/%D/%Y'); -- WORKS WITH STRING TO DATE

SELECT P_CODE AS 'PRODUCT CODE',
P_DESCRIPT AS 'PRODUCT DESCRIPTION',
DATE_FORMAT(P_INDATE,'%M/%D/%Y') AS 'INITIAL INDATE',
DATE_ADD(P_INDATE,INTERVAL 2 YEAR) AS 'EXPIRATION'
FROM PRODUCT
ORDER BY DATE_ADD(P_INDATE,INTERVAL 2 YEAR);

-- FIND ALL THE EMPLOYEES WHO WERE HIRED ON THE LAST WEEK OF THE MONTH; FIND THE EMPLOYEES ON HIRED ON THE LAST 7 DAYS OF THE MONTH
SELECT EMP_FNAME AS 'FIRST NAME',
       EMP_LNAME AS 'LAST NAME',
	   EMP_HIRE_DATE,
	   LAST_DAY(EMP_HIRE_DATE)
FROM EMPLOYEE;

SELECT LAST_DAY(EMP_HIRE_DATE), DATE_ADD(LAST_DAY(EMP_HIRE_DATE), INTERVAL -7 DAY) FROM EMPLOYEE;

SELECT EMP_FNAME AS 'FIRST NAME',
       EMP_LNAME AS 'LAST NAME',
	   DATE_ADD(LAST_DAY(EMP_HIRE_DATE), INTERVAL -7 DAY) AS 'HIRE DATE'
FROM EMPLOYEE
WHERE EMP_HIRE_DATE >= DATE_ADD(LAST_DAY(EMP_HIRE_DATE), INTERVAL -7 DAY);

SELECT P_PRICE, 
	   ROUND(P_PRICE,1) AS PRICE_1, -- 1 DECIMAL PLACE
       ROUND(P_PRICE,0) AS PRICE_0 -- NO DECIMAL
FROM PRODUCT;

SELECT P_PRICE, 
	   CEIL(P_PRICE) AS CEIL_1, -- smallest integer value greater than or equal to the number
       FLOOR(P_PRICE) AS FLOOR_1 -- largest integer value less than or equal to the number 
FROM PRODUCT;

SELECT EMP_FNAME AS 'FIRST NAME',
       EMP_LNAME AS 'LAST NAME',
       CONCAT(EMP_FNAME,' ',EMP_LNAME) AS COMBINED
FROM EMPLOYEE;

SELECT EMP_FNAME AS 'FIRST NAME',
       EMP_LNAME AS 'LAST NAME',
       UPPER(CONCAT(EMP_FNAME,' ',EMP_LNAME)) AS COMBINED -- UPPER MAKES THEM ALL UPPERCASE
FROM EMPLOYEE;

SELECT EMP_FNAME AS 'FIRST NAME',
       EMP_LNAME AS 'LAST NAME',
       LOWER(CONCAT(EMP_FNAME,' ',EMP_LNAME)) AS COMBINED -- LOWER MAKES THEM ALL LOWERCASE
FROM EMPLOYEE;

SELECT EMP_PHONE,
       SUBSTRING(EMP_PHONE,1,3) -- SELECTING THE FIRST 3 VALUES 
FROM EMPLOYEE;

SELECT EMP_PHONE,
       SUBSTRING(EMP_PHONE,5,7) -- SELECTING THE LAST 4 VALUES 
FROM EMPLOYEE;

SELECT EMP_PHONE,
       RIGHT(EMP_PHONE,4) -- SELECTING THE LAST 4 VALUES 
FROM EMPLOYEE;

SELECT EMP_LNAME, LENGTH(EMP_LNAME) FROM EMPLOYEE;


/* 
create a view; right click views under the ch7 sale co schema, then put query below into the new view 
SELECT * FROM CUSTOMER WHERE CUS_BALANCE > 0;
*/

SELECT * FROM CUSTOMER_BALANCE;


/*
create a new view called product stats with this query:
SELECT V_CODE,
	   SUM(P_QOH*P_PRICE) AS 'Total Cost',
       MAX(P_QOH) AS MAXQTY,
       MIN(P_QOH) AS MINQTY,
       AVG(P_QOH) AS AVGQTY
FROM PRODUCT
GROUP BY V_CODE;

*/

SELECT * FROM product_stats;


/*
CREATE A STORED PROCEDURE WITH THIS QUERY; CREATE A STORED PROCEDURE BY RIGHT CLICKING ON STORED PROCEDURES:
SELECT CUS_FNAME,
	   CUS_LNAME,
       CUS_BALANCE
FROM CUSTOMER;
*/

CALL GET_CUSTOMER_BALANCE();

/*
CREATE GET VENDOR NAME PROCEDURE FOR QUERY BELOW:
SELECT V_NAME
FROM VENDOR 
WHERE V_CODE IN (SELECT V_CODE FROM PRODUCT WHERE P_DESCRIPT = '9.00-in. pwr. saw blade')
*/
CALL VENDOR_NAME();

