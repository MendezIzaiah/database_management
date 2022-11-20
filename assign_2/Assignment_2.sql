/*   
1. Write a query to find all customers whose balance is greater than average customer balance. 
 
2. Write a query to find all customers with a balance of more than 100 but less than 500. Sort the 
results by customer balance (highest first). 
 
3. Write a query to find out the name of the vendor who supplied the product with 
product code '89-WRE-Q'. 
 
4. Write a query to generate first name, last name of customers along with invoice number and invoice date 
where invoice date is between January 17 and February 28, 2018. 
 
5. Find a list of vendor/vendors who supplied '9.00-in. pwr. saw blade'. 
 
6. Generate a listing of all purchases made by the customers. Sort the results by customer code, 
invoice number, and product description. 
*/

-- Question 1
SELECT CONCAT(CUS_FNAME,' ', CUS_LNAME) AS 'CUSTOMER NAME'
FROM CUSTOMER
WHERE CUS_BALANCE > (SELECT AVG(CUS_BALANCE) FROM CUSTOMER);


-- Question 2
SELECT CONCAT(CUS_FNAME, ' ', CUS_LNAME) AS 'CUSTOMER NAME', 
	   CUS_BALANCE
FROM CUSTOMER
WHERE CUS_BALANCE BETWEEN '100' AND '500'
ORDER BY CUS_BALANCE DESC; 

-- Question 3 
SELECT V_NAME
FROM VENDOR
NATURAL JOIN PRODUCT
WHERE P_CODE = '89-WRE-Q';

-- Question 4 
SELECT CONCAT(CUS_FNAME,' ', CUS_LNAME) AS 'CUSTOMER NAME', 
       INV_NUMBER AS 'INVOICE NUMBER',
       INV_DATE AS 'INVOICE DATE'
FROM CUSTOMER
NATURAL JOIN INVOICE
WHERE INV_DATE BETWEEN '2018-1-17' AND '2018-2-28';

-- Question 5
SELECT V_NAME
FROM VENDOR
NATURAL JOIN PRODUCT
WHERE P_DESCRIPT = '9.00-in. pwr. saw blade';

-- Question 6 
SELECT CUS_FNAME, 
	   CUS_LNAME, 
       CUS_CODE, 
       INV_NUMBER, 
       P_DESCRIPT
FROM CUSTOMER
NATURAL JOIN INVOICE
NATURAL JOIN LINE
NATURAL JOIN PRODUCT
ORDER BY CUS_CODE, INV_NUMBER, P_DESCRIPT;





