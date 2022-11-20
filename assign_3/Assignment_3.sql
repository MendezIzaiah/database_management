/*
Q1. Find a list of all products along with their vendor names and contacts. 

Q2. Find vendor name and contact who supplied '2.5-in. wd. screw, 50'. 

Q3. List all products (product code, product description) supplied by Gomez Bros. 

Q4:    List the Vendor name and their total inventory from highest inventory to lowest inventory. 

Q5. Write a query that summarizes the value of products currently in inventory. Note that the value of 
each product is a result of multiplying the units currently in inventory by the unit price. Sort the 
results in descending order by subtotal. 

Q6. Find the total value of the product inventory. 

Q7. List all products ordered by Kathy Smith. 
*/

-- Question 1
SELECT P_DESCRIPT,
	   V_CONTACT AS 'CONTACT',
       V_NAME AS 'VENDOR NAME'
FROM PRODUCT
NATURAL JOIN VENDOR; 

-- Question 2
SELECT V_NAME,
	   V_CONTACT
FROM VENDOR
NATURAL JOIN PRODUCT
WHERE P_DESCRIPT = '2.5-in. wd. screw, 50';

-- Question 3
SELECT P_CODE,
       P_DESCRIPT
FROM PRODUCT 
NATURAL JOIN VENDOR
WHERE V_NAME = 'Gomez Bros.';

-- Question 4
SELECT V_NAME,
       SUM(P_QOH) AS 'INVENTORY'
FROM VENDOR
NATURAL JOIN PRODUCT
GROUP BY V_NAME
ORDER BY SUM(P_QOH) DESC;

-- Question 5
SELECT P_DESCRIPT,
       (P_QOH * P_PRICE) AS 'SUBTOTAL'
FROM PRODUCT
ORDER BY (P_QOH * P_PRICE) DESC;

-- Question 6
SELECT SUM(P_QOH * P_PRICE) AS 'Total in inventory'
FROM PRODUCT;

-- Question 7
SELECT CONCAT(CUS_FNAME,' ',CUS_LNAME) AS 'CUSTOMER NAME',
       P_DESCRIPT
FROM CUSTOMER
NATURAL JOIN INVOICE
NATURAL JOIN LINE
NATURAL JOIN PRODUCT
WHERE CUS_FNAME = 'Kathy' AND CUS_LNAME = 'Smith';






